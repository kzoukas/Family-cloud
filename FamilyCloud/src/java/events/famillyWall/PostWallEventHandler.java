package events.famillyWall;

import daos.DAOFactory;
import daos.PostWallDAO;
import db.model.PostWall;
import events.EventHandlerBase;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Date;

import java.util.Iterator;
import java.util.List;
import javax.imageio.ImageIO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.PostWallBO;
import models.UserBO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;

public class PostWallEventHandler extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String text = null;
        byte[] data = null;
        byte[] bytes = null;

        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Parse the request
        try {
            List<FileItem> items = upload.parseRequest(request);
            Iterator<FileItem> iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = iter.next();
                if (item.getContentType() == null) {
                    text = item.getString();
                } else {
                    bytes = item.get();
//                    if(bytes.length!=0){
//                    BufferedImage newImage = createImageFromBytes(bytes);
//
//                    BufferedImage scaledImage = Scalr.resize(newImage, 220);
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    ImageIO.write(scaledImage, "jpg", baos);
//                    data = baos.toByteArray();
//                    }else{
//                        data=bytes;
//                    }

                }
            }

        } catch (FileUploadException e) {

        }

        UserBO current_user = (UserBO) mySession.getAttribute("myUser");

        Date date = new Date();
        int createdBy = current_user.getUserID();
        int director = current_user.getDirector();

        PostWallBO postBO = new PostWallBO();
        postBO.setText(text);
        postBO.setPostImage(bytes);
        postBO.setCreatedBy(createdBy);
        postBO.setDirector(director);
        postBO.setDatetime(date);

        PostWall post = new PostWall();
        post.setText(postBO.getText());
        post.setPostImage(postBO.getPostImage());
        post.setCreatedBy(postBO.getCreatedBy());
        post.setDirector(postBO.getDirector());
        post.setDatetime(postBO.getDatetime());

        DAOFactory mySqlFactorys = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        PostWallDAO newPostDAO = mySqlFactorys.getPostWallDAO();
        boolean result = newPostDAO.insertPost(post);

            
        setURL("Controller?newproperties=FAMILLYWALL");

    }

    private BufferedImage createImageFromBytes(byte[] imageData) {
        ByteArrayInputStream bais = new ByteArrayInputStream(imageData);
        try {
            return ImageIO.read(bais);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
