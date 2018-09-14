
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
            function viewMember(kwstas)
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
                     var url="Controller?newproperties=VIEWMEMBER&userID="+kwstas;
                     //creating callback method.here countrychanged is callback method
                     xmlHttp.onreadystatechange=viewMemberChanged

                     xmlHttp.open("GET",url,true)
                     xmlHttp.send(null)
                 }

             }
            function viewMemberChanged()
            {

                if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
                {
                    //getting response from server(Servlet)
                   var json = JSON.parse(xmlHttp.responseText);
        
                   
                //displaying response in select box by using that id
                if(json.email == "-"){
                    //document.getElementById("emailtr").style.display = "none";
                    //document.getElementById("birthDatetr").style.display = "none";
                    //document.getElementById("genretr").style.display = "none";
                    //document.getElementById("relationtr").style.display = "block";
                    document.getElementById("firstNameInactive").innerHTML=json.firstName;
                    document.getElementById("lastNameInactive").innerHTML=json.lastName;
                    document.getElementById("relationInactive").innerHTML=json.relation;
                    document.getElementById("photoShowInactive").setAttribute("src","Controller?newproperties=SHOWPICTURE&userID="+json.userID);
                    
                }else{
                    //document.getElementById("relationtr").style.display = "none";
                    //document.getElementById("emailtr").style.display = "block";
                    //document.getElementById("birthDatetr").style.display = "block";
                    //document.getElementById("genretr").style.display = "block";
                    document.getElementById("firstNames").innerHTML=json.firstName;
                    document.getElementById("lastNames").innerHTML=json.lastName;
                    document.getElementById("emails").innerHTML=json.email;
                    document.getElementById("sexs").innerHTML=json.sex;
                    //document.getElementById("relation").innerHTML=json.relation;
                    document.getElementById("birthDates").innerHTML=json.birthDate;
                    document.getElementById("photoShow").setAttribute("src","Controller?newproperties=SHOWPICTURE&userID="+json.userID);
                }
                    
                    
//                  
                }
            }
            
            
