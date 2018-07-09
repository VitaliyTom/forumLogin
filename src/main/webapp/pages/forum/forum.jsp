<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"  %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>forum</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>



    <style>form {
        margin: 200px;
    }</style>

    <%--
        <style>
            @-webkit-keyframes blink6 {
                10% {
                    transform: scale(1, 1) rotate(80deg);
                }
                20% {
                    transform: scale(0, 0) rotate(160deg);
                }
                100% {
                    transform: scale(0, 0) rotate(0deg);
                }
            }

            @keyframes blink6 {
                10% {
                    transform: scale(1, 1) rotate(80deg);
                }
                20% {
                    transform: scale(0, 0) rotate(160deg);
                }
                100% {
                    transform: scale(0, 0) rotate(0deg);
                }
            }

            #blink6 {
                position: relative;
                display: inline-block;
                color: #000;
                font-size: 200%;
                text-shadow: 0 0 10px #3d7a97;
                background: Cornsilk;
            }

            #blink6:after, #blink6:before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                display: block;
                width: 100px;
                height: 100px;
                background-image: radial-gradient(rgba(1, 1, 1, 1), rgba(1, 1, 1, 0) 30%),
                linear-gradient(45deg, rgba(0, 0, 0, 0) 49%, rgba(1, 1, 1, .4) 50%, rgba(0, 0, 0, 0) 51%),
                linear-gradient(135deg, rgba(0, 0, 0, 0) 49%, rgba(1, 1, 1, .4) 50%, rgba(0, 0, 0, 0) 51%);
                -webkit-animation: blink6 10s linear infinite;
                animation: blink6 10s linear infinite;
                transform: scale(0, 0) rotate(0deg);
            }

            #blink6:before {
                top: -30%;
                right: 0;
                left: auto;
                -webkit-animation-delay: 5s;
                animation-delay: 5s;
            }
        </style>


    --%>

    <script>setInterval(function () {
        $.get('/forumurl?nick-param=${n}&theme-param=${th}', function (data) {
            //  console.log(data);
            $("body").html(data);
        });
    }, 10000);</script>


</head>
<body bgcolor="Cornsilk">
<center>

    <div id="blink7">
<h4>{ Вы авторизовались под ником: ${n} }</h4>
<h4>[ Тема ] : { ${th} }</h4>


<h2>{ Cообщения }</h2>
    </div>

<c:forEach var="message" items="${m}">
    <p>[ ${message} ]</p>
  <%--  <p> ${message.nick} : ${message.text} : ${message.date} </p>--%>

</c:forEach>


<form action="/forumurl" method="post">
    <span> [ ${n} ] : </span>
    <input hidden type="text" value="${n}" name="nick-param">
    <input hidden type="text" value="${th}" name="theme-param">
    <input type="text" name="text-param">

    <input type="submit" value="Отправить">
</form>


</center>

</body>
</html>
