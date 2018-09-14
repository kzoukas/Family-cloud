/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.model;

/**
 *
 * @author Vaggos
 */
public class ShoppingList {

    private int productID;
    private String product;
    private float price;
    private String status;
    private int director;
    private int addedBy;

    public ShoppingList() {

        productID=0;
        product=null;
        price=0;
        status=null;
        director=0;
        addedBy=0;
    }

    // Getter and Setter Methods
    //////////////////////////////////
    public void updateShoppInfo(ShoppingList other) {
        if (other != null) {
            if (other.getProductID() != 0) {
                productID = other.getProductID();
            }
            if (other.getProduct() != null) {
                product = other.getProduct();
            }
            if (other.getPrice() != 0) {
                price = other.getPrice();
            }

            if (other.getStatus()!= null) {
                status = other.getStatus();
            }

            if (other.getDirector()!= 0) {
                director = other.getDirector();
            }
            if (other.getAddedBy()!= 0) {
                addedBy = other.getAddedBy();
            }
            

        }
    }

    /**
     * @return the productID
     */
    public int getProductID() {
        return productID;
    }
    
    /**
     * @return the product
     */
    public String getProduct() {
        return product;
    }

    public int getAddedBy() {
        return addedBy;
    }

    public void setAddedBy(int addedBy) {
        this.addedBy = addedBy;
    }
    
    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @return the director
     */
    public int getDirector() {
        return director;
    }

    /**
     * @param productID the productID to set
     */
    public void setProductID(int productID) {
        this.productID = productID;
    }

    /**
     * @param product the product to set
     */
    public void setProduct(String product) {
        this.product = product;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @param director the director to set
     */
    public void setDirector(int director) {
        this.director = director;
    }

}
