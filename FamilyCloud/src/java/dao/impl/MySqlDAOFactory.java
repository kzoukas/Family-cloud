
package dao.impl;

import daos.DAOFactory;
import daos.FamilyCalendarDAO;
import daos.MealsDAO;
import daos.MediaObjectDAO;
import daos.MessagesDAO;
import daos.NotificationsDAO;
import daos.PersonalCalendarDAO;
import daos.PostWallDAO;
import daos.ShoppingListDAO;
import daos.ToDoListDAO;
import daos.UserDAO;
import java.sql.*;

public class MySqlDAOFactory extends DAOFactory {

    public static final String DRIVER ="com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/fcloud?useUnicode=true&characterEncoding=UTF-8&characterSetResults=UTF-8";
    
    public static Connection createConnection() {
        Connection conn = null;

        try {
            Class.forName(DRIVER);
          
            
            conn = DriverManager.getConnection(DBURL, "root", "kwstas");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }


    @Override
    public ToDoListDAO getToDoListDAO() {
        return new MySqlToDoListDAO();
    }
    @Override
    public UserDAO getUserDAO() {
        return new MySqlUserDAO();
    }
    @Override
    public ShoppingListDAO getShoppingListDAO() {
        return new MySqlShoppingListDAO();
    }
    
  
    @Override
    public MediaObjectDAO getMediaObjectDAO() {
        return new MySqlMediaObjectDAO();
    }
    @Override
    public PostWallDAO getPostWallDAO() {
       return new MySqlPostWallDAO();
    }
    public MessagesDAO getMessagesDAO() {
       return new MySqlMessagesDAO();
    }
    
    public PersonalCalendarDAO getPersonalCalendarDAO() {
        return new MySqlPersonalCalendarDAO();
    }
    public FamilyCalendarDAO getFamilyCalendarDAO() {
        return new MySqlFamilyCalendarDAO();
    }
    public MealsDAO getMealsDAO(){
        return new MySqlMealsDAO();
    }
    public NotificationsDAO getNotificationsDAO(){
        return new MySqlNotificationsDAO();
    }
   
    
}
