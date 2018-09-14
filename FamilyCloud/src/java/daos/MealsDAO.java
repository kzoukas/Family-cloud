
package daos;

import db.model.Meals;
import java.util.List;
import models.MealsBO;



/**
 *
 * @author Vaggos
 */
public interface MealsDAO {
  public boolean addMeal(Meals meal);
  public List<MealsBO> getMealsListBasedOnDirector(int director) throws DBOperationException;
  public Meals getMealEventBasedOnID(int mealID) throws DBOperationException;
  public boolean updateMealEvent(Meals meal, int mealID);
  public boolean deleteMealEvent(int mealID);
}
