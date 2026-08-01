<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*,com.pgfinder.servlet.DBConnection" %>

<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit PG | PG Hostel Finder</title>

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
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    color:#fff;
    overflow:hidden;

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

/* ===== LIGHT OVERLAY ===== */
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

/* ===== FORM CONTAINER ===== */
.form-container{
    width:420px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:44px 50px;
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

/* ===== HEADING ===== */
.form-container h2{
    text-align:center;
    margin-bottom:26px;
    font-size:30px;
    font-weight:800;
}

/* ===== LABELS ===== */
label{
    display:block;
    margin-top:16px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:500;
}

/* ===== INPUTS ===== */
input, textarea{
    width:100%;
    padding:11px 13px;
    border:none;
    border-radius:8px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.92);
    transition:0.3s;
}

textarea{
    height:90px;
    resize:none;
}

/* Focus glow */
input:focus, textarea:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

/* ===== BUTTON (SMALL WIDTH) ===== */
button{
    margin-top:22px;
    padding:9px 18px;
    font-size:14px;
    font-weight:600;
    border:none;
    border-radius:8px;
    cursor:pointer;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    color:#fff;
    transition:all 0.3s ease;
    display:block;
    margin-left:auto;
    margin-right:auto;
}

/* Hover */
button:hover{
    transform:scale(1.04);
}

/* ===== ERROR TEXT ===== */
.error{
    color:#ffb3b3;
    text-align:center;
    margin-top:10px;
}

/* ===== RESPONSIVE ===== */
@media(max-width:600px){
    .form-container{
        width:90%;
        padding:34px 26px;
    }

    .form-container h2{
        font-size:24px;
    }
}
</style>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">Edit PG Details</h2>

<%
try{
    if(id != null){
        con = DBConnection.getConnection();
        ps = con.prepareStatement("SELECT * FROM pg_details WHERE id=?");
        ps.setInt(1, Integer.parseInt(id));
        rs = ps.executeQuery();

        if(rs.next()){
%>

<form action="EditPGServlet" method="post">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">

    <label>PG Name</label>
    <input type="text" name="pgName" value="<%= rs.getString("pg_name") %>" required>

    <label>Location</label>
    <input type="text" name="location" value="<%= rs.getString("location") %>" required>

    <label>Rent</label>
    <input type="text" name="rent" value="<%= rs.getString("rent") %>" required>

    <label>Facilities</label>
    <textarea name="facilities" required><%= rs.getString("facilities") %></textarea>

    <button type="submit">Update PG</button>
</form>

<%
        } else {
%>
    <p class="error">PG record not found.</p>
<%
        }
    } else {
%>
    <p class="error">Invalid request.</p>
<%
    }
}catch(Exception e){
    e.printStackTrace();
%>
    <p class="error">Something went wrong.</p>
<%
} finally{
    if(rs!=null) rs.close();
    if(ps!=null) ps.close();
    if(con!=null) con.close();
}
%>

</div>
</body>
</html>
