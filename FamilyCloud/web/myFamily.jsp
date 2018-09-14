<%-- 
    Document   : myFamily
    Created on : May 29, 2015, 3:59:12 PM
    Author     : Vaggos
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="models.UserBO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="col-sm-12 contentPage">

    <c:choose>
        <c:when test="${myUser.familyName == null}">


            <div class="col-sm-12" id="example1">
                <h1>Welcome ${myUser.firstName} </h1>
                <br>
                <h4 style="text-align: justify;">Thank you participating on the site and be ready for an unforgettable trip with your 
                    loved family! In order to continue create a family or take participation to other family created already! Have fun!</h4>
                <div class="col-sm-3 col-sm-offset-8" >
                    <br><br><br>
                    <button type="button" class="btn btn-primary" id="addeventbutton" data-toggle="modal" data-target="#myModalcreatefamily" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Create Family</button> 
                </div>
            </div>    


        </c:when>   
        <c:otherwise>
            <c:choose>
                <c:when test="${director.userID != myUser.userID}">

                    <div class="col-sm-12" id="todoHeader">
                        <h3>My Family</h3>
                    </div>
                    <div class="row col-sm-12">

                        <div class="col-sm-3 " id="myPhoto2" >
                            <h4 style="color:#00557F;"> ${director.firstName} (Director)</h4>
                            <img class="img-responsive directorPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${director.userID}" alt="Flower" width="220" height="220">
                            <br>
                            <br>
                            <br>
                        </div>
                        <div class="col-sm-9 ">
                            <br><br><br><br>
                            <p style="color: green">${messageMyPhoto}<br><br></p> 
                        </div>

                    </div> 
                    <c:choose>
                        <c:when test="${myInactiveUser.size() != 0}">           

                            <div class="row">        
                                <div class="col-sm-4" >
                                    <h4 style="color:#00557F; margin-left: 40px;"><u><b>${myUser.familyName}  Family</b></u></h4>

                                </div>
                                <div class="col-sm-4 col-sm-offset-4 ">
                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dLabel" data-toggle="dropdown" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add family member</button>
                                        <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addActive">Active</a>
                                            </li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addInactive">Inactive</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>

                            <div class="row">
                                <div class="panel panel-default col-sm-12 " id="myPanel2">
                                    <div class="panel-body">

                                        <p style="color: green">${messageMyFamily}</p>  




                                        <c:forEach items="${myInactiveUser}" var="member">
                                            <div class="col-sm-3 membersPhotos">
                                                <h4 style="color: white"> ${member.firstName}</h4>
                                                <c:choose>
                                                    <c:when test="${member.email == '-'}">  
                                                         <button   class="buttonTransparent" data-toggle="modal" data-target="#viewInactiveMember" value="${member.userID}" onclick="viewMember(this.value)"><img class="img-responsive imgFit" src="Controller?newproperties=SHOWPICTURE&userID=${member.userID}" alt="Flower" width="220" height="220" ></button>

                                                   
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button   class="buttonTransparent" data-toggle="modal" data-target="#viewMember" value="${member.userID}" onclick="viewMember(this.value)"><img class="img-responsive imgFit" src="Controller?newproperties=SHOWPICTURE&userID=${member.userID}" alt="Flower" width="220" height="220" ></button>

                                                    </c:otherwise>
                                                </c:choose>
                                                <br>
                                                <button  style="background-color: #D4D0BD;" class="btnFit" data-toggle="modal" hidden="hidden" data-target="#editModal" value="${member.userID}" onclick="editMember(this.value)"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
                                                <br>
                                                <button style="background-color: #D4D0BD; " class="btnFit" data-toggle="modal" hidden="hidden" data-target="#deleteModal" value="${member.userID}" onclick="gotodeleteMember(this.value)"><span class="glyphicon glyphicon-remove-sign"></span> Delete</button>
                                            </div>




                                        </c:forEach>




                                    </div>
                                </div>
                            </div>



                        </c:when> 
                        <c:otherwise>


                           <div class="col-sm-12" id="afterCreate">
                                <h4 style="text-align: justify;">
                                    You can now add to your family your loved persons.
                                    You can chat with active members and share important infos with them. Also the site provides lists for shopping and calendars to organize your events.
                                    To add an active member, that member  needs first to have signed up.<br><br>
                                    To start your experience add a member in your family!<br><br>
                                </h4>

                                <div class="col-sm-3 col-sm-offset-8" >
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dLabel" data-toggle="dropdown" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add family member</button>
                                    <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="3#" data-toggle="modal" data-target="#addActive">Active</a>
                                        </li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="3#" data-toggle="modal" data-target="#addInactive">Inactive</a>
                                        </li>
                                    </ul>
                                </div>
                                 </div>

                            </div>

                        </c:otherwise>
                    </c:choose> 


                </c:when>
                <c:otherwise>



                    <div class="col-sm-12" id="todoHeader">
                        <h3>My Family</h3>
                    </div>
                    <div class="row col-sm-12">

                        <div class="container">

                            <div class="col-sm-3 " id="myPhoto2" >
                                <h4 style="color:#00557F;"> ${director.firstName} (Director)</h4>
                                <img class="img-responsive directorPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${director.userID}" alt="Flower" width="220" height="220">
                                <br>
                                <br>
                                <br>
                            </div>
                            <div class="col-sm-9 ">
                                <br><br><br><br>
                                <p style="color: green">${messageMyPhoto}<br><br></p> 
                            </div>
                        </div>  
                    </div> 
                    <c:choose>
                        <c:when test="${familyExceptDirector.size() != 0}">                    

                            <div class="row">        
                                <div class="col-sm-4" style="margin-top: 30px">
                                    <h4 style="color:#00557F; margin-left: 40px;"><u><b>${myUser.familyName}  Family</b></u></h4>

                                </div>
                                <div class="col-sm-4 col-sm-offset-4">
                                    <div class="dropdown">
                                        <button class="btn btn-primary dropdown-toggle" type="button" id="dLabel" data-toggle="dropdown" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add family member</button>
                                        <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addActive">Active</a>
                                            </li>
                                            <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addInactive">Inactive</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="panel panel-default col-sm-12 " id="myPanel2">
                                    <div class="panel-body">

                                        <p style="color: green">${messageMyFamily}</p>  

                                        <div id="memberPhotos">
                                            <c:forEach items="${familyExceptDirector}" var="member">
                                                <div class="col-sm-3 membersPhotos">
                                                    <h4 style="color: white"> ${member.firstName}</h4>
                                                    <c:choose>
                                                        <c:when test="${member.email == '-'}">   
                                                            <button  class="buttonTransparent" data-toggle="modal" data-target="#viewInactiveMember" value="${member.userID}" onclick="viewMember(this.value)"><img class="img-responsive imgFit" src="Controller?newproperties=SHOWPICTURE&userID=${member.userID}" alt="Flower" width="220" height="220" ></button>
                                                            </c:when>
                                                            <c:otherwise>
                                                            <button  class="buttonTransparent" data-toggle="modal" data-target="#viewMember" value="${member.userID}" onclick="viewMember(this.value)"><img class="img-responsive imgFit" src="Controller?newproperties=SHOWPICTURE&userID=${member.userID}" alt="Flower" width="220" height="220" ></button>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    <br>
                                                    <button    class="btn btn-primary btnFit" data-toggle="modal" data-target="#editModal" value="${member.userID}" onclick="editMember(this.value)"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
                                                    <br>
                                                    <button    class="btn btn-primary btnFit" data-toggle="modal" data-target="#deleteModal" value="${member.userID}" onclick="gotodeleteMember(this.value)"><span class="glyphicon glyphicon-remove-sign"></span> Delete</button>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <br>

                                <button type="button" class="btn btn-primary deletefamily" id="deletefamily" data-toggle="modal" data-target="#deleteFamily"> <span class="glyphicon glyphicon-remove-sign"></span> Delete family</button>
                            </div>

                        </c:when>
                        <c:otherwise>  

                            <div class="col-sm-12" id="afterCreate">
                                <h4 style="text-align: justify;">
                                    You can now add to your family your loved persons.
                                    You can chat with active members and share important infos with them. Also the site provides lists for shopping and calendars to organize your events.
                                    To add an active member, that member  needs first to have signed up.<br><br>
                                    To start your experience add a member in your family!<br><br>
                                </h4>

                                <div class="col-sm-3 col-sm-offset-8" >
                                <div class="dropdown">
                                    <button class="btn btn-primary dropdown-toggle" type="button" id="dLabel" data-toggle="dropdown" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add family member</button>
                                    <ul class="dropdown-menu " role="menu" aria-labelledby="dLabel">
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addActive">Active</a>
                                        </li>
                                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-toggle="modal" data-target="#addInactive">Inactive</a>
                                        </li>
                                    </ul>
                                </div>
                                 </div>

                            </div>

                        </c:otherwise>
                    </c:choose> 


                </c:otherwise>
            </c:choose>     
        </c:otherwise>
    </c:choose> 


