
package events.myFamily;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
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



public class ValidateEmailActiveEventHandler extends EventHandlerBase {

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
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO myUserDAO = mySqlFactory.getUserDAO();
      
        
        UserBO user = new UserBO();
        user.setEmail(email);
       try {
           if (loadUserFamily(user)==true) {
               
              newJSON.put("messageValidate","You can add this member to your family.");
              newJSON.put("enabled","btn btn-primary");
              newJSON.put("style","color:green;");
              newJSON.put("email",email);
              
              out.println(newJSON);
              out.close();
           }
           
           else if(loadUser(user)==false){
              newJSON.put("messageValidate","This user does not exist.");
              newJSON.put("enabled","btn btn-primary disabled");
              newJSON.put("style","color:red;");
              
              out.println(newJSON);
              out.close();
               
           }else if(loadUser(user)==true){
                   newJSON.put("messageValidate","This user has already a family.");
                   newJSON.put("enabled","btn btn-primary disabled");
                   newJSON.put("style","color:red;");
                  out.println(newJSON);
                  out.close();
               
            }
           
       } catch (DBOperationException ex) {
           Logger.getLogger(ValidateEmailActiveEventHandler.class.getName()).log(Level.SEVERE, null, ex);
       } catch (SQLException ex) {
           Logger.getLogger(ValidateEmailActiveEventHandler.class.getName()).log(Level.SEVERE, null, ex);
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
     public boolean loadUserFamily(UserBO myUserBO) throws DBOperationException, SQLException {
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO myUserDAO = mySqlFactory.getUserDAO();
       
         User myUser = myUserDAO.getUserNoFamily(myUserBO.getEmail());
         
         
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

    public UserBO getUserNofam(String email) {
        try {
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO userDAO = mySqlFactory.getUserDAO();

            UserBO userBO = new UserBO();

            User user = userDAO.getUserNoFamily(email);

            userBO = userBO.toUserBO(user);

            return userBO;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
    
}
