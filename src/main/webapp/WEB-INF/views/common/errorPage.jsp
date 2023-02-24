<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
	<head>
	<title>Error_page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

	<style>
		body{
			background: url("/resources/assets/img/error.png");
			background-size: cover;
		}
		
		#wrap{
		margin: auto;
	}
		#image{
			display : flex;
			flex-direction:row;
			justify-content: center;
			align-items: center;
		}
		h1{
			display : flex;
			justify-content: center;
			align-items: center;
			color: white;
		}

	</style>

	</head>
	<body id="error">
	<div id="wrap">
		<div id="image">
			<a href="/"><img src="/resources/assets/img/logo.png"></a>
		</div>
		<h1>요청하신 주소에 대한 권한이 없습니다.</h1>
	</div>
	</body>
</html>