



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
            function gotodeleteMember(userID)
            {
                   
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                    //alert("mpike");
                     //sending selected country to servlet
                     var url="Controller?newproperties=GOTODELETEMEMBER&userID="+userID;
                               
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=gotodeleteMemberChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function gotodeleteMemberChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                    
                  

                   var json = JSON.parse(xmlHttp.responseText);
        
                   //alert("ksanampike");
                   document.getElementById("delete_submit").setAttribute("value",json.userID);
                  
                  //document.getElementById("pageNew").innerHTML=showstates;
                  
                }
            }
            
            
