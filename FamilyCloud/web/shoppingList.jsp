<%-- 
    Document   : shoppingList
    Created on : May 28, 2015, 6:38:46 PM
    Author     : Vaggos
--%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.ShoppingListBO"%>
<%@page import="models.UserBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%

    List<ShoppingListBO> listShoppBOnotBought = new ArrayList<ShoppingListBO>();
    listShoppBOnotBought = (List<ShoppingListBO>) session.getAttribute("listShoppBOnotBought");

%>
<%float totalPrice2 = 0;%>
<%for (int i = 0; i < listShoppBOnotBought.size(); i++) {%>
<%ShoppingListBO product2 = listShoppBOnotBought.get(i); %>
<% totalPrice2 = totalPrice2 + product2.getPrice();                   %>
<%}%> 
<%

    List<ShoppingListBO> listShoppBObought = new ArrayList<ShoppingListBO>();
    listShoppBObought = (List<ShoppingListBO>) session.getAttribute("listShoppBObought");

%>
<%float totalPrice = 0;%>
<%for (int i = 0; i < listShoppBObought.size(); i++) {%>
<%ShoppingListBO product = listShoppBObought.get(i); %>
<% totalPrice = totalPrice + product.getPrice();                   %>
<%}%>    
<div class="col-sm-12 contentPage" id="newPage">


    <div class="col-sm-12 non-printable" id="todoHeader">
        <h3>Shopping list</h3>
    </div>

    <div class="col-sm-9 non-printable" >
        <button type="button" class="btn btn-primary" id="addproductbutton" data-toggle="modal" data-target="#AddProduct" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Add product</button> 
    </div>

    <div class="col-sm-3 non-printable">
        <button type="button" onclick="printFunction()" class="btn btn-default btn-sm" id="printshoppingbutton">  <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print List</button>
    </div>


    <p style="color: green">${messageShopping}<br><br></p>  
    <div><h4>Products to buy</h4></div>

    <div class="datagrid"><table>
            <thead><tr><th>Products</th><th>Price</th><th></th><th></th></tr></thead>
            <!--<tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>-->
            <tbody>
                <c:choose>
                    <c:when test="${listShoppBOnotBought.size()==0}">
                        <tr><td>
                                <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 20px;">You have no products to the list!</h4><br>
                                <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 10px;">Add a not bought product</h4>
                            </td></tr>
                        </c:when>

                    <c:otherwise>

                        <c:forEach items="${listShoppBOnotBought}" var="productJSTLnotB">

                            <tr>
                                <td>${productJSTLnotB.product} </td>
                                <td>${productJSTLnotB.price} </td>

                                <c:choose>
                                    <c:when test="${(myUser.userID == myUser.director)||(myUser.userID == productJSTLnotB.addedBy)}">

                                        <td><button style=" background: transparent; border: none !important;" class="non-printable" id="editButton" data-toggle="modal" value="${productJSTLnotB.productID}" onclick="editProduct(this.value)" data-target="#editModal"><span class="glyphicon glyphicon-pencil"></span> Edit</button></td>
                                        <td><button style=" background: transparent; border: none !important;" class="non-printable" value="${productJSTLnotB.productID}" onclick="gotoDeleteProduct(this.value)"  data-toggle="modal" data-target="#deleteModal"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button></td>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>Total price: </td>
                            <td> <%=totalPrice2%></td>
                        </tr>

                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    <br>
    <br>

    <div><h4>Bought products</h4></div>


    <div class="datagrid"><table>
            <thead><tr><th>Products</th><th>Price</th><th></th><th></th></tr></thead>
            <!--<tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>-->
            <tbody>
                <c:choose>
                    <c:when test="${listShoppBObought.size()==0}">
                        <tr><td>
                                <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 20px;">You have no products to the list!</h4><br>
                                <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 10px;">Add a bought product</h4>
                            </td></tr>
                        </c:when>

                    <c:otherwise>

                        <c:forEach items="${listShoppBObought}" var="productJSTL">

                            <tr>
                                <td>${productJSTL.product} </td>
                                <td>${productJSTL.price} </td>

                                <c:choose>
                                    <c:when test="${(myUser.userID == myUser.director)||(myUser.userID == productJSTL.addedBy)}">

                                        <td><button style=" background: transparent; border: none !important;" class="non-printable" id="editButton" data-toggle="modal" value="${productJSTL.productID}" onclick="editProduct(this.value)" data-target="#editModal"><span class="glyphicon glyphicon-pencil"></span> Edit</button></td>
                                        <td><button style=" background: transparent; border: none !important;" class="non-printable" value="${productJSTL.productID}" onclick="gotoDeleteProduct(this.value)"  data-toggle="modal" data-target="#deleteModal"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button></td>
                                    </c:when>
                                </c:choose>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td>Total price: </td>
                            <td> <%=totalPrice%></td>
                        </tr>

                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    <!--            </div>
            </div>
        </div>				-->
</div>

<!--------------------------------------------------------------- Modal Add Product---------------------------------------------->

<div class="modal fade" id="AddProduct" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Add a Product</h4>
            </div>
            <div class="modal-body">

                <div class="container-fluid">	

                    <form class="form-horizontal" role="form" onsubmit="addProduct();
                            return false;">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="product">Product:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="product"  placeholder="product description" required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="price">Price:</label>
                            <div class="col-sm-4">
                                <input type="number" min="01" class="form-control" id="price" placeholder="">

                            </div>
                            <div class="col-sm-6 ">
                                <h5> (The price should be like 12.00)</h5>

                            </div>
                        </div>

                        <div class="form-group">

                            <div class="col-sm-10 col-sm-offset-2">


                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="bStatus" value="bought" required>Bought
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="bStatus" value="nBought"  required>Not bought
                                </label>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary"   >Add Product</button>
                        </div>
                    </form>  
                </div>

            </div>    
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!------------------------------------------------------------- Modal Edit Product---------------------------------------------->

<div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit a product</h4>
            </div>
            <div class="modal-body">



                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="prDescription">Product:</label>
                        <div class="col-sm-6">


                            <input type="text" class="form-control" id="productEdit"  placeholder="product description" required>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="price">Price:</label>
                        <div class="col-sm-4">
                            <input type="number" min="01" class="form-control" id="priceEdit" placeholder="">

                        </div>
                        <div class="col-sm-6 ">
                            <h5> (The price should be like 12.00)</h5>

                        </div>
                    </div>

                    <div class="form-group">

                        <div class="col-sm-10 col-sm-offset-2">
                            <form role="form">

                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="bStatusEdit" value="bought" id="bought" required>Bought
                                </label>
                                <label class="radio-inline">
                                    <input type="radio"  name="bStatusEdit" value="nBought" id="nBought" required>Not bought
                                </label>
                                <p id="editoption" class="validationClass"></p>
                            </form>
                        </div>
                    </div>







            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary" data-dismiss="modal" id="productIDEdit" onclick="editProductSaveChanges(this.value)">Save Changes</button>
            </div>
            </form>
        </div>
    </div>
</div>

<!------------------------------------------------------------- end---------------------------------------------->


<!--------------------------------------------------------- Modal Delete Shopping list---------------------------------------------->

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Delete product</h4>
            </div>
            <div class="modal-body">


                <h5>Are you sure you want to delete this product from the list? </h5>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button"  id="productIDToDel" onclick="deleteProduct(this.value)" data-dismiss="modal" class="btn btn-default">Yes</button>

            </div>
        </div>
    </div>
</div>
<!--------------------------------------------------------- end Modal Delete---------------------------------------------->


