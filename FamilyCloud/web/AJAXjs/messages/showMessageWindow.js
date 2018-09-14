

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
function showConversation(userID)
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
        var url = "Controller?newproperties=SHOWCONVERSATION&receiverID=" + userID;

        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = showConversationChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function showConversationChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        
        var showstates = xmlHttp.responseText;
        
        document.getElementById("pageNew").innerHTML=showstates;
        var element = document.getElementById("messagescreen");
        element.scrollTop = element.scrollHeight;
        
    }

}
