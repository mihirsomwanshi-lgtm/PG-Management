package com.pgfinder.servlet;

import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class DeletePGServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement("DELETE FROM pg_details WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("admindashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
