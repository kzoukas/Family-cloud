



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
function addProduct()
{

    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {
        $('#AddProduct').modal('hide');
        var radios = document.getElementsByName("bStatus");

        for (var i = 0, length = radios.length; i < length; i++) {
            if (radios[i].checked) {
                // do whatever you want with the checked radio
                var bStatus = radios[i].value;

                // only one radio can be logically checked, don't check the rest
                break;
            }
        }
        
        
        //sending selected country to servlet
        var url = "Controller?newproperties=ADDPRODUCT&product=" + document.getElementById("product").value +
                "&price=" + document.getElementById("price").value+
                "&bStatus=" + bStatus;
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

        //var json = JSON.parse(xmlHttp.responseText);


        //displaying response in select box by using that id
        //document.getElementById("firstname").innerHTML=json.firstname;
        //displaying response in select box by using that id
        document.getElementById("pageNew").innerHTML = showstates;
//                  
    }
}


