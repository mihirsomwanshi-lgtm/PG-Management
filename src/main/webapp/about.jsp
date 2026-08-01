<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>About | PG Hostel Finder</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap');

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

/* ===== BODY & BACKGROUND ===== */
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
    from{ background-size:110%; }
    to{ background-size:120%; }
}

/* ===== DARK OVERLAY ===== */
body::before{
    content:'';
    position:fixed;
    inset:0;
    background:rgba(0,0,0,0.55);
    z-index:-1;
}

/* ===== SAME GRADIENT AS HOME ===== */
.gradient-text{
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== ABOUT CARD ===== */
.about-container{
    width:560px;
    background:rgba(0,0,0,0.35);
    backdrop-filter:blur(18px);
    padding:50px 56px;
    border-radius:26px;
    text-align:center;
    box-shadow:0 25px 55px rgba(0,0,0,0.55);
    animation:fadeUp 1.2s ease;
}

@keyframes fadeUp{
    from{opacity:0; transform:translateY(40px) scale(0.95);}
    to{opacity:1; transform:translateY(0) scale(1);}
}

/* ===== HEADING ===== */
.about-container h2{
    font-size:34px;
    font-weight:800;
    margin-bottom:22px;
}

/* ===== TEXT ===== */
.about-container p{
    font-size:15.5px;
    line-height:1.9;
    color:#e5e7eb;
    margin-bottom:16px;
}

/* ===== FEATURES ===== */
.features{
    text-align:left;
    margin:26px auto 0;
    max-width:380px;
}

.features li{
    list-style:none;
    font-size:14.5px;
    margin-bottom:14px;
    padding-left:26px;
    position:relative;
    color:#e5e7eb;
}

.features li::before{
    content:"✔";
    position:absolute;
    left:0;
    font-weight:700;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== BACK BUTTON ===== */
.back-btn{
    display:inline-block;
    margin-top:32px;
    padding:12px 28px;
    font-size:14.5px;
    font-weight:600;
    border-radius:14px;
    text-decoration:none;
    color:#fff;
    background:linear-gradient(90deg,#c27ba0,#7b6fcf);
    box-shadow:0 0 22px rgba(123,111,207,0.45);
    transition:0.35s;
}

.back-btn:hover{
    transform:translateY(-3px) scale(1.06);
    box-shadow:0 0 38px rgba(123,111,207,0.75);
}

/* ===== RESPONSIVE ===== */
@media(max-width:600px){
    .about-container{
        width:92%;
        padding:38px 26px;
    }

    .about-container h2{
        font-size:26px;
    }

    .about-container p{
        font-size:14px;
    }
}
</style>
</head>

<body>

<div class="about-container">
    <h2 class="gradient-text">About PG Hostel Finder</h2>

    <p>
        PG Hostel Finder is a modern platform built to help students and working
        professionals find verified, affordable, and comfortable PG accommodations
        without the usual hassle.
    </p>

    <p>
        Our goal is to make PG searching simple, transparent, and trustworthy by
        offering clear details, instant enquiries, and a smooth user experience.
    </p>

    <ul class="features">
        <li>Search PGs by location and budget</li>
        <li>View facilities, pricing & availability</li>
        <li>Instant enquiry to PG owners</li>
        <li>Admin panel for PG & enquiry management</li>
        <li>Secure login & session handling</li>
    </ul>

    <a href="index.jsp" class="back-btn">← Back to Home</a>
</div>

</body>
</html>
