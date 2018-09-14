
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.personalCalendar;

import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.PersonalCalendarDAO;
import db.model.FamilyCalendar;
import db.model.PersonalCalendar;
import events.EventHandlerBase;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FamilyCalendarBO;
import models.PersonalCalendarBO;
import models.UserBO;

/**
 *
 * @author Desktop
 */
public class EditPcEventEventHandler  extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            
            String activityName = request.getParameter("activityName");
            String category = request.getParameter("category");
            String startingDateString = request.getParameter("startingDate");
            String endingDateString = request.getParameter("endingDate");
            String comment = request.getParameter("comment");
            String expDateString = request.getParameter("expDate");
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String reminderDateString =request.getParameter("reminderDate");
            Date reminderDate = new Date();
             if (reminderDateString != "" && reminderDateString != null) {
                reminderDate = format.parse(reminderDateString);
            } else {
                reminderDate = format.parse("0000-00-00");
            } 
            startingDateString = startingDateString.replace(" ","T");
            endingDateString = endingDateString.replace(" ", "T");
            if(endingDateString == null || endingDateString == ""){
                endingDateString = startingDateString;
            }
            int activityID= Integer.parseInt(request.getParameter("activityID"));
            
            DateFormat formatDT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date startingDate = formatDT.parse(startingDateString);
            Date endingDate = formatDT.parse(endingDateString);
            
            Date expDate = new Date();
            if(expDateString != null && expDateString != ""){
                expDate = format.parse(expDateString);
            }
            boolean daily = Boolean.valueOf(request.getParameter("daily"));
            boolean weekly = Boolean.valueOf(request.getParameter("weekly"));
            boolean monthly = Boolean.valueOf(request.getParameter("monthly"));
            String reminder = request.getParameter("reminder");
            int hoursRemindBefore= Integer.parseInt(request.getParameter("hoursBefore"));
           
            
            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            int userID= myUser2.getUserID();
            
            
            PersonalCalendarBO pcBO = new PersonalCalendarBO();
            pcBO.setActivityName(activityName);
            pcBO.setCategory(category);
            pcBO.setComment(comment);
            pcBO.setStartingDate(startingDate);
            pcBO.setEndingDate(endingDate);
            pcBO.setUserID(userID);
            pcBO.setDaily(daily);
            pcBO.setWeekly(weekly);
            pcBO.setMonthly(monthly);
            pcBO.setReminder(reminder);
            pcBO.setHoursRemindBefore(hoursRemindBefore);
            pcBO.setExpDate(expDate);
            pcBO.setActivityID(activityID);
            pcBO.setReminderDate(reminderDate);
//            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
           PersonalCalendarDAO pcDAO = mySqlFactory.getPersonalCalendarDAO();
//
            PersonalCalendar fc = new PersonalCalendar();
//           
            
            fc.setActivityName(pcBO.getActivityName());
            fc.setActivityID(pcBO.getActivityID());
            fc.setCategory(pcBO.getCategory());
            fc.setComment(pcBO.getComment());
            fc.setUserID(pcBO.getUserID());
            fc.setEndingDate(pcBO.getEndingDate());
            fc.setStartingDate(pcBO.getStartingDate());
            fc.setDaily(pcBO.isDaily());
            fc.setWeekly(pcBO.isWeekly());
            fc.setMonthly(pcBO.isMonthly());
            fc.setReminder(pcBO.getReminder());
            fc.setHoursRemindBefore(pcBO.getHoursRemindBefore());
            fc.setExpDate(pcBO.getExpDate());
            fc.setReminderDate(pcBO.getReminderDate());
            
            boolean result = pcDAO.updatePcEvent(fc,activityID);
            if(result){
                    request.setAttribute("messageMyPC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+activityName +" has been updated successfully");
            }
                
            setURL("Controller?newproperties=PERSONALCALENDAR");
            
        }catch(Exception e){
            
            
        }
     }
}
