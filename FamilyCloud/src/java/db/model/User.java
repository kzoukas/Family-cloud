
package db.model;

import java.util.Date;


public class User {


    private String email;
    private String firstName;
    private String lastName;
    private String password;
    private Date birthDate;
    private String sex;
    private String familyName;
    private String relation;
    private int director;

   
    private int userID;
    private byte[] image;
    
    

    public User() {
        
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

    

    // Getter and Setter Methods
    //////////////////////////////////
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }
    
    
    public void setSex(String sex) {
        this.sex = sex;
    }

    

    public String getSex() {
        return sex;
    }

    public String getFamilyName() {
        return familyName;
    }


    public void setFamilyName(String familyName) {
        this.familyName = familyName;
    }
    
    public void updateUserInfo(User other) {
        if (other != null) {
            if (other.getEmail() != null) {
                email = other.getEmail();
            }
            if (other.getFirstName() != null) {
                firstName = other.getFirstName();
            }
            if (other.getLastName() != null) {
                lastName = other.getLastName();
            }
            
            if (other.getBirthDate() != null) {
                birthDate = other.getBirthDate();
            }
            
            if (other.getPassword() != null) {
                password = other.getPassword();
            }
             if (other.getSex() != null) {
                sex = other.getSex();
            }
              if (other.getFamilyName()!= null) {
                familyName = other.getFamilyName();
            }
              if (other.getUserID()!= 0) {
                    userID = other.getUserID();
            }
              if (other.getDirector()!= 0) {
                director = other.getDirector();
            }
               if (other.getRelation()!= null) {
                relation = other.getRelation();
            }
              
           
           
        }
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
}
