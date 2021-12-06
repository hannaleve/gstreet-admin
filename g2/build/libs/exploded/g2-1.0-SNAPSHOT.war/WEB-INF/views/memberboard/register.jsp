<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <!--paper kit 2-->
    <link href="/resources/css/paper-kit.css?v=2.2.0" rel="stylesheet"/>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet"
          href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/resources/plugins/fontawesome-free/css/all.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    <link rel="stylesheet" href="/resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/resources/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/resources/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/resources/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/resources/plugins/daterangepicker/daterangepicker.css">
    <!-- summernote -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
</head>
<style>

    .fileForm{
        font-size: xx-small;
        position: relative;
        display: flex !important;
        border-collapse: separate;
    }

    .userAddressBox{
        display: flex;
        padding: 0px 0px 17px;
    }

    .register-page {
        height: auto;
        background-image: url("https://wallpaper.dog/large/10808513.jpg");
        background-size: 100% 100%;
    }



    .login-box, .register-box {
        width: 40%;
        height: fit-content;
    }


    .form-group mail_warp{
        display: flex;
        flex-direction: row;
        border: 0px solid #e9ecef;
    }

    .form-control mail_input{order: 1;}
    .mail_check_button {order: 2;}

    .mail_warp2{
        display: flex;
    }

    .media-body, .media-left, .media-right {
        padding: 10px;
    }

    .dropdown-item-title {
        font-size: xxx-large;
    }

    .form-group{
        margin: 0px 0px 22px;
        padding: 0px 15px 1px;
    }

    .form-control{
        border: 0px !important;
        margin: inherit;
    }

    .card .card-body {
        padding: 50px;
    }

    .uploadResult{ width: 180px; }
</style>

</div>

<style>
    .id_input_re_1, .pw2_input_re_1, .email_key_msg {
        color: green;
        display: none;
        font-size: 12px;
    }

    .id_input_re_2, .pw2_input_re_2 {
        color: red;
        display: none;
        font-size: 12px;
    }

    .form_required {
        color: red;
    }

    .correct {
        color: green;
    }

    .incorrect {
        color: red;
    }

    /*유효성검사*/
    .required_pw {
        display: none;
        color: red;
    }

    .required_pw2 {
        display: none;
        color: red;
    }
</style>

