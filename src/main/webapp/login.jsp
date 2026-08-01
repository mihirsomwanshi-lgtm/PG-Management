<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>User Login | PG Hostel Finder</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap');

/* ===== RESET ===== */
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* ===== BODY ===== */
body{
    height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    overflow:hidden;
    color:#fff;

    background:url('images/pgHostelimg.jpg') no-repeat center center;
    background-size:110%;
    animation:bgZoom 22s ease-in-out infinite alternate;
}

@keyframes bgZoom{
    from{background-size:110%;}
    to{background-size:120%;}
}

/* ===== DARK OVERLAY ===== */
body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.55);
    z-index:-1;
}

/* ===== SAME GRADIENT ===== */
.gradient-text{
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== FORM CARD ===== */
.form-container{
    width:390px;
    background:rgba(0,0,0,0.35);
    backdrop-filter:blur(16px);
    padding:46px 50px;
    border-radius:22px;
    box-shadow:0 25px 55px rgba(0,0,0,0.55);
    animation:fadeUp 1.1s ease;
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(35px) scale(0.95);}
    to{opacity:1; transform:translateY(0) scale(1);}
}

/* ===== HEADING ===== */
.form-container h2{
    text-align:center;
    margin-bottom:26px;
    font-size:28px;
    font-weight:800;
}

/* ===== ERROR ===== */
.error{
    background:rgba(255,0,0,0.15);
    color:#ffb3b3;
    padding:10px;
    border-radius:8px;
    font-size:14px;
    text-align:center;
    margin-bottom:16px;
}

/* ===== LABELS ===== */
label{
    display:block;
    margin-top:14px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:500;
}

/* ===== INPUTS ===== */
input{
    width:100%;
    padding:11px 14px;
    border:none;
    border-radius:9px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.95);
    transition:0.3s;
}

input:focus{
    box-shadow:0 0 12px rgba(194,123,160,0.6);
}

/* ===== BUTTON ===== */
button{
    width:170px;
    margin:26px auto 0;
    padding:10px;
    font-size:14px;
    font-weight:600;
    border:none;
    border-radius:10px;
    cursor:pointer;
    color:#fff;
    display:block;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    box-shadow:0 0 20px rgba(123,111,207,0.45);
    transition:0.35s;
}

button:hover{
    transform:translateY(-2px) scale(1.06);
    box-shadow:0 0 34px rgba(123,111,207,0.75);
}

/* ===== REGISTER LINK ===== */
p{
    text-align:center;
    margin-top:18px;
    font-size:14px;
    color:#ddd;
}

p a{
    text-decoration:none;
    font-weight:600;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

p a:hover{
    text-decoration:underline;
}

/* ===== RESPONSIVE ===== */
@media(max-width:600px){
    .form-container{
        width:92%;
        padding:36px 26px;
    }
    button{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">User Login</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if(error != null){ 
    %>
        <div class="error"><%= error %></div>
    <% } %>

    <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Enter your password" required>

        <button type="submit">Login</button>
    </form>

    <p>New user? <a href="register.jsp">Register</a></p>
</div>

</body>
</html>
