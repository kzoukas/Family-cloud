/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.myProfile;

import db.model.User;
import events.EventHandlerBase;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;






public class ValidateOldPasswordEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            
            JSONObject newJSON= new JSONObject();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            String password = request.getParameter("password");
            
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            
            if(current_user.getPassword().equals(password)){
                newJSON.put("messageCorrect","Correct password!");
                newJSON.put("messagePassValidate","not");
                newJSON.put("enabled","btn btn-primary");
                out.println(newJSON);
                out.close();
            }else{
                newJSON.put("messagePassValidate","The password is not valid.");
                newJSON.put("enabled","btn btn-primary disabled");
                out.println(newJSON);
                out.close();
            }
           }
         catch (Exception e) {
         }       
    }
}
