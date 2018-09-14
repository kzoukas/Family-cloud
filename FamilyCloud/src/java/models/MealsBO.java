/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import db.model.Meals;
import java.util.Date;

/**
 *
 * @author Desktop
 */
public class MealsBO {
    
    private int mealID;
    private String mealName;
    private String place;
    private Date datetime;
    private String description;
    private int director;
    private boolean daily;
    private boolean weekly;
    private boolean monthly;
    private int hoursRemindBefore;
    private String reminder;
    private Date expDate;
    private int userID;
    private Date reminderDate;
    
    public MealsBO(){
        
        mealID=0;
        mealName=null;
        place=null;
        datetime=null;
        description=null;
        director=0;
        userID=0;
        daily=false;
        weekly = false;
        monthly = false;
        hoursRemindBefore = 0;
        reminder = null;
        expDate = null;
        reminderDate = null;
       
    }
    public MealsBO toMealsBO(Meals meal) {

        MealsBO mealsBO = new MealsBO();

        mealsBO.setMealID(meal.getMealID());
        mealsBO.setMealName(meal.getMealName());
        mealsBO.setPlace(meal.getPlace());
        mealsBO.setDatetime(meal.getDatetime());
        mealsBO.setDescription(meal.getDescription());
        mealsBO.setDirector(meal.getDirector());
        mealsBO.setUserID(meal.getUserID());
        mealsBO.setDaily(meal.isDaily());
        mealsBO.setMonthly(meal.isMonthly());
        mealsBO.setWeekly(meal.isWeekly());
        mealsBO.setHoursRemindBefore(meal.getHoursRemindBefore());
        mealsBO.setReminder(meal.getReminder());
        mealsBO.setExpDate(meal.getExpDate());
        mealsBO.setReminderDate(meal.getReminderDate());
        
       
        return mealsBO;
    }

    public Date getReminderDate() {
        return reminderDate;
    }

    public void setReminderDate(Date reminderDate) {
        this.reminderDate = reminderDate;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
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
    
    public int getMealID() {
        return mealID;
    }

    public void setMealID(int mealID) {
        this.mealID = mealID;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }

    public String getPlace() {
        return place;
    }

    public void setPlace(String place) {
        this.place = place;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = director;
    }
    
    
    
}
