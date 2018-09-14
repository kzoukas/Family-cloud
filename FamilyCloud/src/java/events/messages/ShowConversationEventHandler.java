/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.messages;

import dao.impl.MySqlMessagesDAO;
import dao.impl.MySqlUserDAO;
import db.model.User;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MessagesBO;
import models.UserBO;

/**
 *
 * @author Vaggos
 */
public class ShowConversationEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try{
            
            
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            int receiverID = Integer.parseInt(request.getParameter("receiverID"));
            mySession.setAttribute("receiverID", receiverID);
            
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            User receiver = newUserDAO.getUserBasedOnID(receiverID);
            
            MySqlMessagesDAO messages =new MySqlMessagesDAO();
            List<MessagesBO> message_posts = messages.getListMessageBasedOnSenderReceiver(current_user.getUserID(),receiverID);
            mySession.setAttribute("message_posts", message_posts);
            request.setAttribute("memberToChat", receiver.getFirstName());
            setURL("messages.jsp");  
            
        }catch(Exception e){
            
            
        }

     }
}
