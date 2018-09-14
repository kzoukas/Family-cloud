/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.UserDAO;
import db.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Desktop
 */
public class ajaxHandler extends EventHandlerBase {

   private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
         
        
        JSONObject newJSON= new JSONObject();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String email = request.getParameter("email");
        
        UserBO user = new UserBO();
        user.setEmail(email);
       try {
           if (loadUser(user) == true) {
               
              newJSON.put("message","This email is already in use. Please sign up with another email");
              newJSON.put("disabled","btn btn-primary disabled");
              newJSON.put("style","border:1px solid red; box-shadow:none;");
              
              out.println(newJSON);
              out.close();
               
           }
           else{
              newJSON.put("message"," ");
              newJSON.put("disabled","btn btn-primary");
              //newJSON.put("style","border:1px solid green;");
              
              out.println(newJSON);
              out.close();
               
           }
       } catch (DBOperationException ex) {
           Logger.getLogger(ajaxHandler.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(ajaxHandler.class.getName()).log(Level.SEVERE, null, ex);
       }
        
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();
//        
//        out.println("<h4>spasta ola kwstaki</h4>");
        
    }
    
    
    
    public boolean loadUser(UserBO myUserBO) throws DBOperationException, SQLException {
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO myUserDAO = mySqlFactory.getUserDAO();
       
         User myUser = myUserDAO.getUser(myUserBO.getEmail());
         
         
         if ((myUser.getEmail() != null) ) {
            if (myUser.getEmail().equals(myUserBO.getEmail())) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    public UserBO getUser(String email) {
        try {
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO userDAO = mySqlFactory.getUserDAO();

            UserBO userBO = new UserBO();

            User user = userDAO.getUser(email);

            userBO = userBO.toUserBO(user);

            return userBO;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
    
}
