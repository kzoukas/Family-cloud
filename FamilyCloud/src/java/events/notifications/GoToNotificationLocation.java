
package events.notifications;

import dao.impl.MySqlNotificationsDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.UserDAO;
import db.model.Notifications;
import db.model.User;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.NotificationsBO;
import models.UserBO;


/**
 *
 * @author Vaggos
 */


    public class GoToNotificationLocation extends EventHandlerBase{
            
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
             UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            Notifications notification = pcDAO.getNotificationBasedOnID(notificationID);
            
            boolean result=pcDAO.updateNotificationIsReadB(notificationID);
            
            
            if(notification.getNotification_type().equals("family_calendar_insert")||(notification.getNotification_type().equals("family_calendar_update"))
                                                                                   ||(notification.getNotification_type().equals("family_calendar_delete"))){
            boolean result2 = pcDAO.deleteNotification(notificationID);
             DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
            List<String> categoryList = myfcDAO.getCategoryList(current_user.getDirector());
            request.setAttribute("categoryList", categoryList);
            
            
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            List<UserBO> usersExceptCurrent = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
            request.setAttribute("usersExceptCurrent", usersExceptCurrent);
            
            setURL("family-calendar.jsp");
            }else if(notification.getNotification_type().equals("to_do_list_insert")||(notification.getNotification_type().equals("to_do_list_update"))
                                                                                         ||(notification.getNotification_type().equals("to_do_list_delete"))){
             boolean result3 = pcDAO.deleteNotification(notificationID);
             setURL("Controller?newproperties=TODOLIST");
            }
            else if(notification.getNotification_type().equals("add_active")){
                
               DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
               UserDAO myUserDAO = mySqlFactory.getUserDAO();
               User myUser = myUserDAO.getUserBasedOnID(notification.getUserID_A());
               mySession.setAttribute("family_inviter", myUser);
               mySession.setAttribute("notif_invitation", notification);
               
               
                setURL("family-invitation.jsp");
            }else if (notification.getNotification_type().equals("reminderNot")){
                boolean result4 = pcDAO.deleteNotification(notificationID);
                setURL("Controller?newproperties=PERSONALCALENDAR");
                
            }else if (notification.getNotification_type().equals("reminderNotMeals")){
                boolean result4 = pcDAO.deleteNotification(notificationID);
                setURL("Controller?newproperties=MEALSPLAN");
                
            }else if (notification.getNotification_type().equals("reminderNotFC")){
                boolean result4 = pcDAO.deleteNotification(notificationID);
                 DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
            List<String> categoryList = myfcDAO.getCategoryList(current_user.getDirector());
            request.setAttribute("categoryList", categoryList);
            
            
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            List<UserBO> usersExceptCurrent = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
            request.setAttribute("usersExceptCurrent", usersExceptCurrent);
                setURL("Controller?newproperties=FAMILYCALENDAR");
                
            }
            
            
//            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
//            MySqlNotificationsDAO pcDAO =new MySqlNotificationsDAO();
//            List<NotificationsBO> listWithNotifications = pcDAO.getNotificationsBasedOnID(myUser.getUserID());
//            mySession.setAttribute("notifications", listWithNotifications );
           
            
            
            //setURL("notifications.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
     
}

    


    

