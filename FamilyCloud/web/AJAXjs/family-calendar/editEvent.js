
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
function editEvent()
{
    var activityID = document.getElementById("editSaveChangesFC").value;
    
    $('#EditEventModal').modal('hide');
    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {

        var daily = document.getElementById("editDailyFC").checked;
        var weekly = document.getElementById("editWeeklyFC").checked;
        var monthly = document.getElementById("editMonthlyFC").checked;
      


        var radios = document.getElementsByName("editreeminderFC");
        if(document.getElementById("editReminderFC").checked==true){
           for (var i = 0, length = radios.length; i < length; i++) {
              if (radios[i].checked) {
                  // do whatever you want with the checked radio
                  radios = radios[i].value;
                  

                  // only one radio can be logically checked, don't check the rest
                  break;
              }
           } 
        }
        else{

            radios="No reminder";

        }
         if( radios=="hourly"){
             
             var hoursbefore=document.getElementById("editHourinputFC").value;
         }
        else
        {
             var hoursbefore="0";
        
        }
        var InvForm = document.forms.editfc;
                    var assignedTo = "";
                    var x = 0;
                    var count=0;

                    var temp=InvForm.multiselectAssignedToFCedit.length;
                    for (x=0;x<InvForm.multiselectAssignedToFCedit.length;x++)
                     {
                        if(InvForm.multiselectAssignedToFCedit[x].selected )
                        {
                            if(temp==1){

                                assignedTo = InvForm.multiselectAssignedToFCedit[x].value;
                            }else{

                                count=count+1;

                                if(count==1){
                                    assignedTo = InvForm.multiselectAssignedToFCedit[x].value + assignedTo ;

                                }else{

                                    assignedTo = InvForm.multiselectAssignedToFCedit[x].value + "," + assignedTo ;

                                }


                            }

                         

                        }
                     }
        
       
       
        var url = "Controller?newproperties=EDITFCSAVECHANGS&activityName=" + document.getElementById("editTitleFC").value +
                "&category=" + document.getElementById("editCategoryFC").value +
                "&startingDate=" + document.getElementById("editStartingDateFC").value +
                "&endingDate=" + document.getElementById("editEndingDateFC").value +
                "&comment=" + document.getElementById("editCommentFC").value +
                "&daily=" + daily +
                "&weekly=" + weekly +
                "&monthly=" + monthly +
                "&reminder=" + radios +
                "&assignedTo=" + assignedTo +
                "&hoursBefore=" + hoursbefore +
                "&expDate=" + document.getElementById("editexpDateFC").value+
                "&activityID=" + activityID +
                "&reminderDate=" + document.getElementById("editReminderDateFC").value;
        //creating callback method.here countrychanged is callback method
        
        xmlHttp.onreadystatechange = addProductsChanged

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function addProductsChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var showstates = xmlHttp.responseText;

        document.getElementById("pageNew").innerHTML = showstates;
       
         myEventsFamily();
         getNotifNumber();
    }
}


