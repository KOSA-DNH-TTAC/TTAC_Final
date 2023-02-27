<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
 body {
      /* height: 100vh; */
      background-color: black;
      display: flex;
      justify-content: center;
      align-items: center;
    }
    
    .acid-rain {
      position: absolute;
      font-size: 20px;
      color: #fff;
      user-select: none;
      pointer-events: none;
      animation: rain 5s linear infinite;
    }
    .ending-credits{
      font-size: 20px;
      color: #fff;
      animation: rain 3s linear infinite;
    }
    
    @keyframes rain {
      0% {
        transform: translateY(-100px);
        opacity: 0;
      }
      100% {
        transform: translateY(100vh);
        opacity: 1;
      }
    }
        </style>
        		

		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <H2>TEA TIME AND CODING</H2>
    
</body>
<script>
  let arr = ["TTAC : Tea Time And Coding", "딱사장님 고맙습니다", "임준한과 아이들이 될 뻔한 TTAC", "우리조가 제일 빨리 잘 했어", "임준한", "고범종", "박예빈", "도현정", "목소리도 컸지만 제일 빨리 잘한 팀 ^_^"];

  let container = document.createElement("div");
  container.classList.add("ending-credits");
  document.body.appendChild(container);

  let index = 0;

  function createCredit() {
    console.log("create")
    let drop = document.createElement("div");
    drop.textContent = arr[index];
    drop.style.left = `${Math.random() * 100}%`;
    container.appendChild(drop);
    index++;
    if (index < arr.length) {
      setTimeout(createCredit, 5000);
    }
  }
  $(document).ready(function(){
    console.log("도큐먼트 레디")
    createCredit();
  })
  

</script>
</html>