/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.Notifications;
import java.util.List;
import models.NotificationsBO;

/**
 *
 * @author Vaggos
 */
public interface NotificationsDAO {
    
     public List<NotificationsBO> getNotificationsBasedOnID(int userID) throws DBOperationException;
     public Notifications getNotificationBasedOnID(int notificationID) throws DBOperationException;
     public int getNOReadB(int userID)throws DBOperationException;
     public boolean updateNotificationIsReadB(int notificationID);
     public boolean deleteNotification(int notificationID);
     public boolean insertReminderNotification(Notifications not);
    
}
