package dao.impl;

import daos.DBOperationException;
import daos.MealsDAO;
import db.model.Meals;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.MealsBO;

/**
 *
 * @author Vaggos
 */
public class MySqlMealsDAO implements MealsDAO {

    @Override
    public boolean addMeal(Meals meal) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();

        try {
            pst = conn.prepareStatement("SELECT MAX(mealID) AS maxID FROM meals;");
            ResultSet rs1 = pst.executeQuery();
            while (rs1.next()) {

                meal.setMealID(rs1.getInt("maxID") + 1);
            }

            pst = conn.prepareStatement("INSERT INTO meals(mealID, mealName, place, datetime ,description, director, "
                    + "daily, weekly, monthly, hoursRemindBefore, reminder, reputanceExpDate,userID, reminderDate ) VALUES(?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?, ?, ?)");
            pst.setInt(1, meal.getMealID());
            pst.setString(2, meal.getMealName());
            pst.setString(3, meal.getPlace());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(meal.getDatetime().getTime());
            pst.setTimestamp(4, timestamp);

            pst.setString(5, meal.getDescription());
            pst.setInt(6, meal.getDirector());

            int daily = (meal.isDaily() ? 1 : 0);
            int weekly = (meal.isWeekly() ? 1 : 0);
            int monthly = (meal.isMonthly() ? 1 : 0);
            pst.setInt(7, daily);
            pst.setInt(8, weekly);
            pst.setInt(9, monthly);
            pst.setInt(10, meal.getHoursRemindBefore());
            pst.setString(11, meal.getReminder());
            pst.setDate(12, new java.sql.Date(meal.getExpDate().getTime()));
            pst.setInt(13, meal.getUserID());
            pst.setDate(14, new java.sql.Date(meal.getReminderDate().getTime()));
            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }

    @Override
    public List<MealsBO> getMealsListBasedOnDirector(int director) throws DBOperationException {

        PreparedStatement pst = null;

        Connection conn = MySqlDAOFactory.createConnection();
        List<MealsBO> mealsActivities = new ArrayList<MealsBO>();
        Meals meal = new Meals();

        try {
            pst = conn.prepareStatement("SELECT * FROM meals WHERE director=?");
            pst.setInt(1, director);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {

                meal.setMealID(rs.getInt("mealID"));
                meal.setUserID(rs.getInt("userID"));
                meal.setMealName(rs.getString("mealName"));
                meal.setPlace(rs.getString("place"));
                meal.setDescription(rs.getString("description"));
                meal.setDirector(director);
                meal.setDatetime(rs.getTimestamp("datetime"));

                int daily = rs.getInt("daily");
                int weekly = rs.getInt("weekly");
                int monthly = rs.getInt("monthly");
                if (daily == 0) {
                    meal.setDaily(false);
                } else {
                    meal.setDaily(true);
                }
                if (weekly == 0) {
                    meal.setWeekly(false);
                } else {
                    meal.setWeekly(true);
                }
                if (monthly == 0) {
                    meal.setMonthly(false);
                } else {
                    meal.setMonthly(true);
                }

                meal.setReminder(rs.getString("reminder"));
                meal.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                meal.setExpDate(rs.getDate("reputanceExpDate"));
                meal.setReminderDate(rs.getDate("reminderDate"));
                MealsBO takis = new MealsBO();

                mealsActivities.add(takis.toMealsBO(meal));

            }

        } catch (SQLException ex) {
            meal = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }
        return mealsActivities;
    }

    @Override
    public Meals getMealEventBasedOnID(int mealID) throws DBOperationException {
        PreparedStatement pst = null;
        Connection conn = MySqlDAOFactory.createConnection();
        Meals meal = new Meals();

        try {
            pst = conn.prepareStatement("SELECT * FROM meals WHERE mealID=?");
            pst.setInt(1, mealID);

            ResultSet rs = pst.executeQuery();

            while (rs.next()) {
                meal.setMealID(mealID);
                meal.setUserID(rs.getInt("userID"));
                meal.setMealName(rs.getString("mealName"));
                meal.setPlace(rs.getString("place"));
                meal.setDescription(rs.getString("description"));
                meal.setDirector(rs.getInt("director"));
                meal.setDatetime(rs.getTimestamp("datetime"));

                int daily = rs.getInt("daily");
                int weekly = rs.getInt("weekly");
                int monthly = rs.getInt("monthly");
                if (daily == 0) {
                    meal.setDaily(false);
                } else {
                    meal.setDaily(true);
                }
                if (weekly == 0) {
                    meal.setWeekly(false);
                } else {
                    meal.setWeekly(true);
                }
                if (monthly == 0) {
                    meal.setMonthly(false);
                } else {
                    meal.setMonthly(true);
                }

                meal.setReminder(rs.getString("reminder"));
                meal.setHoursRemindBefore(rs.getInt("hoursRemindBefore"));
                meal.setExpDate(rs.getDate("reputanceExpDate"));
                meal.setReminderDate(rs.getDate("reminderDate"));

            }

        } catch (SQLException ex) {
            meal = null;
            throw new DBOperationException(ex);
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {

                throw new DBOperationException(ex);
            }
        }

        return meal;
    }

    @Override
    public boolean updateMealEvent(Meals meal, int mealID) {
        PreparedStatement pst = null;
        int affected = 0;
        Connection conn = MySqlDAOFactory.createConnection();
        //Meals previousEvent = this.getFamilyEventBasedOnID(activityID);
        try {
            //    previousEvent.updateEventInfo(fc);
            pst = conn.prepareStatement("UPDATE meals "
                    + "SET mealName = ?"
                    + ",place = ?"
                    + ",description = ?"
                    + ",director = ?"
                    + ",datetime = ?"
                    + ",daily = ?"
                    + ",weekly = ?"
                    + ",monthly = ?"
                    + ",hoursRemindBefore = ?"
                    + ",reminder = ?"
                    + ",reputanceExpDate = ?"
                    + ",userID = ?"
                    + ",reminderDate = ?"
                    + " WHERE mealID = ?");

            pst.setString(1, meal.getMealName());
            pst.setString(2, meal.getPlace());
            pst.setString(3, meal.getDescription());
            pst.setInt(4, meal.getDirector());
            java.sql.Timestamp timestamp = new java.sql.Timestamp(meal.getDatetime().getTime());
            pst.setTimestamp(5, timestamp);
            int daily = (meal.isDaily() ? 1 : 0);
            int weekly = (meal.isWeekly() ? 1 : 0);
            int monthly = (meal.isMonthly() ? 1 : 0);
            pst.setInt(6, daily);
            pst.setInt(7, weekly);
            pst.setInt(8, monthly);

            pst.setInt(9, meal.getHoursRemindBefore());
            pst.setString(10, meal.getReminder());
            pst.setDate(11, new java.sql.Date(meal.getExpDate().getTime()));
            pst.setInt(12, meal.getUserID());
             pst.setDate(13, new java.sql.Date(meal.getReminderDate().getTime()));
            pst.setInt(14,meal.getMealID());
            
            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    @Override
    public boolean deleteMealEvent(int mealID) {
        PreparedStatement pst = null;
        int affected = 0;

        Connection conn = MySqlDAOFactory.createConnection();

        try {
            //conn.setAutoCommit(false);

            pst = conn.prepareStatement("DELETE FROM meals WHERE mealID = ?");
            pst.setInt(1, mealID);

            affected = pst.executeUpdate();

            if (affected == 1) {
                return true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                conn.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
