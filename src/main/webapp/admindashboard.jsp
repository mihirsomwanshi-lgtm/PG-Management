<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*, com.pgfinder.servlet.DBConnection" %>

<%
    if (request.getSession(false) == null ||
        request.getSession(false).getAttribute("admin") == null) {
        response.sendRedirect(request.getContextPath() + "/AdminLoginServlet");
        return;
    }

    Connection con = null;
    Statement stPG = null, stEnq = null, stBook = null;
    ResultSet rsPG = null, rsEnq = null, rsBook = null;

    try {
        con = DBConnection.getConnection();

        stPG = con.createStatement();
        rsPG = stPG.executeQuery("SELECT * FROM pg_details ORDER BY id DESC");

        stEnq = con.createStatement();
        rsEnq = stEnq.executeQuery("SELECT * FROM enquiry ORDER BY created_at DESC");

        stBook = con.createStatement();
        rsBook = stBook.executeQuery(
            "SELECT b.*, p.pg_name FROM booking b " +
            "JOIN pg_details p ON b.pg_id = p.id " +
            "ORDER BY b.booking_date DESC"
        );
    } catch(Exception e){
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard | PG Hostel Finder</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap');

*{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif;}

body{
    min-height:100vh;
    display:flex;
    background:url('images/pgHostelimg.jpg') no-repeat center/cover;
    color:#fff;
}

body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.55);
    z-index:-1;
}

/* ===== SIDEBAR ===== */
.sidebar{
    width:250px;
    padding:32px 22px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(18px);
}

