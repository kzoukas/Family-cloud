/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.MediaObject;

/**
 *
 * @author Vaggos
 */
public interface MediaObjectDAO {
    public boolean insertMediaObject(byte[] image,int userID);
    public MediaObject getImageBasedOnID(int userID)throws DBOperationException;
}
