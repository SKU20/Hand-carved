<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enter Recovery Code</title>
    <style>
        body {
            background-image: linear-gradient(to bottom right, #FD8451, #FFBD6F);
            font-family: "Roboto", Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            padding: 30px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .code-input {
            width: 100%;
            height: 40px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 20px;
            padding: 8px;
            outline: none;
        }
        .submit-button {
            width: 100%;
            height: 40px;
            background-color: #FD8451;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .submit-button:hover {
            background-color: #FFBD6F;
        }
        .error-message {
            color: red;
            font-size: 14px;
            text-align: center;
            margin-top: 10px;
        }
        .back-login {
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Enter Recovery Code</h2>
        <% if (request.getAttribute("message") != null) { %>
            <p class="error-message"><%= request.getAttribute("message") %></p>
        <% } %>
        <form action="ValidateOtp" method="post">
            <input class="code-input" type="text" name="otp" placeholder="Enter OTP" required>
            <button type="submit" class="submit-button">Reset Password</button>
        </form>
        <div class="back-login"><a href="index.jsp">Back to Login</a></div>
    </div>
</body>
</html>
