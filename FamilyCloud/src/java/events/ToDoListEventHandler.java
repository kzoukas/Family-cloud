

package events;

import dao.impl.MySqlToDoListDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ToDoListBO;
import models.UserBO;


public class ToDoListEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
            
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
             
            MySqlToDoListDAO newToDoListDAO= new MySqlToDoListDAO();
            List<ToDoListBO> lista = newToDoListDAO.getListToDoList(myUser.getDirector());
            request.setAttribute("listaToDo", lista);
            setURL("toDoList.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
}
