

package events;


import events.EventHandlerBase;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
           
            
            if (mySession != null) {
         //   mySession.removeAttribute("FirstName");
            mySession.removeAttribute("myUser");

            mySession.invalidate();
           
            request.setAttribute("messageLogout", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">You have successfully logged out.");
            
             }
           
            setURL("first.jsp");
            
            
        }catch(Exception e){
            
            
        }
    }
      

}
