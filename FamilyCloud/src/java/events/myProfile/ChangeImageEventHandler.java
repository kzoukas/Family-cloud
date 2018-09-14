

package events.myProfile;

import daos.DAOFactory;
import daos.MediaObjectDAO;
import daos.PostWallDAO;
import daos.UserDAO;
import db.model.MediaObject;
import db.model.PostWall;
import db.model.User;
import events.EventHandlerBase;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MediaObjectBO;
import models.PostWallBO;
import models.UserBO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;




public class ChangeImageEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
            
            
            int userID = Integer.parseInt(request.getParameter("userID"));
              String text=null;
              byte[] data =null;
 
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();
                
                
                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                // Parse the request
                try{
                     List<FileItem> items = upload.parseRequest(request);
                     Iterator<FileItem> iter = items.iterator();
                    while (iter.hasNext()) {
                    FileItem item = iter.next();
                    data = item.get();
                    
                   }
                    
                   
                }catch(FileUploadException e){
                
                }
            MediaObjectBO mediaObjectBO= new MediaObjectBO();
                  mediaObjectBO.setImage(data);
                  
                  MediaObject mediaObject= new MediaObject();
                  mediaObject.setImage(mediaObjectBO.getImage());
                    
                  DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
                  MediaObjectDAO imageDAO = mySqlFactory.getMediaObjectDAO();
                  boolean result =imageDAO.insertMediaObject( mediaObject.getImage(), userID);
                  
                   

            setURL("Controller?newproperties=MYPROFILE");
            
        
            
            
        }
    
     }
     

