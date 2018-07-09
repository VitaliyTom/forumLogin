<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>тема</title>

    <style>form {
        margin: 200px;
    }</style>

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
</head>
<body bgcolor="Cornsilk">
<center>


    <div id="blink6">

        <p><h2>{ Вы авторизовались под логином: ${n} }</h2></p>

        <p><h1> { Выбор темы } </h1></p>


        <p><form action="/forumurl" method="get">


    <input hidden type="text" name="nick-param" value="${n}">
    <span>[ Введи тему ] :</span>
    <input  type="text" name="theme-param">
    <input type="submit" value="Войти в форум">

</form>
        </p>
    </div>
</center>
</body>
</html>
