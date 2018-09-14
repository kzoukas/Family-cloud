
package events;

import dao.impl.MySqlToDoListDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.ToDoList;
import db.model.User;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ToDoListBO;
import models.UserBO;
import org.json.simple.JSONObject;





public class EditTodoListEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           
          
            
            String assignedTo= request.getParameter("assignedTo");
            if(assignedTo.length()==0){
            
                assignedTo="0";
            }
           
           String task = request.getParameter("task");
           
          String dueDates = request.getParameter("dueDate");
           DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
           Date dueDate = format.parse(dueDates);
           String status = request.getParameter("status");
           int taskID = Integer.parseInt(request.getParameter("taskID"));
           
           UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
           int creator= myUser2.getUserID();
           int director= myUser2.getDirector();
            
            String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
            

            ToDoListBO editedList = new ToDoListBO();
            editedList.setTask(task);
            editedList.setDirector(director);
            editedList.setAssignedTo(assignedTo);
            editedList.setCreatedBy(creator);
            editedList.setDueDate(dueDate);
             if (status.equals("completed")){
                editedList.setCompletedDate(date);
             }
             else{
                 editedList.setCompletedDate("-");
             }
            
            editedList.setStatus(status);
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ToDoListDAO myToDoListDAO = mySqlFactory.getToDoListDAO();
//
            ToDoList newList = new ToDoList();
//           
            newList.setTaskID(editedList.getTaskID());
            newList.setDirector(editedList.getDirector());
            newList.setTask(editedList.getTask());
            newList.setAssignedTo(editedList.getAssignedTo()); 
            newList.setCreatedBy(editedList.getCreatedBy());
            newList.setDueDate(editedList.getDueDate());
            newList.setCompletedDate(editedList.getCompletedDate());
            newList.setStatus(editedList.getStatus());
            //UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            boolean result = myToDoListDAO.updateToDoListEdit(newList,taskID);
            if(result){
                request.setAttribute("messageToDo", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully updated the task with title "+ task);
            }
            
            setURL("Controller?newproperties=TODOLIST");
            
            
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

