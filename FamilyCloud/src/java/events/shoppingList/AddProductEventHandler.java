/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.shoppingList;

import dao.impl.MySqlShoppingListDAO;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.ShoppingListDAO;
import daos.UserDAO;
import db.model.ShoppingList;
import db.model.User;
import events.EventHandlerBase;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ShoppingListBO;
import models.UserBO;


/**
 *
 * @author Vaggos
 */
public class AddProductEventHandler extends EventHandlerBase {

   private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
            try{
            String product = request.getParameter("product");
            String p = request.getParameter("price");
            int price=0;
            if(p!=null && p!=""){
                price = Integer.parseInt(p);
            }
            String status = request.getParameter("bStatus");

            ShoppingListBO newShoppBO = new ShoppingListBO();
            UserBO myUser = (UserBO) mySession.getAttribute("myUser");
            int director = myUser.getDirector();

            //newShoppBO.setDirector(1);
            //newShoppBO.setProductID(1); auta ta kanoume sto mySqlShopp...

            newShoppBO.setProduct(product);
            newShoppBO.setPrice(price);
            newShoppBO.setStatus(status);
            newShoppBO.setDirector(director);
            newShoppBO.setAddedBy(myUser.getUserID());

            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ShoppingListDAO myShoppDAO = mySqlFactory.getShoppingListDAO();

            ShoppingList newShopp = new ShoppingList();



            newShopp.setPrice(newShoppBO.getPrice());
            newShopp.setProduct(newShoppBO.getProduct());
            newShopp.setStatus(newShoppBO.getStatus());
            newShopp.setDirector(newShoppBO.getDirector());
            newShopp.setAddedBy(newShoppBO.getAddedBy());

            boolean result = myShoppDAO.insertProduct(newShopp);
            if(result){
                request.setAttribute("messageShopping", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully inserted to shopping list the product "+ product);
            }
            setURL("Controller?newproperties=SHOPPINGLIST");
            }catch(Exception e){


            }
       
    }
    
}