<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin panel</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/admin/admin.css" rel="stylesheet">
    <link href="${contextPath}/resources/css/admin/main.css" rel="stylesheet">

    <script src="${contextPath}/resources/libs/jquery/jquery-1.9.1.min.js"></script>
    <script src="${contextPath}/resources/js/admin/admin.js"></script>
    <script src="${contextPath}/resources/js/admin/listing.js"></script>
    <script src="${contextPath}/resources/js/admin/jquery-ui.js"></script>
    <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${contextPath}/resources/js/admin/jquery.validate.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

<div id="s_holder_id" class="row">
    <div class="col-md-12">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <b><span class="glyphicon glyphicon-picture" aria-hidden="true"></span> ADMIN PANEL</b>
            </div>
            <div class="panel-body">
                <div class="col-xs-12 hidden-md hidden-lg text-right">
                    <span class="glyphicon glyphicon-align-justify glyp-menu" id="glyp-menu"></span>
                </div>

                <div class="col-xs-12 col-md-4 col-lg-2 admin-nav" id="admin-nav">
                    <nav>
                        <ul class="nav" id="nav">
                            <li><a href="/" id="home_link" class="link">Home</a></li>
                            <li><a id="gallery" href="listing" class="link">Gallery</a></li>
                        </ul>
                    </nav>
                </div>

                <!--Content start -->
                <div class="col-xs-12 col-md-8 col-lg-10 admin-content" id="content">

                    <!--Content welcome start -->
                    <div id="welcome_panel" class="panel panel-info">
                        <div class="panel-heading">
                            Welcome
                        </div>
                        <div class="panel-body">
                            <div class="col-xs-12 col-sm-8 col-md-6 col-lg-8">
                                <c:if test="${pageContext.request.userPrincipal.name != null}">
                                    <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    </form>

                                    <h2>Welcome to admin panel | <a onclick="document.forms['logoutForm'].submit()">Logout</a>
                                    </h2>

                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!--Content welcome end -->

                    <!--Content edit gallery start -->
                    <div id="edit_gallery" class="panel panel-info" style="display: none">
                        <div class="panel-heading">
                            Edit gallery
                        </div>
                        <div class="panel-body">
                            <%--<form id="edit_listing_form" action="listing/save">--%>

                            <div class="center-but-wrap">
                                <button type="button" class="btn btn-success" id="add_list_img"><span
                                        class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add New Image
                                </button>
                                <p id="add_list_img_res"></p>
                            </div>

                                <div class="uploaded-imgs row text-center">
                                <c:forEach items="${images}" var="image_path">
                                    <div class="list-img-wrap">
                                        <div class="list-img"
                                             style="background-image: url(${contextPath}${image_path});"></div>
                                        <div class="buts-group">
                                            <form class="remove_image_form" method="POST" action="image/remove">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}"/>
                                                <input type="text" class="img_name display-none" name="img_name" value=${image_path}>
                                            </form>
                                            <button type="button"
                                                    class="btn btn-success img-list-remove-button"><span
                                                    class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                                Remove
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>

                            <div id="page_res"></div>
                        </div>
                    </div>
                    <!--Content edit gallery end -->

                    <div class="list-img-wrap display-none" id="tpl-uploaded-imgs">
                        <div class="list-img"></div>
                        <div class="buts-group">
                            <form id="add_image_form" method="POST" action="uploadFile" enctype="multipart/form-data">
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                                <input id="new_image" type="file" class="display-none" name="file"
                                       accept="image/jpeg,image/png,image/gif">
                            </form>
                            <form id="remove_image_form" method="POST" action="image/remove">
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                                <input type="text" class="img_name display-none" name="img_name" value="">
                            </form>
                            <button type="button" class="btn btn-success img-list-remove-button"><span
                                    class="glyphicon glyphicon-trash" aria-hidden="true"></span> Remove
                            </button>
                        </div>
                    </div>

                    <script>
                        var del_imgs = [];

                        $(document).ready(function () {
                            /* FORM VALIDATION */
                            $('#edit_listing_form').validate({
                                rules: {
                                    name: {
                                        required: true,
                                        minlength: 2
                                    },
                                    description: {
                                        required: true
                                    },
                                    mls: {
                                        required: true,
                                        maxlength: 8,
                                        minlength: 8,
                                        onlyInt: true
                                    },
                                    property_type: {
                                        required: true
                                    },
                                    location: {
                                        required: true
                                    },
                                    price: {
                                        required: true,
                                        onlyInt: true
                                    },
                                    bed_rooms: {
                                        onlyInt: true
                                    },
                                    baths: {
                                        onlyInt: true
                                    },
                                    sq_ft: {
                                        number: true
                                    },
                                    map_code: {
                                        required: true
                                    }
                                }
                            });
                        })
                    </script>
                </div>
                <!-- Content end -->
            </div>
        </div>
    </div>
</div>

</body>
</html>
