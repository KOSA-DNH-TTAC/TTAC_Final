<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
 body {
      /* height: 100vh; */
      background-color: black;
      /* display: flex; */
      justify-content: center;
      align-items: center;
      overflow: hidden;
    }

    @font-face {
      font-family: "DungGeunMo"; /* 사용하고 싶은 font-family명을 지정 */
      src: url("/assets/css/DungGeunMo.ttf") format("TrueType"); /* 폰트파일 불러오기 */
    }
    .ending-credits{
      font-family: "DungGeunMo";
      font-size: 60px;
      text-align: center;
      color: #fff;
      animation: rain 4s infinite linear;
    }
    #title{
      font-family: "DungGeunMo";
      margin-top: 400px;
      font-size: 60px;
      text-align: center;
      color: #fff;
      animation: last 4s;
    }
    
    
    @keyframes rain {
      0% {
        transform: translateY(-100px);
        opacity: 0;
      }
      50% {
        transform: translateY(50vh);
        opacity: 1;
      }
      100%{
        transform: translateY(120vh);
        opacity: 1;
      }
    }

    @keyframes last {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }
        </style>
        		

		<!-- Jquery -->
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
    <div id="title" >MADE BY TTAC</div>
    <div id="ending" class="ending-credits">

    </div>
</body>
<script>
  let arr = ["TTAC : Tea Time And Coding", "From KOSA 703", "임준한과 아이들이 될 뻔한 TTAC", "MUSINSA STYLE PM 임준한", "SERVER MAN 고범종", "BEST DB DESIGNER 박예빈", "SMOKER PL 도현정"];
  // let arr = ["하나", "둘"];

  // let container = document.createElement("div");
  // container.classList.add("ending-credits");
  // document.body.appendChild(container);

  let index = 0;

  function createCredit() {
    console.log("create")
    console.log(index);
    $('#ending').empty();
    console.log(arr[index])
    let drop = document.createElement("div");
    drop.textContent = arr[index];
    // drop.style.left = `${Math.random() * 100}%`;
    // container.appendChild(drop);
    $('#ending').append(drop);
    index++;
    if (index <= arr.length) {
      setTimeout(createCredit, 4000);
    } else {
      $('#ending').remove();
      // $('#title').append("ㅁ ㅏ!!!")
      $('#title').show();
    }
  }
  $(document).ready(function(){
    $('#title').hide();
    createCredit();
  })
  

</script>
</html>