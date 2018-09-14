<%-- 
    Document   : index
    Created on : May 20, 2015, 3:32:41 PM
    Author     : Vaggos
--%>

<%@page import="models.UserBO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
    <head>
        <title>Family Cloud</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

        <script type="text/javascript" src="js/bootstrap-datepicker-fixed.js"></script>
        <link href="style.css" rel="stylesheet" type="text/css" />
        <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> 

        <link rel="stylesheet" href="fullcalendar.css" />
        
        <script src="validation/validation.js"></script>
        
        <script src="AJAXjs/createFamily.js"></script>
        <script src="AJAXjs/myFamilyShow.js"></script>
        <script src="AJAXjs/myProfileShow.js"></script>
        <script src="AJAXjs/addInactive.js"></script>
        <script src="AJAXjs/viewMember.js"></script>
        <script src="AJAXjs/goToDeleteMember.js"></script>
        <script src="AJAXjs/deleteMember.js"></script>
        <script src="AJAXjs/editMember.js"></script>
        <script src="AJAXjs/editMemberSaveChanges.js"></script>
        
        <script src="AJAXjs/myFamily/deleteFamily.js"></script>
        <script src="AJAXjs/myFamily/validateEmailAddActive.js"></script>
        <script src="AJAXjs/myFamily/addActive.js"></script>
        <script src="AJAXjs/myFamily/accept_invitation.js"></script>
        <script src="AJAXjs/myFamily/decline_invitation.js"></script>
        
        
        <script src="AJAXjs/toDoListShow.js"></script>
        <script src="AJAXjs/toDoList/addToDoList.js"></script>
        <script src="AJAXjs/toDoList/editTodoList.js"></script>
        <script src="AJAXjs/toDoList/editTodoListSaveChanges.js"></script>
        <script src="AJAXjs/toDoList/goToDeleteTodolist.js"></script>
        <script src="AJAXjs/toDoList/deleteToDo.js"></script>
        
        <script src="AJAXjs/shoppingListShow.js"></script>
        <script src="AJAXjs/shopping_list/addProduct.js"></script>
        <script src="AJAXjs/shopping_list/editProduct.js"></script>
        <script src="AJAXjs/shopping_list/deleteProduct.js"></script>
        <script src="AJAXjs/shopping_list/editProductSaveChanges.js"></script>
        
        <script src="AJAXjs/myProfile/editProfile.js"></script>
        <script src="AJAXjs/myProfile/editProfileSaveChanges.js"></script>
        <script src="AJAXjs/myProfile/changeImage.js"></script>
        <script src="AJAXjs/myProfile/changePassword.js"></script>
        <script src="AJAXjs/myProfile/changePasswordSaveChanges.js"></script>
        <script src="AJAXjs/myProfile/validateOldPassword.js"></script>
        
        
        
        <script src="AJAXjs/famillyWall/famillyWallShow.js"></script>
        <script src="AJAXjs/famillyWall/postWall.js"></script>
        <script src="AJAXjs/famillyWall/deletePost.js"></script>
        
        
        <script src="AJAXjs/messages/messagesShow.js"></script>
        <script src="AJAXjs/messages/newMessageAdd.js"></script>
        <script src="AJAXjs/messages/showMessageWindow.js"></script>
        <script src="AJAXjs/messages/deleteMessage.js"></script>
        
        <script src="AJAXjs/personal-calendar/personal-calendarShow.js"></script>
        <script src="AJAXjs/personal-calendar/moment.js"></script>
	<script src="AJAXjs/personal-calendar/fullcalendar.js"> </script>
        <script src="AJAXjs/personal-calendar/newTaskAdd.js"> </script>
        <script src="AJAXjs/personal-calendar/viewEventInfo.js"> </script>
        <script src="AJAXjs/personal-calendar/edit_personal_events.js"> </script>
        <script src="AJAXjs/personal-calendar/delete_personal_event.js"> </script>
        <script src="AJAXjs/personal-calendar/showEditModal.js"> </script>
        
        
       
        
        <script src="AJAXjs/family-calendar/family-calendarShow.js"></script>
        <script src="AJAXjs/family-calendar/newTaskAddFamily.js"> </script>
        <script src="AJAXjs/family-calendar/viewFamilyEvent.js"> </script>
        <script src="AJAXjs/family-calendar/deleteEvent.js"> </script>
        <script src="AJAXjs/family-calendar/editEvent.js"> </script>
        <script src="AJAXjs/family-calendar/show_edits_event.js"> </script>
        <script src="AJAXjs/family-calendar/groupByMember.js"> </script>
        <script src="AJAXjs/family-calendar/groupByCategory.js"> </script>
        <script src="AJAXjs/family-calendar/importToPersonal.js"> </script>
        
        
        
        <script src="AJAXjs/meals/editMealSaveChanges.js"></script>
        <script src="AJAXjs/meals/mealsShow.js"></script>
        <script src="AJAXjs/meals/newMealAdd.js"></script>
        <script src="AJAXjs/meals/vieMealsEvent.js"></script>
        <script src="AJAXjs/meals/deleteMeal.js"></script>
        
        <script src="AJAXjs/notifications/showNotifications.js"></script>
        <script src="AJAXjs/notifications/getNotifNumber.js"></script>
        <script src="AJAXjs/notifications/goToNotificationLocation.js"></script>
        <script src="AJAXjs/notifications/goToNotificationLoacationMEALSreminder.js"></script>
        <script src="AJAXjs/notifications/goToNotificationLocationFCreminder.js"></script>
        <script src="AJAXjs/notifications/goToNotificationLocationPCreminder.js"></script>
        
        <script>
            
            window.onload=function(){
                getNotifNumber();
            }
                
            
        </script>
      

    </head>

    <body>

        
        <%@ include file="pageParts/familyTop.jsp" %>


        <div class="container-fluid" id="contfluid">

            <div class="row" >

                <%@ include file="pageParts/familyLeft.jsp" %>

                <div class="col-sm-6" id="pageNew">
                    <%@ include file="myFamily.jsp" %>
                </div>
                <div class="col-sm-3 non-printable" id="columnright">
                <%@ include file="pageParts/familyRight.jsp" %>
                </div>
            </div>
        </div>                 

        <%@ include file="pageParts/familyFooter.jsp" %>






        <!------------------------ Modal Logout---------------------------------------------->	

        <div class="modal fade" id="logoutmod"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                  <form action="Controller" method="post"  role="form" >  
 
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Logout</h4>
                    </div>
                    <div class="modal-body">


                        <h5>Are you sure you want to log out? </h5>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                        <a href="file:///C:/Users/Desktop/Desktop/site1/first.html"><button type="submit" name="newproperties" value="LOGOUT" class="btn btn-default">Yes</button></a>
                    </div>
                  </form>
                </div>
            </div>
        </div>
        <!------------------------ end Modal Logout---------------------------------------------->



    </body>
</html>

