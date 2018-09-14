package dao.impl;

import daos.DBOperationException;
import daos.UserDAO;
import db.model.User;
import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import models.UserBO;

public class MySqlUserDAO implements UserDAO {

    public boolean insertUser(User user) {

        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            PreparedStatement pst2 = null;
            byte[] imageBytes = null;
            Connection conn2 = MySqlDAOFactory.createConnection();
            pst2 = conn2.prepareStatement("SELECT * FROM default_image");

            ResultSet rs = pst2.executeQuery();
            while (rs.next()) {
                Blob imageBlob = rs.getBlob("image");
                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                String b = "sad";

            }
            conn2.close();

            pst = conn.prepareStatement("SELECT MAX(userID) AS maxID FROM user;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {

                user.setUserID(rs1.getInt("maxID") + 1);

            }

            pst = conn.prepareStatement("INSERT INTO user(firstName, lastName, email, password, birthDate, sex , familyName, director, userID, relation, image) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

            pst.setString(1, user.getFirstName());
            pst.setString(2, user.getLastName());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getPassword());
            //pst.setString(5, user.getBirthDate());
            
            pst.setDate(5,new java.sql.Date(user.getBirthDate().getTime()));
            pst.setString(6, user.getSex());
            pst.setString(7, user.getFamilyName());
            pst.setInt(8, user.getDirector());
            pst.setInt(9, user.getUserID());
            pst.setString(10, user.getRelation());
            pst.setBinaryStream(11, new ByteArrayInputStream(imageBytes), imageBytes.length);

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

    public boolean insertActiveToNotification(int current_userID, int newMemberID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        //DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Date date = new Date();

        try {

            pst = conn.prepareStatement("INSERT INTO notifications(usernameA, usernameB, notification_type, date_created, referredID, isreadA , isreadB) "
                    + "VALUES(?, ?, ?, ?, ?, ?, ?)");

            pst.setInt(1, current_userID);
            pst.setInt(2, newMemberID);
            pst.setString(3, "add_active");
            java.sql.Timestamp timestamp = new java.sql.Timestamp(date.getTime());
            pst.setTimestamp(4, timestamp);
            pst.setInt(5, 0);
            pst.setString(6, "N");
            pst.setString(7, "N");

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

    public User getUser(String email) throws DBOperationException {

        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE email = ?");
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public User getUserNoFamily(String email) throws DBOperationException {

        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE email = ? AND director='0'");
            pst.setString(1, email);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public User getUserBasedOnID(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        byte[] imageBytes = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID = ?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));
//                Blob imageBlob = rs.getBlob("image");
//                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
//                user.setImage(imageBytes);

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public User getUserImageBasedOnID(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        byte[] imageBytes = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID = ?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));
                Blob imageBlob = rs.getBlob("image");
                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                user.setImage(imageBytes);

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public User getUserBasedOnIDforEdit(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        byte[] imageBytes = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID = ?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public User getDirectorBasedOnFamily(String familyName) throws DBOperationException {

        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();

        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE director=userID AND familyName= ?");
            pst.setString(1, familyName);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

            }

        } catch (SQLException ex) {
            user = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return user;
    }

    public boolean deleteUser(int userID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {

            pst = conn.prepareStatement("DELETE FROM user "
                    
                    + " WHERE userID = ?");

            pst.setInt(1, userID);
            

            

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

    public boolean deleteFamily(int director, int userID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM user WHERE director = ? AND userID != ?");
            pst.setInt(1, director);
            pst.setInt(2, userID);

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

    public boolean updateFamilyNameAfterDeleteFamily(int userID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {

            pst = conn.prepareStatement("UPDATE user "
                    + "SET familyName = ?"
                    + ",director = ?"
                    + " WHERE userID = ?");

            pst.setString(1, null);
            pst.setInt(2, 0);

            pst.setInt(3, userID);

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

    public boolean updateUser(User newUser, String email) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            User previousUser = this.getUser(email);

            previousUser.updateUserInfo(newUser);

            pst = conn.prepareStatement("UPDATE user "
                    + "SET familyName = ?"
                    + ",director = ?"
                    + " WHERE email = ?");

            pst.setString(1, previousUser.getFamilyName());
            pst.setInt(2, previousUser.getDirector());
            pst.setString(3, email);

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

    public boolean updateUserEdit(User newUser, int userID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            User previousUser = this.getUserBasedOnID(userID);

            previousUser.updateUserInfo(newUser);

            pst = conn.prepareStatement("UPDATE user "
                    + "SET firstName = ?"
                    + ",lastName = ?"
                    + ",email = ?"
                    + ",birthDate = ?"
                    + ",relation = ?"
                    + ",password = ?"
                    + ",sex = ?"
                    + " WHERE userID = ?");

            pst.setString(1, previousUser.getFirstName());
            pst.setString(2, previousUser.getLastName());
            pst.setString(3, previousUser.getEmail());
            //pst.setString(4, previousUser.getBirthDate());
//            java.sql.Timestamp timestamps = new java.sql.Timestamp(previousUser.getBirthDate().getTime());
//            pst.setTimestamp(4, timestamps);
            pst.setDate(4, new java.sql.Date(previousUser.getBirthDate().getTime()));
            pst.setString(5, previousUser.getRelation());
            pst.setString(6, previousUser.getPassword());
            pst.setString(7, previousUser.getSex());
            pst.setInt(8, userID);

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

    public boolean insertInactiveUser(User user) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            pst = conn.prepareStatement("INSERT INTO inactive_users(director, firstName, lastName, relation, familyName, image) VALUES(?, ?, ?, ?, ?, ?)");

            pst.setInt(1, user.getDirector());
            pst.setString(2, user.getFirstName());
            pst.setString(3, user.getLastName());
            pst.setString(4, user.getRelation());
            pst.setString(5, user.getFamilyName());
            pst.setBinaryStream(6, new ByteArrayInputStream(user.getImage()), user.getImage().length);
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

    public List<UserBO> getListUser(String familyName) throws DBOperationException {

        PreparedStatement pst = null;

        Connection conn = MySqlDAOFactory.createConnection();
        List<UserBO> allmembers = new ArrayList<UserBO>();
        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID!=director AND familyName = ?");
            pst.setString(1, familyName);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

                UserBO takis = new UserBO();

                allmembers.add(takis.toUserBO(user));

            }

        } catch (SQLException ex) {
            user = null;
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

    public List<UserBO> getListUserWithDirector(String familyName) throws DBOperationException {

        PreparedStatement pst = null;

        Connection conn = MySqlDAOFactory.createConnection();
        List<UserBO> allmembers = new ArrayList<UserBO>();
        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE familyName = ?");
            pst.setString(1, familyName);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

                UserBO takis = new UserBO();

                allmembers.add(takis.toUserBO(user));

            }

        } catch (SQLException ex) {
            user = null;
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

    public List<UserBO> getListActiveUsersExceptCurrent(String familyName, int currentUserID) throws DBOperationException {
        PreparedStatement pst = null;

        Connection conn = MySqlDAOFactory.createConnection();
        List<UserBO> activeFamilyMembers = new ArrayList<UserBO>();
        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID != ? AND familyName = ? AND email != '-' ");
            pst.setInt(1, currentUserID);
            pst.setString(2, familyName);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

                UserBO takis = new UserBO();

                activeFamilyMembers.add(takis.toUserBO(user));

            }

        } catch (SQLException ex) {
            activeFamilyMembers = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
        return activeFamilyMembers;
    }

    public List<UserBO> getListExceptCurrent(String familyName, int currentUserID) throws DBOperationException {
        PreparedStatement pst = null;

        Connection conn = MySqlDAOFactory.createConnection();
        List<UserBO> activeFamilyMembers = new ArrayList<UserBO>();
        User user = new User();

        try {
            pst = conn.prepareStatement("SELECT * FROM user WHERE userID != ? AND familyName = ? ");
            pst.setInt(1, currentUserID);
            pst.setString(2, familyName);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setFirstName(rs.getString("firstName"));
                user.setLastName(rs.getString("lastName"));
                user.setBirthDate(rs.getDate("birthDate"));
                user.setSex(rs.getString("sex"));
                user.setFamilyName(rs.getString("familyName"));
                user.setDirector(rs.getInt("director"));
                user.setUserID(rs.getInt("userID"));
                user.setRelation(rs.getString("relation"));

                UserBO takis = new UserBO();

                activeFamilyMembers.add(takis.toUserBO(user));

            }

        } catch (SQLException ex) {
            activeFamilyMembers = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
        return activeFamilyMembers;
    }

}
