/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.messages;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.MessagesDAO;
import db.model.Messages;
import events.EventHandlerBase;
import events.famillyWall.ShowPostWallPicture;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vaggos
 */
public class ShowPostMessagePicture extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
            try{
        
            
           int messageID = Integer.parseInt(request.getParameter("messageID"));
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            MessagesDAO messageDAO = mySqlFactory.getMessagesDAO();
            Messages message = messageDAO.getMessageBasedOnMessageID(messageID);
         
            response.setContentType("image/jpeg");
            response.setContentLength(message.getMessageImage().length);
            response.getOutputStream().write(message.getMessageImage());
            setURL(null);
             
             
             
             
            } catch (DBOperationException ex) {
            
                    Logger.getLogger(ShowPostWallPicture.class.getName()).log(Level.SEVERE, null, ex);
            }
     
     }
}

    

