
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
            function editFamilyEvent(activityID)
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
                     var url="Controller?newproperties=VIEWFAMILYEVENT&activityID="+activityID;
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=vieweFamilyChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function vieweFamilyChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var json = JSON.parse(xmlHttp.responseText);
        
                   
                //displaying response in select box by using that id
                
                    
                    
                    document.getElementById("editfamilyEventTitle").innerHTML=json.event_title;
                    document.getElementById("editfamilyCategory").innerHTML=json.category;
                    document.getElementById("editfamilyDescription").innerHTML=json.description;
                    
                    
                }
            }
            
            
