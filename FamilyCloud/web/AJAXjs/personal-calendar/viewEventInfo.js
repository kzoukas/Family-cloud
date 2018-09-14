
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
function viewPersonalEvent(activityID)
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
        var url = "Controller?newproperties=VIEWPERSONALEVENT&activityID=" + activityID;
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = viewPeChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function viewPeChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete") {
        //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);

        //displaying response in select box by using that id
        document.getElementById("saveChangesButtonPC").setAttribute("value", json.activityID);
        document.getElementById("editEventButtonPC").setAttribute("value", json.activityID);

        document.getElementById("familyEventTilePC").innerHTML = json.event_title;
        document.getElementById("familyStartingDatePC").innerHTML = json.starting_date;
        document.getElementById("familyEndingDatePC").innerHTML = json.ending_date;
        document.getElementById("familyCategoryPC").innerHTML = json.category;
        document.getElementById("familyReminderPC").innerHTML = json.reminderView;
        document.getElementById("familyDescriptionPC").innerHTML = json.description;
        document.getElementById("viewReputancePC").innerHTML = json.reputance;
        }
    
//    document.getElementById("deleteEventButtonPC").setAttribute("value", json.activityID);
    document.getElementById("delete_eventPC").setAttribute("value", json.activityID);



}



