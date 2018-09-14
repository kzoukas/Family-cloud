package daos;


import db.model.ToDoList;
import db.model.User;
import java.util.List;
import models.ToDoListBO;
import models.UserBO;

public interface ToDoListDAO {

    public boolean insertToDoList(ToDoList list);
    //public User getUser(String email) throws DBOperationException;
    //public boolean updateUser(User user, String email);
    public boolean updateToDoListEdit(ToDoList newList, int taskID);
    //public boolean insertInactiveUser(User user);
    //public List<UserBO> getListUser(String familyName) throws DBOperationException;
    public ToDoList getToDoListBasedOnID(int taskID) throws DBOperationException ;
    public boolean deleteList(int taskID);
    public List<ToDoListBO> getListToDoList(int director) throws DBOperationException ;
}
