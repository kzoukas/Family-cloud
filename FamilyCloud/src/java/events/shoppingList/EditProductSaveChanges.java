/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.shoppingList;

import daos.DAOFactory;
import daos.ShoppingListDAO;
import daos.UserDAO;
import db.model.ShoppingList;
import db.model.User;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ShoppingListBO;
import models.UserBO;

/**
 *
 * @author Vaggos
 */
public class EditProductSaveChanges  extends EventHandlerBase{

     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            String product = request.getParameter("product");
            int price = Integer.parseInt(request.getParameter("price"));
            String status = request.getParameter("bStatus");
            int productID = Integer.parseInt(request.getParameter("productID"));
            ShoppingListBO shoppBO = new ShoppingListBO();
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            int director = myUser.getDirector();
            
            shoppBO.setDirector(director);
            shoppBO.setPrice(price);
            shoppBO.setProduct(product);
            shoppBO.setStatus(status);
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ShoppingListDAO shoppDAO = mySqlFactory.getShoppingListDAO();
            ShoppingList shopp = new ShoppingList();
            
            shopp.setDirector(shoppBO.getDirector());
            shopp.setPrice(shoppBO.getPrice());
            shopp.setProduct(shoppBO.getProduct());
            shopp.setProductID(shoppBO.getProductID());
            shopp.setStatus(shoppBO.getStatus());
            
            boolean result = shoppDAO.updateProductEdit(shopp,productID);
            if(result){
                request.setAttribute("messageShopping", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully updated the product "+ product);
            }
            setURL("Controller?newproperties=SHOPPINGLIST");
        }catch(Exception e){
            
            
        }
    }
}