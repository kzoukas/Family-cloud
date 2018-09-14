

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
            function deleteTodoList(taskID)
             {
                 
                 
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {   
                   
                      var url="Controller?newproperties=TODOLISTINFO&taskID="+taskID;
                                                                  
                     
                     xmlHttp.onreadystatechange=gdeleteToDoListChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function gdeleteToDoListChanged()
            {
                
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                  
                 var json = JSON.parse(xmlHttp.responseText);
        
                   //alert("ksanampike");
                   document.getElementById("delete_todo").setAttribute("value",json.taskID);
                 }
            }
            
          

