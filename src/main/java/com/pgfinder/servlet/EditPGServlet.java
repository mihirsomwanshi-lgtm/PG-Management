package com.pgfinder.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditPGServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");
        String pgName = request.getParameter("pgName");
        String location = request.getParameter("location");
        String rent = request.getParameter("rent");
        String facilities = request.getParameter("facilities");

        if (idStr == null || pgName == null || location == null || rent == null || facilities == null) {
            response.sendRedirect("admindashboard.jsp");
            return;
        }

        try (Connection con = DBConnection.getConnection()) {

            PreparedStatement ps = con.prepareStatement(
                "UPDATE pg_details SET pg_name=?, location=?, rent=?, facilities=? WHERE id=?"
            );

            ps.setString(1, pgName);
            ps.setString(2, location);
            ps.setString(3, rent);
            ps.setString(4, facilities);
            ps.setInt(5, Integer.parseInt(idStr));

            int updated = ps.executeUpdate();

            if (updated > 0) {
                response.sendRedirect("admindashboard.jsp");
            } else {
                response.getWriter().println("Update failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Server error occurred!");
        }
    }
}
