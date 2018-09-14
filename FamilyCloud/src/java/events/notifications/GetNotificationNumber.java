/**
 *
 * @author Vaggos
 */
package events.notifications;

import dao.impl.MySqlFamilyCalendarDAO;
import dao.impl.MySqlMealsDAO;
import dao.impl.MySqlNotificationsDAO;
import dao.impl.MySqlPersonalCalendarDAO;
import db.model.FamilyCalendar;
import db.model.Meals;
import db.model.Notifications;
import db.model.PersonalCalendar;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FamilyCalendarBO;
import models.MealsBO;
import models.PersonalCalendarBO;
import models.UserBO;

public class GetNotificationNumber extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            
            handleNotReminderPC(myUser);
            handleNotReminderMeals(myUser);
            handleNotReminderFC(myUser);
            
            PrintWriter out = null;
            MySqlNotificationsDAO pcDAO = new MySqlNotificationsDAO();

            int count = pcDAO.getNOReadB(myUser.getUserID());

            out = response.getWriter();
            out.print(count);
            out.close();

        } catch (Exception e) {

        }

    }
    private void handleNotReminderPC(UserBO myUser){
        try{
            MySqlPersonalCalendarDAO pcDAO1 = new MySqlPersonalCalendarDAO();
            MySqlNotificationsDAO notDAO = new MySqlNotificationsDAO();
            //pairnoume th lista tou pc sumfona me to userID
            List<PersonalCalendarBO> listPCBO = pcDAO1.getPCListBasedOnDirector(myUser.getUserID());
            PersonalCalendar pcRemDAO = new PersonalCalendar();
            DateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            PersonalCalendarBO pcBO;
            Notifications not = new Notifications();
            Date currentDate = new Date();
            String currentDateString = newDateFormat.format(currentDate);
            String reminderDateString = "0000-00-00";
            PersonalCalendar pc = new PersonalCalendar();
            for (int i = 0; i < listPCBO.size(); i++) {
                pcBO = listPCBO.get(i);
                pc.setActivityName(pcBO.getActivityName());
                pc.setCategory(pcBO.getCategory());
                pc.setComment(pcBO.getComment());
                pc.setUserID(pcBO.getUserID());
                pc.setEndingDate(pcBO.getEndingDate());
                pc.setStartingDate(pcBO.getStartingDate());
                pc.setActivityID(pcBO.getActivityID());
                pc.setDaily(pcBO.isDaily());
                pc.setWeekly(pcBO.isWeekly());
                pc.setMonthly(pcBO.isMonthly());
                pc.setReminder(pcBO.getReminder());
                pc.setHoursRemindBefore(pcBO.getHoursRemindBefore());
                pc.setExpDate(pcBO.getExpDate());
                
                
                

                reminderDateString = newDateFormat.format(pcBO.getReminderDate());
                if (currentDateString.equals(reminderDateString)) {
                    //an isxuei prepei na valoume notification
                    not.setDate_created(currentDate);
                    not.setIsreadA("");
                    not.setIsreadB("N");
                    not.setNotification_type("reminderNot");
                    //userID here stands for personal calendar activityID
                    not.setUserID_A(0);
                    not.setUserID_B(myUser.getUserID());
                    not.setReferredID(pcBO.getActivityID());
                    notDAO.insertReminderNotification(not);
                    //reputance daily and reminder
                    pc.setReminderDate(newDateFormat.parse("0000-00-00"));
                    
                    //kanoume set ReminderDate 0000-00-00
                    //an 8eloume na kanoume set kati allo to kanoume parakato
                    
                    if(pc.isMonthly()){
                        if(pc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(pcBO.getReminderDate());
                            c.add(Calendar.MONTH, 1);  // number of days to add
                            pc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                           
                        }
                    }
                    if(pc.isWeekly()){
                        if(pc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(pcBO.getReminderDate());
                            c.add(Calendar.DATE, 7);  // number of days to add
                            pc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                    }
                    if(pc.isDaily()){
                        if(pc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(pcBO.getReminderDate());
                            c.add(Calendar.DATE, 1);  // number of days to add
                            pc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                            
                        
                    }
                    pcDAO1.updatePcEvent(pc, pc.getActivityID());
                }

            }
            } catch (Exception e) {

        }
    }
    
    public void handleNotReminderMeals(UserBO myUser){
        try{
            MySqlMealsDAO mealDAO = new MySqlMealsDAO();
            List<MealsBO> listmealBO = mealDAO.getMealsListBasedOnDirector(myUser.getDirector());
            //pairnoume th lista tou meals sumfona me to director
            MySqlNotificationsDAO notDAO = new MySqlNotificationsDAO();
            
            
            DateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            MealsBO mealsBO = new MealsBO();
            Notifications not = new Notifications();
            Date currentDate = new Date();
            String currentDateString = newDateFormat.format(currentDate);
            String reminderDateString = "0000-00-00";
            Meals meal = new Meals();
            for (int i = 0; i < listmealBO.size(); i++) {
                mealsBO = listmealBO.get(i);
                
                meal.setMealName(mealsBO.getMealName());
                meal.setDescription(mealsBO.getDescription());
                meal.setPlace(mealsBO.getPlace());
                meal.setDatetime(mealsBO.getDatetime());
                meal.setDirector(mealsBO.getDirector());
                meal.setUserID(mealsBO.getUserID());
                meal.setDaily(mealsBO.isDaily());
                meal.setWeekly(mealsBO.isWeekly());
                meal.setMonthly(mealsBO.isMonthly());
                meal.setReminder(mealsBO.getReminder());
                meal.setHoursRemindBefore(mealsBO.getHoursRemindBefore());
                meal.setExpDate(mealsBO.getExpDate());
                meal.setReminderDate(mealsBO.getReminderDate());
                meal.setMealID(mealsBO.getMealID());
                
                

                reminderDateString = newDateFormat.format(mealsBO.getReminderDate());
                if (currentDateString.equals(reminderDateString)) {
                    //an isxuei prepei na valoume notification
                    not.setDate_created(currentDate);
                    not.setIsreadA("");
                    not.setIsreadB("N");
                    not.setNotification_type("reminderNotMeals");
                    //userID here stands for personal calendar activityID
                    not.setUserID_A(0);
                    not.setUserID_B(mealsBO.getUserID());
                    not.setReferredID(mealsBO.getMealID());
                    notDAO.insertReminderNotification(not);
                    //reputance daily and reminder
                    meal.setReminderDate(newDateFormat.parse("0000-00-00"));
                    //kanoume set ReminderDate 0000-00-00
                    //an 8eloume na kanoume set kati allo to kanoume parakato
                    
                    if(meal.isMonthly()){
                        if(meal.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(mealsBO.getReminderDate());
                            c.add(Calendar.MONTH, 1);  // number of days to add
                            meal.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                           
                        }
                    }
                    if(meal.isWeekly()){
                        if(meal.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(mealsBO.getReminderDate());
                            c.add(Calendar.DATE, 7);  // number of days to add
                            meal.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                    }
                    if(meal.isDaily()){
                        if(meal.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(mealsBO.getReminderDate());
                            c.add(Calendar.DATE, 1);  // number of days to add
                            meal.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                            
                        
                    }
                    mealDAO.updateMealEvent(meal, meal.getMealID());
                }

            }
            } catch (Exception e) {

        }
        
        
    }
    public void handleNotReminderFC(UserBO myUser){
        try{
            MySqlFamilyCalendarDAO fcDAO = new MySqlFamilyCalendarDAO();
            List<FamilyCalendarBO> listFCBO = fcDAO.getFCListBasedOnDirector(myUser.getDirector());
            //pairnoume th lista tou meals sumfona me to director
            MySqlNotificationsDAO notDAO = new MySqlNotificationsDAO();
            
            
            DateFormat newDateFormat = new SimpleDateFormat("yyyy-MM-dd");
            FamilyCalendarBO fcBO = new FamilyCalendarBO();
            Notifications not = new Notifications();
            Date currentDate = new Date();
            String currentDateString = newDateFormat.format(currentDate);
            String reminderDateString = "0000-00-00";
            FamilyCalendar fc = new FamilyCalendar();
            for (int i = 0; i < listFCBO.size(); i++) {
                fcBO = listFCBO.get(i);
                
                fc.setActivityName(fcBO.getActivityName());
                fc.setCategory(fcBO.getCategory());
                fc.setComment(fcBO.getComment());
                fc.setAssignedTo(fcBO.getAssignedTo());
                fc.setUserID(fcBO.getUserID());
                fc.setEndingDate(fcBO.getEndingDate());
                fc.setStartingDate(fcBO.getStartingDate());
                fc.setDaily(fcBO.isDaily());
                fc.setWeekly(fcBO.isWeekly());
                fc.setMonthly(fcBO.isMonthly());
                fc.setReminder(fcBO.getReminder());
                fc.setHoursRemindBefore(fcBO.getHoursRemindBefore());
                fc.setExpDate(fcBO.getExpDate());
                fc.setDirector(fcBO.getDirector());
                fc.setReminderDate(fcBO.getReminderDate());
                fc.setActivityID(fcBO.getActivityID());
                

                reminderDateString = newDateFormat.format(fcBO.getReminderDate());
                if (currentDateString.equals(reminderDateString)) {
                    //an isxuei prepei na valoume notification
                    not.setDate_created(currentDate);
                    not.setIsreadA("");
                    not.setIsreadB("N");
                    not.setNotification_type("reminderNotFC");
                    //userID here stands for personal calendar activityID
                    not.setUserID_A(0);
                    not.setUserID_B(fcBO.getUserID());
                    not.setReferredID(fcBO.getActivityID());
                    notDAO.insertReminderNotification(not);
                    //reputance daily and reminder
                    fc.setReminderDate(newDateFormat.parse("0000-00-00"));
                    fc.setReminder("trigger_disable");
                    //kanoume set ReminderDate 0000-00-00
                    //an 8eloume na kanoume set kati allo to kanoume parakato
                    
                    if(fc.isMonthly()){
                        if(fc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(fcBO.getReminderDate());
                            c.add(Calendar.MONTH, 1);  // number of days to add
                            fc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                           
                        }
                    }
                    if(fc.isWeekly()){
                        if(fc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(fcBO.getReminderDate());
                            c.add(Calendar.DATE, 7);  // number of days to add
                            fc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                    }
                    if(fc.isDaily()){
                        if(fc.getExpDate().compareTo(currentDate)>0){
                            Calendar c = Calendar.getInstance();
                            c.setTime(fcBO.getReminderDate());
                            c.add(Calendar.DATE, 1);  // number of days to add
                            fc.setReminderDate(c.getTime());

                            //pc.setReminderDate(newDateFormat.parse(reminderDateString));
                            
                        }
                            
                        
                    }
                    fcDAO.updateFcEvent(fc, fc.getActivityID());
                }

            }
            } catch (Exception e) {

        }
        
        
    }
    
    

}
