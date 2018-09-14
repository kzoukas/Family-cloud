/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import db.model.PersonalCalendar;
import java.util.Date;

/**
 *
 * @author Vaggos
 */
public class PersonalCalendarBO {
    
    private int activityID;
    private String activityName;
    private String category;
    private Date startingDate;
    private Date endingDate;
    private String comment;
    private int userID;
    private boolean daily;
    private boolean weekly;
    private boolean monthly;
    private int hoursRemindBefore;
    private String reminder;
    private Date expDate;
    private Date reminderDate;
    
    public PersonalCalendarBO(){
        
        activityID=0;
        userID = 0;
        activityName=null;
        category=null;
        startingDate=null;
        endingDate =null;
        comment =null;
        daily=false;
        weekly=false;
        monthly=false;
        hoursRemindBefore=0;
        reminder=null;
        expDate=null;        
        reminderDate=null;
    }
    
     public PersonalCalendarBO toPersonalCalendarBO(PersonalCalendar pc) {

        PersonalCalendarBO pcBO = new PersonalCalendarBO();

        pcBO.setActivityID(pc.getActivityID());
        pcBO.setActivityName(pc.getActivityName());
        pcBO.setCategory(pc.getCategory());
        pcBO.setComment(pc.getComment());
        pcBO.setEndingDate(pc.getEndingDate());
        pcBO.setStartingDate(pc.getStartingDate());
        pcBO.setUserID(pc.getUserID());
        pcBO.setDaily(pc.isDaily());
        pcBO.setWeekly(pc.isWeekly());
        pcBO.setMonthly(pc.isMonthly());
        pcBO.setHoursRemindBefore(pc.getHoursRemindBefore());
        pcBO.setReminder(pc.getReminder());
        pcBO.setExpDate(pc.getExpDate());
        pcBO.setReminderDate(pc.getReminderDate());
       
        return pcBO;
    }

    public Date getReminderDate() {
        return reminderDate;
    }

    public void setReminderDate(Date reminderDate) {
        this.reminderDate = reminderDate;
    }

    public String getReminder() {
        return reminder;
    }

    public void setReminder(String reminder) {
        this.reminder = reminder;
    }

    public Date getExpDate() {
        return expDate;
    }

    public void setExpDate(Date expDate) {
        this.expDate = expDate;
    }

     
     
    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

     
    public int getActivityID() {
        return activityID;
    }

    public void setActivityID(int activityID) {
        this.activityID = activityID;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getStartingDate() {
        return startingDate;
    }

    public void setStartingDate(Date startingDate) {
        this.startingDate = startingDate;
    }

    public Date getEndingDate() {
        return endingDate;
    }

    public void setEndingDate(Date endingDate) {
        this.endingDate = endingDate;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public boolean isDaily() {
        return daily;
    }

    public void setDaily(boolean daily) {
        this.daily = daily;
    }

    public boolean isWeekly() {
        return weekly;
    }

    public void setWeekly(boolean weekly) {
        this.weekly = weekly;
    }

    public boolean isMonthly() {
        return monthly;
    }

    public void setMonthly(boolean monthly) {
        this.monthly = monthly;
    }

    public int getHoursRemindBefore() {
        return hoursRemindBefore;
    }

    public void setHoursRemindBefore(int hoursRemindBefore) {
        this.hoursRemindBefore = hoursRemindBefore;
    }
    
    
    
    
}
