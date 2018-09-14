

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<div class="col-sm-12 contentPage" id="newPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Personal Calendar</h3>
    </div> 
    <div class="row">
    <div class="col-sm-3 non-printable" >
        <button type="button" class="btn btn-primary" id="addeventbutton" data-toggle="modal" data-target="#AddEventModal" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Add event</button> 
    </div>

   

    <div class="col-sm-3 col-sm-offset-6 non-printable">
        <button type="button" onclick="printFunction()" class="btn btn-primary" id="printcalendarbutton" data-toggle="modal" data-target="#printModal" >  <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print Calendar</button>
    </div>
    </div>
    <div class=" row">
    <div class=" col-sm-7">
        <p id="messageNot" style="  color: #3E7A2E; ">${messageMyPC}</p> 
    </div>
    </div>
    <div class="col-sm-10 col-sm-offset-1 printable" id="calendar">

    </div> 




</div>


<!------------------------ Modal Add Event---------------------------------------------->

<div class="modal fade non-printable" id="AddEventModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add a task</h4>
            </div>
            <div class="modal-body">


                <div class="container-fluid">		 
                    <form data-toggle="validator" class="form-group" role="form" onsubmit="addTask();
                            return false;">
                        <div class="row">
                            <div class="form-group col-sm-6" >
                                <label for="activityName" class="control-label">Activity title</label>
                                <input type="text" name="" class="form-control" id="activityName" value="" required>
                                <p id="validactivityName" class="validationClass"></p>
                            </div>

                            <div class="form-group col-sm-6">
                                <label for="category" class="control-label">Category</label>
                                <input type="text" name="" class="form-control" id="category"  value="" required>
                                <p id="validcategory" class="validationClass"></p>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="control-label" for="date2">Starting Date</label>
                            <div class='input-group date' id="datetimepicker1">
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm" id="startingDate" class="form-control" required    >


                            </div>
                            <p id="validdate2" class="validationClass"></p>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="date2">Ending Date</label>
                            <div class='input-group date' id='datetimepicker1' >
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm" id="endingDate" class="form-control" />

                            </div>
                        </div>

                        <div class="form-group col-sm-12">


                            <label for="comment">Comment:</label>
                            <textarea class="form-control" rows="3" id="comment"></textarea>


                        </div>
                        <div class="row"> 
                            <div class=" col-sm-4 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reputance:</span>
                                </label>
                                <input type="checkbox" id="reputance" onchange="showElement('mycheckboxdiv')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv" style="display:none">

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
                                <input type="checkbox" id="reminderChecked" onchange="showElement('mycheckboxdiv2')" class="checkbox pull-right" value="0" />
                                <div id="mycheckboxdiv2" style="display:none">
                                    <label for="reminderDate">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="reminderDatePC"    class="form-control" />

                                    <div hidden="true">
                                        <input type="radio" name="reminder" id="hourly" onchange="showElement('myRadioDiv')" value="hourly" >  hours ago:<br>
                                        <div id="myRadioDiv" style="display:none">

                                            <input hidden="true" type='number' class="form-control" id="hourinput" placeholder="Give a number" />


                                        </div>

                                        <input hidden="true" type="radio" name="reminder"   value="day1ago">  1 day ago<br> 
                                        <input hidden="true" type="radio" name="reminder"   value="day2ago">  2 days ago
                                    </div>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
                            <button type="submit" class="btn btn-primary" >Add Event</button>
                        </div>






                    </form>
                </div>





            </div>
        </div>
    </div>
</div>
<!------------------------ end Modal Add Event---------------------------------------------->
<!------------------------ Modal View Event---------------------------------------------->
<div class="modal fade" id="viewEventModalPC" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">View information of personal event</h4>
            </div>
            <div class="modal-body">



                <div class="row"> <div class="col-sm-3"><p>Event title: </p></div>                <div class="col-sm-7"><p id="familyEventTilePC"></p></div> </div>
                <div class="row"> <div class="col-sm-3"><p>Starting Date:</p></div>               <div class="col-sm-7">  <p id="familyStartingDatePC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Ending Date: </p></div>                <div class="col-sm-7">  <p id="familyEndingDatePC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Category: </p></div>                   <div class="col-sm-7">  <p id="familyCategoryPC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Reputance: </p></div>                <div class="col-sm-7">  <p id="viewReputancePC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Reminder: </p></div>                   <div class="col-sm-7"> <p id="familyReminderPC"></p></div></div>
                <div class="row"> <div class="col-sm-4"><p>Description of the event: </p></div>   <div class="col-sm-7"> <p id="familyDescriptionPC"></p></div></div>



            </div>
            <div class="modal-footer">
                
                <button  type="button" class="btn btn-default" data-dismiss="modal" id="editEventButtonPC" data-toggle="modal" onclick = "showEdit(this.value);" data-target="#EditEventModalpc" ><span style="color: #677A96E;" class="glyphicon glyphicon-pencil"></span> Edit</button>
                <button  type="button" class="btn btn-default" data-dismiss="modal" id="deleteEventButtonPC" data-toggle="modal"  data-target="#DeleteEventModalpc"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button>
                <button  type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                

            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->


