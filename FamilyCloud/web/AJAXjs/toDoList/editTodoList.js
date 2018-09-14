




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
            function editTodoList(taskID)
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
                     var url="Controller?newproperties=TODOLISTINFO&taskID="+taskID;
                     
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=editTodolistChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function editTodolistChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var json = JSON.parse(xmlHttp.responseText);
        
                   
                //displaying response in select box by using that id
                
                document.getElementById("editTask").setAttribute("value",json.task);
                document.getElementById("editDueDate").setAttribute("value",json.dueDate);
//                document.getElementById("editTask").innerHTML=json.task;
//                document.getElementById("editDueDate").innerHTML=json.dueDate;
                if(json.status == "completed"){
                    document.getElementById("editcompleted").checked = true;
                                   
                }else{
                    document.getElementById("editincompleted").checked = true;
                }
               document.getElementById("taskIDbutton").setAttribute("value",json.taskID);
                
//                    
                }
            }
            
            
