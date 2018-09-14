<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="col-sm-12 contentPage">
    
    
        <div class="col-sm-12" id="example1">
                <h1>Welcome ${myUser.firstName} </h1>
                <br>
                <h4 style="text-align: justify;">Thank you participating on the site and be ready for an unforgettable trip with your 
                    loved family! In order to continue create a family or take participation to other family created already! Have fun!</h4>
                <div class="col-sm-3 col-sm-offset-8" >
                    <br><br><br>
                <button type="button" class="btn btn-primary" id="addeventbutton" data-toggle="modal" data-target="#myModalcreatefamily" >  <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>  Create Family</button> 
                </div>
            </div>   
     
<div class="row ">
    <div class="col-sm-6 ">
        <br><br>
        <br>
        <h4>${family_inviter.firstName} added you to his family . Do you want to participate?</h4>
    </div>
    <div class="col-sm-2 ">
         <br><br>
        <br>
            <button type="button" value="${notif_invitation.notificationID}" class="btn btn-primary" onclick="accept_invitation(this.value)" id="addMemberbutton" > <span class="glyphicon glyphicon-ok" aria-hidden="true"></span> Accept</button>
    </div>
    
    <div class="col-sm-2 ">
         <br><br>
        <br>
            <button type="button" value="${notif_invitation.notificationID}" class="btn btn-primary" onclick="decline_invitation(this.value)" id="declineMemberbutton" > <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Decline</button>
    </div>
    </div>

</div>