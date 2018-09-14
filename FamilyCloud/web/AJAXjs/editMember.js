




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
function editMember(userID)
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
        var url = "Controller?newproperties=EDITMEMBER&userID=" + userID;

        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = editMemberChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function editMemberChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);


        //displaying response in select box by using that id
        if (json.email == "-") {
            document.getElementById("emailEditDiv").style.display = "none";
            document.getElementById("birthDateEditDiv").style.display = "none";
            document.getElementById("sexEditDiv").style.display = "none";
            document.getElementById("relationEditDiv").style.display = "block";
            document.getElementById("relationEdit").setAttribute("value", json.relation);
            document.getElementById("firstNameEdit").setAttribute("value", json.firstName);
            document.getElementById("lastNameEdit").setAttribute("value", json.lastName);
        } else {
            document.getElementById("relationEditDiv").style.display = "none";
            document.getElementById("emailEditDiv").style.display = "block";
            document.getElementById("birthDateEditDiv").style.display = "block";
            document.getElementById("sexEditDiv").style.display = "block";
            document.getElementById("firstNameEdit").setAttribute("value", json.firstName);
            document.getElementById("lastNameEdit").setAttribute("value", json.lastName);
            document.getElementById("emailEdit").setAttribute("value", json.email);
            document.getElementById("birthDateEdit").setAttribute("value", json.birthDate);
        }



        document.getElementById("userID").setAttribute("value", json.userID);
        if (json.sex == "male") {
            document.getElementById("male").checked = true;

        } else {
            document.getElementById("female").checked = true;
        }
        document.getElementById("photoform").setAttribute("action", "PhotoServlet?userID=" + json.userID);
        document.getElementById("photoEdit").setAttribute("src", "Controller?newproperties=SHOWPICTURE&userID=" + json.userID);
    }

}
