



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
            function accept_invitation(notificationID)
            {
                 //document.getElementById("#addInactive").setAttribute("data-dismiss", modal);
                 
                 //$('#addInactive').modal('hide');
                 
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                    
                     var url="Controller?newproperties=ACCEPTINVITATION&notificationID="+notificationID;
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=acceptInvitationChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function acceptInvitationChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                  var showstates = xmlHttp.responseText;

                  
                  document.getElementById("pageNew").innerHTML=showstates;
//                  
                }
            }
            
            
