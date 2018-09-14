

package events;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;


public class CreateFamilyEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {

            
            String familyName = request.getParameter("familyName");
            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            
            int director= myUser2.getUserID();
            
            UserBO newuser = new UserBO();
            newuser.setFamilyName(familyName);
            newuser.setDirector(director);
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();

            User myUser = new User();
            myUser.setFamilyName(newuser.getFamilyName());
            myUser.setDirector(newuser.getDirector());
            
           
            boolean result = myUserDAO.updateUser(myUser,myUser2.getEmail());
            
            
            
            UserBO user= getUser(myUser2.getEmail());
           
            mySession.setAttribute("myUser",user);
            mySession.setAttribute("director",user);
            
           
            
            setURL("Controller?newproperties=MYFAMILY");
           // setURL("familyAfterCreate.jsp");
          
        }catch(Exception e){
            
            
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
