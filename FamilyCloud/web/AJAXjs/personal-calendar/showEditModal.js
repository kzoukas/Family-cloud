/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function showEdit(activityID) {

    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {
       
        //$('#viewEventModalPC').modal('hide');
        //sending selected country to servlet
        var url = "Controller?newproperties=VIEWPERSONALEVENT&activityID=" + activityID;
        //creating callback method.here countrychanged is callback method
        xmlHttp.onreadystatechange = showEditChanged

        xmlHttp.open("GET", url, true)
        xmlHttp.send(null)
    }
}

function showEditChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
        //getting response from server(Servlet)

        var json = JSON.parse(xmlHttp.responseText);
    
    document.getElementById("editEventTitlePC").setAttribute("value", json.event_title);
    document.getElementById("editCategoryPC").setAttribute("value", json.category);
    document.getElementById("editStartingDatePC").setAttribute("value",json.starting_date);
    document.getElementById("editEndingDatePC").setAttribute("value", json.ending_date);
    document.getElementById("editCommentPC").value = json.description;
    if(json.reputance!=""){
            document.getElementById("editReputancePC").checked = true;
            document.getElementById("editReputancePCdiv1").style.display = "block";
            
            if(json.daily){
                document.getElementById("editDailyPC").checked = true;
            }
            if(json.weekly){
                document.getElementById("editWeeklyPC").checked = true;
            }
            if(json.monthly){
                document.getElementById("editMonthlyPC").checked = true;
            }
            document.getElementById("editExpDatePC").setAttribute("value",json.expDate);
            if(json.reminder!="No reminder"){
                document.getElementById("editreminderCheckedPC").checked =true;
                document.getElementById("editReminderDiv").style.display = "block";
            }
            if(json.reminder == "hourly"){
                document.getElementById("editHourlyPC").checked = true;
                document.getElementById("editMyRadioPCDiv").style.display = "block";
                document.getElementById("EditHourinputPC").setAttribute("value",json.hoursRemindBefore);
            }
            if(json.reminder == "day1ago"){
                document.getElementById("edit1RemPC").checked = true;
            }
            if(json.reminder == "day2ago"){
                document.getElementById("edit2RemPC").checked = true;
            }
            
            
        }
        if(json.reminderDate != "0"){
            document.getElementById("editreminderCheckedPC").checked =true;
            document.getElementById("editReminderDiv").style.display = "block";
            document.getElementById("editReminderDatePC").setAttribute("value",json.reminderDate);
        }
    

}
