package events.messages;


import dao.impl.MySqlMessagesDAO;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.MessagesDAO;
import db.model.Messages;
import events.EventHandlerBase;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.MessagesBO;
import models.UserBO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;







public class PostMessageEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) throws IOException {
        
            
                try{
                    
                    
                    String text=null;
                    byte[] data =null;
                    byte[] bytes =null;
                    
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
                            if(item.getContentType()==null)
                            {
                                text = item.getString();
                            }
                            else{
                                bytes = item.get();
//                                if(bytes.length!=0){
//                                BufferedImage newImage = createImageFromBytes(bytes);
//
//                                BufferedImage scaledImage = Scalr.resize(newImage,100);
//                                ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                                ImageIO.write(scaledImage, "jpg", baos);
//                                data = baos.toByteArray();
//                                }else{
//                                    data=bytes;
//                                }
                            }
                        }
                        
                        
                    }catch(FileUploadException e){
                        
                    }
                     
                    UserBO current_user = (UserBO) mySession.getAttribute("myUser");
                    int receiverID  = Integer.parseInt(request.getParameter("receiverID"));
                    int senderID = current_user.getUserID();
                    
                    
                    MessagesBO messageBO= new MessagesBO();
                    messageBO.setText(text);
                    messageBO.setMessageImage(bytes);
                    messageBO.setSenderID(senderID);
                    messageBO.setReceiverID(receiverID);
                    
                    
                    Messages message= new Messages();
                    message.setText(messageBO.getText());
                    message.setMessageImage(messageBO.getMessageImage());
                    message.setSenderID(messageBO.getSenderID());
                    message.setReceiverID(messageBO.getReceiverID());
                    
                    DAOFactory mySqlFactorys = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
                    MessagesDAO newPostDAO = mySqlFactorys.getMessagesDAO();
                    boolean result = newPostDAO.insertMessage(message);
                    
                    MySqlMessagesDAO messages =new MySqlMessagesDAO();
                    List<MessagesBO> message_posts = messages.getListMessageBasedOnSenderReceiver(current_user.getUserID(),receiverID);
                    mySession.setAttribute("message_posts", message_posts);
                    
                    setURL("messages.jsp");  
                    
                    
                    
                    
                }catch(DBOperationException ex){
             Logger.getLogger(PostMessageEventHandler.class.getName()).log(Level.SEVERE, null, ex);
                
                }
            
        
            
            
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
     

