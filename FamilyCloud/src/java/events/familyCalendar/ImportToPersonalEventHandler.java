/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.familyCalendar;

import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.PersonalCalendarDAO;
import db.model.FamilyCalendar;
import db.model.PersonalCalendar;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FamilyCalendarBO;
import models.PersonalCalendarBO;
import models.UserBO;


public class ImportToPersonalEventHandler  extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            int userID= myUser2.getUserID();
            
//             List<FamilyCalendarBO> listPCBO = (List) mySession.getAttribute("last_FClist_onload");
//            
//             for(int i=0 ; i<listPCBO.size() ; i++){
                 int activityID = Integer.parseInt(request.getParameter("activityID"));
                 DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
                 FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
                 FamilyCalendar importedEvent=myfcDAO.getFamilyEventBasedOnID(activityID);
                 
                    PersonalCalendarBO pcBO = new PersonalCalendarBO();
                    pcBO.setActivityName(importedEvent.getActivityName());
                    pcBO.setCategory(importedEvent.getCategory());
                    pcBO.setComment(importedEvent.getComment());
                    pcBO.setStartingDate(importedEvent.getStartingDate());
                    pcBO.setEndingDate(importedEvent.getEndingDate());
                    pcBO.setUserID(userID);
                    pcBO.setDaily(importedEvent.isDaily());
                    pcBO.setWeekly(importedEvent.isDaily());
                    pcBO.setMonthly(importedEvent.isMonthly());
                    pcBO.setReminder(importedEvent.getReminder());
                    pcBO.setHoursRemindBefore(importedEvent.getHoursRemindBefore());
                    pcBO.setExpDate(importedEvent.getExpDate());
                    pcBO.setReminderDate(importedEvent.getReminderDate());
            

                    
                    PersonalCalendarDAO pcDAO = mySqlFactory.getPersonalCalendarDAO();

                    PersonalCalendar pc = new PersonalCalendar();


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
                    pc.setReminderDate((pcBO.getReminderDate()));

                    boolean result = pcDAO.addTask(pc);
                    if(result){
                    request.setAttribute("messageMyPC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+pc.getActivityName() +" has been imported  successfully");
                    }
           //}    
            setURL("Controller?newproperties=PERSONALCALENDAR");
            
        }catch(Exception e){
            
            
        }
     }
    }

