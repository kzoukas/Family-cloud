/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.meals;

import daos.DAOFactory;
import daos.MealsDAO;
import daos.UserDAO;
import db.model.Meals;
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
 * @author Vaggos
 */
public class ViewMealEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        int mealID = Integer.parseInt(request.getParameter("mealID"));
        String bla = "asda";
        UserBO current_user= (UserBO) mySession.getAttribute("myUser");
        try {
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            MealsDAO mealDAO = mySqlFactory.getMealsDAO();
            DateFormat dateFormatDT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Meals meal = mealDAO.getMealEventBasedOnID(mealID);
            
            JSONObject newJSON = new JSONObject();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();            

            newJSON.put("mealID", meal.getMealID());
            newJSON.put("mealName", meal.getMealName());
            newJSON.put("place", meal.getPlace());
            newJSON.put("description", meal.getDescription());
            String dateTimeToShow = dateFormatDT.format(meal.getDatetime());
            dateTimeToShow = dateTimeToShow.replace("T", " ");
            newJSON.put("datetime", dateTimeToShow);
            String reputance = "";
            if(meal.isDaily()) reputance = reputance + "Daily ";
            if(meal.isWeekly()) reputance = reputance + ",Weekly ";
            if(meal.isMonthly()) reputance = reputance + ",Monthly ";
            newJSON.put("reputance",reputance);
            newJSON.put("reminder",meal.getReminder());
            
            
             
            newJSON.put("daily",meal.isDaily());
            newJSON.put("weekly",meal.isWeekly());
            newJSON.put("monthly",meal.isMonthly());
            
            newJSON.put("reminder",meal.getReminder());
            newJSON.put("hoursRemindBefore",meal.getHoursRemindBefore());
            dateTimeToShow = dateFormat.format(meal.getExpDate());
            newJSON.put("expDate",dateTimeToShow);
            
            if((meal.getUserID()==current_user.getUserID())||(current_user.getUserID()== current_user.getDirector())){
                
                newJSON.put("creator","true");
            }
            else{
                newJSON.put("creator","false");
            }
            dateTimeToShow = dateFormat.format(meal.getReminderDate());
            if(dateTimeToShow.equals("0002-11-30")){
                dateTimeToShow = "0";
            }
            newJSON.put("reminderDate", dateTimeToShow);
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            User creator = myUserDAO.getUserBasedOnID(meal.getUserID());
            newJSON.put("createdBy", creator.getFirstName());
            
            
            String reminderView = null;
            reminderView = dateFormat.format(meal.getReminderDate());
            if(reminderView.equals("0002-11-30")){
                reminderView = "No Reminder";
            }
            newJSON.put("reminderView", reminderView);
            
            out.println(newJSON);

             out.close();
        } catch (Exception e) {

        }
    }

}
