
package events.myProfile;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;






public class EditProfileEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           String firstName = request.getParameter("firstNameEdit");
           String lastName = request.getParameter("lastNameEdit");
           String email = request.getParameter("emailEdit");
           String birthDates = request.getParameter("birthDateEdit");
           
           int userID = Integer.parseInt(request.getParameter("userID"));
           String sex=request.getParameter("sex");
           DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
           Date birthDate = format.parse(birthDates);
           
           UserBO editedUser = new UserBO();
            editedUser.setFirstName(firstName);
            editedUser.setLastName(lastName);
            editedUser.setEmail(email);
            editedUser.setBirthDate(birthDate);
            
            editedUser.setSex(sex);
            editedUser.setUserID(userID);
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();

            User myEditedUser = new User();
            myEditedUser.setFirstName(editedUser.getFirstName());
            myEditedUser.setLastName(editedUser.getLastName());
            myEditedUser.setEmail(editedUser.getEmail());
            myEditedUser.setBirthDate(editedUser.getBirthDate());
            myEditedUser.setRelation(editedUser.getRelation());
            myEditedUser.setSex(editedUser.getSex());
            myEditedUser.setUserID(editedUser.getUserID());
            
            boolean result = myUserDAO.updateUserEdit(myEditedUser,userID);
            if(result){
                  request.setAttribute("messageMyProfile", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully updated your profile");
            }
            
//            UserDAO myUserDAO2 = mySqlFactory.getUserDAO();
//            User edited_user = myUserDAO2.getUserBasedOnID(userID);
//            mySession.setAttribute("myUser", edited_user);

            setURL("Controller?newproperties=MYPROFILE");

            
            
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

