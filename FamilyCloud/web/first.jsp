<%-- 
    Document   : first
    Created on : May 21, 2015, 7:42:28 PM
    Author     : Desktop
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Family cloud</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Lato:400,700' rel='stylesheet' type='text/css'> 
        <link href="style.css" rel="stylesheet" type="text/css" />

        <script src="AJAXjs/signUpValidateEmail.js"></script>
        <script type="text/javascript">
            function confirmPass() {
                var inpObj1 = document.getElementById("password").value;
                var inpObj2 = document.getElementById("rPassword").value;
                //document.getElementById("rPassword").setAttribute("class","form-control");
                if (inpObj1 != inpObj2) {
                    document.getElementById("validPassword").innerHTML = "Password does not match!";
                    document.getElementById("validPassword").setAttribute("style","color: red;");
                    document.getElementById("signup_submit").setAttribute("class","btn btn-primary disabled");
                    //document.getElementById("password").setAttribute("class","validInput");
                   document.getElementById("rPassword").setAttribute("style","border: 1px solid red;");

                }else{
                    document.getElementById("validPassword").setAttribute("style","color: green;");
                    document.getElementById("validPassword").innerHTML = "Correct password!";
                    document.getElementById("rPassword").setAttribute("style","border: 1px solid green;");
                    document.getElementById("signup_submit").setAttribute("class","btn btn-primary");
                     
                }

            }

