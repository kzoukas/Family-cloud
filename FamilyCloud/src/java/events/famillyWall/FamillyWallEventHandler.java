

package events.famillyWall;
import com.google.common.collect.Lists;
import dao.impl.MySqlPostWallDAO;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.PostWallBO;
import models.UserBO;




public class FamillyWallEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            
             
           
            UserBO current_user = (UserBO) mySession.getAttribute("myUser");
            MySqlPostWallDAO postWall =new MySqlPostWallDAO();
            List<PostWallBO> wall_post = postWall.getListPostWall(current_user.getDirector());
            List<PostWallBO> wall_posts = Lists.reverse(wall_post);
            mySession.setAttribute("wall_posts", wall_posts);
            setURL("familyWall.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
}
