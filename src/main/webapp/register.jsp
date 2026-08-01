<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register | PG Hostel Finder</title>

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

/* Entry animation */
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
    margin-top:14px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:500;
}

/* ===== INPUTS ===== */
input{
    width:100%;
    padding:11px 13px;
    border:none;
    border-radius:8px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.92);
    transition:0.3s;
}

/* Focus glow */
input:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

/* ===== SMALL BUTTON ===== */
button{
    width:160px;
    margin:22px auto 0;
    padding:8px;
    font-size:14px;
    font-weight:600;
    border:none;
    border-radius:8px;
    cursor:pointer;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    color:#fff;
    transition:all 0.3s ease;
    display:block;
}

/* Button hover */
button:hover{
    transform:scale(1.04);
}

/* ===== LOGIN LINK ===== */
p{
    text-align:center;
    margin-top:16px;
    font-size:14px;
    color:#ddd;
}

p a{
    color:#ffc2e0;
    text-decoration:none;
    font-weight:600;
}

p a:hover{
    text-decoration:underline;
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

    button{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">User Registration</h2>

    <form action="RegisterServlet" method="post">
        <label>Name</label>
        <input type="text" name="name" placeholder="Enter your name" required>

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Password</label>
        <input type="password" name="password" placeholder="Create a password" required>

        <label>Mobile</label>
        <input type="text" name="mobile" placeholder="Enter your mobile number" required>

        <button type="submit">Register</button>
    </form>

    <p>Already have an account? <a href="login.jsp">Login</a></p>
</div>

</body>
</html>
