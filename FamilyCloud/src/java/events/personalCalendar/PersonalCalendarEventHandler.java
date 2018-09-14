
package events.personalCalendar;

import dao.impl.MySqlPersonalCalendarDAO;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.PersonalCalendarBO;
import models.UserBO;


/**
 *
 * @author Vaggos
 */

    
    public class PersonalCalendarEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
//            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
//            MySqlPersonalCalendarDAO pcDAO =new MySqlPersonalCalendarDAO();
//            List<PersonalCalendarBO> listPCBO = pcDAO.getPCListBasedOnDirector(myUser.getUserID());
            
            
            setURL("personal-calendar.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
}

    

