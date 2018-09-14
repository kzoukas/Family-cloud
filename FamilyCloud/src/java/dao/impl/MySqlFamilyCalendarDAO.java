package dao.impl;
import dao.impl.MySqlDAOFactory;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.FamilyCalendarDAO;
import daos.UserDAO;
import db.model.FamilyCalendar;
import db.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import models.FamilyCalendarBO;

public class MySqlFamilyCalendarDAO implements FamilyCalendarDAO {

    @Override
    public boolean addTaskFamily(FamilyCalendar fc) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        
        try {
            pst=conn.prepareStatement("SELECT MAX(activityID) AS maxID FROM family_calendar;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {
               
                fc.setActivityID(rs1.getInt("maxID")+1);
            }
                        
            pst = conn.prepareStatement("INSERT INTO family_calendar(activityID, activityName, category, startingDate, endingDate ,comment, userID, daily, weekly, monthly, reminder, hoursRemindBefore,reputanceExpDate,assignedTo,director,reminderDate)"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setInt(1, fc.getActivityID());
            pst.setString(2, fc.getActivityName());
            pst.setString(3, fc.getCategory());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(fc.getStartingDate().getTime());
            pst.setTimestamp(4, timestamp);
            java.sql.Timestamp timestamps = new java.sql.Timestamp(fc.getEndingDate().getTime());
            pst.setTimestamp(5, timestamps);
            pst.setString(6, fc.getComment());
            pst.setInt(7, fc.getUserID());
            int daily=(fc.isDaily()?1:0);
            pst.setInt(8,daily);
            int weekly=(fc.isWeekly()?1:0);
            pst.setInt(9,weekly);
            int monthly=(fc.isMonthly()?1:0);
            pst.setInt(10,monthly);
            pst.setString(11, fc.getReminder());
            pst.setInt(12, fc.getHoursRemindBefore());
            pst.setDate(13, new java.sql.Date(fc.getExpDate().getTime()));
            String assignedTo = fc.getAssignedTo();
            if(fc.getAssignedTo().equals("No specific")){
                assignedTo = "0";
            }
            pst.setString(14, assignedTo);
            pst.setInt(15, fc.getDirector());
            pst.setDate(16, new java.sql.Date(fc.getReminderDate().getTime()));
            
            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
            
        
    }
    
    @Override
    public List<FamilyCalendarBO> getFCListBasedOnDirector(int director) throws DBOperationException {

        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        List<FamilyCalendarBO> pcAllActivities= new ArrayList<FamilyCalendarBO>();
        FamilyCalendar fc = new FamilyCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM family_calendar WHERE director=?");
            pst.setInt(1, director);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                fc.setActivityID(rs.getInt("activityID"));
                fc.setActivityName(rs.getString("activityName"));
                fc.setCategory(rs.getString("category"));
                fc.setComment(rs.getString("comment"));
                fc.setAssignedTo(rs.getString("assignedTo"));
                fc.setUserID(rs.getInt("userID"));
                fc.setDirector(rs.getInt("director"));
                fc.setEndingDate(rs.getTimestamp("endingDate"));
                fc.setStartingDate(rs.getTimestamp("startingDate"));
                int daily=rs.getInt("daily");
                int weekly=rs.getInt("weekly");
                int monthly=rs.getInt("monthly");
                if (daily==0){fc.setDaily(false);}else{fc.setDaily(true);}
                if (weekly==0){fc.setWeekly(false);}else{fc.setWeekly(true);}
                if (monthly==0){fc.setMonthly(false);}else{fc.setMonthly(true);}
                fc.setReminder(rs.getString("reminder"));
                fc.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                fc.setExpDate(rs.getDate("reputanceExpDate"));
                fc.setReminderDate(rs.getDate("reminderDate"));
                
                
                
                FamilyCalendarBO takis = new FamilyCalendarBO();
               
                pcAllActivities.add(takis.toFamilyCalendarBO(fc));
                
                
            }
                
        } catch (SQLException ex) {
            fc = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return pcAllActivities;
    }
    
    
   public List<FamilyCalendarBO> getFCListBasedOnCategory(String category,int director) throws DBOperationException {

        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        List<FamilyCalendarBO> pcAllActivities= new ArrayList<FamilyCalendarBO>();
        FamilyCalendar fc = new FamilyCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM family_calendar WHERE category=? AND director=?");
            pst.setString(1, category);
            pst.setInt(2, director);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                fc.setActivityID(rs.getInt("activityID"));
                fc.setActivityName(rs.getString("activityName"));
                fc.setCategory(rs.getString("category"));
                fc.setComment(rs.getString("comment"));
                fc.setAssignedTo(rs.getString("assignedTo"));
                fc.setUserID(rs.getInt("userID"));
                fc.setDirector(rs.getInt("director"));
                fc.setEndingDate(rs.getTimestamp("endingDate"));
                fc.setStartingDate(rs.getTimestamp("startingDate"));
                int daily=rs.getInt("daily");
                int weekly=rs.getInt("weekly");
                int monthly=rs.getInt("monthly");
                if (daily==0){fc.setDaily(false);}else{fc.setDaily(true);}
                if (weekly==0){fc.setWeekly(false);}else{fc.setWeekly(true);}
                if (monthly==0){fc.setMonthly(false);}else{fc.setMonthly(true);}
                fc.setReminder(rs.getString("reminder"));
                fc.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                fc.setExpDate(rs.getDate("reputanceExpDate"));
                fc.setReminderDate(rs.getDate("reminderDate"));
                
                FamilyCalendarBO takis = new FamilyCalendarBO();
               
                pcAllActivities.add(takis.toFamilyCalendarBO(fc));
                
                
            }
                
        } catch (SQLException ex) {
            fc = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return pcAllActivities;
    }
    
    public List<FamilyCalendarBO> getFCListBasedOnUserID(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        List<FamilyCalendarBO> pcAllActivities= new ArrayList<FamilyCalendarBO>();
        FamilyCalendar fc = new FamilyCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM family_calendar WHERE userID=?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                fc.setActivityID(rs.getInt("activityID"));
                fc.setActivityName(rs.getString("activityName"));
                fc.setCategory(rs.getString("category"));
                fc.setComment(rs.getString("comment"));
                fc.setAssignedTo(rs.getString("assignedTo"));
                fc.setUserID(rs.getInt("userID"));
                fc.setDirector(rs.getInt("director"));
                fc.setEndingDate(rs.getTimestamp("endingDate"));
                fc.setStartingDate(rs.getTimestamp("startingDate"));
                int daily=rs.getInt("daily");
                int weekly=rs.getInt("weekly");
                int monthly=rs.getInt("monthly");
                if (daily==0){fc.setDaily(false);}else{fc.setDaily(true);}
                if (weekly==0){fc.setWeekly(false);}else{fc.setWeekly(true);}
                if (monthly==0){fc.setMonthly(false);}else{fc.setMonthly(true);}
                fc.setReminder(rs.getString("reminder"));
                fc.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                fc.setExpDate(rs.getDate("reputanceExpDate"));
                fc.setReminderDate(rs.getDate("reminderDate"));
                
                FamilyCalendarBO takis = new FamilyCalendarBO();
               
                pcAllActivities.add(takis.toFamilyCalendarBO(fc));
                
                
            }
                
        } catch (SQLException ex) {
            fc = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return pcAllActivities;
    }
    
    public List<String> getCategoryList(int director) throws DBOperationException {

        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        List<String> pcAllActivities= new ArrayList<String>();
       

        try {
            pst = conn.prepareStatement("SELECT DISTINCT category FROM family_calendar WHERE director=?");
            pst.setInt(1, director);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
               pcAllActivities.add(rs.getString("category"));
                
                
            }
                
        } catch (SQLException ex) {
           
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return pcAllActivities;
    }
    
     public FamilyCalendar getFamilyEventBasedOnID(int activityID) throws DBOperationException {

         PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        
        FamilyCalendar fc = new FamilyCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM family_calendar WHERE activityID=?");
            pst.setInt(1, activityID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                fc.setActivityID(rs.getInt("activityID"));
                fc.setActivityName(rs.getString("activityName"));
                fc.setCategory(rs.getString("category"));
                fc.setComment(rs.getString("comment"));
                fc.setAssignedTo(rs.getString("assignedTo"));
                fc.setUserID(rs.getInt("userID"));
                fc.setDirector(rs.getInt("director"));
                fc.setEndingDate(rs.getTimestamp("endingDate"));
                fc.setStartingDate(rs.getTimestamp("startingDate"));
                int daily=rs.getInt("daily");
                int weekly=rs.getInt("weekly");
                int monthly=rs.getInt("monthly");
                if (daily==0){fc.setDaily(false);}else{fc.setDaily(true);}
                if (weekly==0){fc.setWeekly(false);}else{fc.setWeekly(true);}
                if (monthly==0){fc.setMonthly(false);}else{fc.setMonthly(true);}
                fc.setReminder(rs.getString("reminder"));
                fc.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                fc.setExpDate(rs.getDate("reputanceExpDate"));
                fc.setReminderDate(rs.getDate("reminderDate"));
                
                DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
               UserDAO myUserDAO = mySqlFactory.getUserDAO();
                
                if(fc.getAssignedTo().equals("0")){
                         fc.setAssignedTo("-");
                }else{
                    String assigner="";
                    String split_assigns= fc.getAssignedTo();
                    List<String> split_assigns_List = Arrays.asList(split_assigns.split("\\s*,\\s*"));

                    for(int i=0;i<split_assigns_List.size();i++){

                        int assigned = Integer.parseInt(split_assigns_List.get(i));
                        User myUser2 = myUserDAO.getUserBasedOnID(assigned);
                        assigner=myUser2.getFirstName()+"  "+assigner;
                     } 
               
                    fc.setAssignedTo(assigner);
                }
                

            }

        } catch (SQLException ex) {
            fc = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return fc;
    }
     
     
     
         public boolean updateFcEvent(FamilyCalendar fc, int activityID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            FamilyCalendar previousEvent = this.getFamilyEventBasedOnID(activityID);

            previousEvent.updateEventInfo(fc);

            pst = conn.prepareStatement("UPDATE family_calendar "
                    + "SET activityName = ?"
                    + ",activityID = ?"
                    + ",category = ?"
                    + ",comment = ?"
                    + ",reminder = ?"
                    + ",hoursRemindBefore = ?"
                    + ",userID = ?"
                    + ",startingDate = ?"
                    + ",endingDate = ?"
                    + ",reputanceExpDate = ?"
                    + ",daily = ?"
                    + ",weekly = ?"
                    + ",monthly = ?"
                    + ",assignedTo = ?"
                    + ",director = ?"
                    + ",reminderDate = ?"
                    
                    
                    + " WHERE activityID = ?");
            
            
            

            pst.setString(1, previousEvent.getActivityName());
            pst.setInt(2, previousEvent.getActivityID());
            pst.setString(3, previousEvent.getCategory());
            pst.setString(4, previousEvent.getComment());
            pst.setString(5, previousEvent.getReminder());
            pst.setInt(6, previousEvent.getHoursRemindBefore());
            pst.setInt(7, previousEvent.getUserID());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(previousEvent.getStartingDate().getTime());
            pst.setTimestamp(8, timestamp);
            java.sql.Timestamp timestamps = new java.sql.Timestamp(previousEvent.getEndingDate().getTime());
            pst.setTimestamp(9, timestamps);
            pst.setDate(10, new java.sql.Date(previousEvent.getExpDate().getTime()));
            int daily=(fc.isDaily()?1:0);
            pst.setInt(11,daily);
            int weekly=(fc.isWeekly()?1:0);
            pst.setInt(12,weekly);
            int monthly=(fc.isMonthly()?1:0);
            pst.setInt(13,monthly);            
            String assignedTo = fc.getAssignedTo();
            if(fc.getAssignedTo().equals("No specific")){
                assignedTo = "0";
            }
            pst.setString(14, assignedTo);
            pst.setInt(15, previousEvent.getDirector());
            pst.setDate(16, new java.sql.Date(previousEvent.getReminderDate().getTime()));
            pst.setInt(17, previousEvent.getActivityID());
            
            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    
     public boolean deleteFamilyEvent(int activityID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM family_calendar WHERE activityID = ?");
            pst.setInt(1, activityID);

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
     
     
    
    
}