</div>




<!------------------------------------------------------------------- VIEW MEMBER---------------------------------------------->

<div class="modal fade" id="viewMember" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">View information of active member</h4>
            </div>
            <div class="modal-body">

                <div class="col-sm-4">
                    <img class="img-responsive " id="photoShow" alt="Flower" width="220" height="240" >
                </div>
                <table id="infoTable">


                    <tr >
                        <td><b>First Name:</b></td>
                        <td id="firstNames"></td>
                    </tr>

                    <tr>
                        <td><b>Last Name:</b> </td>
                        <td id="lastNames"></td>
                    </tr>
                    <tr id="emailtr">
                        <td><b>Email:</b> </td>
                        <td id="emails"></td>
                    </tr>
                    <tr id="genretr">
                        <td><b>Genre:</b> </td>
                        <td id="sexs"></td>
                    </tr>

                    <tr id="birthDatetr">
                        <td><b>Date of birth:</b> </td>
                        <td id="birthDates"> </td>
                    </tr>

                </table> 

                <div class="modal-footer">

                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!------------------------------------------------------------------- VIEW INACTIVE MEMBER---------------------------------------------->

<div class="modal fade" id="viewInactiveMember" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">View information of inactive member</h4>
            </div>
            <div class="modal-body">

                <div class="col-sm-4">
                    <img class="img-responsive " id="photoShowInactive" alt="Flower" width="220" height="240" >
                </div>
                <table id="infoTable">


                    <tr >
                        <td><b>First Name:</b></td>
                        <td id="firstNameInactive"></td>
                    </tr>

                    <tr>
                        <td><b>Last Name:</b> </td>
                        <td id="lastNameInactive"></td>
                    </tr>

                    <tr id="relationtr">
                        <td><b>Relation:</b> </td>
                        <td id="relationInactive"> </td>
                    </tr>
                </table> 

                <div class="modal-footer">

                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!------------------------------------------------------------- Modal Edit data Member---------------------------------------------->

