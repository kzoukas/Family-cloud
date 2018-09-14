/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.ShoppingList;
import db.model.User;
import java.util.List;
import models.ShoppingListBO;
import models.UserBO;

/**
 *
 * @author Vaggos
 */
public interface ShoppingListDAO {

    public boolean insertProduct(ShoppingList shopp);

    public List<ShoppingListBO> getListShoppBought(int director) throws DBOperationException;

    public List<ShoppingListBO> getListShoppNotBought(int director) throws DBOperationException;

    public boolean deleteProduct(int productID);

    public ShoppingList getProductBasedOnID(int productID) throws DBOperationException;

    public boolean updateProductEdit(ShoppingList shopp, int productID);
}
