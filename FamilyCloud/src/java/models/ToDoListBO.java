/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import db.model.ToDoList;
import db.model.User;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Desktop
 */
public class ToDoListBO {
    
    private int taskID;
    private int director;
    private String task;
    private String assignedTo;
    private int createdBy;
    private String createdByToString;
    private Date dueDate;
    private String completedDate;
    private String status;
    String dateToShow;

    
    
    
    
       public ToDoListBO() {
        
        taskID = 0;
        director=0;
        task = null;
        assignedTo = null;
        createdBy = 0 ;
        dueDate = null;
        completedDate = null;
        status=null;
        createdByToString=null;
        dateToShow = null;
       }
    
    
    /**
     * @return the taskID
     */
    public int getTaskID() {
        return taskID;
    }

    
    public String getDateToShow() {
        return dateToShow;
    }

    
    public void setDateToShow(String dateToShow) {    
        this.dateToShow = dateToShow;
    }

    public void setTaskID(int taskID) {
        this.taskID = taskID;
    }

    public String getCreatedByToString() {
        return createdByToString;
    }

    public void setCreatedByToString(String createdByToString) {
        this.createdByToString = createdByToString;
    }

    
    /**
     * @return the task
     */
    public String getTask() {
        return task;
    }

    /**
     * @param task the task to set
     */
    public void setTask(String task) {
        this.task = task;
    }

    /**
     * @return the assignedTo
     */
    public String getAssignedTo() {
        return assignedTo;
    }

    /**
     * @param assignedTo the assignedTo to set
     */
    public void setAssignedTo(String assignedTo) {
        this.assignedTo = assignedTo;
    }

    /**
     * @return the createdBy
     */
    public int getCreatedBy() {
        return createdBy;
    }

    /**
     * @param createdBy the createdBy to set
     */
    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getDueDate() {
        return dueDate;
    }

    public void setDueDate(Date dueDate) {
        this.dueDate = dueDate;
    }

    public String getCompletedDate() {
        return completedDate;
    }

    public void setCompletedDate(String completedDate) {
        this.completedDate = completedDate;
    }

    

    /**
     * @return the dueDate
     */
  

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the director
     */
    public int getDirector() {
        return director;
    }

    /**
     * @param director the director to set
     */
    public void setDirector(int director) {
        this.director = director;
    }

    
    
    public ToDoListBO toToDoListBO(ToDoList list) {

        ToDoListBO toDoListBO = new ToDoListBO();

        toDoListBO.setTaskID(list.getTaskID());
        toDoListBO.setDirector(list.getDirector());
        toDoListBO.setTask(list.getTask());
        toDoListBO.setAssignedTo(list.getAssignedTo());
        toDoListBO.setCreatedByToString(list.getCreatedByToString());
        toDoListBO.setCreatedBy(list.getCreatedBy());
        toDoListBO.setDueDate(list.getDueDate());
        toDoListBO.setCompletedDate(list.getCompletedDate());
        toDoListBO.setStatus(list.getStatus());
         DateFormat formatDT = new SimpleDateFormat("yyyy-MM-dd");
        
        toDoListBO.setDateToShow(formatDT.format(list.getDueDate()));
        
       
        
        
        

        return toDoListBO;
    }
}
