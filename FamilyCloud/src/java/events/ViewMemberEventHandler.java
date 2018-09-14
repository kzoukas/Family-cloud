

package events;

import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;


public class ViewMemberEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            //JSONObject newJSON= new JSONObject();
            //response.setContentType("text/html;charset=UTF-8");
            //PrintWriter out = response.getWriter();
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            UserDAO myUserDAO = mySqlFactory.getUserDAO();
           
            int userID = Integer.parseInt(request.getParameter("userID"));
        
            User newUser3 = myUserDAO.getUserBasedOnID(userID);
            
             DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
            String birthDate = dateFormat2.format(newUser3.getBirthDate());
            
            
             JSONObject newJSON= new JSONObject();
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
            
             newJSON.put("firstName",newUser3.getFirstName());
             newJSON.put("lastName",newUser3.getLastName());
             newJSON.put("email",newUser3.getEmail());
             newJSON.put("relation",newUser3.getRelation());
             newJSON.put("sex",newUser3.getSex());
             newJSON.put("birthDate",birthDate);
             newJSON.put("image",newUser3.getImage());
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
