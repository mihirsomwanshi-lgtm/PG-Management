<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, com.pgfinder.servlet.DBConnection" %>

<%
    if (session == null ||
        session.getAttribute("userName") == null ||
        session.getAttribute("userEmail") == null) {

        response.sendRedirect("login.jsp");
        return;
    }

    String userName  = (String) session.getAttribute("userName");
    String userEmail = (String) session.getAttribute("userEmail");

    Connection con = null;
    PreparedStatement ps = null, psBook = null;
    ResultSet rs = null, rsBook = null;

    java.sql.Date today = new java.sql.Date(System.currentTimeMillis());
%>

<!DOCTYPE html>
<html>
<head>
<title>Home | PG Hostel Finder</title>

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}

body{
    min-height:100vh;
    display:flex;
    background:url('images/pgHostelimg.jpg') no-repeat center/cover;
    animation:bgMove 20s ease-in-out infinite alternate;
    color:#fff;
}
@keyframes bgMove{0%{background-size:110%;}100%{background-size:120%;}}
body::before{
    content:'';position:fixed;inset:0;
    background:rgba(0,0,0,0.55);z-index:-1;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:240px;
    background:rgba(0,0,0,0.6);
    backdrop-filter:blur(14px);
    padding:30px 20px;
}
.sidebar h2{
    text-align:center;margin-bottom:30px;
    font-size:22px;font-weight:800;
    background:linear-gradient(90deg,#b65fa5,#6f63b6);
    -webkit-background-clip:text;-webkit-text-fill-color:transparent;
}
.sidebar a{
    display:block;margin-bottom:14px;padding:12px;
    border-radius:10px;text-decoration:none;
    font-size:15px;font-weight:600;color:#fff;
    background:linear-gradient(90deg,#b65fa5,#6f63b6);
    text-align:center;transition:.3s;
}
.sidebar a:hover{transform:scale(1.05);}

/* ===== MAIN ===== */
.main{flex:1;padding:40px 50px;overflow-y:auto;}
.main h2{
    font-size:30px;font-weight:800;margin-bottom:25px;
    background:linear-gradient(90deg,#b65fa5,#6f63b6);
    -webkit-background-clip:text;-webkit-text-fill-color:transparent;
}

/* ===== SECTION BOX ===== */
.section-box{
    background:rgba(0,0,0,0.45);
    backdrop-filter:blur(14px);
    padding:25px;
    border-radius:20px;
    margin-bottom:35px;
    box-shadow:0 15px 40px rgba(0,0,0,.4);
}

/* ===== BOOKINGS TABLE ===== */
table{width:100%;border-collapse:collapse;margin-top:15px;}
th{
    background:linear-gradient(90deg,#b65fa5,#6f63b6);
    padding:14px;color:#fff;font-size:14px;
}
td{
    padding:12px;text-align:center;
    border-bottom:1px solid rgba(255,255,255,.15);
}
tr:hover{background:rgba(255,255,255,.08);}

/* ===== STATUS ===== */
.status{
    padding:6px 14px;border-radius:999px;
    font-size:13px;font-weight:800;display:inline-block;
}
.status.pending{background:#f59e0b;color:#111;}
.status.approved{background:#16a34a;color:#fff;}
.status.rejected{background:#dc2626;color:#fff;}
.status.cancelled{background:#6b7280;color:#fff;}

/* ===== CANCEL BTN ===== */
.cancel-btn{
    padding:6px 14px;
    border-radius:6px;
    text-decoration:none;
    font-weight:700;
    color:#fff;
    background:linear-gradient(90deg,#ef4444,#dc2626);
}
</style>
</head>

<body>

<div class="sidebar">
    <h2>PG Finder</h2>
    <a href="search.jsp">🔍 Search PG</a>
    <a href="enquiry.jsp">✉️ Send Enquiry</a>
    <a href="LogoutServlet" onclick="return confirm('Logout?')">🚪 Logout</a>
</div>

<div class="main">
<h2>Welcome, <%= userName %></h2>

<!-- ================= BOOKINGS ================= -->
<div class="section-box">
<h3>My PG Bookings</h3>

<%
con = DBConnection.getConnection();

/* 🔹 ONLY NEW PART: JOIN pg_details */
psBook = con.prepareStatement(
    "SELECT b.*, p.pg_name " +
    "FROM booking b " +
    "JOIN pg_details p ON b.pg_id = p.id " +
    "WHERE b.user_email=? " +
    "ORDER BY b.booking_date DESC"
);
psBook.setString(1, userEmail);
rsBook = psBook.executeQuery();

boolean hasBooking=false;
%>

<table>
<tr>
<th>ID</th>
<th>PG Name</th>
<th>Status</th>
<th>Date</th>
<th>Action</th>
</tr>

<%
while(rsBook.next()){
    hasBooking=true;
    String status=rsBook.getString("status");
%>
<tr>
<td><%=rsBook.getInt("id")%></td>
<td><%=rsBook.getString("pg_name")%></td>

<td><span class="status <%=status.toLowerCase()%>"><%=status%></span></td>
<td><%=rsBook.getTimestamp("booking_date")%></td>

<td>
<% if("Pending".equalsIgnoreCase(status)){ %>
<a href="CancelBookingServlet?id=<%=rsBook.getInt("id")%>"
   class="cancel-btn"
   onclick="return confirm('Cancel this booking?');">
   Cancel
</a>
<% } else { %>—<% } %>
</td>
</tr>
<% } %>

<% if(!hasBooking){ %>
<tr><td colspan="5">No bookings yet.</td></tr>
<% } %>
</table>
</div>

</div>
</body>
</html>

<%
if(rsBook!=null)rsBook.close();
if(psBook!=null)psBook.close();
if(con!=null)con.close();
%>
