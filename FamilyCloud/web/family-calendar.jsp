

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script>

</script>

<div class="col-sm-12 contentPage" id="newPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Family Calendar</h3>
    </div>
    <div class="row">
        <div class="col-sm-3 non-printable">
            <button type="button" class="btn btn-primary" id="addeventbutton" data-toggle="modal" data-target="#AddEventFamily"> <span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add event</button>
        </div>

        <div class="col-sm-3 non-printable">

            <div class="dropdown">
                <a id="addviewbybutton" role="button" data-toggle="dropdown" class="btn btn-primary" data-target="#" href="/page.html">
                    View by <span class="caret"></span>
                </a>
                <ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">

                    <li class="dropdown-submenu">
                        <a tabindex="-1" href="#">Category</a>
                        <ul class="dropdown-menu">

                            <c:forEach items="${categoryList}" var="categories">

                                <li><button style=" background: transparent; border: none !important;" value="${categories}" onclick="groupByCategory(this.value)">${categories}</button>
                                </li>
                            </c:forEach>  
                        </ul>
                    </li>
                    <li class="dropdown-submenu">
                        <a tabindex="-1" href="#">Member</a>



                        <ul class="dropdown-menu">

                            <c:forEach items="${usersExceptCurrent}" var="usersNoCurrent">

                                <li><button style=" background: transparent; border: none !important;" value="${usersNoCurrent.userID}"  onclick="groupByMember(this.value);" >${usersNoCurrent.firstName}</button>
                                </li>
                            </c:forEach>  
                        </ul>

                    </li>
                </ul>
            </div>

        </div>

        <div class="col-sm-3 col-sm-offset-3 non-printable">
            <button type="button" onclick="printFunction()" class="btn btn-primary" id="printcalendarbutton" > <span class="glyphicon glyphicon-print" aria-hidden="true"></span> Print Calendar</button>
        </div>
    </div>
    <div class="row col-sm-7">
        <p id="messageNot" style="color: green">${messageMyFC}</p> 
    </div>
    <div class="col-sm-10 col-sm-offset-1 printable" id="calendar">

    </div>

    

</div>



<!------------------------ Modal Add Event---------------------------------------------->

<div class="modal fade non-printable" id="AddEventFamily"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add a task</h4>
            </div>
            <div class="modal-body">


                <div class="container-fluid">		 
                    <form data-toggle="validator" class="form-group" role="form" id="addfc" onsubmit="addTaskFamily();
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
                                <input  type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm" id="startingDate" class="form-control" required>


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
                            <br>
                            <label class=" col-sm-4">Event assigned to:</label>
                            <div class="col-sm-8">
                                <select multiple class="form-control" id="multiselectAssignedToFC">
                                    <c:forEach items="${usersExceptCurrent}" var="assignedTo">
                                        <option value="${assignedTo.userID}">${assignedTo.firstName}</option>


                                    </c:forEach>
                                </select>
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
                                    <label for="">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="reminderDateFC"    class="form-control" />
                                    
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
                            <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
                            <button type="submit" class="btn btn-primary"  >Add Event</button>
                        </div>






                    </form>
                </div>





            </div>
        </div>
    </div>
</div>
<!------------------------ end Modal Add Event---------------------------------------------->
<!------------------------ Modal View Event---------------------------------------------->
<div class="modal fade" id="viewEventModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">View information of member created by <span id="activityFCcreator"></span></h4>
            </div>
            <div class="modal-body">



                <div class="row"> <div class="col-sm-3"><p>Event title: </p></div>                <div class="col-sm-6"><p id="EventTileFC"></p></div> </div>
                <div class="row"> <div class="col-sm-3"><p>Starting Date:</p></div>               <div class="col-sm-6">  <p id="StartingDateFC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Ending Date: </p></div>                <div class="col-sm-6">  <p id="EndingDateFC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Category: </p></div>                   <div class="col-sm-6">  <p id="CategoryFC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Reputance: </p></div>                <div class="col-sm-7">  <p id="viewReputanceFC"></p></div></div>

                <div class="row"> <div class="col-sm-3"><p>Reminder: </p></div>                   <div class="col-sm-8"> <p id="viewReminderFC"></p></div></div>
                <div class="row"> <div class="col-sm-3"><p>Assigned to: </p></div>                <div class="col-sm-6">  <p id="AssignedToFC"></p></div></div>

                <div class="row"><br><br> <div class="col-sm-6"><p>If you want to import this event to your personal calendar you can click here </p>
                    <button style="float: left" type="button" class="btn btn-default" data-dismiss="modal" id="importToPersonal" onclick="importToPersonal(this.value)">Import</button></div></div>



            </div>
            <div class="modal-footer">
                        
                        
                        <button style="float: right; margin-left: 5px;" type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button style="float: right" type="button" class="btn btn-default" data-dismiss="modal" id="deleteEventButton" data-toggle="modal"  data-target="#DeleteEventModal"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button>
                        <button style="float: right" type="button" class="btn btn-default" data-dismiss="modal" id="editEventButton" data-toggle="modal" onclick="viewFamilyEvent(this.value)" data-target="#EditEventModal"><span style="color: #677A96E;" class="glyphicon glyphicon-pencil"></span> Edit</button>
            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->


