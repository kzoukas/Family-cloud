/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import daos.DBOperationException;
import daos.PersonalCalendarDAO;
import db.model.PersonalCalendar;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.PersonalCalendarBO;

/**
 *
 * @author Vaggos
 */
public class MySqlPersonalCalendarDAO implements PersonalCalendarDAO {

    @Override
    public boolean addTask(PersonalCalendar pc) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        
        try {
            pst=conn.prepareStatement("SELECT MAX(activityID) AS maxID FROM callendar_activities;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {
               
                pc.setActivityID(rs1.getInt("maxID")+1);
            }
                        
            pst = conn.prepareStatement("INSERT INTO callendar_activities(activityID, activityName, category, startingDate, endingDate ,comment, userID, daily, weekly, monthly, reminder, hoursRemindBefore,reputanceExpDate,reminderDate)"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setInt(1, pc.getActivityID());
            pst.setString(2, pc.getActivityName());
            pst.setString(3, pc.getCategory());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(pc.getStartingDate().getTime());
            pst.setTimestamp(4, timestamp);
            java.sql.Timestamp timestamps = new java.sql.Timestamp(pc.getEndingDate().getTime());
            pst.setTimestamp(5, timestamps);
            pst.setString(6, pc.getComment());
            pst.setInt(7, pc.getUserID());
            int daily=(pc.isDaily()?1:0);
            pst.setInt(8,daily);
            int weekly=(pc.isWeekly()?1:0);
            pst.setInt(9,weekly);
            int monthly=(pc.isMonthly()?1:0);
            pst.setInt(10,monthly);
            pst.setString(11, pc.getReminder());
            pst.setInt(12, pc.getHoursRemindBefore());
            pst.setDate(13, new java.sql.Date(pc.getExpDate().getTime()));
            pst.setDate(14, new java.sql.Date(pc.getReminderDate().getTime()));
            
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
    public List<PersonalCalendarBO> getPCListBasedOnDirector(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        List<PersonalCalendarBO> pcAllActivities= new ArrayList<PersonalCalendarBO>();
        PersonalCalendar pc = new PersonalCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM callendar_activities WHERE userID=?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                pc.setActivityID(rs.getInt("activityID"));
                pc.setActivityName(rs.getString("activityName"));
                pc.setCategory(rs.getString("category"));
                pc.setComment(rs.getString("comment"));
                pc.setUserID(userID);
                pc.setEndingDate(rs.getTimestamp("endingDate"));
                pc.setStartingDate(rs.getTimestamp("startingDate"));
                int daily=rs.getInt("daily");
                int weekly=rs.getInt("weekly");
                int monthly=rs.getInt("monthly");
                if (daily==0){pc.setDaily(false);}else{pc.setDaily(true);}
                if (weekly==0){pc.setWeekly(false);}else{pc.setWeekly(true);}
                if (monthly==0){pc.setMonthly(false);}else{pc.setMonthly(true);}
                pc.setReminder(rs.getString("reminder"));
                pc.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                pc.setExpDate(rs.getDate("reputanceExpDate"));
                pc.setReminderDate(rs.getDate("reminderDate"));
                
                PersonalCalendarBO takis = new PersonalCalendarBO();
               
                pcAllActivities.add(takis.toPersonalCalendarBO(pc));
                
                
            }
                
        } catch (SQLException ex) {
            pc = null;
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
    
    
    
      public PersonalCalendar getPersonalEventBasedOnID(int activityID) throws DBOperationException {

         PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        
        
        PersonalCalendar fc = new PersonalCalendar();

        try {
            pst = conn.prepareStatement("SELECT * FROM callendar_activities WHERE activityID=?");
            pst.setInt(1, activityID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                
                fc.setActivityID(rs.getInt("activityID"));
                fc.setActivityName(rs.getString("activityName"));
                fc.setCategory(rs.getString("category"));
                fc.setComment(rs.getString("comment"));
                fc.setUserID(rs.getInt("userID"));
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
     
    
   public boolean updatePcEvent(PersonalCalendar fc, int activityID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            PersonalCalendar previousEvent = this.getPersonalEventBasedOnID(activityID);

            previousEvent.updateEventInfo(fc);

            pst = conn.prepareStatement("UPDATE callendar_activities "
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
                    +",reminderDate = ?"
                    
                    
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
//            pst.setDate(8, new java.sql.Date( previousEvent.getStartingDate().getTime()));
//            pst.setDate(9, new java.sql.Date(previousEvent.getEndingDate().getTime()));
            pst.setDate(10, new java.sql.Date(previousEvent.getExpDate().getTime()));
            int daily=(fc.isDaily()?1:0);
            pst.setInt(11,daily);
            int weekly=(fc.isWeekly()?1:0);
            pst.setInt(12,weekly);
            int monthly=(fc.isMonthly()?1:0);
            pst.setInt(13,monthly);            
            pst.setDate(14,new java.sql.Date(previousEvent.getReminderDate().getTime()));
            

            pst.setInt(15, previousEvent.getActivityID());
            
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

    
     public boolean deletePersonalEvent(int activityID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM callendar_activities WHERE activityID = ?");
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
