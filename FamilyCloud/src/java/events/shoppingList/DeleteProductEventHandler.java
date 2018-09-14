/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.shoppingList;

import dao.impl.MySqlShoppingListDAO;
import daos.DAOFactory;
import daos.ShoppingListDAO;
import db.model.ShoppingList;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ShoppingListBO;

/**
 *
 * @author Vaggos
 */
public class DeleteProductEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {

            int productID = Integer.parseInt(request.getParameter("productID"));
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ShoppingListDAO shoppDAO = mySqlFactory.getShoppingListDAO();
            ShoppingList deletedShop = shoppDAO.getProductBasedOnID(productID);
            String deletedProduct= deletedShop.getProduct();

            boolean result = shoppDAO.deleteProduct(productID);
            if(result){
                request.setAttribute("messageShopping", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully deleted the product "+ deletedProduct+ " from shopping list");
            }
            
            setURL("Controller?newproperties=SHOPPINGLIST");
            
        } catch (Exception e) {

        }
    }
}
