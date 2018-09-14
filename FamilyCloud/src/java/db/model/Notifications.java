/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.model;

import java.util.Date;

/**
 *
 * @author Vaggos
 */
public class Notifications {
    
    private int notificationID;
    private int userID_A;
    private int userID_B;
    private String notification_type;
    private String messages;
    private int referredID;
    private String isreadA;
    private String isreadB;
    private Date date_created;
    
  
    public Notifications(){
        
        notificationID=0;
        userID_A = 0;
        userID_B=0;
        notification_type=null;
        messages=null;
        isreadA=null;
        isreadB =null;
        date_created =null;
        referredID=0;
            
        
    }
    
    

    public int getNotificationID() {
        return notificationID;
    }

    public void setNotificationID(int notificationID) {
        this.notificationID = notificationID;
    }

    public int getUserID_A() {
        return userID_A;
    }

    public void setUserID_A(int userID_A) {
        this.userID_A = userID_A;
    }

    public int getUserID_B() {
        return userID_B;
    }

    public void setUserID_B(int userID_B) {
        this.userID_B = userID_B;
    }

    public String getNotification_type() {
        return notification_type;
    }

    public void setNotification_type(String notification_type) {
        this.notification_type = notification_type;
    }

    public String getMessages() {
        return messages;
    }

    public void setMessages(String messages) {
        this.messages = messages;
    }

    public int getReferredID() {
        return referredID;
    }

    public void setReferredID(int referredID) {
        this.referredID = referredID;
    }

    public String getIsreadA() {
        return isreadA;
    }

    public void setIsreadA(String isreadA) {
        this.isreadA = isreadA;
    }

    public String getIsreadB() {
        return isreadB;
    }

    public void setIsreadB(String isreadB) {
        this.isreadB = isreadB;
    }

    public Date getDate_created() {
        return date_created;
    }

    public void setDate_created(Date date_created) {
        this.date_created = date_created;
    }
    
    
    
    
}

