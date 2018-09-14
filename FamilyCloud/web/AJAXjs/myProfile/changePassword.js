
  

            function changePassword(userID)
            {
                   
                document.getElementById("passChangeButton").setAttribute("value",userID);

             }
            
            
//            function confirmChangePassword() {
//              
//             
//                
//                if (document.getElementById("newPassword").value != document.getElementById("cnewPassword").value) {
//                    document.getElementById("validChangePassword").innerHTML = "Password does not match!";
//                    document.getElementById("passChangeButton").setAttribute("class","btn btn-primary disabled");
//                }
//                else{
//                    document.getElementById("validChangePassword").innerHTML = "Correct password.";
//                    document.getElementById("passChangeButton").setAttribute("class","btn btn-primary");
//                    
//                }
//
//            }
            
            function confirmChangePassword() {
                var inpObj1 = document.getElementById("newPassword").value;
                var inpObj2 = document.getElementById("cnewPassword").value;
                //document.getElementById("rPassword").setAttribute("class","form-control");
                if (inpObj1 != inpObj2) {
                    document.getElementById("validChangePassword").innerHTML = "Password does not match!";
                    document.getElementById("validChangePassword").setAttribute("style","color: red;");
                    document.getElementById("passChangeButton").setAttribute("class","btn btn-primary disabled");
                    //document.getElementById("password").setAttribute("class","validInput");
                   document.getElementById("cnewPassword").setAttribute("style","border: 1px solid red;");

                }else{
                    document.getElementById("validChangePassword").setAttribute("style","color: green;");
                    document.getElementById("validChangePassword").innerHTML = "Correct password!";
                    document.getElementById("cnewPassword").setAttribute("style","border: 1px solid green;");
                    document.getElementById("passChangeButton").setAttribute("class","btn btn-primary");
                     
                }

            }
         
