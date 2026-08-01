<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Login | PG Hostel Finder</title>

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

/* ===== LOGIN CONTAINER ===== */
.login-container{
    width:380px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:42px 46px;
    border-radius:20px;
    animation:fadeUp 1.2s ease;
}

@keyframes fadeUp{
    from{opacity:0;transform:translateY(35px);}
    to{opacity:1;transform:translateY(0);}
}

/* ===== HEADING ===== */
.login-container h2{
    text-align:center;
    margin-bottom:26px;
    font-size:30px;
    font-weight:800;
}

/* ===== LABEL ===== */
label{
    display:block;
    margin-top:16px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:500;
}

/* ===== INPUTS ===== */
input[type="text"],
input[type="password"]{
    width:100%;
    padding:11px 13px;
    border:none;
    border-radius:8px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.92);
    transition:0.3s;
}

input:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

/* ===== BUTTONS ===== */
input[type="submit"],
.back-btn{
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
    text-decoration:none;
    text-align:center;
    width:160px;
}

input[type="submit"]:hover,
.back-btn:hover{
    transform:scale(1.05);
}

/* ===== ERROR MESSAGE ===== */
.error-message{
    color:#ffb3b3;
    text-align:center;
    margin-bottom:12px;
    font-size:14px;
}

/* ===== RESPONSIVE ===== */
@media(max-width:600px){
    .login-container{
        width:90%;
        padding:34px 26px;
    }

    .login-container h2{
        font-size:24px;
    }

    input[type="submit"],
    .back-btn{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="login-container">
    <h2 class="gradient-text">Admin Login</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if(error != null){
    %>
        <p class="error-message"><%= error %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/AdminLoginServlet" method="post">
        <label>Username</label>
        <input type="text" name="adminuser" required>

        <label>Password</label>
        <input type="password" name="adminpass" required>

        <input type="submit" value="Login">
    </form>

    <!-- ✅ BACK TO HOME -->
    <a href="index.jsp" class="back-btn">⬅ Back to Home</a>
</div>

</body>
</html>
