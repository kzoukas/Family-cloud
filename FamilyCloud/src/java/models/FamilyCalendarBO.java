
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import db.model.FamilyCalendar;
import db.model.PersonalCalendar;
import java.util.Date;

/**
 *
 * @author Vaggos
 */
public class FamilyCalendarBO {

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
    private int director;
    private String assignedTo;
    private Date reminderDate;

    public FamilyCalendarBO() {

        activityID = 0;
        userID = 0;
        activityName = null;
        category = null;
        startingDate = null;
        endingDate = null;
        comment = null;
        daily = false;
        weekly = false;
        monthly = false;
        hoursRemindBefore = 0;
        reminder = null;
        expDate = null;
        director = 0;
        assignedTo = null;
        reminderDate = null;
    }

    public FamilyCalendarBO toFamilyCalendarBO(FamilyCalendar fc) {

        FamilyCalendarBO fcBO = new FamilyCalendarBO();

        fcBO.setActivityID(fc.getActivityID());
        fcBO.setActivityName(fc.getActivityName());
        fcBO.setCategory(fc.getCategory());
        fcBO.setComment(fc.getComment());
        fcBO.setEndingDate(fc.getEndingDate());
        fcBO.setStartingDate(fc.getStartingDate());
        fcBO.setUserID(fc.getUserID());
        fcBO.setDaily(fc.isDaily());
        fcBO.setWeekly(fc.isWeekly());
        fcBO.setMonthly(fc.isMonthly());
        fcBO.setHoursRemindBefore(fc.getHoursRemindBefore());
        fcBO.setReminder(fc.getReminder());
        fcBO.setExpDate(fc.getExpDate());
        fcBO.setAssignedTo(fc.getAssignedTo());
        fcBO.setReminderDate(fc.getReminderDate());
        return fcBO;
    }

    public Date getReminderDate() {
        return reminderDate;
    }

    public void setReminderDate(Date reminderDate) {
        this.reminderDate = reminderDate;
    }

    public String getAssignedTo() {
        return assignedTo;
    }

    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
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

    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = director;
    }

}
