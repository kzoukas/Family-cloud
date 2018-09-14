

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
            function addToDoList()
             {
                 
                $('#myModal').modal('hide');
                 xmlHttp=GetXmlHttpObject();
                 if (xmlHttp==null)
                 {
                    alert ("Browser does not support HTTP Request")
                     return
                 }
                 else
                 {
                     
                    
                  var InvForm = document.forms.addtodo;
                    var assignedTo = "";
                    var x = 0;
                    var count=0;

                    var temp=InvForm.multiselectAssignedTo.length;
                    for (x=0;x<InvForm.multiselectAssignedTo.length;x++)
                     {
                        if(InvForm.multiselectAssignedTo[x].selected )
                        {
                            if(temp==1){

                                assignedTo = InvForm.multiselectAssignedTo[x].value;
                            }else{

                                count=count+1;

                                if(count==1){
                                    assignedTo = InvForm.multiselectAssignedTo[x].value + assignedTo ;

                                }else{

                                    assignedTo = InvForm.multiselectAssignedTo[x].value + "," + assignedTo ;

                                }


                            }

                         //alert(InvForm.kb[x].value);

                        }
                     }
                      
                    
                     //sending selected country to servlet
                      var url="Controller?newproperties=ADDTODOLIST&task="+document.getElementById("task").value+
                                                                  "&dueDate="+document.getElementById("dueDate").value +
                                                                  "&assignedTo=" + assignedTo;   
                     
                     xmlHttp.onreadystatechange=addToDoListChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function addToDoListChanged()
            {
                
                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                  //getting response from server(Servlet)
                  //var showstates = xmlHttp.responseText;
                 var showstates = xmlHttp.responseText;


                  //displaying response in select box by using that id
                  document.getElementById("pageNew").innerHTML=showstates;
                 }
            }
            
           var multiSelect = {};
            function antegeia() {      
              var s = document.getElementsByTagName('select');
              for (var i = 0; i < s.length; i++) {
                if (s[i].multiple) {
                  var n = s[i].name;
                  multiSelect[n] = [];
                  for (var j = 0; j < s[i].options.length; j++) {
                    multiSelect[n][j] = s[i].options[j].selected;
                  }
                  s[i].onchange = changeMultiSelect2;
                }
              }
            }

