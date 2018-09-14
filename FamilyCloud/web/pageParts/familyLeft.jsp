<%-- 
    Document   : familyLeft
    Created on : Jun 1, 2015, 2:47:52 PM
    Author     : Vaggos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="col-sm-3 non-printable columnleft" id="columnleft">
     <button type="button" class="btn btn-default visible-xs phoneMenu" data-toggle="collapse" data-target="#bs-example-navbar-collapse-5">
          
            <span >MENU</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
        </button>
    <div class="container-fluid">

<!--        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-5">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>-->

       
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-5">

            <ul class="nav nav-pills nav-stacked" id="navstackedul" >
                <li><a href="file:///C:/Users/Desktop/Desktop/site1/family-wall.html" onclick="getFamillyWall()"><span style="font-size: 22px; " class="glyphicon glyphicon-th-list glyphmargin"></span>Family Wall</a></li>
                <li><a onclick="familyCalendar()" href="file:///C:/Users/Desktop/Desktop/site1/family-calendar.html"><span style="font-size: 22px;" class="glyphicon glyphicon-calendar glyphmargin"></span>Family Calendar</a></li>
                <li><a  onclick="personalCalendar()" href="file:///C:/Users/Desktop/Desktop/site1/personal-calendar.html"><span style="font-size: 22px;" class="glyphicon glyphicon-calendar glyphmargin"></span>Personal Calendar</a></li>
                <li class="divider blackdivider" > </li>
                <li><a href="file:///C:/Users/Desktop/Desktop/site1/meals-plan.html" onclick="mealsPlan()" ><span style="font-size: 22px;" class="glyphicon glyphicon-cutlery glyphmargin"></span>Meals Plan</a></li>
                <li><a href="file:///C:/Users/Desktop/Desktop/site1/todolist.html" onclick="getToDoList()"><span  style="font-size: 22px;" class="glyphicon glyphicon-list-alt glyphmargin"></span>To Do List</a></li>
                <li><a href="file:///C:/Users/Desktop/Desktop/site1/shopping-list.html" onclick="getShoppingList()"><span style="font-size: 22px;" class="glyphicon glyphicon-shopping-cart glyphmargin"></span>Shopping List</a></li>
                <li class="divider blackdivider" > </li>
                <li><a href="file:///C:/Users/Desktop/Desktop/site1/messages.html" onclick="getMessages()" ><span style="font-size: 22px;" class="glyphicon glyphicon-envelope glyphmargin"></span>Messages</a></li>
            </ul>

        </div>

    </div>
</div>

