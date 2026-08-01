<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Contact | PG Management System</title>
<link rel="icon" href="Logo/Logo.png" type="image/x-icon">

<style>
/* ===== RESET ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Segoe UI", Tahoma, sans-serif;
}

body {
    background: #f5f7fb;
    color: #333;
}

/* ===== NAVBAR ===== */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 60px;
    background: #2c3e50;
}

.navbar h2 {
    color: #fff;
}

.navbar ul {
    list-style: none;
    display: flex;
    gap: 25px;
}

.navbar ul li a {
    text-decoration: none;
    color: #ddd;
    font-weight: 500;
    transition: 0.3s;
}

.navbar ul li a:hover,
.navbar ul li a.active {
    color: #1abc9c;
}

/* ===== CONTACT HERO ===== */
.contact-hero {
    height: 200px;
    background: linear-gradient(to right, #1abc9c, #16a085);
    display: flex;
    justify-content: center;
    align-items: center;
}

.contact-hero h1 {
    color: #fff;
    font-size: 42px;
    letter-spacing: 1px;
}

/* ===== CONTACT SECTION ===== */
.contact-section {
    display: flex;
    justify-content: center;
    gap: 40px;
    padding: 60px;
    flex-wrap: wrap;
}

/* ===== CONTACT INFO ===== */
.contact-info {
    background: #fff;
    padding: 35px;
    width: 420px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

.contact-info h2 {
    margin-bottom: 20px;
    color: #2c3e50;
}

.contact-info p {
    margin-bottom: 12px;
    font-size: 15px;
    line-height: 1.6;
}

/* ===== CONTACT FORM ===== */
.contact-form {
    background: #fff;
    padding: 35px;
    width: 420px;
    border-radius: 10px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
}

.contact-form h2 {
    margin-bottom: 20px;
    color: #2c3e50;
}

.contact-form input,
.contact-form textarea {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border-radius: 6px;
    border: 1px solid #ccc;
    outline: none;
    font-size: 14px;
}

.contact-form input:focus,
.contact-form textarea:focus {
    border-color: #1abc9c;
}

.contact-form button {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 6px;
    background: #1abc9c;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: 0.3s;
}

.contact-form button:hover {
    background: #16a085;
}

/* ===== FOOTER ===== */
footer {
    background: #2c3e50;
    color: #ccc;
    text-align: center;
    padding: 15px;
    margin-top: 50px;
    font-size: 14px;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 768px) {
    .navbar {
        flex-direction: column;
        gap: 10px;
    }

    .contact-section {
        padding: 30px;
    }

    .contact-info,
    .contact-form {
        width: 100%;
    }
}
</style>
</head>

<body>

<!-- ===== NAVBAR ===== -->
<nav class="navbar">
    <h2>PG Management System</h2>
    <ul>
        <li><a href="main-page.jsp">Home</a></li>
        <li><a href="main-about.jsp">About</a></li>
        <li><a href="main-contact.jsp" class="active">Contact</a></li>
        <li><a href="register.jsp">Register</a></li>
    </ul>
</nav>

<!-- ===== CONTACT HERO ===== -->
<section class="contact-hero">
    <h1>Contact Us</h1>
</section>

<!-- ===== CONTACT SECTION ===== -->
<section class="contact-section">

    <!-- Contact Info -->
    <div class="contact-info">
        <h2>Get in Touch</h2>
        <p><b>📍 Address:</b> Nashik 422105, Maharashtra, India</p>
        <p><b>📞 Phone:</b> +91 98765 43210, 89567 98138</p>
        <p><b>📧 Email:</b> pgmanagement@gmail.com</p>
        <p><b>⏰ Working Hours:</b> Mon – Sat (9 AM – 6 PM), Sunday (Closed)</p>
    </div>

    <!-- Contact Form -->
    <div class="contact-form">
        <h2>Send Feedback / Query</h2>

        <form onsubmit="submitForm(event)">
            <input type="text" placeholder="Your Name" required>
            <input type="email" placeholder="Your Email" required>
            <textarea rows="5" placeholder="Your Message" required></textarea>
            <button type="submit">Submit</button>
        </form>
    </div>

</section>

<!-- ===== FOOTER ===== -->
<footer>
    <p>© 2026 PG Management System | Final Year Project</p>
</footer>

<script>
function submitForm(e) {
    e.preventDefault();
    alert("Thank you! Your message has been submitted.");
}
</script>

</body>
</html>
