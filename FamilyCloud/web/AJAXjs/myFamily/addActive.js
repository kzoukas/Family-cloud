



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
            function addActive()
            {
                 //document.getElementById("#addInactive").setAttribute("data-dismiss", modal);
                 
                 $('#addActive').modal('hide');
                 
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     
                     var url="Controller?newproperties=ADDACTIVEMEMBER&email="+document.getElementById("email3").value;
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=addactiveMemberChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function addactiveMemberChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                  var showstates = xmlHttp.responseText;

                  
                  document.getElementById("pageNew").innerHTML=showstates;
//                  
                }
            }
            
            
