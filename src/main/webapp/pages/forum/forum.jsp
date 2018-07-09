<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"  %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>forum</title>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>


    <script>setInterval(function () {
        $.get('/forumurl?nick-param=${n}&theme-param=${th}', function (data) {
            //  console.log(data);
            $("body").html(data);
        });
    }, 10000);</script>


</head>
<body>
<center>
<h4>Вы авторизовались под ником: ${n}</h4>
<h4>Тема: ${th}</h4>


<h2>Cообщения</h2>

<c:forEach var="message" items="${m}">
    <p>${message} </p>
  <%--  <p> ${message.nick} : ${message.text} : ${message.date} </p>--%>

</c:forEach>


<form action="/forumurl" method="post">
    <span>  ${n}: </span>
    <input hidden type="text" value="${n}" name="nick-param">
    <input hidden type="text" value="${th}" name="theme-param">
    <input type="text" name="text-param">

    <input type="submit" value="Отправить">
</form>

</center>
</body>
</html>
