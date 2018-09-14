<%-- 
    Document   : familyTop
    Created on : Jun 1, 2015, 2:44:21 PM
    Author     : Vaggos
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default non-printable" id="famcloud">
    <div class="container-fluid">


        <div class="row" >

            <div class="col-sm-2 col-sm-offset-1">
                <a class="navbar-brand" href="#" onclick="getMyFamily()"> <img class="img-responsive "  src="images/the-cloud1.png" alt="Cloud" width="220" height="220" > </a>
                    
                
            </div>

            <div class="col-sm-3 col-sm-offset-2" id="threenav">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>

                </div>
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">	
                    <ul class="nav navbar-nav">
                        <li><a href="#" onclick="getMyFamily()"><span class="glyphicon glyphicon-th-list "></span>  My Family</a></li>
                        <li class="divider-vertical dividervert"></li>
                        <li><a href="#" onclick="getMyProfile()"><span class="glyphicon glyphicon-user "></span> My Profile</a></li>
                    </ul>

                </div>
            </div>

            <div class="col-sm-2" >
                <!--                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                                                <span class="sr-only">Toggle navigation</span>
                                                <span class="icon-bar"></span>
                                                
                                            </button>
                                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">	
                                        <ul class="nav navbar-nav " id="logout">
                                            <li data-toggle="modal" data-target="#logoutmod"><a href="#logoutmod" >Logout </a></li>
                
                                        </ul>-->
                
                <p id="emailnav">${myUser.firstName}</p>
            </div>
       

        <div class="col-sm-2" id="threenav1">
            
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>

            </button>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-2">	
                <ul class="nav navbar-nav " id="logout">
                    <li data-toggle="modal" data-target="#logoutmod"><a href="#logoutmod" >Logout </a></li>

                </ul>


            </div>


        </div>
    </div>
    </div><!-- /.container-fluid -->
    
</nav>

