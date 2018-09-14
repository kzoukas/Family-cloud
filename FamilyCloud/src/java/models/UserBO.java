package models;


import java.util.ArrayList;
import java.util.List;
import db.model.User;
import java.util.Date;

public class UserBO {
   
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private Date birthDate;
    private String sex;
    private String familyName;
    private String relation;

   
    private int director;
    private int userID;
    private byte[] image;

    // Constructor
    //////////////////////////////////
    public UserBO() {
        
        firstName = null;
        lastName = null;
        email = null;
        password = null;
        birthDate = null;
        sex = null;
        familyName=null;
        relation=null;
        director=0;
        userID=0;
        image=null;
      
    }


    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
       
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

   

    public String getSex() {
        return sex;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    

    public void setSex(String sex) {
        this.sex = sex;
    }
    
    
    public UserBO toUserBO(User user) {

        UserBO userBO = new UserBO();

        userBO.setEmail(user.getEmail());
        userBO.setPassword(user.getPassword());
        userBO.setFirstName(user.getFirstName());
        userBO.setLastName(user.getLastName());
        userBO.setBirthDate(user.getBirthDate());
        userBO.setSex(user.getSex());
        userBO.setFamilyName(user.getFamilyName());
        userBO.setDirector(user.getDirector());
        userBO.setRelation(user.getRelation());
        userBO.setUserID(user.getUserID());
        
        
        
        

        return userBO;
    }

    /**
     * @return the familyName
     */
    public String getFamilyName() {
        return familyName;
    }

    /**
     * @param familyName the familyName to set
     */
    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }

    /**
     * @return the relation
     */
    public String getRelation() {
        return relation;
    }

    /**
     * @param relation the relation to set
     */
    public void setRelation(String relation) {
        this.relation = relation;
    }

    /**
     * @return the director
     */
    public int getDirector() {
        return director;
    }

    /**
     * @param director the director to set
     */
    public void setDirector(int director) {
        this.director = director;
    }

    /**
     * @return the userID
     */
    public int getUserID() {
        return userID;
    }

    /**
     * @param userID the userID to set
     */
    public void setUserID(int userID) {
        this.userID = userID;
    }
     public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
    
    
}
