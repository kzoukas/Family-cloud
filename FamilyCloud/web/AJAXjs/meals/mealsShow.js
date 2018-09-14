

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
function mealsPlan()
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
        var url = "Controller?newproperties=MEALSPLAN";
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = mymealChange

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function mymealChange()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        //var showstates = xmlHttp.responseText;
        var showstates = xmlHttp.responseText;

        //displaying response in select box by using that id
        document.getElementById("pageNew").innerHTML = showstates;

        mealsEvents();

    }
}


function mealsEvents() {
    // page is now ready, initialize the calendar...
    
    $('#calendar').fullCalendar({
        header: {right: 'month,agendaWeek,agendaDay',
            center: 'title',
            left: 'today prev,next'},
        
        events: 'Controller?newproperties=MEALSSHOWEVENTS',
        eventColor: '#2A5482',
        eventClick: function (calEvent, jsEvent, view) {

            // change the border color just for fun
           
            $('#viewEventModalMeal').modal('show');
            viewMealsEvent(calEvent.id);
            
            
        }


        //eventColor: '#0F1E66'
    })

}
function showElement(idToShow) {
    var display = document.getElementById(idToShow).style.display;

    if (display == "none") {
        document.getElementById(idToShow).style.display = "block";
    } else {
        document.getElementById(idToShow).style.display = "none";
    }

}



