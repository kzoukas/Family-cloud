

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:choose>
    <c:when test="${notifications.size() == 0}"> 
        <li>
            <button id="notifications_events">
                ${no_notifications} <br>
            </button>
        </li>  
    </c:when> 
    <c:otherwise>
      
        <c:forEach items="${notifications}" var="notes">
            <li>

                <c:choose>
                        <c:when test="${(notes.notification_type == 'reminderNot')}">
                            
                            <button class="notification_events" value="${notes.notificationID}" onclick="goToNotificationLocationPCreminder(this.value)" id="reminderNotPC"><img style="float: left" class="img-responsive img-circle"  src="images/bell.jpg" alt="flower" width="45" height="45" > ${notes.messages}<br> </button>
                        </c:when>
                        <c:when test="${(notes.notification_type == 'reminderNotMeals')}">
                            
                            <button class="notification_events" value="${notes.notificationID}" onclick="goToNotificationLocationMEALSreminder(this.value)" id="reminderNotMEALS"><img style="float: left" class="img-responsive img-circle"  src="images/bell.jpg" alt="flower" width="45" height="45" > ${notes.messages}<br> </button>
                        </c:when>
                        <c:when test="${(notes.notification_type == 'reminderNotFC')}">
                            
                            <button class="notification_events" value="${notes.notificationID}" onclick="goToNotificationLocationFCreminder(this.value)" id="reminderNotFC"><img style="float: left" class="img-responsive img-circle"  src="images/bell.jpg" alt="flower" width="45" height="45" > ${notes.messages}<br> </button>
                        </c:when>    
                        <c:otherwise>
                            
                            <button class="notification_events" value="${notes.notificationID}" onclick="goToNotificationLocation(this.value)" id="notification_events"><img style="float: left" class="img-responsive img-circle" src="Controller?newproperties=SHOWPICTURE&userID=${notes.userID_A}" alt="Flowers" width="40" height="40"> ${notes.messages}<br> </button>
                        </c:otherwise>   
                            
                    </c:choose>
            </li>
             <li class="divider dividernotification " ></li>

        </c:forEach>  
       
    </c:otherwise>
</c:choose>