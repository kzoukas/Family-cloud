



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
            function getAddInactiveMember()
            {
                 //document.getElementById("#addInactive").setAttribute("data-dismiss", modal);
                 
                 $('#addInactive').modal('hide');
                 
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     //sending selected country to servlet
                     var url="Controller?newproperties=ADDINACTIVEMEMBER&firstName="+document.getElementById("firstName").value+
                                "&lastName="+document.getElementById("lastName").value +
                                "&relation="+document.getElementById("relationNew").value;
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=addInactiveMemberChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function addInactiveMemberChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                  var showstates = xmlHttp.responseText;

                   //var json = JSON.parse(xmlHttp.responseText);
        
                   
                //displaying response in select box by using that id
                  //document.getElementById("firstname").innerHTML=json.firstname;
                  //displaying response in select box by using that id
                  document.getElementById("pageNew").innerHTML=showstates;
//                  
                }
            }
            
            