<div class="modal fade" id="editModal"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Edit Member Data</h4>
            </div>
            <div class="modal-body">

                <div class="row">  
                    <div class="col-sm-4">
                        <img class="img-responsive" id="photoEdit" alt="Flower" width="190" height="190" >
                    </div>
                    <form  role="form"  id="photoform" method="post" enctype="multipart/form-data">     
                        <div class="col-sm-4">
                            <h4>Change the picture!</h4>
                            <input style="background-image: none" id="file-id" type="file"  name="our-file" />
                            <br>
                            <button type="submit" class="btn btn-sm btn-primary">Change Image</button>
                        </div>
                    </form>
                </div>


                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <br>
                        <br>
                        <label class="control-label col-sm-3" for="firstNameEdit">First name:</label>
                        <div class="col-sm-6">
                            <input  type="text" class="form-control" id="firstNameEdit"   required>

                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="lastNameEdit">Last name:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="lastNameEdit"   required>

                        </div>
                    </div>

                    <div class="form-group" id="emailEditDiv" >
                        <label class="control-label col-sm-3" for="emailEdit">Email:</label>
                        <div class="col-sm-6">
                            <input type="email" class="form-control" id="emailEdit"   required>

                        </div>
                    </div>
                    <div class="form-group" id="birthDateEditDiv" >
                        <label class="control-label col-sm-3" for="birthDateEdit">Birth Date:</label>
                        <div class="col-sm-6">
                            <input type="date" class="form-control" id="birthDateEdit"   required>

                        </div>
                    </div>
                    <div class="form-group" id="relationEditDiv">
                        <label class="control-label col-sm-3" for="relationEdit">Relation:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="relationEdit"   required>

                        </div>
                    </div>
                    <div class="form-group" >        

                        <div class="col-sm-10 col-sm-offset-3" id="sexEditDiv" >
                            <form role="form">

                                <br>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="male" id="male">Male 
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="sex" value="female" id="female">Female
                                </label>


                            </form>
                        </div>
                    </div>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="userID" onclick="editMemberSaveChanges(this.value)" data-dismiss="modal" >Save changes</button>
            </div>
            </form>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->


