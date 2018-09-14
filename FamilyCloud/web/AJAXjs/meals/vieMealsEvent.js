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
function viewMealsEvent(mealID)
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
        var url = "Controller?newproperties=VIEWMEALSEVENT&mealID=" + mealID;
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = viewMealsChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }

}
function viewMealsChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        
        //getting response from server(Servlet)
        var json = JSON.parse(xmlHttp.responseText);


         if(json.creator=="true"){
            document.getElementById("editMealEventButton").style.display = "block";
            
            document.getElementById("deleteMealEventButton").style.display = "block";
            
            
        }else{
            document.getElementById("editMealEventButton").style.display = "none";
            document.getElementById("deleteMealEventButton").style.display = "none";
        }
        
        
        document.getElementById("editMealButtonSave").setAttribute("value",json.mealID);
        document.getElementById("deleteMealEventButton").setAttribute("value",json.mealID);
        document.getElementById("delete_meal").setAttribute("value",json.mealID);
        
        document.getElementById("mealCreator").innerHTML = json.createdBy;
        
        document.getElementById("viewMealName").innerHTML = json.mealName;
        document.getElementById("viewPlace").innerHTML = json.place;
        document.getElementById("viewDescription").innerHTML = json.description;
        document.getElementById("viewDatetime").innerHTML = (json.datetime);
        document.getElementById("viewReputanceMeals").innerHTML = (json.reputance);
        document.getElementById("viewReminderMeals").innerHTML = (json.reminderView);
        
        document.getElementById("editMealName").setAttribute ("value", json.mealName);
        document.getElementById("editPlace").setAttribute("value", json.place);
        document.getElementById("editDescription").value = json.description;
        document.getElementById("editDates").setAttribute("value", json.datetime);
        if(json.reputance!=""){
            document.getElementById("editReputance").checked = true;
            if(json.daily){
                document.getElementById("editDaily").checked = true;
            }
            if(json.weekly){
                document.getElementById("editWeekly").checked = true;
            }
            if(json.monthly){
                document.getElementById("editMonthly").checked = true;
            }
            document.getElementById("editExpDate").setAttribute("value",json.expDate)
            showElement('mycheckboxdiv5');
        }
        if(json.reminder!="No reminder"){
            document.getElementById("editReminderCheck").checked =true;
            showElement('mycheckboxdiv6');
        }
        if(json.reminder == "hourly"){
            document.getElementById("editHourly").checked = true; 
            showElement('myRadioDiv2');
            document.getElementById("EditHourinput").setAttribute("value",json.hoursRemindBefore);
        }
        if(json.reminder == "day1ago"){
            document.getElementById("edit1Rem").checked = true;
        }
        if(json.reminder == "day2ago"){
            document.getElementById("edit2Rem").checked = true;
        }
        if(json.reminderDate != "0"){
            document.getElementById("editReminderCheck").checked =true;
            document.getElementById("mycheckboxdiv6").style.display = "block";
            document.getElementById("editReminderDateMeals").setAttribute("value",json.reminderDate);
        }

        



    }
}


