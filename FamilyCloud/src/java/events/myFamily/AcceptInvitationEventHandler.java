/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.myFamily;

import dao.impl.MySqlNotificationsDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.Notifications;
import db.model.User;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;

/**
 *
 * @author Vaggos
 */


    public class AcceptInvitationEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            int notificationID=Integer.parseInt(request.getParameter("notificationID"));
             MySqlNotificationsDAO pcDAO =new MySqlNotificationsDAO();
             
            Notifications notification = pcDAO.getNotificationBasedOnID(notificationID);
            boolean result=pcDAO.updateNotificationIsReadB(notificationID);
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            User inviter = myUserDAO.getUserBasedOnID(notification.getUserID_A());
            int director=inviter.getDirector();
            String familyName=inviter.getFamilyName();
            
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            
            UserBO newuser = new UserBO();
            newuser.setFamilyName(familyName);
            newuser.setDirector(director);
            
            User myUser = new User();
            myUser.setFamilyName(newuser.getFamilyName());
            myUser.setDirector(newuser.getDirector());
            
           boolean result2 = myUserDAO.updateUser(myUser,current_user.getEmail());
           boolean result3 = pcDAO.deleteNotification(notificationID);
           UserBO user= getUser(current_user.getEmail());
           mySession.setAttribute("myUser",user);
           
            UserBO userBO = new UserBO();
            User director_user = myUserDAO.getDirectorBasedOnFamily(user.getFamilyName());
            UserBO directors = userBO.toUserBO(director_user);
            mySession.setAttribute("director",directors);
            if(result2){
                request.setAttribute("messageMyFamily", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\"> You have successfully benn added to family "+ familyName);
            }
            
           setURL("Controller?newproperties=MYFAMILY");
            
        }catch(Exception e){
            
        }
    
     }
     
     public UserBO getUser(String email) {
        try {
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO userDAO = mySqlFactory.getUserDAO();

            UserBO userBO = new UserBO();

            User user = userDAO.getUser(email);

            userBO = userBO.toUserBO(user);

            return userBO;
        } catch (Exception e) {
            return null;
        }
    }
     
     
}

    


    

