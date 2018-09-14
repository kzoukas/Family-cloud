
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="col-sm-12 contentPage">
    <div class="col-sm-12" id="todoHeader">
        <h3>Family Wall</h3>
    </div>

    <div class="panel panel-default col-sm-12" id="myPanelFamillyWall">	

        <div>
            <form role="form"  method="post" enctype="multipart/form-data"  id="form-id"   onsubmit="initFullFormAjaxUpload();
                    return false;">
                <div class="form-group">
                    <br>
                    <textarea class="form-control" rows="2"  name="other-field"  placeholder="Share your post" id="other-field-id" required></textarea>
                    <button type="submit"   class="btn btn-primary" id="postbutton" >Post</button>
                    <br>
                    <p ><input style="background-image: none" id="file-id" type="file"  name="our-file" />


                </div>

            </form>



        </div>
        <div >		

            <div class="col-sm-12 " id="wallfam">

                <c:choose >

                    <c:when test="${wall_posts.size() == 0}"> 
                        <h4 style="font-size: 28px; color: #A6BADE; margin-left: 90px; margin-top: 90px;">You have no posts!</h4><br>
                        <h4 style="font-size: 28px; color: #A6BADE; margin-left: 90px; margin-top: 20px;">Share your ideas and photos to your family</h4>
                    </c:when>
                    <c:otherwise>


                        <c:forEach items="${wall_posts}" var="post">

                            <c:choose >

                                <c:when test="${post.postImage == null}">
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img class="img-responsive img-circle imgWallSenderFit" src="Controller?newproperties=SHOWPICTURE&userID=${post.createdBy}" alt="Flowers" width="70" height="90">
                                        </div>
                                        <div class="bubble me col-sm-9">
                                            <c:choose>
                                                <c:when test="${(myUser.userID == myUser.director)||(post.createdBy == myUser.userID)}">

                                                    <button style="float: right" type="button" class="close" value="${post.postID}" onclick="deletePostWall(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </c:when>
                                            </c:choose>
                                            ${post.text}
                                        </div>
                                    </div>
                                    <div class="col-sm-10 col-sm-offset-2">

                                        <p>Posted at ${post.datetime}</p><br>
                                    </div>


                                </c:when>
                                <c:otherwise>
                                    <br>
                                    <div class="row">
                                        <div class="col-sm-2">
                                            <img class="img-responsive img-circle imgWallSenderFit" src="Controller?newproperties=SHOWPICTURE&userID=${post.createdBy}" alt="Flowers" width="70" height="90">

                                        </div>
                                        <div class="bubble me col-sm-9">
                                            <c:choose>
                                                <c:when test="${(myUser.userID == myUser.director)||(post.createdBy == myUser.userID)}">
                                                    <button style="float: right" type="button" class="close" value="${post.postID}" onclick="deletePostWall(this.value)" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                </c:when>
                                            </c:choose>
                                            ${post.text} 
                                            <br>
                                            <img class="img-responsive  imgWallFit" src="Controller?newproperties=SHOWPOSTPICTURE&postID=${post.postID}"  width="450" height="450">
                                        </div>
                                    </div> 
                                    <div class="col-sm-10 col-sm-offset-2">

                                        <p>Posted at ${post.datetime}</p><br>
                                    </div>

                                </c:otherwise>
                            </c:choose> 
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>


    </div>

</div>