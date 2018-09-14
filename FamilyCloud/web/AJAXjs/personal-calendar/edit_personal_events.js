
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
function editPersonalEvent()
{
    var activityID = document.getElementById("saveChangesButtonPC").value;
    $('#EditEventModalpc').modal('hide');
    
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {

        var daily = document.getElementById("editDailyPC").checked;
        var weekly = document.getElementById("editWeeklyPC").checked;
        var monthly = document.getElementById("editMonthlyPC").checked;
      


        var radios = document.getElementsByName("editreminderPC");
        if(document.getElementById("editreminderCheckedPC").checked==true){
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
        var hoursbefore;
         if( radios=="hourly"){
             
             hoursbefore=document.getElementById("EditHourinputPC").value;
         }
        else
        {
             hoursbefore="0";
        
        }
        
        
       
       
        var url = "Controller?newproperties=EDITPCSAVECHANGS&activityName=" + document.getElementById("editEventTitlePC").value +
                "&category=" + document.getElementById("editCategoryPC").value +
                "&startingDate=" + document.getElementById("editStartingDatePC").value +
                "&endingDate=" + document.getElementById("editEndingDatePC").value +
                "&comment=" + document.getElementById("editCommentPC").value +
                "&daily=" + daily +
                "&weekly=" + weekly +
                "&monthly=" + monthly +
                "&reminder=" + radios +
                "&hoursBefore=" + hoursbefore +
                "&expDate=" + document.getElementById("editExpDatePC").value+
                "&activityID=" + activityID +
                "&reminderDate=" + document.getElementById("editReminderDatePC").value;
        
        //creating callback method.here countrychanged is callback method
        
        xmlHttp.onreadystatechange = editPersonalEventChanged

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function editPersonalEventChanged()
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