<body class="hold-transition register-page">
<!-- Content Wrapper. Contains page content -->
<div class="register-box">
    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">


                        <!-- form start -->
                        <form id="form1" action="/memberboard/register" method="post">
                            <div class="card-body">
                                <!-- 아이디 중복체크 -->
                                <div class="form-group">
                                    <label class="form_required">*</label><label>ID</label>
                                    <input type="text" name="userID" class="form-control" id="InputID"
                                           placeholder="Enter ID" maxlength="20" required>
                                    <span class="id_input_re_1">사용 가능한 아이디 입니다.</span>
                                    <span class="id_input_re_2">사용 중인 아이디 입니다. 다른 아이디를 입력하세요.</span>
                                </div>
                                <div class="form-group">
                                    <label class="form_required">*</label><label for="InputPassword">Password</label>
                                    <input type="password" name="userPW" class="form-control" id="InputPassword"
                                           required placeholder="Password" maxlength="20">
                                    <span class="required_pw">비밀번호를 입력하여 주세요.</span>
                                </div>
                                <div class="form-group">
                                    <label class="form_required">*</label><label for="InputPassword2">Repeat
                                    Password</label>
                                    <input type="password" name="userPW2" class="form-control" id="InputPassword2"
                                           required placeholder="Repeat Password" maxlength="20">
                                    <span class="pw2_input_re_1">비밀번호가 일치합니다.</span>
                                    <span class="pw2_input_re_2">비밀번호가 일치하지 않습니다. 다시 입력하여 주세요.</span>
                                    <span class="required_pw2">비밀번호를 재입력하여 주세요.</span>
                                </div>
                                <div class="form-group">
                                    <label class="form_required">*</label><label for="InputName">성명</label>
                                    <input type="text" name="userName" maxlength="20" class="form-control"
                                           id="InputName" required
                                           placeholder="Enter Your Name">
                                </div>
                                <div class="form-group">
                                    <label class="form_required">*</label><label for="InputNickname">사용할 닉네임</label>
                                    <input type="text" name="userNickname" maxlength="20" class="form-control"
                                           id="InputNickname"
                                           placeholder="Enter Nickname">
                                </div>

                                <hr>

                                <div class="form-group">
                                    <label for="InputRegNum">주민번호</label>
                                    <input type="text" name="userRegNum" maxlength="20" class="form-control"
                                           id="InputRegNum"
                                           placeholder="Enter Register Number">
                                </div>
                                <div class="form-group">
                                    <label for="InputPhone">휴대번호</label>
                                    <input type="text" name="userPhone" class="form-control"
                                           id="InputPhone"
                                           placeholder="Enter Register Number">
                                </div>

                                <div class="form-group mail_warp">
                                    <label>등록할 이메일</label>
                                    <div class="mail_warp2">
                                        <input type="email" name="userEmail" class="form-control mail_input"
                                               id="InputEmail_false"
                                               placeholder="Enter email">
                                        <input type="button" value="인증번호 전송" class="mail_check_button btn btn-primary">
                                    </div>
                                    <span style="padding: 15px;" class="email_key_msg">해당 이메일로 인증번호를 전송하였습니다.</span>
                                </div>
                                <div class="form-group mail_check_inputbox">
                                    <label for="InputEmailCheck">인증번호</label>
                                    <input type="text" name="userEmailCheck" maxlength="6"
                                           class="form-control mail_check_input"
                                           id="InputEmailCheck" placeholder="Enter Authorization Code">
                                    <span id="mail_check_input_box_warn"></span>
                                </div>

                                <!--주소api-->
                                <div class="form-group">
                                    <label>주소 입력</label>
                                    <div class="userAddressBox">
                                        <input type="text" class="form-control" id="InputAddress_postcode"
                                               name="userZipCode" placeholder="우편번호" readonly>
                                        <input type="button" class="btn btn-primary" onclick="addressapi()" value="우편번호 찾기">
                                    </div>
                                    <input type="text" name="userAddress" class="form-control"
                                           id="InputAddress_roadAddress" placeholder="도로명주소" readonly>
                                    <input type="text" name="userAddress2" class="form-control"
                                           id="InputAddress_jibunAddress"
                                           placeholder="지번주소" readonly>
                                    <span id="guide" style="color:#999;display:none"></span>
                                    <input type="text" name="userAddressExtra" class="form-control"
                                           id="InputAddress_extraAddress"
                                           placeholder="참고항목" readonly>
                                    <input type="text" name="userAddressDetail" class="form-control"
                                           id="InputAddress_detailAddress"
                                           placeholder="상세주소를 입력하여 주세요.">
                                </div>
                                <div class="temp"></div>
                                <style>
                                    .uploadResult {
                                        display: flex;
                                        justify-content: center;
                                        flex-direction: row;
                                    }
                                </style>

                                <div class="form-group">
                                    <label for="exampleInputFile">프로필설정</label>
                                    <div class="input-group form-group fileForm">
                                        <div class="custom-file">
                                            <input type="file" name="uploadFiles" class="custom-file-input"
                                                   id="exampleInputFile">
                                            <label class="custom-file-label" for="exampleInputFile">Choose file</label>
                                        </div>
                                        <div class="input-group-append">
                                            <span class="input-group-text" id="uploadBtn">Upload</span>
                                        </div>
                                    </div>
                                    <div class="uploadResult">
                                    </div>
                                </div>

                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer text-center ">
                                <button type="button" class="btn btn-warning" onclick="location.href='/customLogin'">Back</button>

                                <button type="submit" id="submitBtn" class="btn btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                    <!-- /.card -->
                </div>
            </div>
        </div>
    </section>
</div>
</div>
</div>

