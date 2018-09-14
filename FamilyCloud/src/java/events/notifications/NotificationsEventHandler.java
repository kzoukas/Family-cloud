/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.notifications;

import com.google.common.collect.Lists;
import dao.impl.MySqlNotificationsDAO;
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


    public class NotificationsEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            MySqlNotificationsDAO pcDAO =new MySqlNotificationsDAO();
            List<NotificationsBO> listWithNotification = pcDAO.getNotificationsBasedOnID(myUser.getUserID());
             List<NotificationsBO> listWithNotifications = Lists.reverse(listWithNotification);
            request.setAttribute("notifications", listWithNotifications );
            request.setAttribute("no_notifications","You have no notifications!");
            
            
            setURL("notifications.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
     
}

    


    

