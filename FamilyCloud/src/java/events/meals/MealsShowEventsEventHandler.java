/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.meals;

import dao.impl.MySqlMealsDAO;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MealsBO;
import models.UserBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Vaggos
 */
public class MealsShowEventsEventHandler extends EventHandlerBase {

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
            MySqlMealsDAO mealDAO = new MySqlMealsDAO();
            List<MealsBO> listmealBO = mealDAO.getMealsListBasedOnDirector(myUser.getDirector());
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
            JSONObject obj = new JSONObject();
            //response.setContentType("application/json;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String ret = null;
            MealsBO meal = listmealBO.get(0);
            
            obj.put("title", meal.getMealName());
            obj.put("start", meal.getDatetime().toString());
            obj.put("editable", "true");
            obj.put("id", meal.getMealID());
            //obj.put("description", "desc");
            ret = obj.toJSONString();

            if (meal.isDaily()) {
                Date newDate = meal.getDatetime();

                while (newDate.compareTo(meal.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.DATE, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", meal.getMealName());
                    String dateToShow = dateFormat.format(newDate);
                    
                    obj.put("start", dateToShow);
                    obj.put("id", meal.getMealID());

                    obj.put("editable", "true");
                    ret = ret + "," + obj.toJSONString();
                }
            }
            if (meal.isWeekly()) {
                Date newDate = meal.getDatetime();

                while (newDate.compareTo(meal.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.DATE, 7);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", meal.getMealName());
                    String dateToShow = dateFormat.format(newDate);
                    
                    obj.put("start", dateToShow);
                    obj.put("id", meal.getMealID());

                    obj.put("editable", "true");
                    ret = ret + "," + obj.toJSONString();
                }
            }
            if (meal.isMonthly()) {
                Date newDate = meal.getDatetime();

                while (newDate.compareTo(meal.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", meal.getMealName());
                    String dateToShow = dateFormat.format(newDate);
                    
                    obj.put("start", dateToShow);
                    obj.put("id", meal.getMealID());

                    obj.put("editable", "true");
                    ret = ret + "," + obj.toJSONString();
                }
            }
            for (int i = 1; i < listmealBO.size(); i++) {

                meal = listmealBO.get(i);
                obj.put("title", meal.getMealName());
                obj.put("start", meal.getDatetime().toString());
                obj.put("editable", "true");
                obj.put("id", meal.getMealID());
                ret = ret + "," + obj.toJSONString();
                if (meal.isDaily()) {
                    Date newDate = meal.getDatetime();

                    while (newDate.compareTo(meal.getExpDate()) <= 0) {

                        Calendar c = Calendar.getInstance();
                        c.setTime(newDate);
                        c.add(Calendar.DATE, 1);  // number of days to add
                        newDate = c.getTime();
                        obj.put("title", meal.getMealName());
                        String dateToShow = dateFormat.format(newDate);
                        
                        obj.put("start", dateToShow);
                        obj.put("id", meal.getMealID());

                        obj.put("editable", "true");
                        ret = ret + "," + obj.toJSONString();
                    }
                }
                if (meal.isWeekly()) {
                    Date newDate = meal.getDatetime();

                    while (newDate.compareTo(meal.getExpDate()) <= 0) {

                        Calendar c = Calendar.getInstance();
                        c.setTime(newDate);
                        c.add(Calendar.DATE, 7);  // number of days to add
                        newDate = c.getTime();
                        obj.put("title", meal.getMealName());
                        String dateToShow = dateFormat.format(newDate);
                        obj.put("start", dateToShow);
                        obj.put("id", meal.getMealID());

                        obj.put("editable", "true");
                        ret = ret + "," + obj.toJSONString();
                    }
                }
                if (meal.isMonthly()) {
                Date newDate = meal.getDatetime();

                while (newDate.compareTo(meal.getExpDate()) <= 0) {

                    Calendar c = Calendar.getInstance();
                    c.setTime(newDate);
                    c.add(Calendar.MONTH, 1);  // number of days to add
                    newDate = c.getTime();
                    obj.put("title", meal.getMealName());
                    String dateToShow = dateFormat.format(newDate);
                    obj.put("start", dateToShow);
                    obj.put("id", meal.getMealID());

                    obj.put("editable", "true");
                    ret = ret + "," + obj.toJSONString();
                }
            }
            }

            out.print("[" + ret + "]");
            out.close();

        } catch (Exception e) {

        }

    }
}
