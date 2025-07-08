/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.eventportal.dao;
import com.eventportal.db.DBConnection;
import com.eventportal.model.User;
import java.sql.*;

/**
 *
 * @author janvi
 */
public class UserDAO {
//    public static boolean registerUser(User user) throws Exception {
//        Connection con = DBConnection.getConnection();
//        PreparedStatement ps = con.prepareStatement("INSERT INTO users(name, email, password, role) VALUES (?, ?, ?, ?)");
//        ps.setString(1, user.getName());
//        ps.setString(2, user.getEmail());
//        ps.setString(3, user.getPassword());
//        ps.setString(4, user.getRole());
//        return ps.executeUpdate() > 0;
//    }
    
    public void save(User user) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // for MySQL 8+
            Connection con = DBConnection.getConnection();  //DriverManager.getConnection(URL, USERNAME, PASSWORD);
            String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getRole());
            ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static User login(String email, String password) throws Exception {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE LOWER(email)=LOWER(?) AND password=?");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            User user = new User();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setEmail(rs.getString("email"));
            user.setRole(rs.getString("role"));
            return user;
        }
        return null;
    }

//    public static void save(User user) {
//        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
//    }
}
