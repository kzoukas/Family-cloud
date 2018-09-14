package events.messages;

import dao.impl.MySqlMessagesDAO;
import dao.impl.MySqlPostWallDAO;
import dao.impl.MySqlUserDAO;
import events.EventHandlerBase;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MessagesBO;

import models.UserBO;


/**
 *
 * @author Vaggos
 */
public class MessagesEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
          
            
           MySqlUserDAO newUserDAO= new MySqlUserDAO(); 
           
           UserBO current_user = (UserBO) mySession.getAttribute("myUser");
           List<UserBO> myFamilyMembers = newUserDAO.getListActiveUsersExceptCurrent(current_user.getFamilyName(), current_user.getUserID());
           mySession.setAttribute("myFamilyMembers", myFamilyMembers);
            
           setURL("messagesStart.jsp");            
        }catch(Exception e){
            
            
        }
     }
}
