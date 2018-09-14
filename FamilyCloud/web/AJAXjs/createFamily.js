

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
            function getCreateFamily()
             {
                 
                  $('#myModalcreatefamily').modal('hide');
                    xmlHttp=GetXmlHttpObject();
                    if (xmlHttp==null)
                    {
                       alert ("Browser does not support HTTP Request")
                        return
                    }
                    else
                    {
                       
                        //alert(document.getElementById("family_name").value)
                        var url="Controller?newproperties=CREATEFAMILY&familyName="+document.getElementById("family_name").value;
                        //creating callback method.here countrychanged is callback method &familyName="+document.getElementById("family_name").value();
                        xmlHttp.onreadystatechange=createFamilyChanged

                        xmlHttp.open("GET",url,true)
                        xmlHttp.send(null)
                    }
                

             }
            function createFamilyChanged()
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
           
                
            
            
