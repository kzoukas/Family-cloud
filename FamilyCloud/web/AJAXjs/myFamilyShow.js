/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
            function getMyFamily()
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
                     var url="Controller?newproperties=MYFAMILY";
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=myFamilyChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function myFamilyChanged()
            {
                
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                  //var showstates = xmlHttp.responseText;
                 var showstates = xmlHttp.responseText;

                 getNotifNumber();
                  //displaying response in select box by using that id
                  document.getElementById("pageNew").innerHTML=showstates;
                  getNotifNumber();

                  //displaying response in select box by using that id
                  //document.getElementById("pageNew").innerHTML=showstates;
                  

                }
            }   
