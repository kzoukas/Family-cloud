

package events;

import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;


public class GoToDeleteMemberEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           
            
            int userID = Integer.parseInt(request.getParameter("userID"));
            
            
            
            JSONObject newJSON= new JSONObject();
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
            
             newJSON.put("userID",userID);
             
              
              out.println(newJSON);
              out.close();
            
            
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
