<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Password Recovery</title>
    <style>
        body {
            font-family: "Roboto", Arial, sans-serif;
            background-image: linear-gradient(to bottom right, #FD8451, #FFBD6F);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            width: 400px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
        }
        .logo {
            text-align: center;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #333;
        }
        .steps {
            margin-left: 20px;
            color: #666;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
            color: #333;
        }
        .form-group input {
            width: 100%;
            height: 40px;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group input:focus {
            outline: none;
            border-color: #FD8451;
        }
        .small-text {
            margin-left: 20px;
            color: #888;
        }
        .btn-success {
            border: none;
            border-radius: 5px;
            font-family: "Courier New", Courier, monospace;
            height: 40px;
            width: 100%;
            background-color: #FD8451;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }
        .btn-success:hover {
            background-color: #FFBD6F;
        }
        .back-login {
            color: #FD8451;
            margin-top: 10px;
            text-decoration: none;
            font-size: 14px;
        }
        .back-login:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-login">Back to login</a>
        <div class="logo">Hand-carved</div>
        <div class="steps">
            <p>Forgot your password?</p>
            <ol>
                <li>Enter your email address below.</li>
                <li>Our system will send you a password recovery code to your email.</li>
                <li>Enter the code on the next page.</li>
            </ol>
        </div>
        <form class="submit-box" action="forgotPassword" method="POST">
            <small class="small-text">Enter the registered email address. We'll email a password recovery code to this address.</small>
            <div class="form-group">
                <label for="email-for-pass">Enter your email address</label>
                <input class="form-control" type="text" name="email" id="email-for-pass" required="">
                <label style="color: red;">${error}</label>
            </div>
            <button class="btn-success" type="submit">Get New Password</button>
        </form>
    </div>
</body>
</html>
