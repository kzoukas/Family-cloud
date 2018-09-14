
package events.familyCalendar;


import dao.impl.MySqlFamilyCalendarDAO;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.FamilyCalendarBO;

import models.UserBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Vaggos
 */
public class ShowEventsByMemberEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            int userID= (Integer) mySession.getAttribute("groupByMember");
            String user_id_string= new Integer(userID).toString();
            
            
            MySqlFamilyCalendarDAO pcDAO = new MySqlFamilyCalendarDAO();
            List<FamilyCalendarBO> listPCBO = pcDAO.getFCListBasedOnUserID(userID);
            
            List<FamilyCalendarBO> listWithEvery = pcDAO.getFCListBasedOnDirector(myUser.getDirector());
            
            for(int i=0 ; i<listWithEvery.size() ; i++){
                
            String SelUsers = listWithEvery.get(i).getAssignedTo();
            
            List<String> SelUserList = Arrays.asList(SelUsers.split("\\s*,\\s*"));
//            if(!user_id_string.equals(listWithEvery.get(i).getUserID()))  {
                    for(int j=0 ; j<SelUserList.size() ; j++){
                        
                      
                        if(user_id_string.equals(SelUserList.get(j))){
                            
                            listPCBO.add(listWithEvery.get(i));
                        }
                      
                    }
//            request.setAttribute("seluserlist", SelUserList);
          //  }
            }
            
            mySession.setAttribute("last_FClist_onload", listPCBO);
           
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");

            JSONObject obj = new JSONObject();
            //response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String ret = null;
            FamilyCalendarBO activity = listPCBO.get(0);
            obj.put("title", activity.getActivityName());
            obj.put("start", activity.getStartingDate().toString());
            obj.put("end", activity.getEndingDate().toString());
            obj.put("editable", "true");
            obj.put("id", activity.getActivityID());
            //obj.put("description", "desc");
            ret = obj.toJSONString();
            if (activity.isDaily()) {
                Date newDate = activity.getStartingDate();
                Date endingDate = activity.getEndingDate();
                while (newDate.compareTo(activity.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.DATE, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", activity.getActivityName());
                    String dateToShow = dateFormat.format(newDate);
                    obj.put("start", dateToShow);
                    
                    c.setTime(endingDate);
                    c.add(Calendar.DATE, 1);  // number of days to add
                    endingDate = c.getTime();
                    String endingDateToShow = dateFormat.format(endingDate);
                    obj.put("end", endingDateToShow);
                    
                    obj.put("editable", "true");
                    obj.put("id", activity.getActivityID());
                    ret = ret + "," + obj.toJSONString();
                }
            }
            if (activity.isWeekly()) {
                    Date newDate = activity.getStartingDate();
                    Date endingDate = activity.getEndingDate();
                    while (newDate.compareTo(activity.getExpDate()) <= 0) {

                        Calendar c = Calendar.getInstance();
                        c.setTime(newDate);
                        c.add(Calendar.DATE, 7);  // number of days to add
                        newDate = c.getTime();
                        obj.put("title", activity.getActivityName());
                        String dateToShow = dateFormat.format(newDate);
                        obj.put("start", dateToShow);
                        
                        c.setTime(endingDate);
                        c.add(Calendar.DATE, 7);  // number of days to add
                        endingDate = c.getTime();
                        String endingDateToShow = dateFormat.format(endingDate);
                        obj.put("end", endingDateToShow);
                        
                        obj.put("editable", "true");
                        obj.put("id", activity.getActivityID());
                        ret = ret + "," + obj.toJSONString();
                    }
                }
            if (activity.isMonthly()) {
                Date newDate = activity.getStartingDate();
                Date endingDate = activity.getEndingDate();
                while (newDate.compareTo(activity.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", activity.getActivityName());
                    String dateToShow = dateFormat.format(newDate);
                    obj.put("start", dateToShow);
                    
                    c.setTime(endingDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    endingDate = c.getTime();
                    String endingDateToShow = dateFormat.format(endingDate);
                    obj.put("end", endingDateToShow);
                    
                    obj.put("editable", "true");
                    obj.put("id", activity.getActivityID());
                    ret = ret + "," + obj.toJSONString();
                }
            }
            for (int i = 1; i < listPCBO.size(); i++) {

                activity = listPCBO.get(i);
                obj.put("title", activity.getActivityName());
                obj.put("start", activity.getStartingDate().toString());
                obj.put("end", activity.getEndingDate().toString());
                obj.put("editable", "true");
                obj.put("id", activity.getActivityID());
                ret = ret + "," + obj.toJSONString();
                if (activity.isDaily()) {
                    Date newDate = activity.getStartingDate();
                    Date endingDate = activity.getEndingDate();
                    while (newDate.compareTo(activity.getExpDate()) <= 0) {

                        Calendar c = Calendar.getInstance();
                        c.setTime(newDate);
                        c.add(Calendar.DATE, 1);  // number of days to add
                        newDate = c.getTime();
                        obj.put("title", activity.getActivityName());
                        String dateToShow = dateFormat.format(newDate);
                        obj.put("start", dateToShow);
                        
                        c.setTime(endingDate);
                        c.add(Calendar.DATE, 1);  // number of days to add
                        endingDate = c.getTime();
                        String endingDateToShow = dateFormat.format(endingDate);
                        obj.put("end", endingDateToShow);
                        
                        obj.put("editable", "true");
                        obj.put("id", activity.getActivityID());
                        ret = ret + "," + obj.toJSONString();
                    }
                }
                if (activity.isWeekly()) {
                    Date newDate = activity.getStartingDate();
                    Date endingDate = activity.getEndingDate();
                    while (newDate.compareTo(activity.getExpDate()) <= 0) {

                        Calendar c = Calendar.getInstance();
                        c.setTime(newDate);
                        c.add(Calendar.DATE, 7);  // number of days to add
                        newDate = c.getTime();
                        obj.put("title", activity.getActivityName());
                        String dateToShow = dateFormat.format(newDate);

                        obj.put("start", dateToShow);
                        
                        c.setTime(endingDate);
                        c.add(Calendar.DATE, 7);  // number of days to add
                        endingDate = c.getTime();
                        String endingDateToShow = dateFormat.format(endingDate);
                        obj.put("end", endingDateToShow);
                        obj.put("editable", "true");
                        obj.put("id", activity.getActivityID());
                        ret = ret + "," + obj.toJSONString();
                    }
                }
                if (activity.isMonthly()) {
                Date newDate = activity.getStartingDate();
                Date endingDate = activity.getEndingDate();
                while (newDate.compareTo(activity.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", activity.getActivityName());
                    String dateToShow = dateFormat.format(newDate);
                    obj.put("start", dateToShow);
                    
                    c.setTime(endingDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    endingDate = c.getTime();
                    String endingDateToShow = dateFormat.format(endingDate);
                    obj.put("end", endingDateToShow);
                    obj.put("editable", "true");
                    obj.put("id", activity.getActivityID());
                    ret = ret + "," + obj.toJSONString();
                }
            }
                //obj.put("description", "desc");

            }
            out.print("[" + ret + "]");
            out.close();

        } catch (Exception e) {

        }
    }
}
