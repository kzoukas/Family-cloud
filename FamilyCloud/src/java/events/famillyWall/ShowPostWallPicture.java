

package events.famillyWall;


import daos.DAOFactory;
import daos.DBOperationException;
import daos.PostWallDAO;
import db.model.PostWall;
import events.EventHandlerBase;
import java.io.IOException;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



public class ShowPostWallPicture extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
            try{
        
            
           int postID = Integer.parseInt(request.getParameter("postID"));
            
            
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            PostWallDAO postDAO = mySqlFactory.getPostWallDAO();
            PostWall post = postDAO.getPostBasedOnPostID(postID);
         
            response.setContentType("image/jpeg");
            response.setContentLength(post.getPostImage().length);
            response.getOutputStream().write(post.getPostImage());
            setURL(null);
             
             
             
             
            } catch (DBOperationException ex) {
            
                    Logger.getLogger(ShowPostWallPicture.class.getName()).log(Level.SEVERE, null, ex);
            }
     
     }
}
