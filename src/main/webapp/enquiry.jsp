<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Send Enquiry | PG Hostel Finder</title>

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

/* ===== GRADIENT ===== */
.gradient-text{
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* ===== CARD ===== */
.form-container{
    width:420px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:44px 50px;
    border-radius:20px;
}

/* ===== TEXT ===== */
h2{
    text-align:center;
    margin-bottom:28px;
    font-size:30px;
    font-weight:800;
}

label{
    display:block;
    margin-top:16px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:500;
}

/* ===== INPUT ===== */
input, textarea{
    width:100%;
    padding:11px 13px;
    border:none;
    border-radius:8px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.92);
}

textarea{
    height:95px;
    resize:none;
}

input:focus, textarea:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

/* ===== COUNTER ===== */
.counter{
    text-align:right;
    font-size:12px;
    color:#ddd;
    margin-top:4px;
}

/* ===== BUTTONS ===== */
button, .back-btn{
    display:block;
    width:160px;
    margin:18px auto 0;
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
    transition:0.3s;
}

button:hover, .back-btn:hover{
    transform:scale(1.05);
}
</style>

<script>
function countChars(el){
    document.getElementById("count").innerText =
        el.value.length + " / 300";
}
</script>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">Send Enquiry</h2>

    <form action="EnquiryServlet" method="post"
          onsubmit="this.querySelector('button').disabled=true;">
        
        <label>Your Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Message</label>
        <textarea name="message"
                  maxlength="300"
                  onkeyup="countChars(this)"
                  required></textarea>

        <div id="count" class="counter">0 / 300</div>

        <button type="submit">Send Enquiry</button>
    </form>

    <a href="home.jsp" class="back-btn">⬅ Back to Home</a>
</div>

</body>
</html>
