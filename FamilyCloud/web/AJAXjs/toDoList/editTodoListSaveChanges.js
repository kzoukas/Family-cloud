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
            function editTodoListSaveChanges(taskID)
            {
                   
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     
                    var radios = document.getElementsByName('editStatus');

                    for (var i = 0, length = radios.length; i < length; i++) {
                        if (radios[i].checked) {
                            // do whatever you want with the checked radio
                            status=radios[i].value;
                            
                            // only one radio can be logically checked, don't check the rest
                            break;
                        }
                     }
                     
                    var InvForm = document.forms.edittodo;
                    var assignedTo = "";
                    var x = 0;
                    var count=0;

                    var temp=InvForm.multiselectAssignedToEdit.length;
                    for (x=0;x<InvForm.multiselectAssignedToEdit.length;x++)
                     {
                        if(InvForm.multiselectAssignedToEdit[x].selected )
                        {
                            if(temp==1){

                                assignedTo = InvForm.multiselectAssignedToEdit[x].value;
                            }else{

                                count=count+1;

                                if(count==1){
                                    assignedTo = InvForm.multiselectAssignedToEdit[x].value + assignedTo ;

                                }else{

                                    assignedTo = InvForm.multiselectAssignedToEdit[x].value + "," + assignedTo ;

                                }


                            }

                         //alert(InvForm.kb[x].value);

                        }
                     }
                     
                       
                     //sending selected country to servlet
                     var url="Controller?newproperties=EDITTODOLIST&task="+document.getElementById("editTask").value+
                                "&assignedTo="+assignedTo +
                                "&dueDate="+document.getElementById("editDueDate").value+
                                "&status="+status+
                                "&taskID="+taskID;
                      
                        
                        
                     
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=editToDoListSaveChangesChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
             
            function editToDoListSaveChangesChanged()
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
            
                        
