/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.FamilyCalendar;
import java.util.List;
import models.FamilyCalendarBO;

/**
 *
 * @author Desktop
 */

public interface FamilyCalendarDAO {
    public boolean addTaskFamily(FamilyCalendar pc);
    public boolean deleteFamilyEvent(int activityID);
    public boolean updateFcEvent(FamilyCalendar fc, int activityID);
    
            
    public List<String> getCategoryList(int director) throws DBOperationException;
    public FamilyCalendar getFamilyEventBasedOnID(int activityID) throws DBOperationException;
    public List<FamilyCalendarBO> getFCListBasedOnDirector(int director) throws DBOperationException;
    public List<FamilyCalendarBO> getFCListBasedOnUserID(int userID) throws DBOperationException;
    public List<FamilyCalendarBO> getFCListBasedOnCategory(String category, int director) throws DBOperationException;
}