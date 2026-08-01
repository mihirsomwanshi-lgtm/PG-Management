<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, jakarta.servlet.http.HttpSession, com.pgfinder.servlet.DBConnection" %>

<%
    /* ===== ADMIN SESSION CHECK (FIXED) ===== */
    HttpSession adminSession = request.getSession(false);
    if (adminSession == null || adminSession.getAttribute("admin") == null) {
        response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
        return;
    }

    /* ===== GET ENQUIRY ID ===== */
    String idParam = request.getParameter("id");
    if (idParam == null) {
        response.sendRedirect("admindashboard.jsp");
        return;
    }

    int enquiryId;
    try {
        enquiryId = Integer.parseInt(idParam);
    } catch (Exception e) {
        response.sendRedirect("admindashboard.jsp");
        return;
    }

    /* ===== FETCH ENQUIRY ===== */
    String name = "", email = "", message = "", adminReply = "";
    Timestamp createdAt = null;

    try (Connection con = DBConnection.getConnection();
         PreparedStatement ps = con.prepareStatement(
             "SELECT name, email, message, admin_reply, created_at FROM enquiry WHERE id=?"
         )) {

        ps.setInt(1, enquiryId);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            name = rs.getString("name");
            email = rs.getString("email");
            message = rs.getString("message");
            adminReply = rs.getString("admin_reply");
            createdAt = rs.getTimestamp("created_at");
        } else {
            response.sendRedirect("admindashboard.jsp");
            return;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>View Enquiry | Admin</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:url('images/pgHostelimg.jpg') no-repeat center center;
    background-size:110%;
    animation:bgMove 20s ease-in-out infinite alternate;
    color:#fff;
}

@keyframes bgMove{
    0%{background-size:110%}
    100%{background-size:120%}
}

body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.55);
    z-index:-1;
}

.card{
    width:90%;
    max-width:820px;
    background:rgba(0,0,0,0.40);
    backdrop-filter:blur(14px);
    padding:40px;
    border-radius:22px;
}

h2{
    text-align:center;
    margin-bottom:26px;
    font-size:28px;
    font-weight:800;
    background:linear-gradient(90deg,#4f46e5,#7c3aed);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.row{
    margin-bottom:16px;
}

.label{
    font-weight:600;
    color:#c7d2fe;
    margin-bottom:6px;
}

.value{
    background:rgba(255,255,255,0.12);
    padding:12px;
    border-radius:8px;
}

textarea{
    width:100%;
    min-height:120px;
    padding:12px;
    border-radius:8px;
    border:none;
    outline:none;
    resize:vertical;
}

.buttons{
    text-align:center;
    margin-top:24px;
}

.btn{
    padding:10px 20px;
    border-radius:8px;
    border:none;
    cursor:pointer;
    font-weight:600;
    color:#fff;
    background:linear-gradient(90deg,#4f46e5,#7c3aed);
}

.btn.secondary{
    background:rgba(255,255,255,0.25);
}
</style>
</head>

<body>

<div class="card">

    <h2>Enquiry Details</h2>

    <div class="row">
        <div class="label">Name</div>
        <div class="value"><%= name %></div>
    </div>

    <div class="row">
        <div class="label">Email</div>
        <div class="value"><%= email %></div>
    </div>

    <div class="row">
        <div class="label">Message</div>
        <div class="value"><%= message %></div>
    </div>

    <div class="row">
        <div class="label">Received At</div>
        <div class="value"><%= createdAt %></div>
    </div>

    <% if (adminReply != null && !adminReply.trim().isEmpty()) { %>
        <div class="row">
            <div class="label">Admin Reply</div>
            <div class="value"><%= adminReply %></div>
        </div>
    <% } %>

    <!-- ===== ADMIN REPLY FORM ===== -->
    <form action="ReplyEnquiryServlet" method="post">
        <input type="hidden" name="enquiryId" value="<%= enquiryId %>">

        <div class="row">
            <div class="label">Reply</div>
            <textarea name="adminReply" required
                placeholder="Type your reply here..."><%= adminReply != null ? adminReply : "" %></textarea>
        </div>

        <div class="buttons">
            <a href="admindashboard.jsp" class="btn secondary">← Back</a>
            &nbsp;
            <button type="submit" class="btn">Send Reply</button>
        </div>
    </form>

</div>

</body>
</html>
