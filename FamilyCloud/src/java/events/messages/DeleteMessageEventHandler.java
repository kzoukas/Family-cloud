/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.messages;

import dao.impl.MySqlMessagesDAO;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.MessagesDAO;
import db.model.Messages;
import events.EventHandlerBase;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MessagesBO;
import models.UserBO;

/**
 *
 * @author Desktop
 */
public class DeleteMessageEventHandler extends EventHandlerBase{
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        
         try {
             int messageID = Integer.parseInt(request.getParameter("messageID"));
             UserBO current_user = (UserBO) mySession.getAttribute("myUser");
             
             
             
             DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
             MessagesDAO newPostDAO = mySqlFactory.getMessagesDAO();
             Messages messageNew=newPostDAO.getMessageBasedOnMessageID(messageID);
             int senderID=messageNew.getSenderID();
             int receiverID=messageNew.getReceiverID();
             boolean result = newPostDAO.deleteMessage(messageID);
             //MySqlMessagesDAO messages =new MySqlMessagesDAO();
             
             
             List<MessagesBO> message_posts = newPostDAO.getListMessageBasedOnSenderReceiver(senderID,receiverID);
             mySession.setAttribute("message_posts", message_posts);
             setURL("messages.jsp");
         
         
         } catch (DBOperationException ex) {
             Logger.getLogger(DeleteMessageEventHandler.class.getName()).log(Level.SEVERE, null, ex);
         }
        
        
    }
}
