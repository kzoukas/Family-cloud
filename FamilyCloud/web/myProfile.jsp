<%-- 
    Document   : myProfile
    Created on : May 31, 2015, 4:52:17 PM
    Author     : Vaggos
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="col-sm-12 contentPage" id="newPage">

    <div class="col-sm-12" id="todoHeader">
        <h3>My Profile</h3>
    </div>

    <div class="row">

        <div class="panel panel-default col-sm-10 col-sm-offset-1" id="myPanel2">	
            <div class="panel-body">
                 <div class="row">
                <div class="col-sm-5 " id="myPhoto">

                    <img class="img-responsive img-circle myPictureFit" id="photoss" src="Controller?newproperties=SHOWPICTURE&userID=${myUser.userID}" alt="Flower" width="200" height="220">
                    <br>
                    <br>
                    <form role="form" action="PhotoServlet?userID=${myUser.userID}"  method="post" enctype="multipart/form-data">

<!--                        <a class="btn btn-default btn-file">
                            Change image <input type="file" name="file">
                        </a>-->
                        <input style="background-image: none" type="file"  name="file" />

                        <button type="submit"   class="btn btn-primary "> Upload</button>
                    </form>
                    


                </div>
                <div class="col-sm-7  " id="profInfo" >


                    <div class="row" style="margin:5px;"> <div class="col-sm-4" style="margin-top:10px;" ><p><b> First Name: </b> </p></div>        <div class="col-sm-6" style="margin-top:10px;">  <p>${myUser.firstName}</p></div> </div>
                    <div class="row" style="margin:5px;"> <div class="col-sm-4" ><p><b> Last Name:</b></p></div>               <div class="col-sm-6">  <p>${myUser.lastName}</p></div></div>
                    <div class="row" style="margin:5px;"> <div class="col-sm-4" ><p><b> Email:</b></p></div>                <div class="col-sm-6">  <p>${myUser.email}</p></div></div>
                    <div class="row" style="margin:5px;"> <div class="col-sm-4" ><p><b> Genre:</b></p></div>                   <div class="col-sm-6">  <p>${myUser.sex}</p></div></div>
                    <div class="row" style="margin:5px;"> <div class="col-sm-4" ><p><b> Date of birth:</b></p></div>                <div class="col-sm-6">  <p>${myUser.birthDate}</p></div></div>


                </div>
                    </div>
                <div class="row">
                    <div class="col-sm-5">
                        <br>
                    <br>
                    <button class="buttonTransparent btn btn-primary" id="editProfile" value="${myUser.userID}" onclick="editProfile(this.value)"  data-toggle="modal" data-target="#editModal">  Edit Profile</button>
                    <br>
                    

                    <button class="buttonTransparent btn btn-primary" id="changePassword" value="${myUser.userID}" onclick="changePassword(this.value)" data-toggle="modal" data-target="#changePassModal">  Change password</button>
                    </div>
                    <div class="col-sm-7">
                    
                    <p  id="messageProf" style="color: green">${messageMyProfile}</p>  
                    </div>
                </div> 

            </div>
        </div>

    </div>	
</div>   

<div class="modal fade" id="editModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit profile</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="firstNameProfileEdit">First name:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="firstNameProfileEdit"   placeholder="" required>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="lastNameProfileEdit">Last name:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="lastNameProfileEdit"  required>

                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="emailProfileEdit">Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="emailProfileEdit"  required>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="birthDateProfileEdit">Birth Date:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="birthDateProfileEdit"  placeholder="" required>

                        </div>
                    </div>
                    <div class="form-group">        

                        <div class="col-sm-10 col-sm-offset-3">
                            <form role="form">

                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="Male" id="ProfileMale"  required>Male 
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="Female" id="ProfileFemale" required>Female
                                </label>


                            </form>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button"  id="userIDs" data-dismiss="modal" onclick="editProfileSaveChanges(this.value)" class="btn btn-primary" >Save Changes</button>
                    </div>	
                </form>

            </div>

        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->   


<!------------------------------------------------------------- Modal Change Pass---------------------------------------------->

<div class="modal fade" id="changePassModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Change Password</h4>
            </div>
            <div class="modal-body">


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="oldPass">Old Password:</label>
                        <div class="col-sm-6">
                            <input type="password" class=" form-control" id="oldPass" oninput="validateOldPassword(this.value)" placeholder="" required>   
                            <p id="messagePassValidate" style="color:red"></p> 
                            <p id="messageCorrect" style="color:green"></p> 
                            
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="newPass">New Password:</label>
                        <div class="col-sm-6">
                            <input type="password" class=" form-control" id="newPassword" pattern=".{6,}"  placeholder="Up to 6 characters" required>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="cNewPass">Repeat New Password:</label>
                        <div class="col-sm-6">
                            <input type="password" class=" form-control" id="cnewPassword" pattern=".{6,}" oninput="confirmChangePassword()"  placeholder="Up to 6 characters" required>
                            <p style="color:red;" id="validChangePassword"></p>
                        </div>
                    </div>


                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" data-dismiss="modal" id="passChangeButton" class="btn btn-primary disabled" value="${myUser.userID}" onclick ="ChangePasswordSaveChanges(this.value)" >Change Password</button>
            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

