




  function GetXmlHttpObject()
            {
                    //creating xmlhttprequestobject.common method for any ajax application
                       var xmlHttp=null;
                       try
                       {
                          // Firefox, Opera 8.0+, Safari
                          xmlHttp=new XMLHttpRequest();
                       }
                       catch (e)
                       {
                           //Internet Explorer
                          try
                          {
                                xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
                          }
                          catch (e)
                          {
                               xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
                          }
                       }
                return xmlHttp;
            }
//to get states
            function editProfile(userID)
            {
                   
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                    
                     //sending selected country to servlet
                     var url="Controller?newproperties=EDITMEMBER&userID="+userID;
                     
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=editProfileChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function editProfileChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var json = JSON.parse(xmlHttp.responseText);
        
                   
                //displaying response in select box by using that id
                
                document.getElementById("firstNameProfileEdit").setAttribute("value",json.firstName);
                document.getElementById("lastNameProfileEdit").setAttribute("value",json.lastName);
                document.getElementById("emailProfileEdit").setAttribute("value",json.email);
                document.getElementById("birthDateProfileEdit").setAttribute("value",json.birthDate);
                document.getElementById("userIDs").setAttribute("value",json.userID);
               
                if(json.sex == "male"){
                    document.getElementById("ProfileMale").setAttribute("checked",true);
                                   
                }else{
                    document.getElementById("ProfileFemale").setAttribute("checked",true);
                }
            }
            
         }
