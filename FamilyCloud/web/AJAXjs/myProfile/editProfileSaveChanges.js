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
            function editProfileSaveChanges(userID)
            {
                   
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     var radios = document.getElementsByName('sex');

                    for (var i = 0, length = radios.length; i < length; i++) {
                        if (radios[i].checked) {
                            // do whatever you want with the checked radio
                            sex=radios[i].value;

                            // only one radio can be logically checked, don't check the rest
                            break;
                        }
                    }  
                     //sending selected country to servlet
                     var url="Controller?newproperties=EDITPROFILE&firstNameEdit="+document.getElementById("firstNameProfileEdit").value+
                                "&lastNameEdit="+document.getElementById("lastNameProfileEdit").value +
                                "&emailEdit="+document.getElementById("emailProfileEdit").value+
                                "&birthDateEdit="+document.getElementById("birthDateProfileEdit").value+
                                
                                "&sex="+sex +
                                "&userID="+userID;
                      
                        
                        
                     
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=editProfileSaveChangesChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function editProfileSaveChangesChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var showstates = xmlHttp.responseText;


                  //displaying response in select box by using that id
                  document.getElementById("pageNew").innerHTML=showstates;
        
                   
                
//                    
                }
            }
            
            
