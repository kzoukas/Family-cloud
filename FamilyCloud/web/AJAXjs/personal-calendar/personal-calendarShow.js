

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
function personalCalendar()
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
        var url = "Controller?newproperties=PERSONALCALENDAR";
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = mycalendarChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function mycalendarChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        //var showstates = xmlHttp.responseText;
        var showstates = xmlHttp.responseText;
        document.getElementById("pageNew").innerHTML = showstates;
        myEvents();
        //getNotifNumber();



        //displaying response in select box by using that id
        //document.getElementById("pageNew").innerHTML=showstates;


    }
}

function myEvents() {

    // page is now ready, initialize the calendar...

    $('#calendar').fullCalendar({
        header: {right: 'month,agendaWeek,agendaDay',
            center: 'title',
            left: 'today prev,next'},
        
        events: 'Controller?newproperties=PERSONALCALENDARSHOWEVENTS'


        , 
        eventColor: '#2A5482',
        eventClick: function (calEvent, jsEvent, view) {

           
           

            viewPersonalEvent(calEvent.id);
            $('#viewEventModalPC').modal('show');
            

        }


        //eventColor: '#0F1E66'
    })

}
//function showElement(idToShow) {
//    var display = document.getElementById(idToShow).style.display;
//
//    if (document.getElementById("idToShow").checked==true) {
//        document.getElementById(idToShow).style.display = "block";
//    } else {
//        document.getElementById(idToShow).style.display = "none";
//    }
//    if((document.getElementById("day1ago").checked==true) || (document.getElementById("day2ago").checked==true)){
//        
//        document.getElementById("myRadioDiv").style.display = "none";
//    }







       
    
