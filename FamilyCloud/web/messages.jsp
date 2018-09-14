

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-12 contentPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Messages</h3>

    </div>
    <!--    <div class="row">
            <div class="col-sm-3" >
                <h4>Choose a family member:</h4>
            </div>
        </div>-->
    <div>	
        <div  class="col-sm-3" >

            <div  class="col-sm-8" >
                <c:forEach items="${myFamilyMembers}" var="member">
                    <br>
                    <div class="row" style="margin-top: 10px;">

                        ${member.firstName}
                        <div class="row">
                            <button style=" background: transparent; border: none !important;" value="${member.userID}"  onclick="showConversation(this.value)"><img  class="choosePictureFit img-responsive" src="Controller?newproperties=SHOWPICTURE&userID=${member.userID}" alt="Flowers" width="120" height="120"></button>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>         


        <div class="col-sm-9" id="conversation" >


            <div class="panel panel-default col-sm-12 " id="messagepanel" >

                <div class="panel-body" >		
                    <h4>${memberToChat}</h4>
                    <div class="col-sm-12 chat" id="messagescreen" style="background-color: white; border:2px solid #7392BA; ">

                        <c:choose >

                            <c:when test="${message_posts.size()==0}">
                                <h4 style="font-size: 28px; color: #A6BADE; margin-left: 20px; margin-top: 90px;">You have no messages with ${memberToChat} yet.</h4><br>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${message_posts}" var="messages">   

                                    <c:choose >

                                        <c:when test="${messages.messageImage == null}">
                                            <c:choose>
                                                <c:when test="${myUser.userID == messages.senderID}">
                                                    <div class="row">
                                                        <img style="float: left" class="img-responsive img-circle senderPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${messages.senderID}" alt="Flowers" width="40" height="40">
                                                        <div class="bubble me col-sm-6">
                                                            <button id="hidden_button" style="display: none" value="${messages.receiverID}" ></button>
                                                            <c:choose>
                                                                <c:when test="${(myUser.userID == myUser.director)||(messages.senderID == myUser.userID)}">

                                                                    <button style="float: right" type="button" class="close" value="${messages.messageID}" onclick="deleteMessage(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                </c:when>
                                                            </c:choose>
                                                            ${messages.text} </div>
                                                    </div>
                                                </c:when>

                                                <c:otherwise>
                                                    <div class="row">
                                                        <img style="float: right" class="img-responsive img-circle senderPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${messages.senderID}" alt="Flowers" width="40" height="40">
                                                        <div class="bubble you col-sm-6">
                                                            <button id="hidden_button" style="display: none" value="${messages.receiverID}" ></button>
                                                            <c:choose>
                                                                <c:when test="${(myUser.userID == myUser.director)||(messages.senderID == myUser.userID)}">

                                                                    <button style="float: left" type="button" class="close" value="${messages.messageID}" onclick="deleteMessage(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                </c:when>
                                                            </c:choose>
                                                            <div style="float: right" >${messages.text} </div> </div> 
                                                    </div>    
                                                </c:otherwise>
                                            </c:choose>
                                        </c:when>
                                        <c:otherwise>
                                            <c:choose>
                                                <c:when test="${myUser.userID == messages.senderID}">
                                                    <div class="row">
                                                        <img style="float: left" class="img-responsive img-circle senderPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${messages.senderID}" alt="Flowers" width="40" height="40">
                                                        <div class="bubble me col-sm-6">
                                                            <button id="hidden_button" style="display: none" value="${messages.receiverID}" ></button>
                                                            <c:choose>
                                                                <c:when test="${(myUser.userID == myUser.director)||(messages.senderID == myUser.userID)}">

                                                                    <button style="float: right" type="button" class="close" value="${messages.messageID}" onclick="deleteMessage(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                </c:when>
                                                            </c:choose>
                                                            ${messages.text}
                                                            <img  class="img-responsive" src="Controller?newproperties=SHOWPOSTMESSAGEPICTURE&messageID=${messages.messageID}"  width="260" height="260">
                                                        </div>
                                                    </div>   

                                                </c:when>

                                                <c:otherwise>
                                                    <div class="row">
                                                        <img style="float: right" class="img-responsive img-circle senderPictureFit" src="Controller?newproperties=SHOWPICTURE&userID=${messages.senderID}" alt="Flowers" width="40" height="40">
                                                        <div class="bubble you col-sm-6">
                                                            <button id="hidden_button" style="display: none" value="${messages.receiverID}" ></button>
                                                            <c:choose>
                                                                <c:when test="${(myUser.userID == myUser.director)||(messages.senderID == myUser.userID)}">

                                                                    <button style="float: left" type="button" class="close" value="${messages.messageID}" onclick="deleteMessage(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                                </c:when>
                                                            </c:choose>
                                                            <div style="float: right" >${messages.text} </div> 
                                                            <img class="img-responsive" src="Controller?newproperties=SHOWPOSTMESSAGEPICTURE&messageID=${messages.messageID}"  width="260" height="260">
                                                        </div>
                                                    </div>    
                                                </c:otherwise>
                                            </c:choose>       
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach> 
                            </c:otherwise>
                        </c:choose>

                    </div>
                </div>
                <div class="panel-footer" style="background-color: #CCC7BE; border-radius: 0px;">
                    <form role="form" method="post" enctype="multipart/form-data" id="postMessageForm">
                        <div class="form-group">
                            <br>
                            <textarea class="form-control" rows="2" id="message_text" name="messages-textArea"></textarea>
                            <button type="button" value="${receiverID}" onclick="postMessage(this.value)"  class="btn btn-primary" id="postbutton" >Post</button>
                            <br>

                            <input style="background-image: none" id="message_image" type="file"  name="messages-file" />


                        </div>

                    </form>



                </div>

            </div>

        </div>



    </div>


</div>