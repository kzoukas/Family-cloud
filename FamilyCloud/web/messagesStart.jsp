

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-sm-12 contentPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Messages</h3>

    </div>
<!--    <div class="row">
        <div class="col-sm-4" >
            <h4>Choose a family member:</h4>
        </div>
    </div>-->
    
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

                    <div class="col-sm-12 chat" id="messagescreen" style="background-color: white; border:2px solid #7392BA; ">
                        
                        <h4 style="font-size: 28px; color: #A6BADE; margin-left: 20px; margin-top: 90px;">Choose a family member to chat!</h4><br>
                        
                        
                    </div>
                </div>
                

            </div>

        </div>

</div>