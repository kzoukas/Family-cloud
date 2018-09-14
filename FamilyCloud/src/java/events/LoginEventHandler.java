package events;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.UserDAO;
import db.model.User;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;




public class LoginEventHandler extends EventHandlerBase {

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
            String password = request.getParameter("password");

            UserBO user = new UserBO();
            user.setEmail(email);
            user.setPassword(password);
            
            if (loadUser(user) != true) {
            
               
                request.setAttribute("error_message", "The email or password is incorrect. Please give the right email and password or sign up");
                setURL("first.jsp");
                    
            }else{
                
                if (familyExists(user) == true){
                    
                    
                    UserBO current_user = getUser(email);
                    MySqlUserDAO newUserDAO= new MySqlUserDAO();
                    List<UserBO> myInactiveUser = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
                    
                    
                    UserBO userBO = new UserBO();
                    User director_user = newUserDAO.getDirectorBasedOnFamily(current_user.getFamilyName());
                    UserBO director = userBO.toUserBO(director_user);
                    
                    if(director.getEmail().equals(current_user.getEmail())){
                        
                             List<UserBO> familyExceptDirector = newUserDAO.getListUser(current_user.getFamilyName()) ;
                             mySession.setAttribute("familyExceptDirector", familyExceptDirector);

                        
                    }
                    
                    mySession.setAttribute("director", director);
                    mySession.setAttribute("myUser", current_user);
                    mySession.setAttribute("myInactiveUser", myInactiveUser);
                    
                    
                    
                    setURL("afterLoginPage.jsp");
                }else{
                    UserBO myUser = getUser(email);
                    
                    
                    mySession.setAttribute("myUser", myUser);
                    
                
                    setURL("afterLoginPage.jsp");
                
                }
                    
            }
           }
         catch (Exception e) {
           
        }

    }



    public boolean loadUser(UserBO myUserBO) throws DBOperationException, SQLException {
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO myUserDAO = mySqlFactory.getUserDAO();
       
         User myUser = myUserDAO.getUser(myUserBO.getEmail());
         
         
         if ((myUser.getEmail() != null)&&(myUser.getPassword()!=null) ) {
            if (myUser.getEmail().equals(myUserBO.getEmail()) && myUser.getPassword().equals(myUserBO.getPassword())) {
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
    
    
    public boolean familyExists(UserBO myUserBO) throws DBOperationException, SQLException {
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        UserDAO myUserDAO = mySqlFactory.getUserDAO();
       
         User myUser = myUserDAO.getUser(myUserBO.getEmail());
         
         
         if ((myUser.getFamilyName()!= null) ) {
                return true;
            } else {
                return false;
            }
    
       
    }
    
//    public UserBO getInactiveUser(String familyName) {
//        try {
//            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
//            UserDAO userDAO = mySqlFactory.getUserDAO();
//
//            UserBO userBO = new UserBO();
//
//            User user = userDAO.getInactiveUser(familyName);
//
//            userBO = userBO.toUserBO(user);
//
//            return userBO;
//        } catch (Exception e) {
//            return null;
//        }
//    }

}
