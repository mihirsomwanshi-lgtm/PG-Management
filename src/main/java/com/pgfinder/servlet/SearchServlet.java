package com.pgfinder.servlet;

import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

//@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String location = request.getParameter("location");
        String minRent  = request.getParameter("minRent");
        String maxRent  = request.getParameter("maxRent");

        StringBuilder redirectUrl = new StringBuilder(
                request.getContextPath() + "/viewpgstudent.jsp?"
        );

        boolean hasParam = false;

        // ✅ Location
        if (location != null && !location.trim().isEmpty()) {
            redirectUrl.append("location=")
                       .append(URLEncoder.encode(location, StandardCharsets.UTF_8));
            hasParam = true;
        }

        // ✅ Min Rent
        if (minRent != null && !minRent.trim().isEmpty()) {
            redirectUrl.append(hasParam ? "&" : "")
                       .append("minRent=")
                       .append(URLEncoder.encode(minRent, StandardCharsets.UTF_8));
            hasParam = true;
        }

        // ✅ Max Rent
        if (maxRent != null && !maxRent.trim().isEmpty()) {
            redirectUrl.append(hasParam ? "&" : "")
                       .append("maxRent=")
                       .append(URLEncoder.encode(maxRent, StandardCharsets.UTF_8));
        }

        // 🔁 Redirect to result page
        response.sendRedirect(redirectUrl.toString());
    }
}
