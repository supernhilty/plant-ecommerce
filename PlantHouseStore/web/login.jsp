<%-- 
    Document   : login
    Created on : Mar 4, 2023, 7:19:13 AM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Sign in</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Amatic+SC:wght@700&family=Rubik:wght@300&display=swap" rel="stylesheet">
        <style>
            h6 {
              font-family: 'Amatic SC';
              font-size: 3em;
              text-align: center;
            }
        </style>
    </head>
    <body>
       
        <section>
            <div class="form-box">
                <div class="form-value">
                     <p>${requestScope.USER_MESSAGE}</p>
                     <p>${requestScope.messagelogin}</p>
                    <form action="login" method="POST">                       
                        <h6>glad to see you again</h6>
                        <div class="inputbox">
                            <input type="text" required name="userID">
                            <label for="">Username</label>
                        </div>
                        <div class="inputbox">
                            <input type="password" name="password" required>
                            <label for="">Password</label>
                        </div>
                        <input name="action" value="login" type="hidden"/>
                        <input type="submit" value="Log in"/>
                        <div class="register">
                            <p>Don't have an account?<a href="signup.jsp"> Register</a></p>
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
