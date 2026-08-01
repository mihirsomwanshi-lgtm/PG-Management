<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>PG Hostel Finder</title>

<style>


*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* ===== BODY ===== */
body{
    height:100vh;
    overflow:hidden;
    background:#000;
}

/* ===== BACKGROUND SLIDER ===== */
.slider{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100vh;
    z-index:-3;
}

.slide{
    position:absolute;
    width:100%;
    height:100%;
    background-size:cover;
    background-position:center;
    opacity:0;
    animation:fade 18s infinite, zoom 18s infinite;
}

/* Images */
.slide:nth-child(1){ background-image:url('images/pg1.jpg'); }
.slide:nth-child(2){ background-image:url('images/pg2.jpg'); animation-delay:6s; }
.slide:nth-child(3){ background-image:url('images/pg3.jpg'); animation-delay:12s; }

/* Fade */
@keyframes fade{
    0%{opacity:0}
    10%{opacity:1}
    30%{opacity:1}
    40%{opacity:0}
    100%{opacity:0}
}

/* Slow zoom */
@keyframes zoom{
    from{transform:scale(1)}
    to{transform:scale(1.15)}
}

/* ===== DARK OVERLAY (SOFTER) ===== */
.overlay{
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.50);
    z-index:-2;
}

/* ===== NAVBAR ===== */
.navbar{
    position:fixed;
    top:0;
    width:100%;
    padding:18px 60px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(8px);
    z-index:10;
    animation:slideDown 1s ease;
}

@keyframes slideDown{
    from{transform:translateY(-100%); opacity:0;}
    to{transform:translateY(0); opacity:1;}
}

/* ===== GRADIENT TEXT (DARKER) ===== */
.gradient-text{
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* LOGO */
.logo{
    font-size:28px;
    font-weight:800;
    letter-spacing:1px;
}

/* ===== NAV LINKS ===== */
.nav-links a{
    margin-left:28px;
    text-decoration:none;
    font-size:16px;
    font-weight:600;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
    position:relative;
    transition:all 0.3s ease;
}

/* underline animation */
.nav-links a::after{
    content:'';
    position:absolute;
    left:0;
    bottom:-6px;
    width:0%;
    height:2px;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    transition:0.3s;
}

.nav-links a:hover::after{
    width:100%;
}

.nav-links a:hover{
    transform:scale(1.08);
}

/* ===== CENTER CONTENT ===== */
.container{
    position:absolute;
    top:50%;
    left:50%;
    transform:translate(-50%,-50%);
    text-align:center;
    animation:fadeScale 1.4s ease;
}

@keyframes fadeScale{
    from{
        opacity:0;
        transform:translate(-50%,-50%) scale(0.9);
    }
    to{
        opacity:1;
        transform:translate(-50%,-50%) scale(1);
    }
}


.container h1{
    font-size:64px;
    font-weight:800;
    letter-spacing:1.6px;
     background:linear-gradient(90deg,#d07a9a,#8f7bd6);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}


@media(max-width:768px){
    .container h1{
        font-size:44px;
    }
    .nav-links a{
        margin-left:18px;
        font-size:14px;
    }
}

</style>
</head>

<body>

<div class="slider">
    <div class="slide"></div>
    <div class="slide"></div>
    <div class="slide"></div>
</div>

<div class="overlay"></div>
<div class="navbar">
    <div class="logo gradient-text">PG Hostel Finder</div>
               <div class="nav-links">
         <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
       
        <a href="about.jsp">About</a>
         <a href="adminlogin.jsp">Admin</a>
    </div>
</div>
<div class="container">
    <h1>Welcome to PG Hostel Finder</h1>
</div>

</body>
</html>
