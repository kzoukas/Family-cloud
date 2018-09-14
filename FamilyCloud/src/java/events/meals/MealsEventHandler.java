


package events.meals;

import dao.impl.MySqlMealsDAO;
import events.EventHandlerBase;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.UserBO;
import models.MealsBO;


/**
 *
 * @author Vaggos
 */

    
    public class MealsEventHandler extends EventHandlerBase{
            
     private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }
    
     public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
       
            setURL("mealsPlan.jsp");
            
        }catch(Exception e){
            
            
        }
    
     }
     
}

    

