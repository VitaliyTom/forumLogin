<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <title>Login</title>

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

    <style>
        @-webkit-keyframes pulsate {
            50% {
                color: #fff;
                text-shadow: 0 -1px rgba(0, 0, 0, .3), 0 0 5px #000, 0 0 8px #000;
            }
        }

        @keyframes pulsate {
            50% {
                color: #fff;
                text-shadow: 0 -1px rgba(0, 0, 0, .3), 0 0 5px #000, 0 0 8px #000;
            }
        }

        #blink7 {
            color: rgb(245, 245, 245);
            text-shadow: 0 -1px rgba(0, 0, 0, .1);
            background: Cornsilk;
            -webkit-animation: pulsate 1.2s linear infinite;
            animation: pulsate 1.2s linear infinite;
        }
    </style>

</head>

<body bgcolor="Cornsilk">

<center>
    <form>

        <div id="blink6"><h1>{ ${m} }</h1></div>
        <div ><h1>  ${login}   </h1></div>

        <div id="blink7"><a href="/default.html">[ Back ]</a></div>

    </form>
</center>

</body>
</html>