</body>
<!-- jQuery -->
<script src="/resources/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/resources/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 4 -->
<script src="/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/resources/plugins/chart.js/Chart.js"></script>
<!-- Sparkline -->
<script src="/resources/plugins/sparklines/sparkline.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/resources/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- overlayScrollbars -->
<script src="/resources/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/resources/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/resources/js/demo.js"></script>
<!-- 소연 폰트어썸 고유키 -->
<script src="https://kit.fontawesome.com/17a7fe8953.js" crossorigin="anonymous"></script>
<!-- iCheck for checkboxes and radio inputs -->
<link rel="stylesheet" href="/resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- jquery-validation -->
<script src="/resources/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="/resources/plugins/jquery-validation/additional-methods.min.js"></script>
<!-- SweetAlert2 -->
<script src="/resources/plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="/resources/plugins/toastr/toastr.min.js"></script>

<%--유효성--%>
<script>
    $(function () {

        $('#form1').validate({
            rules: {
                userID      : {
                    required  : true,
                    minlength : 4,
                    eng_number: true
                },
                userEmail   : {
                    email: true
                },
                userPW      : {
                    required : true,
                    minlength: 4
                },
                userPW2     : {
                    required: true,
                },
                userName    : {
                    required: true
                },
                userNickname: {
                    required: true
                }
            },

            messages      : {
                userID      : {
                    required: "영문과 숫자만 입력하여 주세요.",
                },
                userEmail   : {
                    required: "이메일을 입력하여 주세요",
                    email   : "유효한 이메일 주소를 입력하여 주세요"
                },
                userPassWord: {
                    required : "비밀번호를 입력하여 주세요",
                    minlength: "최소 5자리 이상이 되어야 합니다."
                }
            },
            errorElement  : 'span',
            errorPlacement: function (error, element) {
                error.addClass('invalid-feedback');
                element.closest('.form-group').append(error);
            },
            highlight     : function (element, errorClass, validClass) {
                $(element).addClass('is-invalid');
            },
            unhighlight   : function (element, errorClass, validClass) {
                $(element).removeClass('is-invalid');
            }
        });
    });
</script>


<%--아이디 중복체크--%>
<script>
    $('#InputID').blur("input", function () {

        let memberId = $('#InputID').val();
        let data = {memberId: memberId}

        $.ajax({
            type   : "post",
            url    : "/memberboard/memberIdCheck",
            data   : data,
            success: function (result) {
                // console.log("success test : " + result)

                if (result != 'fail') {
                    $('.id_input_re_1').css("display", "inline-block");
                    $('.id_input_re_2').css("display", "none");

                } else {
                    $('.id_input_re_1').css("display", "none");
                    $('.id_input_re_2').css("display", "inline-block");

                }
            }

        })
    });
</script>

<%--비밀번호 재확인--%>
<script>
    $('#InputPassword , #InputPassword2').on("input", function () {
        let pwcheck = $('#InputPassword').val();
        let pwcheck2 = $('#InputPassword2').val();

        if (pwcheck == pwcheck2) {
            $('.pw2_input_re_1').css("display", "inline-block");
            $('.pw2_input_re_2').css("display", "none");
        } else {
            $('.pw2_input_re_1').css("display", "none");
            $('.pw2_input_re_2').css("display", "inline-block");
        }

    })
</script>

<%--이메일인증--%>
<script>
    let emailCode = ""; // 인증번호체크용 저장변수

    $(".mail_check_button").click(function () {
        let email = $('#InputEmail_false').val();             // 입력한 메일주소
        let emailCheckKey = $(".mail_check_input");     // 인증번호 입력칸
        let emailCheckWarp = $(".mail_check_inputbox"); //인증번호 입력란

        // if(!(email="" && email==null)) {

        $('.email_key_msg').css("display", "inline-block");

        $.ajax({
            type   : "GET",
            url    : "mailCheck?email=" + email,
            success: function (data) {
                // console.log("data : " + data)
                emailCheckKey.attr("disabled", false);
                emailCheckWarp.attr("id", "mail_check_inputbox_true");
                emailCode = data;
            }
        });
    })

    $(".mail_check_input").on("input", function () {
        let inputCode = $(".mail_check_input").val();
        let checkResult = $("#mail_check_input_box_warn");

        if (inputCode == emailCode) {
            checkResult.html("인증번호가 일치합니다.");
            checkResult.attr("class", "correct");

        } else {
            checkResult.html("인증번호가 틀렸습니다. 확인하여 주세요.");
            checkResult.attr("class", "incorrect");

        }
    })

