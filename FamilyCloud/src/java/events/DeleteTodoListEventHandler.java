

package events;

import dao.impl.MySqlToDoListDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.ToDoList;
import db.model.User;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ToDoListBO;
import models.UserBO;
import org.json.simple.JSONObject;


public class DeleteTodoListEventHandler extends EventHandlerBase{
            
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
                        
            ToDoList newList=myToDoListDAO.getToDoListBasedOnID(taskID);
            String deletedTask=newList.getTask();
            
            boolean result = myToDoListDAO.deleteList(taskID);
            
            if(result){
                request.setAttribute("messageToDo", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully deleted the task with title "+ deletedTask);
            }
            
            setURL("Controller?newproperties=TODOLIST");
            
            
        }catch(Exception e){
            
            
        }
    }

}