<!------------------------ Modal Edit Event---------------------------------------------->
<div class="modal fade" id="EditEventModal" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Edit event</h4>
            </div>
            <div class="modal-body">

                <div class="container-fluid">		 
                    <form  class="form-group" role="form" id="editfc" onsubmit="editEvent();
                            return false;">
                        <div class="row">
                            <div class="form-group col-sm-6" >
                                <label  for="editfamilyEventTitle" class="control-label">Activity title</label>

                                <input type="text"  class="form-control" id="editTitleFC" required >


                            </div>

                            <div class="form-group col-sm-6">
                                <label  for="editfamilyCategory" class="control-label">Category</label>
                                <input type="text"  class="form-control" id="editCategoryFC" required  >
                                <p id="validcategory" class="validationClass"></p>
                            </div>
                        </div>
                        <div class="form-group col-sm-6">
                            <label class="control-label" for="date2">Starting Date</label>
                            <div class='input-group date' id="datetimepicker1">
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm"   id="editStartingDateFC" class="form-control" required  >


                            </div>
                            <p id="validdate2" class="validationClass"></p>
                        </div>
                        <div class="form-group col-sm-6">
                            <label for="date2">Ending Date</label>
                            <div class='input-group date' id='datetimepicker1' >
                                <input type="datetime" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01]) ([0-9]{2}:[0-9]{2})" placeholder="yyyy-MM-dd HH:mm"  id="editEndingDateFC"  class="form-control" />

                            </div>
                        </div>

                        <div class="form-group col-sm-12">
                            <br>
                            <label class=" col-sm-4">Event assigned to:</label>
                            <div class="col-sm-8">
                                <select multiple class="form-control" id="multiselectAssignedToFCedit">
                                    <c:forEach items="${usersExceptCurrent}" var="assignedTo">
                                        <option value="${assignedTo.userID}">${assignedTo.firstName}</option>


                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div class="form-group col-sm-12">


                            <label for="comment">Comment:</label>
                            <textarea class="form-control" rows="3" id="editCommentFC"></textarea>


                        </div>
                        <div class="row"> 
                            <div class=" col-sm-4 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reputance:</span>
                                </label>
                                <input type="checkbox" id="editReputanceFC" onchange="showElement('editReputanceDivFC')" class="checkbox pull-right" value="0" />
                                <div id="editReputanceDivFC" style="display:none">

                                    <input type="checkbox" id="editDailyFC" >Daily<br>
                                    <input type="checkbox" id="editWeeklyFC" >Weekly<br> 
                                    <input type="checkbox" id="editMonthlyFC" >Monthly
                                    <div style="float:right" >
                                        <label for="editexpDate">Reputance Until</label>
                                        <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="editexpDateFC"    class="form-control" />
                                    </div>
                                </div>

                            </div>

                            <div class=" col-sm-5 col-sm-offset-2 "> 
                                <br>

                                <label for="mycheckbox">
                                    <span>Reminder:</span>
                                </label>
                                <input type="checkbox" id="editReminderFC" onchange="showElement('editReminderDivFC')" class="checkbox pull-right" value="0" />
                                <div id="editReminderDivFC" style="display:none">
                                    <label for="">Reminder Date</label>
                                    <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])" placeholder="yyyy-MM-dd" id="editReminderDateFC"    class="form-control" />
                                    <div hidden="true">
                                        <input type="radio" name="editreeminderFC" id="editHourlyFC" onchange="showElement('editHourlyDivFC')" value="hourly" >  hours ago:<br>
                                        <div id="editHourlyDivFC" style="display:none">

                                            <input type='number' class="form-control" id="editHourinputFC" placeholder="Give a number" />


                                        </div>
                                        <input type="radio" name="editreeminderFC" id="edit1RemFC"  value="day1ago">  1 day ago<br> 
                                        <input type="radio" name="editreeminderFC" id="edit2RemFC"  value="day2ago">  2 days ago
                                    </div>
                                </div>
                                <br>
                                <br>
                            </div>
                        </div>

                        <div class="modal-footer">

                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary"  id="editSaveChangesFC" >Save Changes</button>
                        </div>

                    </form>
                </div>

            </div>

        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!--------------------------------------------------------- Modal Delete Event---------------------------------------------->	

<div class="modal fade" id="DeleteEventModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
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
                <button type="button" data-dismiss="modal" id="delete_eventFC"  class="btn btn-default" onclick="deleteEvent(this.value)">Yes</button>
            </div>
        </div>
    </div>
</div>



<!--------------------------------------------------------- Modal Delete Family---------------------------------------------->	