<!--------------------------------------------------------------- Modal Add active family member---------------------------------------------->

<div class="modal fade" id="addActive"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add Active family memeber</h4>
            </div>
            <div class="modal-body">



                <form class="form-horizontal" role="form" method="POST"  onsubmit="addActive();
                        return false;">
                    <div class="form-group">
                        <br>
                        <label class="control-label col-sm-2" for="emsail3">Email:</label>
                        <div class="col-sm-5">
                            <input type="email" class="form-control" id="email3" oninput="validateEmail(this.value)" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" placeholder="email@example.gr" required>
                            <p id="apotelesma"></p>  
                        </div>
                        <br>
                        <br>
                        <br>
                        <br>

                    </div>







            
            <div class="modal-footer">

                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary"  id="add_active" >Send invitation</button>
            </div>
            </form>
                </div>
        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->

<!--------------------------------------------------------------- Modal Add inactive family member---------------------------------------------->

<div class="modal fade" id="addInactive"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Add Inactive family memeber</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" method="POST" onsubmit="getAddInactiveMember();
                        return false;" >

                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Fname2">First name:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="firstName" oninput="AddInMemberOnInput('validFname2')" placeholder="" required>
                            <p id="validFname2" class="validationClass"></p>
                        </div>  
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="Lname2">Last name:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="lastName" placeholder=""  required>
                            <p id="validLname2" class="validationClass"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-3" for="relation">Relation:</label>
                        <div class="col-sm-5">
                            <input type="text" class="form-control" id="relationNew" placeholder=""  required>

                        </div>
                    </div>

                    <div class="modal-footer">

                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-primary"  id="adds"  >Add</button>
                    </div>
                </form>  
            </div>



        </div>
    </div>
</div>
<!------------------------------------------------------------------- end---------------------------------------------->	





<!--------------------------------------------------------- Modal Delete member---------------------------------------------->	

<div class="modal fade" id="deleteModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Delete member from family</h4>
            </div>
            <div class="modal-body">


                <h5>Are you sure you want to delete this member from family? </h5>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" data-dismiss="modal" id="delete_submit"  class="btn btn-default" onclick="deleteMember(this.value)"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span>Yes</button>
            </div>
        </div>
    </div>
</div>



<!--------------------------------------------------------- Modal Delete Family---------------------------------------------->	

<div class="modal fade" id="deleteFamily"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Delete member from family</h4>
            </div>
            <div class="modal-body">


                <h5>Are you sure you want to delete your family? </h5>



            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                <button type="button" data-dismiss="modal"   class="btn btn-default" onclick="deleteFamily()"><span style="color:#cc654e;" class="glyphicon glyphicon-remove-sign"></span>Yes</button>
            </div>
        </div>
    </div>
</div>




<!------------------------ Modal CreateFamily ---------------------------------------------->

<div class="modal fade" id="myModalcreatefamily"  role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Create a family</h4>
            </div>
            <div class="modal-body">


                <div class="container-fluid">		 
                    <form class="form-horizontal"  method="POST"  role="form"  onsubmit="getCreateFamily();
                            return false;">
                        <div class="form-group">
                            <br>
                            <label class="control-label col-sm-3" for="mealName">Family name:</label>
                            <div class="col-sm-6">

                                <input type="text" class="form-control"  id= "family_name" placeholder="Give a name for family" required>


                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" id="submit_create">
                                Create family</button>
                        </div>
                    </form>
                </div>


            </div>

        </div>
    </div>
</div>
<!------------------------ end Modal Add Event---------------------------------------------->