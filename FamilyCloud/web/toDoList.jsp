<%-- 
    Document   : toDoList
    Created on : May 28, 2015, 5:58:15 PM
    Author     : Vaggos
--%>

<%@page import="models.UserBO"%>
<%@page import="models.ToDoListBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>



<div class="col-sm-12 contentPage" id="newPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>To Do list</h3>
    </div>


    <button type="button" class="btn btn-primary" id="addtaskbutton" data-toggle="modal" data-target="#myModal" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Add Task</button> 

    <p style="color: green">${messageToDo}<br><br></p>
    <div class="datagrid"><table>
            <thead><tr><th>Task</th><th>Assigned To</th><th>Created by</th><th>Due Date</th><th>Completed Date</th><th>Status</th><th></th><th></th></tr></thead>
            
            <tbody>
                
                <c:choose>
                    <c:when test="${listaToDo.size()==0}">
                        <tr><td>
                    <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 20px;">You have no task to the list!</h4><br>
                    <h4 style="font-size: 18px; color: #574429; margin-left: 20px; margin-top: 10px;">Create a task</h4>
                            </td></tr>
                </c:when>
                
                <c:otherwise>
                    <tfoot><tr><td colspan="4"><div id="paging"><ul><li><a href="#"><span>Previous</span></a></li><li><a href="#" class="active"><span>1</span></a></li><li><a href="#"><span>2</span></a></li><li><a href="#"><span>3</span></a></li><li><a href="#"><span>4</span></a></li><li><a href="#"><span>5</span></a></li><li><a href="#"><span>Next</span></a></li></ul></div></tr></tfoot>
                    <c:forEach items="${listaToDo}" var="family_member">
                        <tr >
                            <td>${family_member.task}</td>
                            <td>${family_member.assignedTo}</td>
                            <td>${family_member.createdByToString}</td>
                            <td>${family_member.dateToShow}</td>
                            <td>${family_member.completedDate}</td>
                            <td>${family_member.status}</td>
                            <c:choose>
                                <c:when test="${(myUser.userID == myUser.director)||(family_member.createdBy == myUser.userID)}">
                                    <td><button  style="  background: transparent; border: none !important;" data-toggle="modal" data-target="#editModal" value="${family_member.taskID}" onclick="editTodoList(this.value)"><span class="glyphicon glyphicon-pencil"></span> Edit</button></td>
                                    <td><button  style="  background: transparent; border: none !important;" data-toggle="modal" data-target="#deleteModal" value="${family_member.taskID}" onclick="deleteTodoList(this.value)"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span> Delete</button></td>

                                </c:when>
                                <c:otherwise>
                                    <td></td>
                                    <td></td>
                                </c:otherwise>
                            </c:choose>
                        </tr >
                    </c:forEach>
                </c:otherwise>
            </c:choose>
                </tbody>
            </table>
        </div>


    </div>				



    <!------------------------ Modal Add Task---------------------------------------------->

    <div class="modal fade" id="myModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Add a task</h4>
                </div>
                <div class="modal-body">



                    <form class="form-horizontal" role="form" id="addtodo" onsubmit="addToDoList(); return false;">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="task">Task:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="task"  required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Assigned to:</label>
                            <div class="col-sm-10">


                                <select multiple class="form-control" id="multiselectAssignedTo">
                                    <c:forEach items="${myInactiveUser}" var="assignedTo">
                                        <option value="${assignedTo.userID}">${assignedTo.firstName}</option>


                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-10 col-sm-offset-2">


                            <h6> (Hold down the Ctrl (windows) / Command (Mac) button to select multiple options)</h6>
                            <br>
                        </div>
                        <div class="form-group">


                            <label class="control-label col-sm-2" for="dueDate">Due Date:</label>
                            <div class="col-sm-10">
                                <input type="date" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"  placeholder="yyyy-MM-dd" class="form-control" id="dueDate" required>
                            </div>

                        </div>

                
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary" >Add task</button>
                </div>
                </form>
              </div>
            </div>
        </div>
        </div>
   
    <!------------------------ end---------------------------------------------->


    <!------------------------ Modal Edit Task---------------------------------------------->

    <div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">Edit a task</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" role="form" id="edittodo">
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="task">Task:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="editTask" placeholder=""  required>

                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" >Assigned to:</label>
                            <div class="col-sm-10">
                                <select multiple class="form-control"  id="multiselectAssignedToEdit">

                                    <c:forEach items="${myInactiveUser}" var="assignedTo">
                                        <option value="${assignedTo.userID}">${assignedTo.firstName}</option>


                                    </c:forEach>   


                                </select>
                            </div>
                        </div>
                        <div class="col-sm-10 col-sm-offset-2">


                            <h6> (Hold down the Ctrl (windows) / Command (Mac) button to select multiple options)</h6>
                            <br>
                        </div>
                        <div class="form-group">


                            <label class="control-label col-sm-2" >Due Date:</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control" id="editDueDate" required>


                            </div>

                            <div class="col-sm-10 col-sm-offset-2">
                                <form role="form">

                                    <br>
                                    <label class="radio-inline">
                                        <input type="radio" name="editStatus" value="completed" id="editcompleted"  required>Completed
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="editStatus" value="incompleted" id="editincompleted"  required>Incompleted

                                    </label>
                                    <br>

                                </form>
                            </div>
                        </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="taskIDbutton" onclick="editTodoListSaveChanges(this.value)" >Save Changes</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!------------------------ end---------------------------------------------->



<!------------------------ Modal Delete Task---------------------------------------------->

<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Delete task</h4>
            </div>
            <div class="modal-body">


                <h5>Are you sure you want to delete this task? </h5>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <a href="file:///C:/Users/Desktop/Desktop/site1/todolist.html">
                    <button type="button" data-dismiss="modal"  id="delete_todo" onclick="deletetodo(this.value)" class="btn btn-default">Yes</button>
                </a>
            </div>
        </div>
    </div>
</div>
<!------------------------ end Modal Logout---------------------------------------------->

