



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
function gotoDeleteProduct(productID){
    document.getElementById("productIDToDel").setAttribute("value",productID);
    
}
function deleteProduct(productID)
{

    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {
        
        var url = "Controller?newproperties=DELETEPRODUCT&productID=" + productID;
        //creating callback method.here countrychanged is callback method
        
        xmlHttp.onreadystatechange = deleteProductChanged
        
        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function deleteProductChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var showstates = xmlHttp.responseText;

        //var json = JSON.parse(xmlHttp.responseText);


        //displaying response in select box by using that id
        //document.getElementById("firstname").innerHTML=json.firstname;
        //displaying response in select box by using that id
        document.getElementById("pageNew").innerHTML = showstates;
//                  
    }
}