//            var password = document.getElementById("password")
//              , rPassword = document.getElementById("rPassword");
//
//            function validatePassword(){
//              if(password.value != rPassword.value) {
//                rPassword.setCustomValidity("Passwords Don't Match");
//              } else {
//                rPassword.setCustomValidity('');
//              }
//            }
//
//            password.onchange = validatePassword;
//            rPassword.onkeyup = validatePassword;
        </script>
    </head>
    <body>

        <div class="container-fluid" id="firstcontain">
            <div class="col-sm-10 col-sm-offset-2">
                <a class="navbar-brand" href="file:///C:/Users/Desktop/Desktop/site1/index.html"> <img class="img-responsive "  src="images/the-cloud1.png" alt="Cloud" width="320" height="320" > </a>
            </div>
        </div>




        <div class="container-fluid" id="signup">

            <div class="row" id="myrow" >

                <div class="col-sm-6" id="columnleftsignup">
                    <br><br>
                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>

                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">


                            <div class="item active" >
                                <img src="images/aa.gif" alt="Chania" width="460" height="345">
                                <div class="carousel-caption">
                                    <h3>Simplicity</h3>
                                    <p></p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="images/calendar.jpg" alt="Flower" width="460" height="345">
                                <div class="carousel-caption">
                                    <h3>Organization</h3>
                                    <p></p>
                                </div>
                            </div>

                            <div class="item">
                                <img src="images/chat.jpg" alt="Flower" width="460" height="345">
                                <div class="carousel-caption">
                                    <h3>Immediacy</h3>
                                    <p></p>
                                </div>
                            </div>

                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>

                    <br>	  
                    <div class="col-sm-4" id="siteInfo"> 
                        <h3 class="center">Organization</h3>
                        <p style="text-align: justify;">This site is caracterised by its impressing simplicity in use. It is indeed easy to use for family members of all ages and 
                            proper for those who have an adequate know-how of technology  and for those who do not have at all. It is 
                            proper for all family members, serving the most important aim , to enable them to communicate and be organised easily and simply.</p>
                    
                        </div>
                    <div class="col-sm-4" id="siteInfo"> 
                        <h3 class="center">Immediacy</h3>
                        <p style="text-align: justify;">This site serves the most important family need:direct 
                            contact and communication all day long, no matter how far each family member is. Indeed, this site enables
                            members to fight the rythmes of modern life, which lead to a loss of time, offering them immediacy and directness in family member's communication.</p>
                    </div>
                    <div class="col-sm-4" id="siteInfo"> 
                        <h3 class="center">Simplicity</h3>
                        <p style="text-align: justify;">This site offers family members the possibility to organise their personal and family schedule 
                            easily and immediately, so that they do not waste time in this process. 
                            Being able to communicate directly and mark their duties on the family calendar, they manage to be 
                            perfectly organised, and eventually enjoy more common family time.</p>
                    
                        </div>
                </div>


                <div class="col-sm-6 ">
                    <div class="col-sm-12  ">
                        <p  style=" margin-left: 35px; margin-top: 30px;" id="messageLogout" style="color: green">${messageLogout}</p>  
                    </div>
                    <div class="col-sm-8 col-sm-offset-1">

                        <h3>Sign in</h3>
                        <form action="Controller" method="post"  role="form" >
                            <div class="row">
                                <div class="form-group col-sm-6">
                                    <label for="email4">Email:</label>
                                    <input type="email" name="email" class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" 
                                           title="" placeholder="Enter email" required>


                                </div>
                                <div class="form-group col-sm-6">

                                    <label for="pawd">Password:</label>
                                    <input type="password" name="password" id="signInPass" class="form-control" pattern=".{6,}" placeholder="Enter password" required>

                                </div>
                                
                            </div >
                            <div class="row">

                                <div class="col-sm-6">
                                    <p style="color:red"> ${error_message}</p>
                                </div>

                                <div class="col-sm-6" style="text-align: right">
                                    <button type="submit" name="newproperties" value="LOGIN" class="btn btn-primary " onclick="signInVal();" >Login</button>
                                </div> 


                            </div >


                        </form>


                        <br>
                        <br>
                        <div class="col-sm-8">
                            <div class="divider dividersignin" > </div>
                        </div>
                        <br>


                    </div>
                                <div class="col-sm-3">
                                    <button id="help_button" class="btn btn-primary" data-toggle="modal"    data-target="#helpModal"> You need help?</button> 
                                </div>
                    
                    				
                        <div class="col-sm-8 col-sm-offset-1">
                            <h4 class="dark-grey">You haven't account?</h4>
                            <h3 class="dark-grey">Sign Up</h3>
                            <form  role="form" action="Controller" method="post">

                                <div id="formID">
                                    <div class = "row">
                                        <div class="form-group col-sm-6 " class="divFname" >
                                            <label for="inputFName" >First name</label>
                                            <input type="text" name="firstName" class="form-control" required>
                                        </div>


                                        <div class="form-group col-sm-6">
                                            <label for="inputLName">Last name</label>
                                            <input type="text" name="lastName" class="form-control"  value="" required>

                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="inputEmail" class="control-label">Email</label>
                                            <input type="email" name="email" id="email1" onchange="getStates(this.value)" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" class="form-control" placeholder="email@example.gr"  required>
                                            <div  id="apotelesma" style="color:red">

                                            </div>
                                        </div>

                                        <div class="form-group col-sm-6">
                                            <label for="birthDate">Birth Date</label>
                                            <input type="date" name="birthDate" pattern="[0-9]{4}-(0[1-9]|1[012])-(0[1-9]|1[0-9]|2[0-9]|3[01])"  placeholder="yyyy-MM-dd" class="form-control" required>


                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-group col-sm-6">
                                            <label for="pass">Password</label>
                                            <input type="password" name="password" class="form-control" pattern=".{6,}" id="password"  placeholder="Up to 6 characters"  required>
                                           

                                        </div>

                                        <div class="form-group col-sm-6">
                                            <label for="Cpwd">Repeat Password</label>
                                            <input type="password" name="" class="form-control" oninput="confirmPass()" id="rPassword" required>
                                             <p id="validPassword"></p>

                                        </div>
                                    </div>

                                    <div class="col-sm-12">

                                        <br>
                                        <!--<label class="radio-inline">-->
                                        <input type="radio" name="sex" value="male" required >Male
                                        <!--</label>-->

                                        <!--<label class="radio-inline">-->
                                        <input type="radio" name="sex" value="female" required >Female
                                        <!--</label>-->

                                    </div>		

                                    <div class="col-sm-12">
                                        <br>
                                        <button type="submit" name="newproperties" id="signup_submit" value="SIGNUP" class="btn btn-primary" " >Register</button>				
                                    </div>
                                </div>
                            </form>


                        </div>            
                   






                </div>

            </div>
        </div>

        <div class="footer" id="footersignup">

            <p> &copy Copyright </p>
            <p> <a href="file:///C:/Users/Desktop/Desktop/site1/term-cond.html">Terms and Contidions</a>
                <a href="file:///C:/Users/Desktop/Desktop/site1/privacy.html">Privacy Policy</a>
                <a href="file:///C:/Users/Desktop/Desktop/site1/about-us.html">About us</a> 
            </p>


        </div>	





    </body>
</html>

