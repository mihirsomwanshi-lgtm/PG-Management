<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,com.pgfinder.servlet.DBConnection" %>

<%
    String location = request.getParameter("location");

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    con = DBConnection.getConnection();
    ps = con.prepareStatement("SELECT * FROM pg_details WHERE location LIKE ?");
    ps.setString(1, "%" + location + "%");
    rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<title>Available PGs | PG Hostel Finder</title>

<style>
/* ===== RESET ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* ===== BODY WITH ANIMATED BACKGROUND ===== */
body{
    min-height:100vh;
    color:#fff;
    overflow-x:hidden;

    background:url('images/pgHostelimg.jpg') no-repeat center center;
    background-size:110%;
    animation:bgMove 22s ease-in-out infinite alternate;
}

/* Background animation */
@keyframes bgMove{
    0%{
        background-position:center;
        background-size:110%;
    }
    100%{
        background-position:top center;
        background-size:120%;
    }
}

/* ===== LIGHT DARK OVERLAY ===== */
body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.45);
    z-index:-1;
}

/* ===== GRADIENT TEXT ===== */
.gradient-text{
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== PAGE HEADING ===== */
h2{
    text-align:center;
    margin:40px 0 20px;
    font-size:32px;
    font-weight:800;
}

/* ===== TABLE CONTAINER ===== */
.table-container{
    width:90%;
    margin:0 auto 30px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:25px;
    border-radius:20px;
    animation:fadeUp 1.2s ease;
}

/* Fade up animation */
@keyframes fadeUp{
    from{
        opacity:0;
        transform:translateY(35px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
    color:#fff;
}

th, td{
    padding:12px;
    text-align:center;
    border-bottom:1px solid rgba(255,255,255,0.15);
}

th{
    font-weight:700;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
}

tr:hover{
    background:rgba(255,255,255,0.08);
}

/* ===== ACTION LINKS ===== */
a.action{
    color:#ffc2e0;
    font-weight:700;
    text-decoration:none;
    transition:0.3s;
}

a.action:hover{
    color:#A890FE;
}

/* ===== BACK BUTTON ===== */
.back-link{
    display:block;
    width:160px;
    margin:0 auto 40px;
    text-align:center;
    padding:9px;
    font-size:14px;
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

/* ===== RESPONSIVE ===== */
@media(max-width:768px){
    h2{
        font-size:24px;
    }

    th, td{
        font-size:14px;
        padding:8px;
    }

    .table-container{
        width:95%;
        padding:15px;
    }
}
</style>
</head>

<body>

<h2 class="gradient-text">Available PGs in <%= location %></h2>

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
            <td><%= rs.getString("rent") %></td>
            <td><%= rs.getString("facilities") %></td>
            <td>
                <a class="action" href="editpg.jsp?id=<%= rs.getInt("id") %>">Edit</a> |
                <a class="action" href="DeletePGServlet?id=<%= rs.getInt("id") %>"
                   onclick="return confirm('Delete this PG?');">Delete</a>
            </td>
        </tr>
        <% } %>

        <% if(!found){ %>
        <tr>
            <td colspan="5">No PGs found for this location.</td>
        </tr>
        <% } %>
    </table>
</div>

<a href="search.jsp" class="back-link">New Search</a>

<%
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
%>

</body>
</html>
