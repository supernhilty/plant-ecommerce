<%-- 
    Document   : aboutus
    Created on : Mar 17, 2023, 4:29:37 PM
    Author     : leyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>About us</title>
        <link rel="stylesheet" href="css/teststyle.css">
        <link rel="stylesheet" href="css/stylesheet.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Rubik:wght@300&display=swap">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
    </head>

    <body>
        <!--Navigation bar-->
        

        <header>
             <%@include file="header.jsp" %>
        </header>

       

        <!--Content-->
        <div class="row d-flex justify-content-center">
          <h1 class="d-flex justify-content-center" style="padding: 0.75em">OUR MISSION</h1>
          <div class="d-flex justify-content-center" style="padding: 0 5rem 0 5rem;">
            <blockquote class="blockquote" style="font-style: italic;">
              <p>“Tranquility, serenity, and beauty of nature taught me</p>
              <p>How to find happiness in life </p>
              <p>And in the silence of eternity.”</p>
            </blockquote>
          </div>
          <div class="blockquote-footer d-flex justify-content-center">
            <p>Debasish Mridha</p>  
          </div>
      </div>

      <!--Expandable content-->
      <div class="container collapse" id="devIntroduction">
        <div class="blockquote">
          <p>My story begins back when I was a kid with a snap-on cape and a burning desire to change the world. 
            And while most kids have some type of superhero complex when they are younger, they eventually outgrow it.</p>
          <p>Not me.</p>
          <p>I spent the vast majority of my life searching for the proverbial burning building that I would run into and save the day. 
            Leaving my mark on this planet. However, stuff like that rarely shows up when or how we expect it to. 
            But more on that later.</p>
          <p>Upon the realization that it might take a little longer to change the world than I thought, I got distracted. 
            I found myself graduating from Berklee College of Music in Boston, Massachusetts 
            with a degree in music performance and the impossible dream of one day performing on Broadway.</p>
          </div>
        <hr class="featurette-divider">
        <!-- People thoughts -->
        <h1 class="d-flex justify-content-center" style="padding: 0.75em">OUR TEAM</h1>
        <div class="row text-center" style="margin-top: 6rem;">
          <div class="col-lg-4">
            <img src="images/avatar1.jpg" width="140" height="140" class="rounded-circle">
            <h2 class="fw-normal">Pavel Antonov</h2>
            <p style="margin-bottom: 2em">Agriculture consultant, University of Lomonosov, USSR</p>
            
          </div>
          <div class="col-lg-4">
            <img src="images/avatar2.jpg" width="140" height="140" class="rounded-circle">
            <h2 class="fw-normal">Hu Tao</h2>
            <p style="margin-bottom: 2em">Wangsheng Funeral Parlor, Liyue</p>
            
          </div>
          <div class="col-lg-4">
            <img src="images/avatar3.png" width="140" height="140" class="rounded-circle">
            <h2 class="fw-normal">Walter White</h2>
            <p style="margin-bottom: 2em">Modernist Meth, University of Weed and Drug, Ohio</p>
          </div>
        </div>
      </div>
  
      <!--A button to expand-->
      <div class="d-flex justify-content-center" style="margin: 2em;">
        <div>
          <button class="button" id="collapseButton" type="button" data-bs-toggle="collapse" data-bs-target="#devIntroduction" 
          aria-expanded="false" aria-controls="devIntroduction" onclick="hideElement()">
            Learn more
          </button>
        </div>
      </div>

      <!--Footer-->
            <footer class="container py-5">
                <%@include file="footer.jsp" %>
            </footer>
          
          <script src="js/test.js"></script>
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" 
        integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" 
        crossorigin="anonymous">
          </script>
    </body>
</html>
