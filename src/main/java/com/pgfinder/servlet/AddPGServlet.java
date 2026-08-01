package com.pgfinder.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class AddPGServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("pgName");
        String location = request.getParameter("location");
        String rent = request.getParameter("rent");
        String facilities = request.getParameter("facilities");

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("INSERT INTO pg_details(pg_name,location,rent,facilities) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, location);
            ps.setString(3, rent);
            ps.setString(4, facilities);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("admindashboard.jsp");
            } else {
                response.getWriter().println("Error adding PG details!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
