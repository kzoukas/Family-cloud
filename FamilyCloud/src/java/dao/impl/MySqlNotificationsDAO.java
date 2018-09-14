/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.FamilyCalendarDAO;
import daos.MealsDAO;
import daos.NotificationsDAO;
import daos.PersonalCalendarDAO;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.FamilyCalendar;
import db.model.Meals;
import db.model.Notifications;
import db.model.PersonalCalendar;
import db.model.ToDoList;
import db.model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.NotificationsBO;

/**
 *
 * @author Vaggos
 */
public class MySqlNotificationsDAO implements NotificationsDAO{
    
    public List<NotificationsBO> getNotificationsBasedOnID(int userID) throws DBOperationException{
    
        PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
        List<NotificationsBO> allmembers= new ArrayList<NotificationsBO>();
        Notifications note = new Notifications();

        try {
            
            pst = conn.prepareStatement("SELECT * FROM notifications WHERE usernameB=? AND usernameA!=?");
            pst.setInt(1, userID);
            pst.setInt(2, userID);
            

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                note.setNotificationID(rs.getInt("notificationID"));
                note.setUserID_A(rs.getInt("usernameA"));
                note.setUserID_B(rs.getInt("usernameB"));
                note.setNotification_type(rs.getString("notification_type"));
                //note.setMessages(rs.getString("message"));
                note.setDate_created(rs.getTimestamp("date_created"));
                note.setReferredID(rs.getInt("referredID"));
                note.setIsreadA(rs.getString("isreadA"));
                note.setIsreadB(rs.getString("isreadB"));
                
               DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
               UserDAO myUserDAO = mySqlFactory.getUserDAO();
               User myUser = myUserDAO.getUserBasedOnID(note.getUserID_A());
               
               FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
               FamilyCalendar famEvent =myfcDAO.getFamilyEventBasedOnID(note.getReferredID());
               
               ToDoListDAO newDAO=mySqlFactory.getToDoListDAO();
               ToDoList todoList=newDAO.getToDoListBasedOnID(note.getReferredID());
            
                if(rs.getString("notification_type").equals("family_calendar_insert")){
                    note.setMessages("<strong>"+ myUser.getFirstName() + "</strong> added you to an event with title <strong>" + famEvent.getActivityName()+"<strong>");
                }else if(rs.getString("notification_type").equals("family_calendar_update")){
                    note.setMessages("Your event with title <strong>" +  famEvent.getActivityName() + "</strong> has been updated by <strong>" + myUser.getFirstName()+"</strong>");
                }else if(rs.getString("notification_type").equals("family_calendar_delete")){
                    note.setMessages("<strong>"+myUser.getFirstName()+"</strong> deleted the event you were assigned to");
                }else if(rs.getString("notification_type").equals("to_do_list_insert")){
                     note.setMessages("<strong>"+ myUser.getFirstName() + "</strong> added you to a task with name <strong>"+ todoList.getTask()+"</strong>");
                }else if(rs.getString("notification_type").equals("to_do_list_update")){
                     note.setMessages("Your task with name <strong>" +  todoList.getTask()+ "</strong> has been updated by <strong>" + myUser.getFirstName()+"</strong>");
                }else if(rs.getString("notification_type").equals("to_do_list_delete")){
                    note.setMessages("<strong>"+myUser.getFirstName()+"</strong> deleted the task ");
                }else if(rs.getString("notification_type").equals("add_active")){
                    note.setMessages("<strong>"+myUser.getFirstName()+"</strong> added you to his family with name <strong>"+myUser.getFamilyName()+"</strong>");
                }else if(rs.getString("notification_type").equals("reminderNot")){
                    PersonalCalendarDAO pcalendarDAO = mySqlFactory.getPersonalCalendarDAO();
                    PersonalCalendar pc = pcalendarDAO.getPersonalEventBasedOnID(rs.getInt("referredID"));
                    note.setMessages( "you have a reminder for <strong>" + pc.getActivityName() +"</strong> in <strong>personal calendar</strong>");
                }else if(rs.getString("notification_type").equals("reminderNotMeals")){
                    MealsDAO mealDAO = mySqlFactory.getMealsDAO();
                    Meals meal = mealDAO.getMealEventBasedOnID(rs.getInt("referredID"));
                    note.setMessages( "you have a reminder for <strong>" + meal.getMealName() +"</strong> in <strong>meals plan</strong>");
                }
                else if(rs.getString("notification_type").equals("reminderNotFC")){
                    FamilyCalendarDAO fcDAO = mySqlFactory.getFamilyCalendarDAO();
                    FamilyCalendar fc = fcDAO.getFamilyEventBasedOnID(rs.getInt("referredID"));
                    note.setMessages( "you have a reminder for <strong>" + fc.getActivityName() +"</strong> in <strong>family calendar</strong> ");
                }
                
                
                
                
                NotificationsBO takis = new NotificationsBO();
               
                allmembers.add(takis.toNotificationsBO(note));
                
                
            }
                
        } catch (SQLException ex) {
            note = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return allmembers;
    
        
        
    }
    
