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
function editMealSaveChanges()
{
    $('#EditMealEventModal').modal('hide');
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {

        var daily = document.getElementById("editDaily").checked;
        var weekly = document.getElementById("editWeekly").checked;
        var monthly = document.getElementById("editMonthly").checked;
//        var description = "";
//        var expDate = "";//arxikopoihseis
        var hoursbefore="0";
        description = document.getElementById("editDescription").value;
        
        expDate = document.getElementById("editExpDate").value;
        var radios = document.getElementsByName("editReminder");
        if(document.getElementById("editReminderCheck").checked==true){
           for (var i = 0, length = radios.length; i < length; i++) {
              if (radios[i].checked) {
                  // do whatever you want with the checked radio
                  radios = radios[i].value;
                  

                  // only one radio can be logically checked, don't check the rest
                  break;
              }
           } 
        }else{

            radios="No reminder";

        }if( radios=="hourly"){
             
             hoursbefore=document.getElementById("editHourinput").value;
         }
        else
        {
             hoursbefore="0";
        
        }
        var mealID = document.getElementById("editMealButtonSave").value;
       
        var url = "Controller?newproperties=EDITMEAL&mealName=" + document.getElementById("editMealName").value +
                "&dates=" + document.getElementById("editDates").value +
                "&place=" + document.getElementById("editPlace").value+
                "&description=" + description+
                "&daily=" + daily +
                "&weekly=" + weekly +
                "&monthly=" + monthly +
                "&reminder=" + radios +
                "&hoursBefore=" + hoursbefore+
                "&expDate=" + expDate +
                "&mealID=" + mealID +
                "&reminderDate=" + document.getElementById("editReminderDateMeals").value;

        //creating callback method.here countrychanged is callback method

        xmlHttp.onreadystatechange = editMealChanged

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function editMealChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var showstates = xmlHttp.responseText;

        document.getElementById("pageNew").innerHTML = showstates;
        mealsEvents();
        getNotifNumber();
    }
}