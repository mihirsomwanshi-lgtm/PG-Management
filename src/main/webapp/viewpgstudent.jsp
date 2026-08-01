<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,com.pgfinder.servlet.DBConnection" %>

<%
    String location = request.getParameter("location");
    String minRent  = request.getParameter("minRent");
    String maxRent  = request.getParameter("maxRent");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    StringBuilder sql = new StringBuilder(
        "SELECT * FROM pg_details WHERE 1=1"
    );

    if (location != null && !location.trim().isEmpty()) {
        sql.append(" AND location LIKE ?");
    }
    if (minRent != null && !minRent.trim().isEmpty()) {
        sql.append(" AND rent >= ?");
    }
    if (maxRent != null && !maxRent.trim().isEmpty()) {
        sql.append(" AND rent <= ?");
    }

    con = DBConnection.getConnection();
    ps = con.prepareStatement(sql.toString());

    int index = 1;
    if (location != null && !location.trim().isEmpty()) {
        ps.setString(index++, "%" + location + "%");
    }
    if (minRent != null && !minRent.trim().isEmpty()) {
        ps.setInt(index++, Integer.parseInt(minRent));
    }
    if (maxRent != null && !maxRent.trim().isEmpty()) {
        ps.setInt(index++, Integer.parseInt(maxRent));
    }

    rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Available PGs | PG Hostel Finder</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

body{
    min-height:100vh;
    color:#fff;
    background:url('images/pgHostelimg.jpg') no-repeat center;
    background-size:110%;
    animation:bgMove 22s ease-in-out infinite alternate;
}

@keyframes bgMove{
    0%{ background-size:110%; }
    100%{ background-size:120%; }
}

body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.45);
    z-index:-1;
}

.gradient-text{
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

h2{
    text-align:center;
    margin:40px 0 20px;
    font-size:32px;
    font-weight:800;
}

.table-container{
    width:92%;
    margin:0 auto 30px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:25px;
    border-radius:20px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th, td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid rgba(255,255,255,0.15);
}

th{
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    font-weight:700;
}

tr:hover{
    background:rgba(255,255,255,0.08);
}

/* ===== BOOK BUTTON ===== */
.book-btn{
    display:inline-block;
    padding:7px 16px;
    font-size:13px;
    font-weight:600;
    border-radius:8px;
    text-decoration:none;
    color:#fff;
    background:linear-gradient(90deg,#22c55e,#16a34a);
    transition:0.3s;
}

.book-btn:hover{
    transform:scale(1.05);
    box-shadow:0 0 12px rgba(34,197,94,0.6);
}

.back-link{
    display:block;
    width:160px;
    margin:0 auto 40px;
    padding:9px;
    text-align:center;
    font-weight:600;
    border-radius:8px;
    text-decoration:none;
    color:#fff;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    transition:0.3s;
}

.back-link:hover{
    transform:scale(1.05);
}
</style>
</head>

<body>

<h2 class="gradient-text">Available PGs</h2>

<div class="table-container">
<table>
    <tr>
        <th>PG Name</th>
        <th>Location</th>
        <th>Rent</th>
        <th>Facilities</th>
        <th>Action</th>
    </tr>

<%
    boolean found = false;
    while(rs.next()){
        found = true;
%>
    <tr>
        <td><%= rs.getString("pg_name") %></td>
        <td><%= rs.getString("location") %></td>
        <td>₹ <%= rs.getInt("rent") %></td>
        <td><%= rs.getString("facilities") %></td>
        <td>
            <a href="BookPGServlet?pgId=<%= rs.getInt("id") %>"
               onclick="return confirm('Do you want to book this PG?');"
               class="book-btn">
               Book Now
            </a>
        </td>
    </tr>
<%
    }

    if(!found){
%>
    <tr>
        <td colspan="5">No PGs found for selected filters.</td>
    </tr>
<%
    }
%>
</table>
</div>

<a href="search.jsp" class="back-link">⬅ New Search</a>

<%
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
%>

</body>
</html>
