/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events;

import dao.impl.MySqlToDoListDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.ToDoList;
import db.model.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ToDoListBO;
import models.UserBO;

public class AddToDoListEventHandler extends EventHandlerBase  {
   

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            String task = request.getParameter("task");
            
            String assignedTo= request.getParameter("assignedTo");
            if(assignedTo.length()==0){
            
                assignedTo="No specific";
            }
            String dueDates = request.getParameter("dueDate");
            DateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
            Date dueDate = format.parse(dueDates);
            
            
            UserBO myUser2 = (UserBO) mySession.getAttribute("myUser");
            int creator= myUser2.getUserID();
            int director= myUser2.getDirector();
            
            
            ToDoListBO newListBO = new ToDoListBO();
            newListBO.setTask(task);
            newListBO.setDirector(director);
            newListBO.setAssignedTo(assignedTo);
            newListBO.setCreatedBy(creator);
            newListBO.setDueDate(dueDate);
            newListBO.setCompletedDate("-");
            newListBO.setStatus("incompleted");
            
            
//            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ToDoListDAO myToDoListDAO = mySqlFactory.getToDoListDAO();
//
            ToDoList newList = new ToDoList();
//           
            newList.setTaskID(newListBO.getTaskID());
            newList.setDirector(newListBO.getDirector());
            newList.setTask(newListBO.getTask());
            newList.setAssignedTo(newListBO.getAssignedTo()); 
            newList.setCreatedBy(newListBO.getCreatedBy());
            newList.setDueDate(newListBO.getDueDate());
            newList.setCompletedDate(newListBO.getCompletedDate());
            newList.setStatus(newListBO.getStatus());
           
          
            
            boolean result = myToDoListDAO.insertToDoList(newList);
            if(result){
                request.setAttribute("messageToDo", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully add the task with title "+ task);
            }
            
            setURL("Controller?newproperties=TODOLIST");
            
        }catch(Exception e){
            
            
        }
    }
        
//    public UserBO getInactiveUser(String familyName) {
//        try {
//            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
//            UserDAO userDAO = mySqlFactory.getUserDAO();
//
//            UserBO userBO = new UserBO();
//
//            User user = userDAO.getInactiveUser(familyName);
//
//            userBO = userBO.toUserBO(user);
//
//            return userBO;
//        } catch (Exception e) {
//            return null;
//        }
//    }
    
}
