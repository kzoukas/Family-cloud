package dao.impl;


import daos.DBOperationException;
import daos.PostWallDAO;
import db.model.PostWall;
import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.PostWallBO;


/**
 *
 * @author Vaggos
 */
public class MySqlPostWallDAO implements PostWallDAO {

    
    @Override
    public boolean insertPost(PostWall post) {
        
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            pst=conn.prepareStatement("SELECT MAX(postID) AS maxID FROM wall_post;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {
               
                post.setPostID(rs1.getInt("maxID")+1);

            }
            
            
            
            pst = conn.prepareStatement("INSERT INTO wall_post(postID, createdBy, text, postImage, director, datetime)"
                    + " VALUES(?, ?, ?, ?, ? ,?)");

            pst.setInt   (1, post.getPostID());
            pst.setInt   (2, post.getCreatedBy());
            pst.setString(3, post.getText());
            pst.setBinaryStream(4,new ByteArrayInputStream(post.getPostImage()),post.getPostImage().length);
            pst.setInt   (5, post.getDirector());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(post.getDatetime().getTime());
            pst.setTimestamp(6, timestamp);
             
             
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

    @Override
    public List<PostWallBO> getListPostWall(int director) throws DBOperationException {
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        List<PostWallBO> allPosts= new ArrayList<PostWallBO>();
        PostWall wall = new PostWall();

        try {
            pst = conn.prepareStatement("SELECT * FROM wall_post WHERE director= ? ");
            pst.setInt(1, director);

           
            

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                wall.setCreatedBy(rs.getInt("CreatedBy"));
                wall.setPostID(rs.getInt("postID"));
                wall.setText(rs.getString("text"));
                wall.setDirector(rs.getInt("director"));
                Blob imageBlob = (rs.getBlob("postImage"));
                wall.setDatetime(rs.getTimestamp("datetime"));
                
                byte[] imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                
                if(imageBytes.length==0){
                     wall.setPostImage(null);
                }else{
                    wall.setPostImage(imageBytes);
                }
               
                

            
                PostWallBO takis = new PostWallBO();
               
                allPosts.add(takis.toPostWallBO(wall));
                
                
            }
                
        } catch (SQLException ex) {
            wall = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return allPosts;
    }
    
    
        public PostWall getPostBasedOnPostID(int postID) throws DBOperationException {

        PreparedStatement pst = null;
        byte[] imageBytes = null;
        Connection conn = MySqlDAOFactory.createConnection();

        PostWall post = new PostWall();

        try {
            pst = conn.prepareStatement("SELECT * FROM wall_post WHERE postID = ?");
            pst.setInt(1, postID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                post.setPostID(rs.getInt("postID"));
                post.setCreatedBy(rs.getInt("createdBy"));
                post.setText(rs.getString("text"));
                post.setDirector(rs.getInt("director"));
               
                
                Blob imageBlob = rs.getBlob("postImage");
                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                post.setPostImage(imageBytes);

            }

        } catch (SQLException ex) {
            post = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return post;
    }
        
        public boolean deletePost(int postID){
         PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            pst = conn.prepareStatement("DELETE FROM wall_post WHERE postID = ?");
            pst.setInt(1, postID);

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
    

}
    
    
    
    
    
    

