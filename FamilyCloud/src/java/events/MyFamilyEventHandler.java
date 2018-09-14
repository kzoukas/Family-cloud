

package events;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;


public class MyFamilyEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            String email= current_user.getEmail();
            
           // UserBO myUser = getUser(email);
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            
            User newUser3 = myUserDAO.getUserBasedOnID(current_user.getUserID());
            List<UserBO> myInactiveUser = newUserDAO.getListUserWithDirector(newUser3.getFamilyName());
            List<UserBO> familyExceptDirector = newUserDAO.getListUser(current_user.getFamilyName()) ;
            mySession.setAttribute("familyExceptDirector", familyExceptDirector);
            mySession.setAttribute("myInactiveUser", myInactiveUser);
            
            setURL("myFamily.jsp");
            
            
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
