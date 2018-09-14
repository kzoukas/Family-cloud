
package events;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;





public class EditMemberSaveChangesEventHandler extends EventHandlerBase{
            
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
           Date birthDate;
           String relation = request.getParameter("relationEdit");
           int userID = Integer.parseInt(request.getParameter("userID"));
           String sex=request.getParameter("sex");
           if(email.equals("")){
                DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
                 birthDate = format.parse("0000-00-00");
                 email="-";
           }else{
               DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
                String birthDates = request.getParameter("birthDateEdit");
                 birthDate = format.parse(birthDates);
           }
           
           UserBO editedUser = new UserBO();
            editedUser.setFirstName(firstName);
            editedUser.setLastName(lastName);
            editedUser.setEmail(email);
            editedUser.setBirthDate(birthDate);
            editedUser.setRelation(relation);
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
            //UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            boolean result = myUserDAO.updateUserEdit(myEditedUser,userID);
            if(result){
                request.setAttribute("messageMyFamily", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully updated "+ firstName +"' personal info<br><br>");
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

