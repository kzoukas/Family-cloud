



var xhr = new XMLHttpRequest();
function changePicture(userID) {
  var form = document.getElementById('formPicture');
  //form.onsubmit = function() {
      alert(userID)
    // FormData receives the whole form
    var formData = new FormData(form);
    
    // We send the data where the form wanted
    var action = "Controller?newproperties=CHANGEIMAGE&userID="+userID;
    
     
    // Code common to both variants
    sendXHRequest(formData, action);
    // Avoid normal form submission
    return false;
  
}

function sendXHRequest(formData, uri) {
  // Get an XMLHttpRequest instance
 
    xhr.onreadystatechange=onreadystatechangeHandler

  // Set up request
  xhr.open('POST', uri, true);
  // Fire!
  xhr.send(formData);
}


// Handle the response from the server
function onreadystatechangeHandler() {
    if (xhr.readyState==4 || xhr.readyState=="complete"){
       var showstates = xhr.responseText;


                    //displaying response in select box by using that id
      document.getElementById("pageNew").innerHTML=showstates;
    }
  }

 

