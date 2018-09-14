
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
function addTaskFamily()
{

    xmlHttp = GetXmlHttpObject();
    if (xmlHttp == null)
    {
        alert("Browser does not support HTTP Request")
        return
    }
    else
    {

         $('#AddEventFamily').modal('hide');
        var daily = document.getElementById("daily").checked;
        var weekly = document.getElementById("weekly").checked;
        var monthly = document.getElementById("monthly").checked;
      


        var radios = document.getElementsByName("reminder");
        if(document.getElementById("reminderChecked").checked==true){
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
             
             var hoursbefore=document.getElementById("hourinput").value;
         }
        else
        {
             var hoursbefore="0";
        
        }
        
        
                    var InvForm = document.forms.addfc;
                    var assignedTo = "";
                    var x = 0;
                    var count=0;

                    var temp=InvForm.multiselectAssignedToFC.length;
                    for (x=0;x<InvForm.multiselectAssignedToFC.length;x++)
                     {
                        if(InvForm.multiselectAssignedToFC[x].selected )
                        {
                            if(temp==1){

                                assignedTo = InvForm.multiselectAssignedToFC[x].value;
                            }else{

                                count=count+1;

                                if(count==1){
                                    assignedTo = InvForm.multiselectAssignedToFC[x].value + assignedTo ;

                                }else{

                                    assignedTo = InvForm.multiselectAssignedToFC[x].value + "," + assignedTo ;

                                }


                            }

                         //alert(InvForm.kb[x].value);

                        }
                     }
                      
                    
       
        var url = "Controller?newproperties=ADDTASKFAMILY&activityName=" + document.getElementById("activityName").value +
                "&category=" + document.getElementById("category").value +
                "&startingDate=" + document.getElementById("startingDate").value +
                "&endingDate=" + document.getElementById("endingDate").value +
                "&comment=" + document.getElementById("comment").value +
                "&daily=" + daily +
                "&weekly=" + weekly +
                "&monthly=" + monthly +
                "&reminder=" + radios +
                "&hoursBefore=" + hoursbefore +
                "&assignedTo="+ assignedTo +
                "&expDate=" + document.getElementById("expDate").value +
                "&reminderDate=" + document.getElementById("reminderDateFC").value;
        
        //creating callback method.here countrychanged is callback method
        
        xmlHttp.onreadystatechange = addProductFCChanged

        xmlHttp.open("GET", url, true);
        xmlHttp.send(null);
    }

}
function addProductFCChanged()
{

    if (xmlHttp.readyState == 4 || xmlHttp.readyState == "complete")
    {
        //getting response from server(Servlet)
        var showstates = xmlHttp.responseText;

        document.getElementById("pageNew").innerHTML = showstates;
       
         myEventsFamily();
         
    }
}


