package events.personalCalendar;

import daos.DAOFactory;

import daos.PersonalCalendarDAO;

import db.model.PersonalCalendar;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Desktop
 */
public class ViewPersonalEventEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            //JSONObject newJSON= new JSONObject();
            //response.setContentType("text/html;charset=UTF-8");
            //PrintWriter out = response.getWriter();
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            PersonalCalendarDAO pcalendarDAO = mySqlFactory.getPersonalCalendarDAO();
            String dateToShow = "";
            int activityID = Integer.parseInt(request.getParameter("activityID"));
            
            
            PersonalCalendar current_event = pcalendarDAO.getPersonalEventBasedOnID(activityID);

            DateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
            
             JSONObject newJSON = new JSONObject();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            newJSON.put("event_title", current_event.getActivityName());
            newJSON.put("description", current_event.getComment());
            newJSON.put("category", current_event.getCategory());
            dateToShow = format.format(current_event.getStartingDate());
            dateToShow = dateToShow.replace("T", " ");
            newJSON.put("starting_date", dateToShow);
            dateToShow = format.format(current_event.getEndingDate());
            dateToShow = dateToShow.replace("T", " ");
            newJSON.put("ending_date", dateToShow);
            
            newJSON.put("activityID", current_event.getActivityID());
            String reputance = "";
            if (current_event.isDaily()) {
                reputance = reputance + "Daily  ";
            }
            if (current_event.isWeekly()) {
                reputance = reputance + "Weekly  ";
            }
            if (current_event.isMonthly()) {
                reputance = reputance + "Monthly  ";
            }
            newJSON.put("reputance", reputance);
            dateToShow = format2.format(current_event.getExpDate());
            newJSON.put("expDate", dateToShow);
            
            newJSON.put("daily",current_event.isDaily());
            newJSON.put("weekly",current_event.isWeekly());
            newJSON.put("monthly",current_event.isMonthly());
            
            if(current_event.getReminder().equals("day1ago")){
                 newJSON.put("reminder","Your reminder has been set 1 day ago");
             }else if(current_event.getReminder().equals("day2ago")){
                 newJSON.put("reminder","Your reminder has been set 2 days ago");
            }else if(current_event.getReminder().equals("No reminder")){
               
                newJSON.put("reminder","You havent set any reminder");
            }else{
                 newJSON.put("reminder","Your reminder has been set "+ current_event.getHoursRemindBefore() +" hous ago");
            }
            newJSON.put("hoursRemindBefore",current_event.getHoursRemindBefore());
            dateToShow = format2.format(current_event.getReminderDate());
            if(dateToShow.equals("0002-11-30")){
                dateToShow = "0";
            }
            newJSON.put("reminderDate", dateToShow);
            String reminderView = null;
            reminderView = format2.format(current_event.getReminderDate());
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
