<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<div class="col-sm-12 contentPage" id="newPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Meals Plan</h3>
    </div> 

    <div class="col-sm-3 non-printable" >
        <button type="button" class="btn btn-primary" id="addeventbutton" data-toggle="modal" data-target="#myModal" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Add Meal</button> 
    </div>



    <div class="col-sm-3 col-sm-offset-6 non-printable">
        <button type="button" onclick="printFunction()" class="btn btn-primary" id="printcalendarbutton" data-toggle="modal" data-target="#printModal" >  <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print Meal</button>
    </div>
    <div class="row col-sm-12">
        <p id="messageNot" style="color: green">${messageMyMeals}</p> 
    </div> 
    <div class="col-sm-10  col-sm-offset-1 printable" id="calendar">

    </div> 




</div>


<!------------------------ Modal Add Meal---------------------------------------------->

<div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add a meal</h4>
            </div>
            <div class="modal-body">


                <div class="container-fluid">		 
                    <form class="form-horizontal" role="form" method="POST" onsubmit="addMeal();
                            return false;">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="mealName">Meal name:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="mealName" placeholder="" required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" >Day and time:</label>
                            <div class="col-sm-6" >
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm" class="form-control" id="dates"  required >


                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Place:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="place" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="comment">Description:</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="3" id="description" placeholder="Give a despription of the food or any other comment"></textarea>	
                            </div>
                        </div>
                        <div class="row"> 
                            <div class=" col-sm-4 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reputance:</span>
                                </label>
                                <input type="checkbox" id="reputance" onchange="showElement('mycheckboxdiv3')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv3" style="display:none">

                                    <input type="checkbox" id="daily" >Daily<br>
                                    <input type="checkbox" id="weekly" >Weekly<br> 
                                    <input type="checkbox" id="monthly" >Monthly
                                    <div style="float:right" >
                                        <label for="expDate">Reputance Until</label>
                                        <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="expDate"    class="form-control" />
                                    </div>
                                </div>

                            </div>

                            <div class=" col-sm-5 col-sm-offset-2 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reminder:</span>
                                </label>
                                <input type="checkbox" id="reminderChecked" onchange="showElement('mycheckboxdiv4')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv4" style="display:none">
                                    <label for="reminderDateMeals">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="reminderDateMeals"    class="form-control" />
                                    <div hidden="true">
                                        <input type="radio" name="reminder" id="hourly" onchange="showElement('myRadioDiv')" value="hourly" >  hours ago:<br>
                                        <div id="myRadioDiv" style="display:none">

                                            <input type='number' class="form-control" id="hourinput" placeholder="Give a number" />


                                        </div>
                                        <input type="radio" name="reminder"   value="day1ago">  1 day ago<br> 
                                        <input type="radio" name="reminder"   value="day2ago">  2 days ago
                                    </div>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" >Add Meal</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>
<!------------------------ end Modal Add MEAL---------------------------------------------->






<!------------------------ Modal View Event---------------------------------------------->
<div class="modal fade" id="viewEventModalMeal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">View information of meal created by <span id="mealCreator"></span></h4>
                
            </div>
            <div class="modal-body">
                <div class="row"> <div class="col-sm-3"><p>Meal Name: </p></div>                <div class="col-sm-5">  <p id="viewMealName"></p></div> </div>
                <div class="row"> <div class="col-sm-3"><p>Place:</p></div>                     <div class="col-sm-5">  <p id="viewPlace"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Description: </p></div>              <div class="col-sm-7">  <p id="viewDescription"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Datetime: </p></div>                 <div class="col-sm-5">  <p id="viewDatetime"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Reputance: </p></div>                <div class="col-sm-7">  <p id="viewReputanceMeals"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Reminder: </p></div>                 <div class="col-sm-6">  <p id="viewReminderMeals"></p></div></div>

            </div>
            <div class="modal-footer">
                
                
                <button style="float: right; margin-left: 5px;" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button style="float: right" type="button" class="btn btn-default" data-dismiss="modal" id="deleteMealEventButton" data-toggle="modal" onclick="viewMealsEvent(this.value)" data-target="#DeleteMealEventModal"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button>
                <button style="float: right" type="button" class="btn btn-default" data-dismiss="modal" id="editMealEventButton" data-toggle="modal" onclick="viewMealsEvent(this.value)" data-target="#EditMealEventModal"><span style="color: #677A96E;" class="glyphicon glyphicon-pencil"></span> Edit</button>
                

                

            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!------------------------ Modal Edit Meal---------------------------------------------->

<div class="modal fade" id="EditMealEventModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Meal</h4>
            </div>
            <div class="modal-body">


                <div class="container-fluid">		 
                    <form class="form-horizontal" role="form" method="POST"  onsubmit="editMealSaveChanges();
                            return false;">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="mealName">Meal name:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="editMealName" placeholder="" required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" >Day and time:</label>
                            <div class="col-sm-6" >
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm" class="form-control" id="editDates" required >


                            </div>

                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3">Place:</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="editPlace" placeholder="" required>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="comment">Description:</label>
                            <div class="col-sm-6">
                                <textarea class="form-control" rows="3" id="editDescription" placeholder="Give a despription of the food or any other comment"></textarea>	
                            </div>
                        </div>
                        <div class="row"> 
                            <div class=" col-sm-4 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reputance:</span>
                                </label>
                                <input type="checkbox" id="editReputance" onchange="showElement('mycheckboxdiv5')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv5" style="display:none">

                                    <input type="checkbox" id="editDaily" >Daily<br>
                                    <input type="checkbox" id="editWeekly" >Weekly<br> 
                                    <input type="checkbox" id="editMonthly" >Monthly
                                    <div style="float:right" >
                                        <label for="editExpDate">Reputance Until</label>
                                        <input type="date" id="editExpDate" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd"     class="form-control" />
                                    </div>
                                </div>

                            </div>

                            <div class=" col-sm-5 col-sm-offset-2 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reminder:</span>
                                </label>
                                <input type="checkbox" id="editReminderCheck" onchange="showElement('mycheckboxdiv6')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv6" style="display:none">
                                    
                                    <label for="editReminderDateMeals">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="editReminderDateMeals"    class="form-control" />
                                    <div hidden="true">
                                        <input type="radio" name="editReminder" id="editHourly" onchange="showElement('myRadioDiv2')" value="hourly" >  hours ago:<br>
                                        <div id="myRadioDiv2" style="display:none">

                                            <input type='number' class="form-control" id="editHourinput" placeholder="Give a number" />


                                        </div>
                                        <input type="radio" name="editReminder" id="edit1Rem"  value="day1ago">  1 day ago<br> 
                                        <input type="radio" name="editReminder" id="edit2Rem"  value="day2ago">  2 days ago
                                    </div>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" id="editMealButtonSave"  >Save changes</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>
<!------------------------ end Modal Edit MEAL---------------------------------------------->
<div class="modal fade" id="DeleteMealEventModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Delete member from family</h4>
            </div>
            <div class="modal-body">


                <h5>Are you sure you want to delete this event from calendar? </h5>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" data-dismiss="modal" id="delete_meal"  class="btn btn-default" onclick="deleteMeal(this.value)">Yes</button>
            </div>
        </div>
    </div>
</div>