</script>

<%--주소api--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addressapi() {
        new daum.Postcode({
            oncomplete: function (data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }

                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('InputAddress_postco' +
                    '' +
                    '' +
                    'de').value = data.zonecode;
                document.getElementById("InputAddress_roadAddress").value = roadAddr;
                document.getElementById("InputAddress_jibunAddress").value = data.jibunAddress;

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("InputAddress_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("InputAddress_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>

<%--프로필사진 업로드--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script>

    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click", (e) => { //UPLOAD버튼클릭했을때

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for (let i = 0; i < fileInput.files.length; i++) {

            console.log(fileInput.files[i])

            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(formData)

        const headerObj = {headers: {'Content-Type': 'multipart/form-data'}} //여러개 파일업로드시 반드시 추가해야하는것

        axios.post("/upload4", formData, headerObj).then((response) => { //post로 보내고 then으로 axios응답
            const arr = response.data
            console.log("axios data!!! : " + arr) //axios에서 data보낸 배열내용 출력

            let str = "";

            for (let i = 0; i < arr.length; i++) {
                //파일업로드한결과
                const {userUuid, userFileName, userFilePath, userImageCheck, thumbnail, fileLink} = {...arr[i]}

                if (userImageCheck) {
                    str += `<div data-uuid='\${userUuid}' data-filename='\${userFileName}' data-uploadpath='\${userFilePath}' data-image='\${userImageCheck}'><img src='/viewFile4?file=\${thumbnail}'/><span>\${userFileName}</span>
                    <button onclick="javascript:removeFile4('\${fileLink}',this)">x</button></div>`
                } else { //이미지가아니라면 파일링크로 행함
                    str += `<div data-uuid='\${userUuid}' data-filename='\${userFileName}' data-uploadpath='\${userFilePath}' data-image='\${userImageCheck}'><a href='/downFile4?file=\${fileLink}'>\${userFileName}</a></div>`
                }
            }//end for

            //문자열 완성되면 div에 추가 (기존에있던 내용 유지하면서 추가)
            uploadResultDiv.innerHTML += str
        })

    }, false)

    function removeFile4(fileLink, ele) {
        console.log(fileLink)
        axios.post("/removeFile4", {fileName: fileLink}).then(response => {
            const targetDiv = ele.parentElement
            targetDiv.remove()
        })
    }

</script>

<%--프로필사진--%>
<script>
    document.querySelector("#submitBtn").addEventListener("click", (e) => {

        // e.stopPropagation();
        // e.preventDefault();

        const form1 = document.querySelector("#form1");
        const fileDivArr = uploadResultDiv.querySelectorAll("div");
        // if (!fileDivArr) {
        //     form1.submit()
        //     return
        // }
        let str = ""
        for (let i = 0; i < fileDivArr.length; i++) {
            const target = fileDivArr[i]
            const userUuid = target.getAttribute("data-uuid")
            const userFileName = target.getAttribute("data-filename")
            const userFilePath = target.getAttribute("data-uploadpath")
            const userImageCheck = target.getAttribute("data-image")

            console.log("useruuid : " + userUuid);
            console.log("userfilename : " + userFileName);


            str += `<input type='hidden' name='files[\${i}].userUuid' value='\${userUuid}' >`
            str += `<input type='hidden' name='files[\${i}].userFileName' value='\${userFileName}' >`
            str += `<input type='hidden' name='files[\${i}].userFilePath' value='\${userFilePath}' >`
            str += `<input type='hidden' name='files[\${i}].userImageCheck' value='\${userImageCheck}' >`
        }

        document.querySelector(".temp").innerHTML = str
        //form1.innerHTML += str
        // form1.submit()
        //form을 submit

    }, false)
</script>

</body>
</html>
