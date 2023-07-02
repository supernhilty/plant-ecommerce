<%-- 
    Document   : signup
    Created on : Mar 5, 2023, 2:47:34 PM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign up</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
              integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Rubik:wght@300&display=swap" rel="stylesheet">
        <style>
            h4 {
                font-family: 'Amatic SC';
                font-size: 3em;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <%@include file="header.jsp" %>
        </header>
        <section>
            <div class="form-box">
                <div class="form-value">
                    <form action="./signup" method="POST">
                        <h4>welcome</h4>                       
                        <div class="inputbox">
                            <input type="text" id="username" name="userID" required>
                            <label for="">Username</label>

                        </div>
                        ${requestScope.USER_ERROR.getUserIDError()}
                        <div class="inputbox">
                            <input type="text" name="fullName" required>
                            <label for="">Full Name</label>

                        </div>
                        ${requestScope.USER_ERROR.getFullNameError()}
                        <div class="inputbox">
                            <input type="password" id="password" name="password" required>
                            <label for="">Password</label>
                        </div>
                        <div class="inputbox">
                            <input type="password" id="password2" name="confirm" required>
                            <label for="">Confirm password</label>

                        </div>
                        ${requestScope.USER_ERROR.getConfirmError()}
                        <div class="inputbox">
                            <input type="text" id="password2" name="phone" required>
                            <label for="">Phone</label>

                        </div>
                        ${requestScope.USER_ERROR.getPhoneError()}<br>
                        <div><input type="submit" name="action" value="Sign up"/></div>

                        ${requestScope.USER_ERROR.getMessageError()}<br>
                        <div class="register">
                            <p>Already a member?<a href="login.jsp"> Login</a></p>
                        </div>
                    </form>
                </div>
            </div>
        </section>
        <footer>
            <%@include file="footer.jsp" %> 
        </footer>
        <script src="js/test.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
                crossorigin="anonymous">
        </script>
    </body>
</html>
