
package events;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public abstract class EventHandlerBase {

    protected abstract String getURL();

    public void process(HttpSession sc, HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

    }

    
    public void forward(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        dispatch(request, response);
    }

    protected void dispatch(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        RequestDispatcher rd = request.getRequestDispatcher(getURL());
       
        if (rd == null) {

        }
        rd.forward(request, response);
    }

}
