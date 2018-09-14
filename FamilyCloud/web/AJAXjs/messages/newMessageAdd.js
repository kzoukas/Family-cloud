



var xhr = new XMLHttpRequest();
function postMessage(userID) {
  var form = document.getElementById("postMessageForm");
  
   
   if((document.getElementById("message_text").value != " " ) && (document.getElementById("message_image").value != " ")) {
    // FormData receives the whole form
    var formData = new FormData(form);
    
    
    // We send the data where the form wanted
    var action = "Controller?newproperties=POSTMESSAGE&receiverID="+userID;     
    
     
    // Code common to both variants
    sendMessagesReq(formData, action);
    // Avoid normal form submission
    return false;
  }
  
}

function sendMessagesReq(formData, uri) {
  // Get an XMLHttpRequest instance
 
    xhr.onreadystatechange=sendMessageChanged

  // Set up request
  xhr.open('POST', uri, true);
  // Fire!
  xhr.send(formData);
}


// Handle the response from the server
function sendMessageChanged() {
    if (xhr.readyState==4 || xhr.readyState=="complete"){
       var showstates = xhr.responseText;


                    //displaying response in select box by using that id
      document.getElementById("pageNew").innerHTML=showstates;
      var element = document.getElementById("messagescreen");
        element.scrollTop = element.scrollHeight;
    }
  }

 

