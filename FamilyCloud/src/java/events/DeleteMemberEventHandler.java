

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


public class DeleteMemberEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            int userID = Integer.parseInt(request.getParameter("userID"));
            User deletedUser=myUserDAO.getUserBasedOnID(userID);
            String firstName=deletedUser.getFirstName();
            
            boolean result = myUserDAO.deleteUser(userID);
            if(result){
                request.setAttribute("messageMyFamily", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully deleted "+ firstName +" from your family<br><br>");
            }
            

          setURL("Controller?newproperties=MYFAMILY");

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
