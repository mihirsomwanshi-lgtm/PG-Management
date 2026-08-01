<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Search PG | PG Hostel Finder</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

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

.gradient-text{
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.form-container{
    width:420px;
    background:rgba(0,0,0,0.30);
    backdrop-filter:blur(14px);
    padding:44px 50px;
    border-radius:20px;
    animation:fadeUp 1.2s ease;
}

@keyframes fadeUp{
    from{ opacity:0; transform:translateY(35px); }
    to{ opacity:1; transform:translateY(0); }
}

.form-container h2{
    text-align:center;
    margin-bottom:26px;
    font-size:30px;
    font-weight:800;
}

label{
    display:block;
    margin-top:14px;
    margin-bottom:6px;
    font-size:14px;
    font-weight:600;
}

input{
    width:100%;
    padding:11px 13px;
    border:none;
    border-radius:8px;
    font-size:14px;
    outline:none;
    background:rgba(255,255,255,0.92);
}

input:focus{
    box-shadow:0 0 10px rgba(168,144,254,0.45);
}

.rent-row{
    display:flex;
    gap:10px;
}

button, .back-btn{
    width:160px;
    display:block;
    margin:20px auto 0;
    padding:8px;
    font-size:14px;
    font-weight:600;
    border:none;
    border-radius:8px;
    cursor:pointer;
    text-align:center;
    text-decoration:none;
    background:linear-gradient(90deg,#EA8D8D,#A890FE);
    color:#fff;
    transition:0.3s;
}

button:hover, .back-btn:hover{
    transform:scale(1.05);
}

@media(max-width:600px){
    .form-container{
        width:90%;
        padding:34px 26px;
    }

    .rent-row{
        flex-direction:column;
    }

    button, .back-btn{
        width:100%;
    }
}
</style>
</head>

<body>

<div class="form-container">
    <h2 class="gradient-text">Search PG</h2>

    <form action="<%= request.getContextPath() %>/SearchServlet" method="get">

        <label>Location</label>
        <input type="text" name="location" placeholder="Enter location" required>

        <label>Rent Range</label>
        <div class="rent-row">
            <input type="number" name="minRent" placeholder="Min Rent" min="0">
            <input type="number" name="maxRent" placeholder="Max Rent" min="0">
        </div>

        <button type="submit">Search</button>
    </form>

    <a href="home.jsp" class="back-btn">⬅ Back to Home</a>
</div>

</body>
</html>
