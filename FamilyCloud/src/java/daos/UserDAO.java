
package daos;


import db.model.User;
import java.util.List;
import models.UserBO;

public interface UserDAO {

    public boolean insertUser(User user);
    public User getUser(String email) throws DBOperationException;
    public User getUserNoFamily(String email) throws DBOperationException;
    public boolean updateUser(User user, String email);
    public boolean updateUserEdit(User newUser, int userID);
    public boolean insertInactiveUser(User user);
    public boolean insertActiveToNotification(int current_userID,int newMemberID);
    
    public List<UserBO> getListUser(String familyName) throws DBOperationException;
    public List<UserBO> getListUserWithDirector(String familyName) throws DBOperationException;
    public List<UserBO> getListActiveUsersExceptCurrent(String familyName, int currentUserID) throws DBOperationException;
    public List<UserBO> getListExceptCurrent(String familyName,int currentUserID) throws DBOperationException;
    
    
    public User getUserBasedOnID(int userID) throws DBOperationException;
    public User getUserImageBasedOnID(int userID) throws DBOperationException;
    public User getUserBasedOnIDforEdit(int userID) throws DBOperationException;
    public User getDirectorBasedOnFamily(String familyName) throws DBOperationException;
    public boolean deleteUser(int userID);
    public boolean deleteFamily(int director,int userID);
    public boolean updateFamilyNameAfterDeleteFamily(int userID);
    
}
