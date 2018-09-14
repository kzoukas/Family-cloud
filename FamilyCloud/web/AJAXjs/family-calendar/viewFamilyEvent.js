
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
function viewFamilyEvent(activityID)
{
    
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {


        //sending selected country to servlet
        var url = "Controller?newproperties=VIEWFAMILYEVENT&activityID=" + activityID;
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = viewFamilyEventChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function viewFamilyEventChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);
        document.getElementById("editEventButton").setAttribute("value", json.activityID);
         if(json.creator=="true"){
            document.getElementById("editEventButton").style.display = "block";
            
            document.getElementById("deleteEventButton").style.display = "block";
            //document.getElementById("deleteEventButton").setAttribute("value", json.activityID);
            
        }else{
            document.getElementById("editEventButton").style.display = "none";
            document.getElementById("deleteEventButton").style.display = "none";
        }
        //displaying response in select box by using that id
        document.getElementById("editSaveChangesFC").setAttribute("value", json.activityID);
        document.getElementById("delete_eventFC").setAttribute("value", json.activityID);
        document.getElementById("importToPersonal").setAttribute("value", json.activityID);
        
        document.getElementById("activityFCcreator").innerHTML = json.createdBy;
        
        document.getElementById("EventTileFC").innerHTML = json.event_title;
        document.getElementById("StartingDateFC").innerHTML = json.starting_date;
        document.getElementById("EndingDateFC").innerHTML = json.ending_date;
        document.getElementById("CategoryFC").innerHTML = json.category;
        document.getElementById("viewReputanceFC").innerHTML = json.reputance;
        document.getElementById("viewReminderFC").innerHTML = json.reminderView;
        
        document.getElementById("AssignedToFC").innerHTML = json.assignedTo;
        
        //document.getElementById("reminderFC").innerHTML = json.reminder;
        document.getElementById("editTitleFC").setAttribute("value",json.event_title);
        document.getElementById("editCategoryFC").setAttribute("value", json.category);
        document.getElementById("editStartingDateFC").setAttribute("value", json.starting_date);
        document.getElementById("editEndingDateFC").setAttribute("value", json.ending_date);
        document.getElementById("editCommentFC").value = json.comment;
         if(json.reputance!=""){
            document.getElementById("editReputanceFC").checked = true;
            if(json.daily){
                document.getElementById("editDailyFC").checked = true;
            }
            if(json.weekly){
                document.getElementById("editWeeklyFC").checked = true;
            }
            if(json.monthly){
                document.getElementById("editMonthlyFC").checked = true;
            }
            document.getElementById("editexpDateFC").setAttribute("value",json.expDate);
            document.getElementById("editReputanceDivFC").style.display = "block";
        }
        if(json.reminder!="No reminder"){
            document.getElementById("editReminderFC").checked =true;
            document.getElementById('editReminderDivFC').style.display = "block";
        }
        if(json.reminder == "hourly"){
            document.getElementById("editHourlyFC").checked = true; 
            document.getElementById("editHourlyDivFC").style.display = "block";
            document.getElementById("editHourinputFC").setAttribute("value",json.hoursRem);
        }
        if(json.reminder == "day1ago"){
            document.getElementById("edit1RemFC").checked = true;
        }
        if(json.reminder == "day2ago"){
            document.getElementById("edit2RemFC").checked = true;
        }
        if(json.reminderDate != "0"){
            document.getElementById("editReminderFC").checked =true;
            document.getElementById("editReminderDivFC").style.display = "block";
            document.getElementById("editReminderDateFC").setAttribute("value",json.reminderDate);
        }
        
//        document.getElementById("familyDescription").innerHTML = json.description;
        
//        document.getElementById("deleteEventButton").setAttribute("value", json.activityID);
//        document.getElementById("delete_event").setAttribute("value", json.activityID);
//
//
//
//        document.getElementById("editfamilyDescription").value = json.description;
//        document.getElementById("editfamilyEventTitle").setAttribute("value", json.event_title);
//        document.getElementById("editfamilyCategory").setAttribute("value", json.category);
//        document.getElementById("editStartingDate").setAttribute("value", json.starting_date);
//        document.getElementById("editEndingDate").setAttribute("value", json.ending_date);
//
//        document.getElementById("saveChangesButton").setAttribute("value", json.activityID);



    }
   
}
 function printFunction() {
            var is_chrome = function () { return Boolean(window.chrome); }
            if(is_chrome) 
            {
               window.print();
               setTimeout(function(){window.close();}, 10000); 
               //give them 10 seconds to print, then close
            }
            else
            {
               window.print();
               window.close();
            }
     }


