
package events.myProfile;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;






public class ChangePasswordEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           String newPassword = request.getParameter("newPassword");
           int userID = Integer.parseInt(request.getParameter("userID"));
           
           
           UserBO editedUser = new UserBO();
           
            editedUser.setPassword(newPassword);
            editedUser.setUserID(userID);
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();

            User myEditedUser = new User();
            myEditedUser.setPassword(editedUser.getPassword());
            myEditedUser.setUserID(editedUser.getUserID());
            
            boolean result = myUserDAO.updateUserEdit(myEditedUser,userID);
            if(result){
                  request.setAttribute("messageMyProfile", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully changed your password");
            }
            

            setURL("Controller?newproperties=MYPROFILE");

            
            
        }catch(Exception e){
            
            
        }
    }
     
}