<!------------------------ Modal Edit Event---------------------------------------------->
<div class="modal fade" id="EditEventModalpc" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit event</h4>
            </div>
            <div class="modal-body">

                <div class="container-fluid">		 
                    <form  class="form-group" method="POST" role="form" onsubmit="editPersonalEvent();
                               return false;">
                        <div class="row">
                            <div class="form-group col-sm-6" >
                                <label  for="editEventTitlePC" class="control-label">Activity title</label>

                                <input type="text"  class="form-control" id="editEventTitlePC" required>


                            </div>

                            <div class="form-group col-sm-6">
                                <label  for="editfamilyCategory" class="control-label">Category</label>
                                <input type="text"  class="form-control" id="editCategoryPC"  required>
                                <p id="validcategory" class="validationClass"></p>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="control-label" for="date2">Starting Date</label>
                            <div class='input-group date' id="datetimepicker1">
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm"  class="form-control" id="editStartingDatePC" required>


                            </div>
                            <p id="validdate2" class="validationClass"></p>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="date2">Ending Date</label>
                            <div class='input-group date' id='datetimepicker1' >
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm"  id="editEndingDatePC"  class="form-control" />

                            </div>
                        </div>

                        <div class="form-group col-sm-12">


                            <label for="comment">Comment:</label>
                            <textarea class="form-control" rows="3" id="editCommentPC"></textarea>


                        </div>
                        <div class="row"> 
                            <div class=" col-sm-4 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reputance:</span>
                                </label>
                                <input type="checkbox" id="editReputancePC" onchange="showElement('editReputancePCdiv1')" class="checkbox pull-right"  />
                                <div id="editReputancePCdiv1" style="display:none">

                                    <input type="checkbox" id="editDailyPC" >Daily<br>
                                    <input type="checkbox" id="editWeeklyPC" >Weekly<br> 
                                    <input type="checkbox" id="editMonthlyPC" >Monthly
                                    <div style="float:right" >
                                        <label for="editexpDate">Reputance Until</label>
                                        <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="editExpDatePC"    class="form-control" />
                                    </div>
                                </div>

                            </div>

                            <div class=" col-sm-5 col-sm-offset-2 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reminder:</span>
                                </label>
                                <input type="checkbox" id="editreminderCheckedPC" onchange="showElement('editReminderDiv')" class="checkbox pull-right" value="0" />
                                <div id="editReminderDiv" style="display:none">
                                    <label for="reminderDate">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="editReminderDatePC"    class="form-control" />
                                    <div hidden="true">
                                        <input type="radio" name="editreminderPC" id="editHourlyPC" onchange="showElement('editMyRadioPCDiv')" value="hourly" >  hours ago:<br>
                                        <div id="editMyRadioPCDiv" style="display:none">

                                            <input type='number' class="form-control" id="EditHourinputPC" placeholder="Give a number" />


                                        </div>
                                        <input type="radio" name="editreminderPC" id="edit1RemPC"  value="day1ago">  1 day ago<br> 
                                        <input type="radio" name="editreminderPC" id="edit2RemPC"  value="day2ago">  2 days ago
                                    </div>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>

                        <div class="modal-footer">

                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary"  id="saveChangesButtonPC" >Save Changes</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>
</div>

<!------------------------------------------------------------------- end---------------------------------------------->

<!--------------------------------------------------------- Modal Delete Event---------------------------------------------->	

<div class="modal fade" id="DeleteEventModalpc"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
                <button type="button" data-dismiss="modal" id="delete_eventPC"  class="btn btn-default" onclick="deletePersonalEvent(this.value)">Yes</button>
            </div>
        </div>
    </div>
</div>



<!--------------------------------------------------------- Modal Delete Family---------------------------------------------->	