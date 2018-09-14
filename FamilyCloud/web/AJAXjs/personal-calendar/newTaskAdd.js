
function GetXmlHttpObject()
{
    //creating xmlhttprequestobject.common method for any ajax application
    var xmlHttp = null;
    try
    {
        // Firefox, Opera 8.0+, Safari
        xmlHttp = new XMLHttpRequest();
    }
    catch (e)
    {
        //Internet Explorer
        try
        {
            xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e)
        {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
    }
    return xmlHttp;
}
//to get states
function addTask()
{

$('#AddEventModal').modal('hide');
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {

        var daily = document.getElementById("daily").checked;
        var weekly = document.getElementById("weekly").checked;
        var monthly = document.getElementById("monthly").checked;
      


        var radios = document.getElementsByName("reminder");
        if(document.getElementById("reminderChecked").checked==true){
           for (var i = 0, length = radios.length; i < length; i++) {
              if (radios[i].checked) {
                  // do whatever you want with the checked radio
                  radios = radios[i].value;
                  

                  // only one radio can be logically checked, don't check the rest
                  break;
              }
           } 
        }
        else{

            radios="No reminder";

        }
         if( radios=="hourly"){
             
             var hoursbefore=document.getElementById("hourinput").value;
         }
        else
        {
             var hoursbefore="0";
        
        }
        
        
       
        
        var url = "Controller?newproperties=ADDTASK&activityName=" + document.getElementById("activityName").value +
                "&category=" + document.getElementById("category").value +
                "&startingDate=" + document.getElementById("startingDate").value +
                "&endingDate=" + document.getElementById("endingDate").value +
                "&comment=" + document.getElementById("comment").value +
                "&daily=" + daily +
                "&weekly=" + weekly +
                "&monthly=" + monthly +
                "&reminder=" + radios +
                "&hoursBefore=" + hoursbefore +
                "&expDate=" + document.getElementById("expDate").value + 
                "&reminderDate="+document.getElementById("reminderDatePC").value;
        
        //creating callback method.here countrychanged is callback method
        
        xmlHttp.onreadystatechange = addProductChanged

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function addProductChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var showstates = xmlHttp.responseText;

        document.getElementById("pageNew").innerHTML = showstates;
        
        myEvents();
        getNotifNumber();
    }
}


