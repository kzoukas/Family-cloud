

package events;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;


public class SignupEventHandler extends EventHandlerBase{
            
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
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String birthDates = request.getParameter("birthDate");
            String sex = request.getParameter("sex");
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
            Date birthDate = format.parse(birthDates);
            
            UserBO newUser = new UserBO();

            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setBirthDate(birthDate);
            newUser.setSex(sex);
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();

            User myUser = new User();
            
            myUser.setFirstName(newUser.getFirstName());
            myUser.setLastName(newUser.getLastName()); 
            myUser.setEmail(newUser.getEmail());
            myUser.setPassword(newUser.getPassword());
            myUser.setBirthDate(newUser.getBirthDate());
            myUser.setSex(newUser.getSex()); 
            myUser.setUserID(newUser.getUserID()); 
            myUser.setRelation(newUser.getRelation()); 
            
            
            boolean result = myUserDAO.insertUser(myUser);
            
            UserBO myUsernew = getUser(email);
            mySession.setAttribute("myUser", myUsernew);
            setURL("afterLoginPage.jsp");
            //setURL("Controller?newproperties=MYFAMILY");
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
