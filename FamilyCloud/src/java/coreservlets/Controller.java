
package coreservlets;
import events.Events;
import events.EventHandlerBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.ResourceBundle;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Controller extends HttpServlet {

     protected HashMap events= new HashMap();
     
     public void init() throws ServletException{
         
      
      ResourceBundle bundle = ResourceBundle.getBundle("newproperties");
      Enumeration e = bundle.getKeys();
        
        while(e.hasMoreElements()) {
           String key = (String) e.nextElement();
           String value = bundle.getString(key);
           try {
                EventHandlerBase event =
                (EventHandlerBase) Class.forName(value).newInstance();
                events.put(key, event);
                
                } catch(Exception exc) {
                exc.printStackTrace();
            }
        }
    }
    
     public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
     
     
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {      
       
        
       
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action");

        
        if (session == null) {
            session = request.getSession();
        }

        String event = validateEvent(request);
        

        EventHandlerBase handler = getEventHandler(event);

        try {
            handler.process(session, request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("\n\n\n\n\n\n\n\n\n\nUNKNOWN\n\n\n\n\n\n\n\n\n");
            handler = getEventHandler(Events.UNKNOWN.toString());
        }

        handler.forward(request, response);
    }
    
    protected String validateEvent(HttpServletRequest request) {
        String event = request.getParameter("newproperties");
        if (event == null || !events.containsKey(event)) {
        event = Events.UNKNOWN.toString();
        }
        
        return event;
     }
    
    protected EventHandlerBase getEventHandler(String e) {
            EventHandlerBase h;
            try {
            h = (EventHandlerBase) events.get(e);
            } catch(Exception exc) {
            h = (EventHandlerBase)events.get(Events.UNKNOWN.toString());
            }
           
            return h;
    }
    
    
    
  }

   
   
