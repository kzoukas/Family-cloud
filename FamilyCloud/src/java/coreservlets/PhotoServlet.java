/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coreservlets;


import dao.impl.MySqlMediaObjectDAO;
import dao.impl.MySqlUserDAO;
import daos.DAOFactory;
import daos.DBOperationException;
import daos.MediaObjectDAO;
import daos.UserDAO;
import db.model.MediaObject;
import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.DataBufferByte;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
//import java.awt.Image;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.UserBO;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.imgscalr.Scalr;


/**
 *
 * @author Vaggos
 */
@WebServlet(name = "PhotoServlet", urlPatterns = {"/PhotoServlet"})
public class PhotoServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);

    }

    @Override

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                
                int userID = Integer.parseInt(request.getParameter("userID"));
               
                
                
                byte[] data =null;
 
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                // Create a factory for disk-based file items
                DiskFileItemFactory factory = new DiskFileItemFactory();
                //connection and create DAO 
                
            
                // Configure a repository (to ensure a secure temp location is used)
                ServletContext servletContext = this.getServletConfig().getServletContext();
                File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
                factory.setRepository(repository);

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
//                    BufferedImage newImage=createImageFromBytes(data);
//                    //createResizedCopy(newImage, 100, 100, null);
//                    BufferedImage scaledImage = Scalr.resize(newImage, 220);
//                    //BufferedImage scaledImage =Scalr.resize(newImage, Scalr.Method.SPEED, Scalr.Mode.FIT_TO_WIDTH,200, 100, Scalr.OP_ANTIALIAS);
//                    ByteArrayOutputStream baos = new ByteArrayOutputStream();
//                    ImageIO.write(scaledImage, "jpg", baos);
//                    byte[] bytes = baos.toByteArray();
                    //byte[] imagee =  scaledImage.getRaster().getDataBuffer();
                  //data.getScaledInstance(20, 20, Image.SCALE_DEFAULT);
                  DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
                  MediaObjectDAO imageDAO = mySqlFactory.getMediaObjectDAO();
                  boolean result =imageDAO.insertMediaObject( data, userID);
                  if(result){
                        request.setAttribute("messageMyPhoto", "<img src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The photo has been updated successfully");
                  }
                  
                  MediaObjectDAO newimage = mySqlFactory.getMediaObjectDAO();
                  MediaObject image = newimage.getImageBasedOnID(userID);
                  
                  
                  if(result){
                      
                      System.out.println("mpike");
                      
                  }else{
                      System.out.println("den mpike");
                  }
                  
                    RequestDispatcher requestDispatcher; 
                    requestDispatcher = request.getRequestDispatcher("afterLoginPage.jsp");
                    requestDispatcher.forward(request, response);
                  
                }catch(FileUploadException e){
                
                } catch (DBOperationException ex) {
            Logger.getLogger(PhotoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
                 
                 //Process the uploaded items
         }
    
    BufferedImage createResizedCopy(Image originalImage, 
    		int scaledWidth, int scaledHeight, 
    		boolean preserveAlpha)
    {
    	System.out.println("resizing...");
    	int imageType = preserveAlpha ? BufferedImage.TYPE_INT_RGB : BufferedImage.TYPE_INT_ARGB;
    	BufferedImage scaledBI = new BufferedImage(scaledWidth, scaledHeight, imageType);
    	Graphics2D g = scaledBI.createGraphics();
    	if (preserveAlpha) {
    		g.setComposite(AlphaComposite.Src);
    	}
    	g.drawImage(originalImage, 0, 0, scaledWidth, scaledHeight, null); 
    	g.dispose();
    	return scaledBI;
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
