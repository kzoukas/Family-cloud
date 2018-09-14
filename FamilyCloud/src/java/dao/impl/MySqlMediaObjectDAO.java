/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao.impl;

import daos.DBOperationException;
import daos.MediaObjectDAO;
import db.model.MediaObject;
import db.model.User;
import java.io.ByteArrayInputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Vaggos
 */
public class MySqlMediaObjectDAO implements MediaObjectDAO {

    
    public boolean insertMediaObject(byte[] image, int userID) {
        
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            

            pst = conn.prepareStatement("UPDATE user "
                    + "SET image = ?"
                    + " WHERE userID = ?");

            
            pst.setBinaryStream(1,new ByteArrayInputStream(image),image.length);
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
    
    
    public MediaObject getImageBasedOnID(int userID) throws DBOperationException {

        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        byte[] imageBytes = null;
        MediaObject obj = new MediaObject();

        try {
            pst = conn.prepareStatement("SELECT image FROM user WHERE userID = ?");
            pst.setInt(1, userID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                Blob imageBlob = rs.getBlob("image");
                imageBytes = imageBlob.getBytes(1, (int) imageBlob.length());
                obj.setImage(imageBytes);
            }

        } catch (SQLException ex) {
            
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return obj;
    }
    
    
}
