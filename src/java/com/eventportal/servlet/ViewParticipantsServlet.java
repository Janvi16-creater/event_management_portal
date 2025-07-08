/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.eventportal.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.eventportal.db.DBConnection;
import jakarta.servlet.RequestDispatcher;
/**
 *
 * @author janvi
 */
public class ViewParticipantsServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet ViewParticipantsServlet</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet ViewParticipantsServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
       // }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String eventIdStr = request.getParameter("eventId");
    Map<String, List<String>> eventParticipants = new LinkedHashMap<>();
    
    if (eventIdStr != null) {
        int eventId = Integer.parseInt(eventIdStr);

        try (Connection conn = DBConnection.getConnection()) {
            String query = "SELECT e.title, u.name " +
                           "FROM events e " +
                           "LEFT JOIN registrations r ON e.id = r.event_id " +
                           "LEFT JOIN users u ON r.user_id = u.id " +
                           "WHERE e.id = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, eventId);
            ResultSet rs = ps.executeQuery();
            
            String eventTitle = null;
            while (rs.next()) {
                if (eventTitle == null) {
                    eventTitle = rs.getString("title");
                }
                String participantName = rs.getString("name");

                if (!eventParticipants.containsKey(eventTitle)) {
                    eventParticipants.put(eventTitle, new ArrayList<>());
                }
                if (participantName != null) {
                    eventParticipants.get(eventTitle).add(participantName);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    request.setAttribute("eventParticipants", eventParticipants);
    RequestDispatcher rd = request.getRequestDispatcher("participants.jsp");
    rd.forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
