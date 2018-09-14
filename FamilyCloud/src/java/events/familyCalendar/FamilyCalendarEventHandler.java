
package events.familyCalendar;

import dao.impl.MySqlPersonalCalendarDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.UserDAO;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.PersonalCalendarBO;
import models.UserBO;
import org.json.simple.JSONObject;


/**
 *
 * @author Vaggos
 */

    
    public class FamilyCalendarEventHandler extends EventHandlerBase{
            
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
            String check=request.getParameter("check");
            if(check.equals("groupByMember")){
                
                int userID = Integer.parseInt(request.getParameter("userID"));
                //String user_new= Integer.toString(userID);
                mySession.setAttribute("groupByMember", userID);
                
            }else if(check.equals("groupByCategory")){
                
                String category = request.getParameter("category");
                //String user_new= Integer.toString(userID);
                mySession.setAttribute("groupByCategory", category);
            }
            
            
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
           
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            FamilyCalendarDAO myfcDAO = mySqlFactory.getFamilyCalendarDAO();
            List<String> categoryList = myfcDAO.getCategoryList(current_user.getDirector());
            request.setAttribute("categoryList", categoryList);
            
            
            
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
            MySqlUserDAO newUserDAO= new MySqlUserDAO();
            List<UserBO> usersExceptCurrent = newUserDAO.getListUserWithDirector(current_user.getFamilyName());
            request.setAttribute("usersExceptCurrent", usersExceptCurrent);
            
            
            setURL("family-calendar.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
}

    

