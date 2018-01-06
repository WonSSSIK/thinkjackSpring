
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="false"/>

<!DOCTYPE html>

<html lang="en">

<head>
    <!--필수 -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!--w3schools-->
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <title>Thinkjack</title>

    <!--css파일 연결부분-->
    <link href="/resources/dist/css/common.css" rel="stylesheet">
    <link href="/resources/dist/css/main.css" rel="stylesheet">

    <!--sidenavbar-새로운 게시글 알림-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

    <!--아이콘-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="/resources/assets/css/bootstrap.css" rel="stylesheet">
    <link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
    <link href="/resources/assets/css/docs.css" rel="stylesheet" >

    <link href="/resources/bootstrap-social.css" rel="stylesheet" >
    <script>
        var socialId=Boolean(${socialID});
        if(socialId){
            alert("소셜 아이디는 패스워드를 변경할 수 없습니다. \n해당 소셜 사이트에 접속하여 변경해 주세요.");
            self.location = '/test/myinfo';
        }

    </script>
</head>
<body>
<div class="container text-center">

    <div class="row">
        <div class="col-sm-4"></div>

        <div class="col-sm-4">


            <form name="login" action="/user/setPassAuthCheck" method="post">


                <div class="panel-heading">
                    <div class="panel-title"><h1>패스워드 변경</h1></div>
                </div>
                <input type="text" class="form-control" id="userEmail" name="userEmail" value="${login.userEmail}" readonly autofocus>
                <input type="text" class="form-control" id="userPassword" name="userPassword" placeholder="Password를 입력해주세요" autofocus >
                <input type="submit" class="form-control btn btn-primary" value="로그인"/>

                <%--<a href="/user/naverLogin"><img width="100%" height="50" src="/resources/images/20171227_094328214.jpg"/></a>--%>



                <%--<a href="/user/googleLogin"><img width="100%" height="50" src="/resources/images/google.png"/></a>--%>
                <div>
                    <%--<a href="/user/githubLogin">--%>
                    <%--<img width="100%" height="50" src="/resources/images/github.png"/>--%>
                    <%--</a>--%>

                </div>

            </form>
        </div>
    </div>

</div>

</body>
</html>