
package db.model;

import java.util.Date;




/**
 *
 * @author Desktop
 */
public class Meals {
    
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
    
    public Meals(){
        
        mealID=0;
        mealName=null;
        place=null;
        userID=0;
        datetime=null;
        description=null;
        director=0;
        
        daily=false;
        weekly=false;
        monthly=false;
        
        hoursRemindBefore=0;
        reminder=null;
        expDate=null;      
        reminderDate=null;
    }
    public void updateMealInfo(Meals other) {
        if (other != null) {
            if (other.getMealName()!= null) {
                mealName = other.getMealName();
            }
            if (other.getMealID()!= 0) {
                mealID = other.getMealID();
            }
            if (other.getPlace()!= null) {
                place = other.getPlace();
            }
            
            if (other.getDatetime()!= null) {
                datetime = other.getDatetime();
            }
            if (other.getDescription()!= null) {
                description = other.getDescription();
            }
            if(other.getDirector()!=0){
                director = other.getDirector();
            }
            if(other.getUserID()!=0){
                userID = other.getUserID();
            }
            
            if (other.isDaily()!= false) {
                daily = other.isDaily();
            }
            if (other.isWeekly()!= false) {
                weekly = other.isWeekly();
            }
            if (other.isMonthly()!= false) {
                monthly = other.isMonthly();
            }
            
            if (other.getHoursRemindBefore()!= 0) {
                hoursRemindBefore = other.getHoursRemindBefore();
            }
            if (other.getReminder()!= null) {
                reminder = other.getReminder();
            }
            if (other.getExpDate()!= null) {
                expDate = other.getExpDate();
            }
            if (other.getReminderDate()!=null){
                reminderDate = other.getReminderDate();
            }
              
           
           
        }
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
