<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Add PG | PG Hostel Finder</title>

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

@keyframes bgMove{
    0%{background-position:center;background-size:110%;}
    100%{background-position:top center;background-size:120%;}
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

/* ===== FORM CONTAINER ===== */
.form-container{
    width:420px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:44px 50px;
    border-radius:20px;
    animation:fadeUp 1.2s ease;
}

@keyframes fadeUp{
    from{opacity:0;transform:translateY(35px);}
    to{opacity:1;transform:translateY(0);}
}

/* ===== HEADING ===== */
.form-container h2{
    text-align:center;
    margin-bottom:28px;
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
    height:95px;
    resize:none;
}

input:focus, textarea:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

/* ===== BUTTONS ===== */
button, .back-btn{
    width:160px;
    display:block;
    margin:22px auto 0;
    padding:8px;
    font-size:14px;
    font-weight:600;
    border:none;
    border-radius:8px;
    cursor:pointer;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    color:#fff;
    text-align:center;
    text-decoration:none;
    transition:all 0.3s ease;
}

button:hover, .back-btn:hover{
    transform:scale(1.05);
}

/* ===== RESPONSIVE ===== */
@media(max-width:600px){
    .form-container{
        width:90%;
        padding:34px 26px;
    }
    button, .back-btn{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">Add New PG</h2>

    <form action="AddPGServlet" method="post">
        <label>PG Name</label>
        <input type="text" name="pgName" placeholder="Enter PG name" required>

        <label>Location</label>
        <input type="text" name="location" placeholder="Enter location" required>

        <label>Rent</label>
        <input type="text" name="rent" placeholder="Monthly rent" required>

        <label>Facilities</label>
        <textarea name="facilities" placeholder="WiFi, AC, Laundry..." required></textarea>

        <button type="submit">Add PG</button>
    </form>

    <!-- ✅ BACK TO ADMIN DASHBOARD -->
    <a href="admindashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</div>

</body>
</html>
