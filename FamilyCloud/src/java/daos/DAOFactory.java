
package daos;

import dao.impl.MySqlDAOFactory;



public abstract class DAOFactory {

    public static final int MYSQL = 1;

    public abstract UserDAO getUserDAO();  
    public abstract ToDoListDAO getToDoListDAO(); 
    public abstract ShoppingListDAO getShoppingListDAO(); 
    public abstract MediaObjectDAO getMediaObjectDAO();
    public abstract PostWallDAO getPostWallDAO();
    public abstract MessagesDAO getMessagesDAO();
    public abstract PersonalCalendarDAO getPersonalCalendarDAO();
    public abstract FamilyCalendarDAO getFamilyCalendarDAO();
    public abstract MealsDAO getMealsDAO();
    public abstract NotificationsDAO getNotificationsDAO();
    
    

    public static DAOFactory getDAOFactory(int whichFactory) {
        switch (whichFactory) {
            case MYSQL:
                return new MySqlDAOFactory();
            default:
                return null;
        }
    }
}