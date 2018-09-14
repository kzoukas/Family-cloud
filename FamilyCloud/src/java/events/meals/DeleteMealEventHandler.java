/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package events.meals;

import daos.DAOFactory;
import daos.DBOperationException;
import daos.MealsDAO;
import db.model.Meals;
import events.EventHandlerBase;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vaggos
 */
public class DeleteMealEventHandler  extends EventHandlerBase {

    private String URL;

    private void setURL(String url) {
        this.URL = url;
    }

    protected String getURL() {
        return this.URL;
    }

    public void process(HttpSession mySession, HttpServletRequest request, HttpServletResponse response) {
        try {
            int mealID = Integer.parseInt(request.getParameter("mealID"));
            DAOFactory mySqlFactory = DAOFactory.getDAOFactory(DAOFactory.MYSQL);
            MealsDAO mealDAO = mySqlFactory.getMealsDAO();
            Meals deletedMeal=mealDAO.getMealEventBasedOnID(mealID);
            String deletedName=deletedMeal.getMealName();
            
            boolean result=mealDAO.deleteMealEvent(mealID);
            if(result){
                    request.setAttribute("messageMyMeals", "<img  src=\"images/valid.png\" alt=\"Cloud\" width=\"20\" height=\"20\">The meal "+ deletedName +" has been deleted successfully");
            }
            
            setURL("Controller?newproperties=MEALSPLAN");
            
            
        } catch (DBOperationException ex) {
            Logger.getLogger(DeleteMealEventHandler.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
    }
}
