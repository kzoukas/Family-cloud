/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.personalCalendar;

import daos.DAOFactory;
import daos.PersonalCalendarDAO;
import db.model.PersonalCalendar;
import events.EventHandlerBase;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.PersonalCalendarBO;
import models.UserBO;

/**
 *
 * @author Vaggos
 */
public class PcAddTaskEventHandler extends EventHandlerBase {

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
            DateFormat formatDT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            String reminderDateString =request.getParameter("reminderDate");
            Date reminderDate = new Date();
            if (reminderDateString != "" && reminderDateString != null) {
                reminderDate = format.parse(reminderDateString);
            } else {
                reminderDate = format.parse("0000-00-00");
            } 
            
            startingDateString = startingDateString.replace(" ","T");
            endingDateString = endingDateString.replace(" ", "T");
            Date startingDate = formatDT.parse(startingDateString);
            Date endingDate = new Date();
            
            if (endingDateString != "" && endingDateString != null) {
                endingDate = formatDT.parse(endingDateString);
            } else {
                endingDate = startingDate;
            }
            Date expDate = new Date();
            if (expDateString != "" && expDateString != null) {
                expDate = format.parse(expDateString);
            }
            //Date endingDate = format.parse(endingDateString);
            boolean daily = Boolean.valueOf(request.getParameter("daily"));
            boolean weekly = Boolean.valueOf(request.getParameter("weekly"));
            boolean monthly = Boolean.valueOf(request.getParameter("monthly"));
            String reminder = request.getParameter("reminder");
            int hoursRemindBefore = Integer.parseInt(request.getParameter("hoursBefore"));
            

            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            int userID = myUser2.getUserID();

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
            pcBO.setReminderDate(reminderDate);
//            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            PersonalCalendarDAO pcDAO = mySqlFactory.getPersonalCalendarDAO();
//
            PersonalCalendar pc = new PersonalCalendar();
//           

            pc.setActivityName(pcBO.getActivityName());
            pc.setCategory(pcBO.getCategory());
            pc.setComment(pcBO.getComment());
            pc.setUserID(pcBO.getUserID());
            pc.setEndingDate(pcBO.getEndingDate());
            pc.setStartingDate(pcBO.getStartingDate());

            pc.setDaily(pcBO.isDaily());
            pc.setWeekly(pcBO.isWeekly());
            pc.setMonthly(pcBO.isMonthly());
            pc.setReminder(pcBO.getReminder());
            pc.setHoursRemindBefore(pcBO.getHoursRemindBefore());
            pc.setExpDate(pcBO.getExpDate());
            pc.setReminderDate(pcBO.getReminderDate());

            boolean result = pcDAO.addTask(pc);
            if(result){
                    request.setAttribute("messageMyPC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+activityName +" has been added successfully");
            }

            setURL("Controller?newproperties=PERSONALCALENDAR");

        } catch (Exception e) {

        }
    }
}
