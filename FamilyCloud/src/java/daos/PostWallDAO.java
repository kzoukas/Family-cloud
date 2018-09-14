/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.PostWall;
import java.util.List;
import models.PostWallBO;


/**
 *
 * @author Vaggos
 */
public interface PostWallDAO {
    
    public boolean insertPost(PostWall post);
    public List<PostWallBO> getListPostWall(int director ) throws DBOperationException ;
    public PostWall getPostBasedOnPostID(int director) throws DBOperationException;
    public boolean deletePost(int postID);
   
}
