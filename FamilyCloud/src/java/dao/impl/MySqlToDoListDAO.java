package dao.impl;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.ToDoListDAO;
import daos.UserDAO;
import db.model.ToDoList;
import db.model.User;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import models.ToDoListBO;
import models.UserBO;

public class MySqlToDoListDAO implements ToDoListDAO {

    public boolean insertToDoList(ToDoList list) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        

        try {
            pst=conn.prepareStatement("SELECT MAX(taskID) AS maxID FROM to_do_list;");
            ResultSet rs1 = pst.executeQuery();
            
            while (rs1.next()) {
               
                list.setTaskID(rs1.getInt("maxID")+1);

            }
            
            pst = conn.prepareStatement("INSERT INTO to_do_list(taskID, director, task, assignedTo, createdBy, dueDate, completedDate, status) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
            
            pst.setInt(1, list.getTaskID());
            pst.setInt(2, list.getDirector());
            pst.setString(3, list.getTask());
            pst.setString(4, list.getAssignedTo());
            pst.setInt(5, list.getCreatedBy());
            java.sql.Timestamp timestamps = new java.sql.Timestamp(list.getDueDate().getTime());
            pst.setTimestamp(6, timestamps);
            pst.setString(7, list.getCompletedDate());
            pst.setString(8, list.getStatus());
            
            

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }


    
    public ToDoList getToDoListBasedOnID(int taskID) throws DBOperationException {

        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();

        ToDoList list = new ToDoList();

        try {
            pst = conn.prepareStatement("SELECT * FROM to_do_list WHERE taskID = ?");
            pst.setInt(1, taskID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                list.setTaskID(rs.getInt("taskID"));
                list.setDirector(rs.getInt("director"));
                list.setTask(rs.getString("task"));
                list.setAssignedTo(rs.getString("assignedTo"));
                list.setCreatedBy(rs.getInt("createdBy"));
                list.setDueDate(rs.getTimestamp("dueDate"));
                list.setCompletedDate(rs.getString("completedDate"));
                list.setStatus(rs.getString("status"));
               
                

            }

        } catch (SQLException ex) {
            list = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return list;
    }

    public boolean deleteList(int taskID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            pst = conn.prepareStatement("DELETE FROM to_do_list WHERE taskID = ?");
            pst.setInt(1, taskID);

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }


    public boolean updateToDoListEdit(ToDoList newList, int taskID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            ToDoList previousUser = this.getToDoListBasedOnID(taskID);

            previousUser.updateToDoListInfo(newList);

            pst = conn.prepareStatement("UPDATE to_do_list "
                    
                    + "SET task = ?"
                    + ",director = ?"
                    + ",assignedTo = ?"
                    + ",createdBy = ?"
                    + ",dueDate = ?"
                    + ",completedDate = ?"
                    + ",status = ?"
                    + " WHERE taskID = ?");
            
            
            pst.setString(1, previousUser.getTask());
            pst.setInt(2, previousUser.getDirector());
            pst.setString(3, previousUser.getAssignedTo());
            pst.setInt(4, previousUser.getCreatedBy());
            java.sql.Timestamp timestamps = new java.sql.Timestamp(previousUser.getDueDate().getTime());
            pst.setTimestamp(5, timestamps);
            pst.setString(6, previousUser.getCompletedDate());
            pst.setString(7, previousUser.getStatus());
            pst.setInt(8, taskID);
            

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
    


    public List<ToDoListBO> getListToDoList(int director) throws DBOperationException {
       
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        List<ToDoListBO> allmembers= new ArrayList<ToDoListBO>();
        ToDoList list = new ToDoList();

        try {
            pst = conn.prepareStatement("SELECT * FROM to_do_list WHERE director = ?");
            pst.setInt(1, director);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                list.setTaskID(rs.getInt("taskID"));
                list.setDirector(rs.getInt("director"));
                list.setTask(rs.getString("task"));
                list.setAssignedTo(rs.getString("assignedTo"));
                list.setCreatedBy(rs.getInt("createdBy"));
                list.setDueDate(rs.getTimestamp("dueDate"));
                list.setCompletedDate(rs.getString("completedDate"));
                list.setStatus(rs.getString("status"));
               
               DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
               UserDAO myUserDAO = mySqlFactory.getUserDAO();
               User myUser = myUserDAO.getUserBasedOnID(list.getCreatedBy());
               list.setCreatedByToString(myUser.getFirstName());
               
                if(list.getAssignedTo().equals("0")){
                         list.setAssignedTo("-");
                }else{
                    String assigner="";
                    String split_assigns= list.getAssignedTo();
                    List<String> split_assigns_List = Arrays.asList(split_assigns.split("\\s*,\\s*"));

                    for(int i=0;i<split_assigns_List.size();i++){

                        int assigned = Integer.parseInt(split_assigns_List.get(i));
                        User myUser2 = myUserDAO.getUserBasedOnID(assigned);
                        assigner=myUser2.getFirstName()+" "+assigner;
                     } 
               
                    list.setAssignedTo(assigner);
                }
               
               
                

            
                ToDoListBO takis = new ToDoListBO();
               
                allmembers.add(takis.toToDoListBO(list));
                
                
            }
                
        } catch (SQLException ex) {
            list = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return allmembers;
    }

}
