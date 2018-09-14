

package events;

import daos.DAOFactory;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.ToDoList;
import db.model.User;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import org.json.simple.JSONObject;


public class TodoListInfoEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ToDoListDAO myToDoListDAO = mySqlFactory.getToDoListDAO();
           
            int taskID = Integer.parseInt(request.getParameter("taskID"));
        
            ToDoList newUser3 = myToDoListDAO.getToDoListBasedOnID(taskID);
            
             
            
        
            String SelUsers = newUser3.getAssignedTo();
            List<String> SelUserList = Arrays.asList(SelUsers.split("\\s*,\\s*"));
            request.setAttribute("seluserlist", SelUserList);
            
//            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            
             JSONObject newJSON= new JSONObject();
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();
            
             newJSON.put("task",newUser3.getTask());
             DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
             String DateToShow = dateFormat.format(newUser3.getDueDate());
             newJSON.put("dueDate",DateToShow);
             newJSON.put("status",newUser3.getStatus());
             newJSON.put("taskID",taskID);
              
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
