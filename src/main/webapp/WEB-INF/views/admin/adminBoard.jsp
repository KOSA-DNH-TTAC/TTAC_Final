<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="ko">

    <head>
    <!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-4DV6JYFYRH"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'G-4DV6JYFYRH');
</script>
        <title>관리자페이지</title>
        <meta charset="utf-8">
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> 
        <meta name="viewport" content="width=1400px, user-scalable=yes"> <!--표준형-->
        <meta name="format-detection" content="telephone=no, address=no, email=no">
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta http-equiv="Expires" content="-1" />

        <link rel="shortcut icon" href="/resources/assets/img/3projectpavicon.ico" type="image/x-icon" />
        <link href="/resources/assets/css/font.css" rel="stylesheet">
        <link href="/resources/assets/css/font-awesome.css" rel="stylesheet">
        <link href="/resources/assets/css/style2.css" rel="stylesheet">
        <link href="/resources/assets/css/program.css" rel="stylesheet">
        <link href="/resources/assets/css/layout.css" rel="stylesheet">
        <link href="/resources/assets/css/menu.css" rel="stylesheet">
        <link href="/resources/assets/css/category.css" rel="stylesheet">
        <link href="/resources/assets/css/graph.css" rel="stylesheet">

        <!-- Jquery -->
        <script src="http://code.jquery.com/jquery-latest.min.js"></script>

        <!-- Sweet Alert -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <body class="">
        <div class="wrap">

            <div id="header">
                <div class="headerwrap">
                    <div id="headerin">
                        <h1><a href="../" class="logo"><img src="/resources/assets/img/logoBLUE.png" alt="로고"
                                    style="height:60px;" /></a></h1>
                        <nav class="gnb">
                            <ul>

                                <li class="menu last">
                                    <button class="btn_sumit ml"
                                        onclick="document.location.href='/logout';">로그아웃</button><button
                                        class="btn_sumit blbtn ml"
                                        onclick="document.location.href='/';">홈페이지</button>
                                </li> <!--.menu.g1-->

                            </ul>
                        </nav>
                    </div>

                </div>
            </div>


            <div class="subcon">
                <div class="leftcon">
                    <nav id="sidemenu">
                        <ul class="submenu">
                            <li class="smenu" style="background-color:#4D6794; color:white;"><a href='javascript:void(0);'>
                                    <h1>기숙사관리시스템 : ${domitoryName}</h1>
                                </a></li>
                            <li class="smenu"><a href="/admin/adminMember">회원관리</a>
                                <ul class="sub ">
                                    <li><a href="/admin/adminMember">회원현황</a></li>
                                    <li><a href="../sub01/sub01_02.php">벌점관리</a></li>
                                </ul>
                            </li>
                            <li class="smenu"><a href="/admin/board" class="msub on">커뮤니티관리</a>
                            <li class="smenu"><a href="/admin/coupon">식권관리</a></li>
                            <li class="smenu"><a href="/admin/popular">외박관리</a>
                                <ul class="sub ">
                                    <li><a href="/admin/popular">외박신청</a></li>
                                    <li><a href="/admin/sleepOverHistory">외박이력</a></li>
                                </ul>
                            </li>
                            <li class="smenu"><a href="/admin/analyze">시설관리</a>
                                <ul class="sub ">
                                    <li><a href="/admin/analyze">시설관리</a></li>
                                    <li><a href="/admin/enroll">시설등록</a></li>
                                </ul>
                            </li>
                            <li class="smenu"><a href="/admin/calendar">일정관리</a></li>
                            <li class="smenu"><a href="/admin/file" >회원파일등록</a></li>
                            <li class="smenu"><a href="/admin/RollCall" >점호관리</a></li>
                            <li class="smenu"><a href="/admin/sail">통계관리</a></li>
                            <li class="smenu"><a href="/admin/qr">식권QR</a></li>
                        </ul>

                    </nav>
                    <script>
                        //서브 left_menu
                        $(document).ready(function () {
                            $(".msub").click(function () {
                                var tg = $(this).siblings(".sub");
                                var dis = tg.css("display");
                                if (dis == "block") {
                                    $(this).removeClass("on");
                                    tg.slideUp(300);
                                }
                                if (dis == "none") {
                                    $(".msub").removeClass("on");
                                    $(this).addClass("on");
                                    $(".sub").slideUp(300);
                                    tg.slideDown(300);
                                }
                                return false;
                            });
                        });
                    </script>

                </div>
                <div class="con">
                    <h3 class="sub_h3">커뮤니티 관리<span>게시판현황</span></h3>



                    <div class="ofh">
                        <div class="halfcon mr">
                            <h4 class="bgtab bgtab2">게시판 목록</h4>
                            <table id="nightoverN" class="comm_table tac bmb">

                            </table>


                        </div>
                        <div class="halfcon">
                            <h4 class="bgtab bgtab2">커스텀 게시판</h4>
                            <table id="nightoverY" class="comm_table tac bmb">
                                <thead>
                                    <tr>
                                        <th>새 게시판 만들기</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="newboard">게시판 이름&nbsp;</label><input name="newboard"
                                                id="newboard" type="text">
                                            <button id="newboardbtn" onclick="createBoard()">생성</button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>



                </div><!--con-->
            </div><!--subcon-->





            <div id="footer">
		<p>Copyright(c) 기숙사 통합 관리 시스템. All rights reserved. supported by DOTO.</a></p>

            </div>

            <div id="pageup">
            </div>
        </div><!--wrap-->




    </body>
    <link rel="stylesheet" media="all" href="/resources/assets/css/litebox.css" />
  


    <script type="text/javascript">
        function dateFormatter(date) {
            var wantDate = new Date(date);
            // 년도 getFullYear()
            var year = wantDate.getFullYear();
            // 월 getMonth() (0~11로 1월이 0으로 표현되기 때문에 + 1을 해주어야 원하는 월을 구할 수 있다.)
            var month = wantDate.getMonth() + 1
            // 일 getDate()
            var date = wantDate.getDate(); // 일
            if (month < 10) {
                month = "0" + month;
            }
            if (date < 10) {
                date = "0" + date;
            }
            var wantDateFormat = year + "-" + month + "-" + date;
            return wantDateFormat;
        }

        //새 커스텀 게시판 생성
        function createBoard() {
            let boardname = $('#newboard').val();
            $('#newboard').val("");
          
            $.ajax({
                type: "POST",
                url: "/admin/board/create",
                data: JSON.stringify({
                    "boardname": boardname,
                }),
                contentType: "application/json; charset=UTF-8",
                success: function (result) {
                    if (result.rows > 0) {
                        Swal.fire(
                            '생성 완료!',
                            '게시판을 생성했습니다',
                            'success'
                        )
                    } else {
                        Swal.fire(
                            'ERROR!',
                            '요청한 작업을 수행하지 못했습니다',
                            'error'
                        )
                    }
                    getCategory();
                }
            })
        }

        //커스텀 게시판 이름 수정
        function updateBoardName() {
            let boardname = $('#newname').val();
            let boardidx = $('#currentidx').val();

            //ajax로 보드 이름 수정
            $.ajax({
                type: "PATCH",
                url: "/admin/board/updateBoard",
                data: JSON.stringify({
                    "boardname": boardname,
                    "boardidx": boardidx
                }),
                contentType: "application/json; charset=UTF-8",
                success: function (result) {
            
                    $('#newname').val("");
                    if (result.rows > 0) {
                        Swal.fire(
                            '수정 완료!',
                            '게시판 이름을 바꿨습니다',
                            'success'
                        )
                    } else {
                        Swal.fire(
                            'ERROR!',
                            '요청한 작업을 수행하지 못했습니다',
                            'error'
                        )
                    }
                    getCategory();
                }
            })
        }

        //게시판 삭제
        function deleteBoard() {

            let boardidx = $('#currentidx').val();
           
            Swal.fire({
                title: '정말 삭제하시겠습니까?',
                text: "되돌릴 수 없어요!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#e96b56',
                cancelButtonColor: 'grey',
                confirmButtonText: 'DELETE'
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        type: "DELETE",
                        url: "/admin/board/delete",
                        data: JSON.stringify({
                            "boardidx": boardidx
                        }),
                        contentType: "application/json; charset=UTF-8",
                        success: function (result) {
                          
                            if (result.rows > 0) {
                                Swal.fire(
                                    '삭제 완료!',
                                    '게시판을 삭제했습니다',
                                    'success'
                                )
                            } else {
                                Swal.fire(
                                    'ERROR!',
                                    '요청한 작업을 수행하지 못했습니다',
                                    'error'
                                )
                            }
                            getCategory();
                        }
                    })

                }
            })



        }

        //커스텀게시판 관리 버튼 클릭
        function customClick(e) {
          
            $('#nightoverY').empty();
            let contents = `<tbody>
                                <tr>
                                    <input type="hidden" id="currentidx" value="` + e + `">
                                    <th colspan='2'>` + $('#' + e).text() + `</th>
                                </tr>
                                <tr>
                                    <th>이름 변경</th>
                                    <td>
                                        <input id="newname" type="text"><button id="updateBoard" onclick="updateBoardName()">변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>게시판 삭제</th>
                                    <td><button id="delboard" onclick="deleteBoard()">삭제</button></td>
                                </tr>
                                </tr>`;

            $('#nightoverY').append(contents);

        }

        function getCategory() {
            $.ajax({
                type: "GET",
                url: "/admin/board/list",
                success: function (result) {
                   
                    $('#nightoverN').empty();
                    $('#nightoverY').empty();
                    let contentY = `<thead>
                                    <tr>
                                        <th>새 게시판 만들기</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <label for="newboard">게시판 이름&nbsp;</label><input name="newboard"
                                                id="newboard" type="text">
                                            <button id="newboardbtn" onclick="createBoard()">생성</button>
                                        </td>
                                    </tr>
                                </tbody>`;
                    $('#nightoverY').append(contentY);

                    let boardarr = ['자유게시판', '거래게시판', '공지사항', '건의사항']

                    let contents = `<tbody>
									<tr>
										<th>게시판번호</th>
										<th>이름</th>
										<th>작성글</th>
										<th>댓글</th>
                                        <th>설정</th>
									</tr>`;
                    //게시판 리스트 받아와서 테이블에 뿌려주는데
                    //커스텀 게시판일 경우에는 옆에는 수정, 삭제 버튼이 있어야 함
                    $.each(result.list, function (index, board) {
                      
                        contents += `<tr><td>` + board.boardIdx + `</td>
                                    <td id="`+ board.boardIdx + `">` + board.boardName + `</td>
                                    <td>` + board.postCount + `</td>
                                    <td>` + board.replyCount + `</td>`;
                        if (!boardarr.includes(board.boardName)) {
                            contents += `<td><button onclick='customClick(` + board.boardIdx + `)'>설정</button></td>`
                        } else {
                            contents += `<td></td>`
                        }
                    })
                    contents += `</tr></tbody>`
                    $('#nightoverN').append(contents);

                },
                error: function (request, status, error) {
                    console.log("에러")
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            })
        }

        $(document).ready(function () {
            getCategory();
        })

    </script>

    </html>