<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>

    <meta charset="utf-8">
    <title>LandingPage</title>

    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/libs/lightslider/css/lightslider.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">


<!-- Navigation section
================================================== -->
<section class="navbar navbar-default navbar-fixed-top sticky-navigation" role="navigation">
    <div class="container">

        <div class="navbar-header">
            <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
                <span class="icon icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right main-navigation">
                <li><a href="#gallery" class="smoothScroll">Gallery</a></li>
                <li><a href="#news" class="smoothScroll">News</a></li>
            </ul>
        </div>

    </div>
</section>


<!-- Gallery section
================================================== -->
<section id="gallery" class="paralla-section">

    <div class="clearfix">
        <ul id="image-gallery" class="image-gallery">
            <c:forEach items="${images}" var="image_path">
                <li data-thumb=${contextPath}${image_path}>
                    <img src=${contextPath}${image_path}/>
                </li>
            </c:forEach>
        </ul>
    </div>
</section>


<!-- news section
================================================== -->
<section id="news" class="paralla-section">
    <div class="container">
        <div class="row">
            <h2>Last news in IT industry<br>
                News from <a href="https://itbukva.com/">ITbukva.com</a>
            </h2>
            <div id="it_news">
                ${news}
            </div>
        </div>
    </div>

</section>

<!-- popup
================================================== -->

<div id="popup" class="popup-wrapper">
    <div id="wrapper" class="wrapper_news">
        <img id="close_img" src="${contextPath}/resources/images/x.png" class="close-popup">
        <div id="content_popup">
        </div>
    </div>
</div>


<!-- Javascript
================================================== -->
<script src="${contextPath}/resources/js/jquery.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${contextPath}/resources/js/jquery.nav.js"></script>
<script src="${contextPath}/resources/libs/lightslider/js/lightslider.js"></script>
<script src="${contextPath}/resources/js/custom.js"></script>
<script src="${contextPath}/resources/js/jquery.parallax.js"></script>
<script src="${contextPath}/resources/js/home.js"></script>

</body>
</html>
