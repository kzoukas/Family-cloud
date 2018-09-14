/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.io.File;
import java.io.FileInputStream;
import java.nio.file.Files;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;

public class AddInactiveEventHandler extends EventHandlerBase  {
   

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String relation = request.getParameter("relation");
            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            String familyName= myUser2.getFamilyName();
            int director= myUser2.getDirector();
            
            UserBO inactiveUser = new UserBO();
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
            Date dueDate = format.parse("0000-00-00");
            inactiveUser.setBirthDate(dueDate);
            inactiveUser.setEmail("-");
            inactiveUser.setFamilyName(familyName);
            inactiveUser.setFirstName(firstName);
            inactiveUser.setLastName(lastName);
            inactiveUser.setPassword("-");
            inactiveUser.setSex("inactive");
            inactiveUser.setRelation(relation);
            inactiveUser.setDirector(director);
            
            
            
            //ImageIO.read(AddInactiveEventHandler.class.getResource("../images/user-male-icon.jpg"));
//            File file = new File("../images/user-male-icon.jpg");
//            byte[] data = Files.readAllBytes(file.toPath());
            //inactiveUser.setImage(image);
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();

            User myUser = new User();
            
            myUser.setFirstName(inactiveUser.getFirstName());
            myUser.setLastName(inactiveUser.getLastName()); 
            myUser.setEmail(inactiveUser.getEmail());
            myUser.setPassword(inactiveUser.getPassword());
            myUser.setBirthDate(inactiveUser.getBirthDate());
            myUser.setSex(inactiveUser.getSex());
            myUser.setRelation(inactiveUser.getRelation());
            myUser.setDirector(inactiveUser.getDirector());
            myUser.setFamilyName(inactiveUser.getFamilyName());
            
            
            boolean result = myUserDAO.insertUser(myUser);
            if(result){
                request.setAttribute("messageMyFamily", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully added "+ firstName +" to your family<br><br>");
            }
            
            setURL("Controller?newproperties=MYFAMILY");
            
            
        }catch(Exception e){
            
            
        }
    }
        
    
}
