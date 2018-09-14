/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import db.model.PostWall;
import java.util.Date;

/**
 *
 * @author Desktop
 */
public class PostWallBO {
    
    private String text;
    private byte[] postImage;
    int createdBy;
    int postID;
    int director;
    Date datetime;
    
      public PostWallBO(){
        
        text=null;
        postImage=null;
        datetime=null;
        postID=0;
        createdBy=0;
        director=0;
    }
    
    public PostWallBO toPostWallBO(PostWall postWall) {

        PostWallBO postWallBO = new PostWallBO();

        postWallBO.setPostID(postWall.getPostID());
        postWallBO.setCreatedBy(postWall.getCreatedBy());
        postWallBO.setPostImage(postWall.getPostImage());
        postWallBO.setText(postWall.getText());
        postWallBO.setDatetime(postWall.getDatetime());
        
        
        return postWallBO;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int CreatedBy) {
        this.createdBy = CreatedBy;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }
    
    
  

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public byte[] getPostImage() {
        return postImage;
    }

    public void setPostImage(byte[] postImage) {
        this.postImage = postImage;
    }
 
    public int getDirector() {
        return director;
    }

    public void setDirector(int director) {
        this.director = director;
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }
    
}
