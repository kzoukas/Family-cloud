/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

editProductSaveChanges
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
            function editProductSaveChanges(productID)
            {
                   
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     var radios = document.getElementsByName("bStatusEdit");
                   
                    for (var i = 0, length = radios.length; i < length; i++) {
                        if (radios[i].checked) {
                            // do whatever you want with the checked radio
                            var bStatusEdits=radios[i].value;

                            // only one radio can be logically checked, don't check the rest
                            break;
                        }
                        
                    }  
                    
                     //sending selected country to servlet
                     var url="Controller?newproperties=EDITPRODUCTSAVECHANGES&product=" + document.getElementById("productEdit").value +
                "&price=" + document.getElementById("priceEdit").value+
                "&bStatus=" + bStatusEdits +
                "&productID=" +productID;
                      
                        
                        
                     
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=editProductSaveChangesChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function editProductSaveChangesChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var showstates = xmlHttp.responseText;


                  //displaying response in select box by using that id
                  document.getElementById("pageNew").innerHTML=showstates;
        
                   
                //displaying response in select box by using that id
                
//                document.getElementById("firstNameEdit").setAttribute("value",json.firstName);
//                document.getElementById("lastNameEdit").setAttribute("value",json.lastName);
//                document.getElementById("emailEdit").setAttribute("value",json.email);
//                document.getElementById("birthDateEdit").setAttribute("value",json.birthDate);
//                document.getElementById("relationEdit").setAttribute("value",json.relation);
//                    
                }
            }
            
            

