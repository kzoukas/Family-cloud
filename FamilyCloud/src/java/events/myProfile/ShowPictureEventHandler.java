

package events.myProfile;


import daos.DAOFactory;
import daos.DBOperationException;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class ShowPictureEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
       
           try {
            
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            User user = myUserDAO.getUserImageBasedOnID(userID);
         
            response.setContentType("image/jpeg");
            response.setContentLength(user.getImage().length);
            response.getOutputStream().write(user.getImage());
            
            //response.getOutputStream().write(user.getImage());
             setURL(null);
             
             
             
             
            } catch (DBOperationException ex) {
            
                    Logger.getLogger(ShowPictureEventHandler.class.getName()).log(Level.SEVERE, null, ex);
            }
     
     }
}
