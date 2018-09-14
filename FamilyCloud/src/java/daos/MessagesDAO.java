/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.Messages;
import java.util.List;
import models.MessagesBO;

/**
 *
 * @author Vaggos
 */
public interface MessagesDAO {
    public boolean insertMessage(Messages message);
    public List<MessagesBO> getListMessageBasedOnSenderReceiver(int senderID,int receiverID) throws DBOperationException;
    public Messages getMessageBasedOnMessageID(int postID) throws DBOperationException;
    public boolean deleteMessage(int messageID);
    
}
