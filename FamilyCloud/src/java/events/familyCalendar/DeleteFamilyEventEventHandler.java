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
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;

/**
 *
 * @author Desktop
 */
public class DeleteFamilyEventEventHandler extends EventHandlerBase{
    
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
            FamilyCalendarDAO famcalDAO = mySqlFactory.getFamilyCalendarDAO();
            int activityID = Integer.parseInt(request.getParameter("activityID"));
            FamilyCalendar deletedEvent=famcalDAO.getFamilyEventBasedOnID(activityID);
            String deletedName=deletedEvent.getActivityName();
            
            boolean result = famcalDAO.deleteFamilyEvent(activityID);
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
           
            
            FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
            List<String> categoryList = myfcDAO.getCategoryList(current_user.getDirector());
            request.setAttribute("categoryList", categoryList);
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            List<UserBO> usersExceptCurrent = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
            request.setAttribute("usersExceptCurrent", usersExceptCurrent);
            
            if(result){
                    request.setAttribute("messageMyFC", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The event "+ deletedName +" has been deleted successfully");
            }
            

          setURL("Controller?newproperties=FAMILYCALENDAR");

          }catch(Exception e){
            
            
        }
    }
    
    
    
    
    
    
    
}
