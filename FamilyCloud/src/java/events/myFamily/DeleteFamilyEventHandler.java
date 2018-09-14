
 
package events.myFamily;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;

/**
 *
 * @author Desktop
 */
public class DeleteFamilyEventHandler  extends EventHandlerBase{
            
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
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO userDao = mySqlFactory.getUserDAO();
           
            
            
            boolean result = userDao.deleteFamily(current_user.getDirector(),current_user.getUserID());
            boolean results = userDao.updateFamilyNameAfterDeleteFamily(current_user.getUserID());
            
            User userWithNoFamily = userDao.getUserBasedOnID(current_user.getUserID());
            mySession.setAttribute("myUser", userWithNoFamily);
            
            
              setURL("Controller?newproperties=MYFAMILY");
            

           
            
            
        }catch(Exception e){
            
            
        }
    
     
     
     
     
     }
  
    
    
    
    
    
    
    
}
