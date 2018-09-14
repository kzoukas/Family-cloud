
package events.myFamily;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;



public class AddActiveEventHandler extends EventHandlerBase  {
   

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            String email = request.getParameter("email");
           
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            User newActive = myUserDAO.getUser(email);
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            
            boolean result=myUserDAO.insertActiveToNotification(current_user.getUserID(),newActive.getUserID());
            if(result){
                request.setAttribute("messageMyFamily", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\"> Friend request send to "+newActive.getFirstName());
            }
            
            setURL("Controller?newproperties=MYFAMILY");
            
            
        }catch(Exception e){
            
            
        }
    }
        
    
}
