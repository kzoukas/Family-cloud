

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
            function validateOldPassword(password)
             {
                 
                 
                    xmlHttp=GetXmlHttpObject();
                    if (xmlHttp==null)
                    {
                       alert ("Browser does not support HTTP Request")
                        return
                    }
                    else
                    {
                       
                        
                        var url="Controller?newproperties=VALIDATEOLDPASSWORD&password="+password;
                        //creating callback method.here countrychanged is callback method &familyName="+document.getElementById("family_name").value();
                        xmlHttp.onreadystatechange=passwordChanged

                        xmlHttp.open("GET",url,true)
                        xmlHttp.send(null)
                    }
                

             }
            function passwordChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                 var json = JSON.parse(xmlHttp.responseText);
        
        
                //displaying response in select box by using that id
                if(json.messagePassValidate!="not"){
                    
                document.getElementById("messagePassValidate").innerHTML=json.messagePassValidate;
                document.getElementById("messagePassValidate").style.display="block";
                document.getElementById("messageCorrect").style.display="none";
                document.getElementById("oldPass").setAttribute("style","border: 1px solid red;");
                
                }else{
                 document.getElementById("messageCorrect").style.display="block";
                document.getElementById("messageCorrect").innerHTML=json.messageCorrect;
                document.getElementById("messagePassValidate").style.display="none";
                 document.getElementById("oldPass").setAttribute("style","border: 1px solid green;");
                
                 }
                 document.getElementById("passChangeButton").setAttribute("class",json.enabled);
                }
            }
        
