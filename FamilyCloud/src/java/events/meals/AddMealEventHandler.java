package events.meals;

import daos.DAOFactory;
import daos.MealsDAO;
import db.model.Meals;
import events.EventHandlerBase;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MealsBO;
import models.UserBO;

/**
 *
 * @author Vaggos
 */
public class AddMealEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {

            String mealName = request.getParameter("mealName");
            String place = request.getParameter("place");
            String datetimes = request.getParameter("dates");
            String description = request.getParameter("description");

            boolean daily = Boolean.valueOf(request.getParameter("daily"));
            boolean weekly = Boolean.valueOf(request.getParameter("weekly"));
            boolean monthly = Boolean.valueOf(request.getParameter("monthly"));
            String reminder = request.getParameter("reminder");
            int hoursRemindBefore = Integer.parseInt(request.getParameter("hoursBefore"));
            String expDateString = request.getParameter("expDate");
            datetimes = datetimes.replace(" ", "T");
            
            DateFormat formatDT = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String reminderDateString =request.getParameter("reminderDate");
            Date reminderDate = new Date();
             if (reminderDateString != "" && reminderDateString != null) {
                reminderDate = format.parse(reminderDateString);
            } else {
                reminderDate = format.parse("0000-00-00");
            } 
             
            Date expDate = new Date();
            if (expDateString == null || expDateString=="") {
                expDateString = "0000-00-00T00:00";
                expDate = formatDT.parse(expDateString);
            }else{
                expDate = format.parse(expDateString);
            }
            

            Date datetime = formatDT.parse(datetimes);

            

            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            int userID=myUser2.getUserID();
            int director = myUser2.getDirector();

            MealsBO mealsBO = new MealsBO();
            mealsBO.setMealName(mealName);
            mealsBO.setPlace(place);
            mealsBO.setDescription(description);
            mealsBO.setDatetime(datetime);
            mealsBO.setDirector(director);
            mealsBO.setUserID(userID);
            mealsBO.setDaily(daily);
            mealsBO.setWeekly(weekly);
            mealsBO.setMonthly(monthly);
            mealsBO.setReminder(reminder);
            mealsBO.setHoursRemindBefore(hoursRemindBefore);
            mealsBO.setExpDate(expDate);
            mealsBO.setReminderDate(reminderDate);
//            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            MealsDAO mealDAO = mySqlFactory.getMealsDAO();
//
            Meals meal = new Meals();
//           

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
                    
            boolean result = mealDAO.addMeal(meal);
            if(result){
                    request.setAttribute("messageMyMeals", "<img src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The meal "+ mealName +" has been added successfully");
            }

            setURL("Controller?newproperties=MEALSPLAN");

        } catch (Exception e) {

        }
    }
}