.sidebar h2{
    text-align:center;
    margin-bottom:36px;
    font-size:22px;
    font-weight:800;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.sidebar a{
    display:block;
    margin-bottom:16px;
    padding:12px;
    border-radius:12px;
    text-decoration:none;
    font-size:15px;
    font-weight:600;
    color:#fff;
    text-align:center;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    box-shadow:0 0 18px rgba(123,111,207,0.4);
    transition:.35s;
}

.sidebar a:hover{
    transform:translateY(-3px) scale(1.04);
    box-shadow:0 0 32px rgba(123,111,207,0.7);
}

/* ===== MAIN ===== */
.main{
    flex:1;
    padding:42px;
    overflow-y:auto;
}

/* ===== SECTION ===== */
.section{
    display:none;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(18px);
    padding:34px;
    border-radius:26px;
    box-shadow:0 25px 55px rgba(0,0,0,0.55);
    animation:fadeUp .8s ease;
}

.section.active{display:block;}

@keyframes fadeUp{
    from{opacity:0;transform:translateY(30px) scale(.96);}
    to{opacity:1;transform:translateY(0) scale(1);}
}

.section h3{
    text-align:center;
    margin-bottom:28px;
    font-size:26px;
    font-weight:800;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== PG CARDS ===== */
.pg-grid{
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:24px;
}

.pg-card{
    background:#f9fafb;
    color:#111;
    border-radius:20px;
    padding:24px;
    box-shadow:0 15px 35px rgba(0,0,0,.4);
}

.pg-title{
    font-size:20px;
    font-weight:800;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.pg-info{font-size:14px;margin:6px 0;}

.pg-actions{text-align:center;margin-top:14px;}

/* ===== TABLE ===== */
table{
    width:100%;
    border-collapse:collapse;
}

th,td{
    padding:14px;
    text-align:center;
    font-size:14px;
    border-bottom:1px solid rgba(255,255,255,.15);
}

th{
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
}

/* ===== BUTTONS ===== */
.action-btn{
    padding:8px 18px;
    border-radius:10px;
    text-decoration:none;
    font-weight:600;
    font-size:13px;
    color:#fff;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
}

.action-btn.delete{
    background:linear-gradient(90deg,#ef4444,#dc2626);
}

/* ===== STATUS ===== */
.status.pending{color:orange;font-weight:700;}
.status.approved{color:lightgreen;font-weight:700;}
.status.rejected{color:tomato;font-weight:700;}
</style>

<script>
function showSection(id){
    document.querySelectorAll('.section').forEach(s=>s.classList.remove('active'));
    document.getElementById(id).classList.add('active');
}
window.onload=()=>showSection('enquiries');
</script>
</head>

<body>

<div class="sidebar">
    <h2>Admin Panel</h2>
    <a href="#" onclick="showSection('pgDetails')">PG Details</a>
    <a href="#" onclick="showSection('enquiries')">Enquiries</a>
    <a href="#" onclick="showSection('bookings')">Bookings</a>
    <a href="addpg.jsp">Add PG</a>
    <a href="LogoutServlet" onclick="return confirm('Logout?')">Logout</a>
</div>

<div class="main">

<!-- PG DETAILS -->
<div id="pgDetails" class="section">
<h3>PG Details</h3>
<div class="pg-grid">
<% while(rsPG!=null && rsPG.next()){ %>
<div class="pg-card">
<div class="pg-title"><%=rsPG.getString("pg_name")%></div>
<div class="pg-info">📍 <%=rsPG.getString("location")%></div>
<div class="pg-info">💰 ₹<%=rsPG.getInt("rent")%></div>
<div class="pg-info">🏠 <%=rsPG.getString("facilities")%></div>
<div class="pg-actions">
<a class="action-btn" href="editpg.jsp?id=<%=rsPG.getInt("id")%>">Edit</a>
<a class="action-btn delete" href="DeletePGServlet?id=<%=rsPG.getInt("id")%>"
onclick="return confirm('Delete this PG?')">Delete</a>
</div>
</div>
<% } %>
</div>
</div>

<!-- ENQUIRIES -->
<div id="enquiries" class="section active">
<h3>Enquiries</h3>
<table>
<tr><th>ID</th><th>Name</th><th>Email</th><th>Message</th><th>Date</th><th>Action</th></tr>
<% while(rsEnq!=null && rsEnq.next()){ %>
<tr>
<td><%=rsEnq.getInt("id")%></td>
<td><%=rsEnq.getString("name")%></td>
<td><%=rsEnq.getString("email")%></td>
<td><%=rsEnq.getString("message")%></td>
<td><%=rsEnq.getTimestamp("created_at")%></td>
<td>
<a class="action-btn" href="viewEnquiry.jsp?id=<%=rsEnq.getInt("id")%>">View</a>
<a class="action-btn delete" href="DeleteEnquiryServlet?id=<%=rsEnq.getInt("id")%>"
onclick="return confirm('Delete enquiry?')">Delete</a>
</td>
</tr>
<% } %>
</table>
</div>

<!-- BOOKINGS -->
<div id="bookings" class="section">
<h3>Bookings</h3>
<table>
<tr><th>ID</th><th>User Email</th><th>PG Name</th><th>Status</th><th>Date</th><th>Action</th></tr>

<% boolean hasBookings=false;
while(rsBook!=null && rsBook.next()){
hasBookings=true;
String status=rsBook.getString("status"); %>

<tr>
<td><%=rsBook.getInt("id")%></td>
<td><%=rsBook.getString("user_email")%></td>
<td><%=rsBook.getString("pg_name")%></td>
<td class="status <%=status.toLowerCase()%>"><%=status%></td>
<td><%=rsBook.getTimestamp("booking_date")%></td>
<td>
<% if("Pending".equalsIgnoreCase(status)){ %>
<a class="action-btn" href="ApproveBookingServlet?id=<%=rsBook.getInt("id")%>">Approve</a>
<a class="action-btn delete" href="RejectBookingServlet?id=<%=rsBook.getInt("id")%>"
onclick="return confirm('Reject booking?')">Reject</a>
<% } else { %>—<% } %>
</td>
</tr>
<% } if(!hasBookings){ %>
<tr><td colspan="6">No bookings found.</td></tr>
<% } %>
</table>
</div>

</div>
</body>
</html>

<%
if(rsPG!=null)rsPG.close();
if(rsEnq!=null)rsEnq.close();
if(rsBook!=null)rsBook.close();
if(stPG!=null)stPG.close();
if(stEnq!=null)stEnq.close();
if(stBook!=null)stBook.close();
if(con!=null)con.close();
%>
