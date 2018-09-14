/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.familyCalendar;

import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.UserDAO;
import db.model.FamilyCalendar;
import db.model.User;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Desktop
 */

public class ViewFamilyEventEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            FamilyCalendarDAO fcalendarDAO = mySqlFactory.getFamilyCalendarDAO();
            UserBO current_user= (UserBO) mySession.getAttribute("myUser");
            int activityID = Integer.parseInt(request.getParameter("activityID"));
        
            FamilyCalendar current_event = fcalendarDAO.getFamilyEventBasedOnID(activityID);
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"); 
            String startingToShow = dateFormat.format(current_event.getStartingDate());
            String endingToShow = dateFormat.format(current_event.getEndingDate());
            DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
            String expDateToShow = dateFormat2.format(current_event.getExpDate());
            
             JSONObject newJSON= new JSONObject();
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
            
             newJSON.put("assignedTo",current_event.getAssignedTo());
             newJSON.put("event_title",current_event.getActivityName());
             newJSON.put("comment",current_event.getComment());
             newJSON.put("category",current_event.getCategory());
             startingToShow = startingToShow.replace("T", " ");
             newJSON.put("starting_date",startingToShow);
             endingToShow = endingToShow.replace("T", " ");
             newJSON.put("ending_date",endingToShow);
             if(current_event.getReminder().equals("day1ago")){
                 newJSON.put("reminder","Your reminder has been set 1 day ago");
             }else if(current_event.getReminder().equals("day2ago")){
                 newJSON.put("reminder","Your reminder has been set 2 days ago");
            }else if(current_event.getReminder().equals("No reminder")){
               
                newJSON.put("reminder","You havent set any reminder");
            }else{
                 newJSON.put("reminder","Your reminder has been set "+ current_event.getHoursRemindBefore() +" hous ago");
            }
             
             newJSON.put("hoursRem",current_event.getHoursRemindBefore());
             newJSON.put("activityID",current_event.getActivityID());
             
            String reputance = "";
            if(current_event.isDaily()) reputance = reputance + "Daily  ";
            if(current_event.isWeekly()) reputance = reputance + "Weekly  ";
            if(current_event.isMonthly()) reputance = reputance + "Monthly  ";
            newJSON.put("reputance",reputance);
            newJSON.put("daily",current_event.isDaily());
            newJSON.put("weekly",current_event.isWeekly());
            newJSON.put("monthly",current_event.isMonthly());
            newJSON.put("expDate", expDateToShow);
            
            
            if((current_event.getUserID()==current_user.getUserID())||(current_user.getUserID()== current_user.getDirector())){
                
                newJSON.put("creator","true");
            }
            else{
                newJSON.put("creator","false");
            }
            String dateToShow = null;
            dateToShow = dateFormat2.format(current_event.getReminderDate());
            if(dateToShow.equals("0002-11-30") || dateToShow==null ){
                dateToShow = "0";
            }
            newJSON.put("reminderDate", dateToShow);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            User creator = myUserDAO.getUserBasedOnID(current_event.getUserID());
            newJSON.put("createdBy", creator.getFirstName());
              String reminderView = null;
            reminderView = dateFormat2.format(current_event.getReminderDate());
            if(reminderView.equals("0002-11-30")){
                reminderView = "No Reminder";
            }
            newJSON.put("reminderView", reminderView);
              out.println(newJSON);
            
              out.close();
              
            
        }catch(Exception e){
            
            
        }
    
     
     
     
     
     }
     


}
