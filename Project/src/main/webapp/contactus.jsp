<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Contact Us</title>
    <style>
        body {
            background-color: #f7f7f7;
            font-family: Arial, sans-serif;
            color: #333333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .contact-container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 500px;
            text-align: center;
        }
        h2 {
            color: #333333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            text-align: left;
            font-size: 14px;
            color: #333333;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            font-family: Arial, sans-serif;
        }
        textarea {
            height: 100px;
        }
        .submit-button {
            background-color: #2196F3;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .login-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }
        .submit-button:hover {
            background-color: #1976D2;
        }
        .login-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="contact-container">
        <h2>Contact Us</h2>
        <form action="contactus" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter Name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter Email" required>
            
            <label for="message">Message:</label>
            <textarea id="message" name="message" placeholder="Enter Message" required></textarea>
            
            <button type="submit" class="submit-button">Submit Message</button>
            <button type="button" class="login-button" onclick="location.href='login.jsp'">Login</button>
        </form>

        <script>
            <% 
                String message = (String) request.getAttribute("message");
                if (message != null) {
            %>
                alert("<%= message %>");
            <% } %>
        </script>
    </div>
</body>
</html>
