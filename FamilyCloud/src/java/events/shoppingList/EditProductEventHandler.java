/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.shoppingList;

import dao.impl.MySqlShoppingListDAO;
import daos.DAOFactory;
import daos.ShoppingListDAO;
import daos.UserDAO;
import db.model.ShoppingList;
import db.model.User;
import events.EventHandlerBase;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.ShoppingListBO;
import org.json.simple.JSONObject;

/**
 *
 * @author Vaggos
 */
public class EditProductEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            int productID  = Integer.parseInt(request.getParameter("productID"));
            
            
            String v="sd";

            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            ShoppingListDAO shoppDAO = mySqlFactory.getShoppingListDAO();

            ShoppingList shopp = shoppDAO.getProductBasedOnID(productID);

            JSONObject newJSON= new JSONObject();
             response.setContentType("text/html;charset=UTF-8");
             PrintWriter out = response.getWriter();

             newJSON.put("product",shopp.getProduct());
             newJSON.put("price",shopp.getPrice());
             newJSON.put("status",shopp.getStatus());
             newJSON.put("director",shopp.getDirector());
             newJSON.put("productID",shopp.getProductID());
             out.println(newJSON); 
             out.close();
            
        }catch(Exception e){
            
            
        }
    
    }
}
