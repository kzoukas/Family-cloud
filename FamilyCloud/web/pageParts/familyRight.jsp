
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     
     
     
        <div >
            <button id="help_button" class="btn btn-primary" data-toggle="modal"    data-target="#helpModal"> You need help?</button> 
        </div>
            <div  class="col-sm-7 dropdown" >
                    <button   type="button" class="btn btn-primary" onclick="getNotifications()" data-toggle="dropdown" id="notification_button" aria-haspopup="true" >
                       Notifications  <span  id="number_notif"></span>
                       <span class="caret"></span>
                    </button>

                    <ul style="overflow-y: scroll; max-height:400px;" class="dropdown-menu" aria-labelledby="dLabel" id="notification_show">
                      
                    </ul>
                
             </div>
         
              
<!------------------------ Modal Help---------------------------------------------->	

        <div class="modal fade" id="helpModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form action="Controller" method="post"  role="form" >  

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Help</h4>
                        </div>
                        <div class="modal-body">






                            <h4 style="margin-left:25px" ><b>Select one of the followings:</b></h4>

                            <div style="margin-left:25px" >

                                <h4><button type="button" class="helpButton" onclick="showElement('helpSignUp');"> Sign up </button></h4>
                                <div class="helpDiv" id="helpSignUp" style="display: block"><p>All you have to do is to fill the sign up form on first page and click register</p></div>


                                <h4><button type="button" class="helpButton" onclick="showElement('helpSignIn');"> Sign in </button></h4>
                                <div class="helpDiv" id="helpSignIn" style="display: block"><p>In order to Sign in you have to fill the sign in form on first page and click sign in</p></div>



                                <h4><button type="button" class="helpButton" onclick="showElement('helpCreateFam');"> Create Family </button></h4>
                                <div class="helpDiv" id="helpCreateFam" style="display: block"><p>After you sign up you can create a family. The user that creates the family is the director of the family. Each user can only have one family. As a result, this procedure can take place only once.</p></div>


                                <h4 style="margin-left:110px"><b>The following procedures take place only if you have signed in and you are in a Family.</b></h4>    


                                <h4><button type="button" class="helpButton" onclick="showElement('helpAddActive');"> Add Active family member</button></h4>
                                <div class="helpDiv" id="helpAddActive" style="display: block"><p>In order to add an Active Family member there are two principles. Firstly, you have to be the director. Secondly, the user that you want to add must exist on the website without a family. In other words the active user that you want to add must have signed up. Then you can click on Add Family member, choose active and fill his email. The user will be added if he accepts the request.  </p></div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpAddInActive');"> Add Inactive family member</button></h4>
                                <div class="helpDiv" id="helpAddInActive" style="display: block"><p>Firstly, you have to be the director. Click on Add Family member, choose Inactive and fill the form </p></div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpEditDel');"> View/Edit/Delete member</button></h4>
                                <div class="helpDiv" id="helpEditDel" style="display: block"><p>To view the member's info click on his image. To edit/delete a member you have to be the director of the family. Just click on edit/delete button and follow the path. If the director deletes a family member, that user continues to exist, so he can enter another family or create his own</p></div>        

                                <h4><button type="button" class="helpButton" onclick="showElement('helpDelFam');"> Delete Family</button></h4>
                                <div class="helpDiv" id="helpDelFam" style="display: block"><p>The director of the family has that opportunity. If the director deletes the family the users continue to exist, so they can enter other families or create their own</p></div>   



                                <h4><button type="button" class="helpButton" onclick="showElement('helpToDo');">To Do List</button></h4>
                                <div class="helpDiv" id="helpToDo" style="display: block"><p>To do list is provided for the family. In to the to do list you can add/edit/delete things that you want to do, as well as assign things to other members of the family. When an event is assigned to another family member, the family member will be notified through the notification system of our site.</p> </div>




                                <h4><button type="button" class="helpButton" onclick="showElement('helpShopp');">Shopping List</button></h4>
                                <div class="helpDiv" id="helpShopp" style="display: block"><p>Shopping List is provided for the family. In shopping list users can add/edit/delete products bought or to be bought. Shopping list  categorizes the products on bought and not bought and calculates the total price. </p> </div>


                                <h4><button type="button" class="helpButton" onclick="showElement('helpWall');">Family Wall</button></h4>
                                <div class="helpDiv" id="helpWall" style="display: block"><p>Family wall is a field where users can post messages and photos to the whole family. </p> </div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpMessages');">Messages</button></h4>
                                <div class="helpDiv" id="helpMessages" style="display: block"><p>Messages is a field where you can have private conversation with the members of the family</p> </div>





                               
                                  

                                <h4><button type="button" class="helpButton" onclick="showElement('helpCal');"> Calendars</button></h4>
                                <div class="helpDiv" id="helpCal" style="display: block"><p>All of our calendars can be shown daily weekly or monthly. Furthermore, you can add events(repeatedly or simple) and set a reminder as well.</p></div> 


                                <h4><button type="button" class="helpButton" onclick="showElement('helPC');"> Personal Calendar</button></h4>
                                <div class="helpDiv" id="helPC" style="display: block"><p>The personal calendar is each active's user personal calendar. The  personal calendar can be shown as whole or by category. You just have to categorize the events you add by filling the category field.</p></div> 

                                <h4><button type="button" class="helpButton" onclick="showElement('helFC');"> Family Calendar</button></h4>
                                <div class="helpDiv" id="helFC" style="display: block"><p>The family calendar is ofcourse the family's calendar. Events can be assigned to family members, When an event is assigned to another family member, the member will be notified through the notification system of our site . The view of the family calendar can be shown as whole, by category or by member. What you see on your family calendar can be imported to your personal, just click on the button import to personal.</p> </div> 

                                <h4><button type="button" class="helpButton" onclick="showElement('helpMeal');"> Meals Plan</button></h4>
                                <div class="helpDiv" id="helpMeal" style="display: block"><p>As meals is also a calendar you can add any kind of meal or dinner arrangements you want. Meals plan is visible to all family.</p> </div> 
                            </div>





                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!------------------------ end Modal help---------------------------------------------->

     

