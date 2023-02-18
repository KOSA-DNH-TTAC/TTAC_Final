<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>DOTO:저녁 점호</title>
  <meta content="" name="description">
  <meta content="" name="keywords">



  <!-- Template Main CSS File -->
  <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

  <style>
#effectContainer {
  height: 200px;
  width: 400px;
  background-color: #eee;
  position: relative;
}

  </style>
</head>

<body>

<div id="effectContainer">Move your cursor over me</div>






</body>
  <script>
  const container = document.querySelector("#effectContainer");

  container.addEventListener("mousemove", (e) => {
    const x = e.clientX;
    const y = e.clientY;
    container.style.backgroundColor = `rgb(${x/4}, ${y/4}, ${(x/4 + y/4)/2})`;
  });

  </script>
</html>