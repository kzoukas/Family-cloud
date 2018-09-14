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
   function validateEmail(email)
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
            var url="Controller?newproperties=VALIDATEEMAILACTIVE&email="+email;
            //creating callback method.here countrychanged is callback method
            xmlHttp.onreadystatechange=countryChanged
           
            xmlHttp.open("GET",url,true)
            xmlHttp.send(null)
        }
        
    }
    function countryChanged()
{

      if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
      {
          //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);
        
        
        //displaying response in select box by using that id
        document.getElementById("apotelesma").innerHTML=json.messageValidate;
        document.getElementById("add_active").setAttribute("class",json.enabled);
        document.getElementById("apotelesma").setAttribute("style",json.style);
       // document.getElementById("add_active_submit").setAttribute("value",json.email);
       
      }
}