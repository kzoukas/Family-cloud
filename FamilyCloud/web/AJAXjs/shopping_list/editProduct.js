/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */






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
function editProduct(productID)
{
    
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {
        document.getElementById("productIDEdit").setAttribute("value",productID);
        //sending selected country to servlet
        var url = "Controller?newproperties=EDITPRODUCT&productID=" + productID;

        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = editProductChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }
    

}
function editProductChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);
       
        
        //displaying response in select box by using that id

        document.getElementById("productEdit").setAttribute("value", json.product);
        document.getElementById("priceEdit").setAttribute("value", json.price);
        document.getElementById("productIDEdit").setAttribute("value", json.productID);
        //document.getElementById("statusEdit").setAttribute("value", json.status);
//        document.getElementById("productIDEdit").setAttribute("value", json.productID);
//        document.getElementById("directorEdit").setAttribute("value", json.director);
        
        if (json.status == "bought") {
            document.getElementById("bought").setAttribute("checked", true);
               
        } else {
            document.getElementById("nBought").setAttribute("checked", true);
            
        }
    }

}
