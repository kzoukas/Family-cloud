

package events.shoppingList;

import dao.impl.MySqlShoppingListDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.UserDAO;
import db.model.User;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ShoppingListBO;
import models.UserBO;


public class ShoppingListEventHandler extends EventHandlerBase{
            
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
            MySqlShoppingListDAO shopp =new MySqlShoppingListDAO();
            List<ShoppingListBO> listShoppBObought = shopp.getListShoppBought(myUser.getDirector());
            List<ShoppingListBO> listShoppBOnotBought = shopp.getListShoppNotBought(myUser.getDirector());
            
            mySession.setAttribute("listShoppBObought", listShoppBObought);
            mySession.setAttribute("listShoppBOnotBought", listShoppBOnotBought);
            
            
            setURL("shoppingList.jsp");
            
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
