/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.famillyWall;

import daos.DAOFactory;
import daos.PostWallDAO;
import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Desktop
 */

public class DeletePostEventHandler  extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        int postID = Integer.parseInt(request.getParameter("postID"));
        DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
        PostWallDAO newPostDAO = mySqlFactory.getPostWallDAO();
        boolean result = newPostDAO.deletePost(postID);
        setURL("Controller?newproperties=FAMILLYWALL");
        
        
    }
}