<!------------------------ Modal Help---------------------------------------------->	

        <div class="modal fade" id="helpModal"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <form action="Controller" method="post"  role="form" >  

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Help</h4>
                        </div>
                        <div class="modal-body">






                            <h4 style="margin-left:25px" ><b>Select one of the followings:</b></h4>

                            <div style="margin-left:25px" >

                                <h4><button type="button" class="helpButton" onclick="showElement('helpSignUp');"> Sign up </button></h4>
                                <div class="helpDiv" id="helpSignUp" style="display: block"><p>All you have to do is to fill the sign up form on first page and click register</p></div>


                                <h4><button type="button" class="helpButton" onclick="showElement('helpSignIn');"> Sign in </button></h4>
                                <div class="helpDiv" id="helpSignIn" style="display: block"><p>In order to Sign in you have to fill the sign in form on first page and click sign in</p></div>



                                <h4><button type="button" class="helpButton" onclick="showElement('helpCreateFam');"> Create Family </button></h4>
                                <div class="helpDiv" id="helpCreateFam" style="display: block"><p>After you sign up you can create a family. The user that creates the family is the director of the family. Each user can only have one family. As a result, this procedure can take place only once.</p></div>


                                <h4 style="margin-left:110px"><b>The following procedures take place only if you have signed in and you are in a Family.</b></h4>    


                                <h4><button type="button" class="helpButton" onclick="showElement('helpAddActive');"> Add Active family member</button></h4>
                                <div class="helpDiv" id="helpAddActive" style="display: block"><p>In order to add an Active Family member there are two principles. Firstly, you have to be the director. Secondly, the user that you want to add must exist on the website without a family. In other words the active user that you want to add must have signed up. Then you can click on Add Family member, choose active and fill his email. The user will be added if he accepts the request.  </p></div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpAddInActive');"> Add Inactive family member</button></h4>
                                <div class="helpDiv" id="helpAddInActive" style="display: block"><p>Firstly, you have to be the director. Click on Add Family member, choose Inactive and fill the form </p></div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpEditDel');"> View/Edit/Delete member</button></h4>
                                <div class="helpDiv" id="helpEditDel" style="display: block"><p>To view the member's info click on his image. To edit/delete a member you have to be the director of the family. Just click on edit/delete button and follow the path. If the director deletes a family member, that user continues to exist, so he can enter another family or create his own</p></div>        

                                <h4><button type="button" class="helpButton" onclick="showElement('helpDelFam');"> Delete Family</button></h4>
                                <div class="helpDiv" id="helpDelFam" style="display: block"><p>The director of the family has that opportunity. If the director deletes the family the users continue to exist, so they can enter other families or create their own</p></div>   



                                <h4><button type="button" class="helpButton" onclick="showElement('helpToDo');">To Do List</button></h4>
                                <div class="helpDiv" id="helpToDo" style="display: block"><p>To do list is provided for the family. In to the to do list you can add/edit/delete things that you want to do, as well as assign things to other members of the family. When an event is assigned to another family member, the family member will be notified through the notification system of our site.</p> </div>




                                <h4><button type="button" class="helpButton" onclick="showElement('helpShopp');">Shopping List</button></h4>
                                <div class="helpDiv" id="helpShopp" style="display: block"><p>Shopping List is provided for the family. In shopping list users can add/edit/delete products bought or to be bought. Shopping list  categorizes the products on bought and not bought and calculates the total price. </p> </div>


                                <h4><button type="button" class="helpButton" onclick="showElement('helpWall');">Family Wall</button></h4>
                                <div class="helpDiv" id="helpWall" style="display: block"><p>Family wall is a field where users can post messages and photos to the whole family. </p> </div>

                                <h4><button type="button" class="helpButton" onclick="showElement('helpMessages');">Messages</button></h4>
                                <div class="helpDiv" id="helpMessages" style="display: block"><p>Messages is a field where you can have private conversation with the members of the family</p> </div>





                               
                                <h4 style="font-size:16px;"><b>Calendars: Personal Calendar,  Family Calendar,  Meals Plan. All of our calendars can be shown daily weekly or monthly. Furthermore, you can add events(repeatedly or simple) and set a reminder as well.</b></h4>    




                                <h4><button type="button" class="helpButton" onclick="showElement('helPC');"> Personal Calendar</button></h4>
                                <div class="helpDiv" id="helPC" style="display: block"><p>The personal calendar is each active's user personal calendar. The  personal calendar can be shown as whole or by category. You just have to categorize the events you add by filling the category field.</p></div> 

                                <h4><button type="button" class="helpButton" onclick="showElement('helFC');"> Family Calendar</button></h4>
                                <div class="helpDiv" id="helFC" style="display: block"><p>The family calendar is ofcourse the family's calendar. Events can be assigned to family members, When an event is assigned to another family member, the member will be notified through the notification system of our site . The view of the family calendar can be shown as whole, by category or by member. What you see on your family calendar can be imported to your personal, just click on the button import to personal.</p> </div> 

                                <h4><button type="button" class="helpButton" onclick="showElement('helpMeal');"> Meals Plan</button></h4>
                                <div class="helpDiv" id="helpMeal" style="display: block"><p>As meals is also a calendar you can add any kind of meal or dinner arrangements you want. Meals plan is visible to all family.</p> </div> 
                            </div>





                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">close</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!------------------------ end Modal help---------------------------------------------->