package com.pgfinder.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String TEST_USERNAME = "admin";
    private static final String TEST_PASSWORD = "password";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("adminuser");
        String password = request.getParameter("adminpass");

        if (TEST_USERNAME.equals(username) && TEST_PASSWORD.equals(password)) {

            HttpSession session = request.getSession(true);

            // ✔ existing attribute (used by dashboard)
            session.setAttribute("admin", username);

            // ✅ ADD THIS (VERY IMPORTANT)
            session.setAttribute("role", "ADMIN");

            session.setMaxInactiveInterval(30 * 60);

            response.sendRedirect(request.getContextPath() + "/admindashboard.jsp");
            return;
        }

        request.setAttribute("error", "Invalid username or password");
        request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/adminlogin.jsp").forward(req, resp);
    }
}
