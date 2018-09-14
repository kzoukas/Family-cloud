/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import daos.DBOperationException;
import daos.MessagesDAO;
import db.model.Messages;
import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.MessagesBO;

/**
 *
 * @author Vaggos
 */
public class MySqlMessagesDAO implements MessagesDAO{

    @Override
    public boolean insertMessage(Messages message) {
            
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        

        try {
            pst=conn.prepareStatement("SELECT MAX(messageID) AS maxID FROM messages;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {
               
                message.setMessageID(rs1.getInt("maxID")+1);

            }
            pst = conn.prepareStatement("INSERT INTO messages(messageID, senderID, receiverID, text, image) VALUES(?, ?, ?, ?, ?)");

            pst.setInt(1,message.getMessageID() );
            pst.setInt(2,message.getSenderID() );
            pst.setInt(3,message.getReceiverID() );
            pst.setString(4,message.getText() );
            pst.setBinaryStream(5,new ByteArrayInputStream(message.getMessageImage()),message.getMessageImage().length);
            
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
            
  public List<MessagesBO> getListMessageBasedOnSenderReceiver(int senderID,int receiverID) throws DBOperationException {
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        List<MessagesBO> allPosts= new ArrayList<MessagesBO>();
        Messages message = new Messages();

        try {
            pst = conn.prepareStatement("SELECT * FROM messages WHERE (senderID= ? AND receiverID=?) OR (senderID=? AND receiverID=?) ");
            pst.setInt(1, senderID);
            pst.setInt(2, receiverID);
            pst.setInt(3, receiverID);
            pst.setInt(4, senderID);

           
            

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                message.setMessageID(rs.getInt("messageID"));
                message.setSenderID(rs.getInt("senderID"));
                message.setText(rs.getString("text"));
                message.setReceiverID(rs.getInt("receiverID"));
                Blob imageBlob = (rs.getBlob("image"));
                
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                
                if(imageBytes.length==0){
                    message.setMessageImage(null);
                }else{
                    message.setMessageImage(imageBytes);
                }
               
                

            
                MessagesBO takis = new MessagesBO();
               
                allPosts.add(takis.toMessagesBO(message));
                
                
            }
                
        } catch (SQLException ex) {
            message = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return allPosts;
    }     
  
    @Override
   public Messages getMessageBasedOnMessageID(int postID) throws DBOperationException {

        PreparedStatement pst = null;
        byte[] imageBytes = null;
        Connection conn = MySqlDAOFactory.createConnection();

        Messages message = new Messages();

        try {
            pst = conn.prepareStatement("SELECT * FROM messages WHERE messageID = ?");
            pst.setInt(1, postID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                message.setMessageID(rs.getInt("messageID"));
                message.setReceiverID(rs.getInt("receiverID"));
                message.setSenderID(rs.getInt("senderID"));
                message.setText(rs.getString("text"));
               
                
                Blob imageBlob = rs.getBlob("image");
                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                message.setMessageImage(imageBytes);
            }

        } catch (SQLException ex) {
            message = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return message;
    }
    
   
   public boolean deleteMessage(int messageID){
       
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            pst = conn.prepareStatement("DELETE FROM messages WHERE messageID = ?");
            pst.setInt(1, messageID);

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
