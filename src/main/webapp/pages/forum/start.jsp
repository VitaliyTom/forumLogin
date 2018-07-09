<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>тема</title>
</head>
<body>
<center>
    <h1>Выбор темы</h1>

<form action="/forumurl" method="get">
    <h4>Вы авторизовались под ником: ${n}</h4>

    <input hidden type="text" name="nick-param" value="${n}">
    <span>Введи тему</span>
    <input  type="text" name="theme-param">
    <input type="submit" value="Войти в форум">

</form>
</center>
</body>
</html>
