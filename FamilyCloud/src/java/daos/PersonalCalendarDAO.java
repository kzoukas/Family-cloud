/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import db.model.PersonalCalendar;
import java.util.List;
import models.PersonalCalendarBO;

/**
 *
 * @author Vaggos
 */
public interface PersonalCalendarDAO {
    public boolean addTask(PersonalCalendar pc);
    public List<PersonalCalendarBO> getPCListBasedOnDirector(int userID) throws DBOperationException;
    public PersonalCalendar getPersonalEventBasedOnID(int activityID) throws DBOperationException;
    public boolean deletePersonalEvent(int activityID);
    public boolean updatePcEvent(PersonalCalendar fc, int activityID);
    
}
