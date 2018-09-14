/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db.model;

import java.util.Date;

/**
 *
 * @author Desktop
 */
public class ToDoList {
    
    private int taskID;
    private int director;
    private String task;
    private String assignedTo;
    private int createdBy;
    private String createdByToString;
    private Date dueDate;
    private String completedDate;
    private String status;
    

    
    
    
    
       public ToDoList() {
        
        taskID = 0;
        director=0;
        task = null;
        assignedTo = null;
        createdBy = 0;
        dueDate = null;
        completedDate = null;
        status=null;
        createdByToString=null;
       }
    
    
    /**
     * @return the taskID
     */
    public int getTaskID() {
        return taskID;
    }

    /**
     * @param taskID the taskID to set
     */
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

    
    
    public void updateToDoListInfo(ToDoList other) {
        if (other != null) {
            if (other.getTaskID() != 0) {
                taskID = other.getTaskID();
            }
             if (other.getDirector() != 0) {
                taskID = other.getDirector();
            }
            if (other.getTask() != null) {
                task = other.getTask();
            }
            if (other.getAssignedTo()!= null) {
                assignedTo = other.getAssignedTo();
            }
            
            if (other.getCreatedBy()!= 0) {
                createdBy = other.getCreatedBy();
            }
            
            if (other.getDueDate()!= null) {
                dueDate = other.getDueDate();
            }
             if (other.getCompletedDate()!= null) {
                completedDate = other.getCompletedDate();
            }
              if (other.getStatus()!= null) {
                status = other.getStatus();
            }
              
              
           
           
        }
    }

   
    
    

}


 