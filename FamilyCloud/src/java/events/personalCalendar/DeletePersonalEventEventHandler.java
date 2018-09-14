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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Desktop
 */

public class DeletePersonalEventEventHandler extends EventHandlerBase{
    
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
            PersonalCalendarDAO famcalDAO = mySqlFactory.getPersonalCalendarDAO();
            int activityID = Integer.parseInt(request.getParameter("activityID"));
            PersonalCalendar deletedEvent=famcalDAO.getPersonalEventBasedOnID(activityID);
            String deletedName=deletedEvent.getActivityName();
            
            boolean result = famcalDAO.deletePersonalEvent(activityID);
            if(result){
                    request.setAttribute("messageMyPC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+ deletedName +" has been deleted successfully");
            }
            

          setURL("Controller?newproperties=PERSONALCALENDAR");

          }catch(Exception e){
            
            
        }
    }
    
    
    
    
    
    
    
}
