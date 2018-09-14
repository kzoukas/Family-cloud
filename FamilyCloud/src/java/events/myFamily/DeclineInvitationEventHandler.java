
package events.myFamily;

import dao.impl.MySqlNotificationsDAO;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Desktop
 */

public class DeclineInvitationEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            int notificationID=Integer.parseInt(request.getParameter("notificationID"));
             MySqlNotificationsDAO pcDAO =new MySqlNotificationsDAO();
             
            
            boolean result=pcDAO.deleteNotification(notificationID);
            
           setURL("Controller?newproperties=MYFAMILY");
            
        }catch(Exception e){
            
        }
    
     }
}