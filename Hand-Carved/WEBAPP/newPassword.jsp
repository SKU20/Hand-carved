<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

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
            color: black;
        }

        .container {
            width: 400px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.5);
            padding: 30px;
        }

        .logo {
            text-align: center;
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 20px;
            color: black;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            height: 40px;
            padding: 8px;
            font-size: 16px;
            border: 1px solid black;
            border-radius: 5px;
        }

        .form-group input:focus {
            outline: none;
            border-color: grey;
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .btn {
            width: 150px;
            height: 40px;
            background-color: #ccc;
            color: black;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn:hover {
            background-color: lightgrey;
        }

        .fa-lock {
            margin-right: 5px;
        }

        .message {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            color: red;
            font-size: 14px;
        }

        .back-login {
            color: black;
            margin-top: -10px;
            text-decoration: none;
            font-size: 14px;
        }

        .back-login i {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    
    <div class="container">
    <a href="index.jsp" class="back-login"><i class="fas fa-arrow-left"></i>Back to login</a>
        <div class="logo">Reset Password</div>
        <form action="newPassword" method="POST">							
            <div class="form-group">
                <label for="password"><i class="fas fa-lock"></i>New Password</label>
                <input type="text" name="password" id="password" placeholder="Enter your new password" required>
            </div>
            <div class="form-group">
                <label for="confPassword"><i class="fas fa-lock"></i>Confirm New Password</label>
                <input type="password" name="confPassword" id="confPassword" placeholder="Confirm your new password" required>
            </div>
            <div class="button-container">
                <input type="submit" value="Reset" class="btn">
            </div>  	
            <div class="message">
                ${error}
            </div>
        </form>							
    </div>
    <script src="https://kit.fontawesome.com/cfcf8a8a29.js" crossorigin="anonymous"></script>
</body>
</html>
