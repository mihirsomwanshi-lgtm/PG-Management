package com.pgfinder.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ReplyEnquiryServlet")
public class ReplyEnquiryServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reply = request.getParameter("adminReply"); // ✅ FIXED
        String idStr = request.getParameter("enquiryId");

        if (reply == null || reply.trim().isEmpty() || idStr == null) {
            response.getWriter().println("Reply failed: Missing data");
            return;
        }

        try {
            int enquiryId = Integer.parseInt(idStr);

            try (Connection con = DBConnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(
                     "UPDATE enquiry SET admin_reply=? WHERE id=?")) {

                ps.setString(1, reply);
                ps.setInt(2, enquiryId);
                ps.executeUpdate();
            }

            response.sendRedirect("viewEnquiry.jsp?id=" + enquiryId);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Reply failed");
        }
    }
}
