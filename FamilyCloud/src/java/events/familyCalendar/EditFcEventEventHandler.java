
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.familyCalendar;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.UserDAO;
import db.model.FamilyCalendar;
import events.EventHandlerBase;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FamilyCalendarBO;
import models.UserBO;

/**
 *
 * @author Desktop
 */
public class EditFcEventEventHandler  extends EventHandlerBase{
            
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
            int activityID = Integer.parseInt(request.getParameter("activityID"));
            
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String reminderDateString =request.getParameter("reminderDate");
            Date reminderDate = new Date();
             if (reminderDateString != "" && reminderDateString != null) {
                reminderDate = format.parse(reminderDateString);
            } else {
                reminderDate = format.parse("0000-00-00");
            } 
            
            startingDateString = startingDateString.replace(" ", "T");
            endingDateString = endingDateString.replace(" ", "T");
            if (endingDateString == null || endingDateString == "") {
                endingDateString = startingDateString;
            }
            DateFormat formatDT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date startingDate = formatDT.parse(startingDateString);
            Date endingDate = formatDT.parse(endingDateString);


            Date expDate = new Date();
            if (expDateString != null && expDateString != "") {
                expDate = format.parse(expDateString);
            }

            boolean daily = Boolean.valueOf(request.getParameter("daily"));
            boolean weekly = Boolean.valueOf(request.getParameter("weekly"));
            boolean monthly = Boolean.valueOf(request.getParameter("monthly"));
            String reminder = request.getParameter("reminder");
            int hoursRemindBefore = Integer.parseInt(request.getParameter("hoursBefore"));

            String assignedTo = request.getParameter("assignedTo");
            if (assignedTo.length() == 0) {

                assignedTo = "No specific";
            }

            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            int userID = current_user.getUserID();
            int director = current_user.getDirector();

            FamilyCalendarBO pcBO = new FamilyCalendarBO();
            pcBO.setActivityName(activityName);
            pcBO.setCategory(category);
            pcBO.setComment(comment);
            pcBO.setAssignedTo(assignedTo);
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
            pcBO.setDirector(director);
            pcBO.setReminderDate(reminderDate);
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            FamilyCalendarDAO pcDAO = mySqlFactory.getFamilyCalendarDAO();
//
            FamilyCalendar fc = new FamilyCalendar();
//           

            fc.setActivityName(pcBO.getActivityName());
            fc.setActivityID(pcBO.getActivityID());
            fc.setCategory(pcBO.getCategory());
            fc.setComment(pcBO.getComment());
            fc.setAssignedTo(pcBO.getAssignedTo());
            fc.setUserID(pcBO.getUserID());
            fc.setEndingDate(pcBO.getEndingDate());
            fc.setStartingDate(pcBO.getStartingDate());
            fc.setDaily(pcBO.isDaily());
            fc.setWeekly(pcBO.isWeekly());
            fc.setMonthly(pcBO.isMonthly());
            fc.setReminder(pcBO.getReminder());
            fc.setHoursRemindBefore(pcBO.getHoursRemindBefore());
            fc.setExpDate(pcBO.getExpDate());
            fc.setDirector(pcBO.getDirector());
            fc.setReminderDate(pcBO.getReminderDate());
            boolean result = pcDAO.updateFcEvent(fc, activityID);
            
            FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
            List<String> categoryList = myfcDAO.getCategoryList(current_user.getDirector());
            request.setAttribute("categoryList", categoryList);
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            List<UserBO> usersExceptCurrent = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
            request.setAttribute("usersExceptCurrent", usersExceptCurrent);
            
            if(result){
                    request.setAttribute("messageMyFC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+activityName +" has been updated successfully");
            }

            setURL("Controller?newproperties=FAMILYCALENDAR");
            
        }catch(Exception e){
            
            
        }
     }
}
