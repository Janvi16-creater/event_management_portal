/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eventportal.dao;
import com.eventportal.db.DBConnection;
import com.eventportal.model.Event;
import java.sql.*;
import java.util.*;
/**
 *
 * @author janvi
 */
public class EventDAO {
    public static boolean createEvent(Event event) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("INSERT INTO events(title, description, date, time, venue) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, event.getTitle());
        ps.setString(2, event.getDescription());
        ps.setString(3, event.getDate());
        ps.setString(4, event.getTime());
        ps.setString(5, event.getVenue());
        return ps.executeUpdate() > 0;
    }

    public static List<Event> getAllEvents() throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM events");
        ResultSet rs = ps.executeQuery();
        List<Event> list = new ArrayList<>();
        while (rs.next()) {
            Event e = new Event();
            e.setId(rs.getInt("id"));
            e.setTitle(rs.getString("title"));
            e.setDescription(rs.getString("description"));
            e.setDate(rs.getString("date"));
            e.setTime(rs.getString("time"));
            e.setVenue(rs.getString("venue"));
            list.add(e);
        }
        return list;
    }
    
    public static boolean updateEvent(Event event) throws Exception {
    //Connection con = getConnection();
    Connection con = DBConnection.getConnection();
    String query = "UPDATE events SET title = ?, date = ?, venue = ? WHERE id = ?";
    
    try (PreparedStatement stmt = con.prepareStatement(query)) {
        stmt.setString(1, event.getTitle());
        stmt.setString(2, event.getDate());
        stmt.setString(3, event.getVenue());
        stmt.setInt(4, event.getId());

        int rowsUpdated = stmt.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

// Delete event
public static boolean deleteEvent(int eventId) throws Exception {
    //Connection con = getConnection();
    Connection con = DBConnection.getConnection();
    String query = "DELETE FROM events WHERE id = ?";
    
    try (PreparedStatement stmt = con.prepareStatement(query)) {
        stmt.setInt(1, eventId);

        int rowsDeleted = stmt.executeUpdate();
        return rowsDeleted > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

public static Event getEventById(int id) throws Exception {
    Connection con = DBConnection.getConnection();
    String query = "SELECT * FROM events WHERE id = ?";
    
    try (PreparedStatement stmt = con.prepareStatement(query)) {
        stmt.setInt(1, id);
        ResultSet rs = stmt.executeQuery();
        
        if (rs.next()) {
            Event event = new Event();
            event.setId(rs.getInt("id"));
            event.setTitle(rs.getString("title"));
            event.setDescription(rs.getString("description"));
            event.setDate(rs.getString("date"));
            event.setTime(rs.getString("time"));
            event.setVenue(rs.getString("venue"));
            return event;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null; // if no event found
}

}