    public Notifications getNotificationBasedOnID(int notificationID) throws DBOperationException{
    
     PreparedStatement pst = null;
        
        Connection conn = MySqlDAOFactory.createConnection();
       
        Notifications note = new Notifications();

        try {
            pst = conn.prepareStatement("SELECT * FROM notifications WHERE notificationID= ?");
            pst.setInt(1, notificationID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                
                note.setNotificationID(rs.getInt("notificationID"));
                note.setUserID_A(rs.getInt("usernameA"));
                note.setUserID_B(rs.getInt("usernameB"));
                note.setNotification_type(rs.getString("notification_type"));
                //note.setMessages(rs.getString("message"));
                note.setDate_created(rs.getTimestamp("date_created"));
                note.setReferredID(rs.getInt("referredID"));
                note.setIsreadA(rs.getString("isreadA"));
                note.setIsreadB(rs.getString("isreadB"));
                
               
                
            }
                
        } catch (SQLException ex) {
            note = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return note;
    
    }
    
     public int getNOReadB(int userID) throws DBOperationException{
      
      
      PreparedStatement pst = null;
      int count=0;  
        Connection conn = MySqlDAOFactory.createConnection();
       
        Notifications note = new Notifications();

        try {
            pst = conn.prepareStatement("SELECT isReadB FROM notifications WHERE usernameB= ? AND usernameA!= ?");
            pst.setInt(1, userID);
            pst.setInt(2, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               
                if(rs.getString("isReadB").equals("N")){
                count=count+1;
                }
               
                
               
                
            }
                
        } catch (SQLException ex) {
            note = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
         return count;
    
    }
     
      public boolean updateNotificationIsReadB(int notificationID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            

            pst = conn.prepareStatement("UPDATE notifications "
                    + "SET isreadB = 'Y'"
                    + " WHERE notificationID = ?");

            pst.setInt(1, notificationID);

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
      
       public boolean deleteNotification(int notificationID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM notifications WHERE notificationID = ?");
            pst.setInt(1, notificationID);

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
       
       public boolean insertReminderNotification(Notifications not) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            pst = conn.prepareStatement("SELECT MAX(notificationID) AS maxID FROM notifications;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {

                not.setNotificationID(rs1.getInt("maxID") + 1);
            }

            pst = conn.prepareStatement("INSERT INTO notifications (notificationID, usernameA, usernameB, notification_type,"
                    + "date_created, referredID, isreadA, isreadB) "
                    + " VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setInt(1, not.getNotificationID());
            pst.setInt(2, not.getUserID_A());
            pst.setInt(3, not.getUserID_B());
            pst.setString(4, not.getNotification_type());
            pst.setDate(5,  new java.sql.Date(not.getDate_created().getTime()));
            
            pst.setInt(6, not.getReferredID());
            pst.setString(7, "N");
            pst.setString(8,"N");
            
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
