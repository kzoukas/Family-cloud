/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;
import daos.DBOperationException;
import daos.ShoppingListDAO;
import db.model.ShoppingList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.ShoppingListBO;

/**
 *
 * @author Vaggos
 */
public class MySqlShoppingListDAO implements ShoppingListDAO{

    

    @Override
    public boolean insertProduct(ShoppingList shopp) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        
        
        try {
            pst=conn.prepareStatement("SELECT MAX(productID) AS maxID FROM shopping_list;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {
               
                shopp.setProductID(rs1.getInt("maxID")+1);

            }
            
            
            
            pst = conn.prepareStatement("INSERT INTO shopping_list(productID, product, price, status, director,addedBy)"
                    + " VALUES(?, ?, ?, ?, ?, ?)");

            pst.setInt(1, shopp.getProductID());
            pst.setString(2, shopp.getProduct());
            pst.setFloat(3, shopp.getPrice());
            pst.setString(4, shopp.getStatus());
            pst.setInt(5,shopp.getDirector());
            pst.setInt(6, shopp.getAddedBy());
            
            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }


    public List<ShoppingListBO> getListShoppNotBought(int director) throws DBOperationException {
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        List<ShoppingListBO> allFamilyProducts = new ArrayList<ShoppingListBO>();
        ShoppingList shopp = new ShoppingList();

        try {
            pst = conn.prepareStatement("SELECT * FROM shopping_list WHERE director = ? AND status = ?");
            pst.setInt(1, director);
            pst.setString(2,"nBought");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               shopp.setProduct(rs.getString("product"));
               shopp.setPrice(rs.getFloat("price"));
               shopp.setStatus(rs.getString("status"));
               shopp.setDirector(rs.getInt("director"));
               shopp.setProductID(rs.getInt("productID"));
               shopp.setAddedBy(rs.getInt("addedBy"));
                
               ShoppingListBO takis = new ShoppingListBO();
               
                allFamilyProducts.add(takis.toShoppingListBO(shopp));
//                UserBO takis = new UserBO();
//               
//                allmembers.add(takis.toUserBO(user));
                
                
            }
                
        } catch (SQLException ex) {
            shopp = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return allFamilyProducts;
    }

    
    @Override
    public List<ShoppingListBO> getListShoppBought(int director) throws DBOperationException {
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        List<ShoppingListBO> allFamilyProducts = new ArrayList<ShoppingListBO>();
        ShoppingList shopp = new ShoppingList();

        try {
            pst = conn.prepareStatement("SELECT * FROM shopping_list WHERE director = ? AND status = ?");
            pst.setInt(1, director);
            pst.setString(2,"bought");

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
               shopp.setProduct(rs.getString("product"));
               shopp.setPrice(rs.getFloat("price"));
               shopp.setStatus(rs.getString("status"));
               shopp.setDirector(rs.getInt("director"));
               shopp.setProductID(rs.getInt("productID"));
               shopp.setAddedBy(rs.getInt("addedBy"));
                
               ShoppingListBO takis = new ShoppingListBO();
               
                allFamilyProducts.add(takis.toShoppingListBO(shopp));
//                UserBO takis = new UserBO();
//               
//                allmembers.add(takis.toUserBO(user));
                
                
            }
                
        } catch (SQLException ex) {
            shopp = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return allFamilyProducts;
    }
    

    @Override
    public ShoppingList getProductBasedOnID(int productID) throws DBOperationException {
       PreparedStatement pst = null;
            Connection conn = MySqlDAOFactory.createConnection();

        ShoppingList shopp = new ShoppingList();
        
        try {
            pst = conn.prepareStatement("SELECT * FROM shopping_list WHERE productID = ?");
            pst.setInt(1, productID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                shopp.setProduct(rs.getString("product"));
                shopp.setPrice(rs.getFloat("price"));
                shopp.setStatus(rs.getString("status"));
                shopp.setDirector(rs.getInt("director"));
                shopp.setProductID(productID);
            }

        } catch (SQLException ex) {
            shopp = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return shopp;
    }

    @Override
    public boolean deleteProduct(int productID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM shopping_list WHERE productID = ?");
            pst.setInt(1, productID);

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    
    public boolean updateProductEdit(ShoppingList shopp ,int productID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //ShoppingList previousUser = this.getUserBasedOnID(userID);
            ShoppingList previousUser = this.getProductBasedOnID(productID);  
            previousUser.updateShoppInfo(shopp);

            pst = conn.prepareStatement("UPDATE shopping_list "
                    + "SET product = ?"
                    + ",price = ?"
                    + ",status = ?"
                   
                    + ",director = ?"
                    
                    
                    + " WHERE productID = ?");
            
            
            

            pst.setString(1, shopp.getProduct());
            pst.setFloat(2, shopp.getPrice());
            pst.setString(3,shopp.getStatus());
            pst.setInt(4, shopp.getDirector());
            pst.setInt(5, productID);
           
            

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
 }




        
    
        
    
    //    public ShoppingList getProductBasedOnID(int productID) throws DBOperationException {
//
//        PreparedStatement pst = null;
//        Connection conn = MySqlDAOFactory.createConnection();
//
//        ShoppingList shopp = new ShoppingList();
//        
//        try {
//            pst = conn.prepareStatement("SELECT * FROM shopping_list WHERE productID = ?");
//            pst.setInt(1, productID);
//
//            ResultSet rs = pst.executeQuery();
//
//            while (rs.next()) {
//                shopp.setProduct(rs.getString("product"));
//                shopp.setPrice(rs.getFloat("price"));
//                shopp.setStatus(rs.getString("status"));
//                shopp.setDirector(rs.getInt("director"));
//                shopp.setProductID(productID);
//            }
//
//        } catch (SQLException ex) {
//            shopp = null;
//            throw new DBOperationException(ex);
//        } finally {
//            try {
//                conn.close();
//            } catch (SQLException ex) {
//
//                throw new DBOperationException(ex);
//            }
//        }
//
//        return shopp;
//    }

