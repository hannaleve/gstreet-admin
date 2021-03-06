
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
    .navbar1{
        width: 50px;
        height: 50px;
        float: left !important;
        position: absolute;
        top: 30%;
        margin-left: 20px;
    }

    #QNA{
        position: absolute;
        top: 30%;
        left: 6%;
        transform: translate(-50%,-50%);
    }

    .content-wrapper {display: flex;}

    tr { text-align: center; }

    #map { width: revert; height: 100%; }

    html,
    body {
        height: 100%;
        margin: 0;
        padding: 0;
    }

    .reSp {
        list-style: none;
        display: inline;
        flex-direction: row;
        margin:0.5em;
        border-radius: 0.5em;
        background-color: #1cb386;
    }

    .direct-chat-text{ background-color: #eee; border: 1px solid #f8f9fa; }

    input { width: -webkit-fill-available; }

    .uploadList { overflow: auto; text-align: center; }

    .uploadList img { max-width: 80%; width: 50%; margin: 10px; }

    .content-header h1 { font-size: 80px; }

    .content { padding:30px; width: 70%; }

    #input1, #input2, #input3, #input4 {background-color: transparent; border: transparent;}

    #input4{height: 150px;}

    .form-control{border: transparent;}

    .direct-chat-text{
        padding-inline: inherit;
        position: relative;
        text-align: inherit;
        text-shadow: 0 0 black;
        text-decoration-line: unset;
        padding: 10px;
        width: 80%;
        background-color: white;
        border-top-width: inherit;
    }
</style>



<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <div class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Request Board</h1>

                </div><!-- /.col -->

            </div><!-- /.row -->
        </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-primary">
                        <div class="card-header" style="background-color: #f39c12">
                            <h3 class="card-title">???????????????</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->

                        <div class="card-body">
                            <div class="form-group">
                                <label for="exampleInputEmail1">??????</label>
                                <input type="text" id="input1" name = "bno" class="form-control" id="exampleInputEmail0" value="<c:out value="${reqboardDTO.bno}"></c:out>" readonly>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">?????????</label>
                                <input type="text" id="input2" name = "writer" class="form-control" id="exampleInputEmail1"  value="<c:out value="${reqboardDTO.writer}"></c:out>" readonly>

                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">??????</label>
                                <input type="text" id="input3" name = "title" class="form-control" id="exampleInputEmail2" value="<c:out value="${reqboardDTO.title}"></c:out>" readonly>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <!-- textarea -->
                                    <div class="form-group">
                                        <label>??????</label>
                                        <textarea id="input4" name = "content"  class="form-control" rows="3"  disabled><c:out value="${reqboardDTO.content}"></c:out> </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="uploadList">

                                <c:forEach items="${reqboardDTO.files}" var="attach">
                                <div>
                                    <c:if test="${attach.image}"> <!--??????????????? ??????????????? ???????????????-????????? 50:50????????????-->
                                        <img onclick="javascript:showOrigin('${attach.getFileLink()}')" src="/viewFile1?file=${attach.getFileLink()}">
                                    </c:if>


                                    </c:forEach>
                                </div>
                            </div>

                            &nbsp;

                            <div id="map" style="height:400px; border:1px solid #e3e3e3"></div>

                            &nbsp;


                            <div class="tr_hashTag_area">
                                <div class="form-group">
                                    <div style="color: #1d6fa5"><b>
                                        <c:forEach items="${reqboardDTO.tags}" var="hash" >
                                            <a href="/reqboard/list?page=1&size=10&type=H&keyword=${hash.tags}">#<c:out value="${hash.tags}"></c:out></a>
                                        </c:forEach>
                                    </b></div>
                                </div>
                            </div>

                            &nbsp;
                            <div align="center">

                                <form>
                                    <td id="like">
                                        <c:choose>
                                            <c:when test="${ltlike ==0}">
                                                <button type="button" class="btn btn-light" id="likebtn"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i></button>
                                                <input type="hidden" name = "likecheck" id="likecheck" value="${ltlike }">
                                                <input type="hidden" id="userID" value="${userID.userID}">
                                                <input type="hidden" id="bno" value="${reqboardDTO.bno }">
                                                <input type="hidden" id="likeCount" value="${reqboardDTO.likeCount}">
                                            </c:when>
                                            <c:when test="${ltlike ==1}">
                                                <button type="button" class="btn btn-danger"id="likebtn"><i class="fa fa-thumbs-up" aria-hidden="true"></i></button>
                                                <input type="hidden" id="likecheck" value="${ltlike }">
                                                <input type="hidden" id="userID" value="${userID.userID}">
                                                <input type="hidden" id="bno" value="${reqboardDTO.bno }">
                                                <input type="hidden" id="likeCount" value="${reqboardDTO.likeCount}">
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </form>
                            </div>

                            <!-- /.card-body -->
                            <div class="float-right">
                                <button type="button" class="btn btn-secondary btnList">??????</button>
                                <sec:authentication property="principal" var="memberDTO" />

                                <c:if test="${reqboardDTO.writer eq memberDTO.userID}"> <!--equlas-->
                                    <button type="button" class="btn btn-info btnMod">??????</button>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- /.card -->


                    &nbsp;&nbsp;

                    &nbsp;

                    <!-- DIRECT CHAT -->
                    <div class="card direct-chat direct-chat-primary">
                        <div class="card-header">
                            <i class="fa fa-commenting-o" aria-hidden="true"><h3 class="card-title ">??????&nbsp;</h3></i>
                        </div>
                        <!-- /.card-header -->

                        <div class="card-body">
                            <!-- Conversations are loaded here -->
                            <div class="direct-chat-messages" style="padding: 50px;">
                            </div>
                            <div class="direct-chat-messages2">
                            </div>
                            <!--/.direct-chat-messages-->
                        </div>

                        <div class="card-footer">
                            <div class ="addReplyBtn">

                                <form>
                                    <div class="input-group" style="text-align: right; display: flex; flex-direction: row">
                                        <input type="hidden"  name="replyer" class="form-control" readonly value="<sec:authentication property="principal.userID"/>">
                                        &nbsp;
                                        <input type="text"  name="reply" class="form-control" placeholder="'${memberDTO.userID}'(???)??? ????????????....." style="width: 80%;">

                                        <button type="button" class="btn btn-default operBtn">??????</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </section>
</div>
</div>
<!-- /.content-wrapper -->
<form id="actionForm" action="/reqboard/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>

</form>


<div class="modal fade" id="modal-image">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">????????????</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <img id="targetImage">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div class="modal fade remodal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">????????????</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type='hidden' name='rno'>
                ????????? : <input type="text" name="replyer" readonly value="<sec:authentication property="principal.userID"/>">
                ?????? : <input type="text" name="reply" placeholder="????????????....">
            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                <button type="button" class="btn btn-primary operBtns2">??????</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->


<div class="modal fade  " id="modal-lg">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">

                <h4 class="modal-title">??????/??????</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type='hidden' name='rno' id="rnoVal">
                <input type="hidden" name="replyerMod" class="form-control" readonly  value="<sec:authentication property="principal.userID"/>">
                <input type="text" col="5" name="replyMod" class="form-control">

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">??????</button>
                <button type="button" class="btn btn-info btnModReply">??????</button>
                <button type="button" class="btn btn-danger btnRem">??????</button>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="removeModel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">???????????????????????????.</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!--Q&A-->
<!--<button class="openbtn" onclick="openNav1()"><i class="far fa-question-circle"></i></button>-->
<div id="navbar1" style="width: fit-content; float:left !important;">
    <button type="button" id="QNA" class="btn btn-dark" data-toggle="modal" data-target=".bd-example-modal-lg"><i class="far fa-question-circle"> ????????? ??????????????????? </i>
    </button>
</div>

<!-- Q&A Modal(Large Modal)-->
<button type="button" style="display: none" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-lg">Large modal</button>

<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <h4>G-STREET TUTORIAL</h4>
            <button type="button" class="collapsible">??? ????????? ????????? ?????????? (?????? ??????)</button>
            <div class="contentQNA">
                <p>????????? ????????? ???????????? ????????? ??? ????????? > ?????? > ?????? ?????? ????????? ???????????? ????????? ????????? ??? ??????????????? ????????? ?????????.<br>
                    ?????? ?????? ????????? ????????? ????????? ????????? ??????????????? ?????? ????????? ?????? ?????? ????????? ???????????????.<br>
                    ??????????????? ?????? ???????????? ????????? ??????????????? ?????? ???????????? ?????? ?????? ??????, ?????? ?????? ?????? ?????? ???????????? ????????? ??? ?????? ???????????????.<br>
                    ???????????? ?????? ????????? ????????? ???????????? ??????, ?????? ???????????? ??????????????? ?????? ????????? ???????????? ?????? ?????? ????????? ???????????? ????????????.<br>
                    * ????????????, ?????????, ?????? ?????? ?????? ??? ????????? ?????? ?????? ????????? ?????? > ???????????? ????????? ??? ????????????.<br>
                    ** ?????? ?????? ???, ????????????, ?????????, ?????? ?????? ????????? ???????????? ???????????????.</p>
            </div>
            <button type="button" class="collapsible">??? ??????????????? ???????????? ????????? ?????? ??????????</button>
            <div class="contentQNA">
                <p>??????????????? ?????????.</p>
            </div>
            <button type="button" class="collapsible">??? ????????? ????????? ????????? ?????? ??? ??????????</button>
            <div class="contentQNA">
                <p>?????? ???????????????.</p>
            </div>
            <button type="button" class="collapsible">??? ?????? ?????? ?????? ?????? ?????? ???????????? ??????????</button>
            <div class="contentQNA">
                <p> ??????????????? ???????????? ??????????????? ???????????? ?????? ?????? ???????????????????<br>
                    <br>
                    ???????????? ????????? ?????? ????????? ?????? ?????? ?????????, ????????? ?????? ?????? ?????? ????????? ????????? ????????? ???????????????.<br>
                    ??????????????? ????????? ????????? ???????????? ????????????? ???????????? ????????? ?????????.<br>
                    <br>
                    ???????????? ??????<br>
                    ???????????? ??????<br>
                    ???????????? ??????<br>
                    ???????????? ??? ??????<br>
                    ?????? ??????</p>
            </div>
        </div>
    </div>
</div>


<%@include file="../includes/footer.jsp" %>

<script src="./images/jquery-3.2.1.min.js"></script>

<script src="https://kit.fontawesome.com/44419a768a.js" crossorigin="anonymous"></script>
<%-- FONTAWESOME ?????? ????????????--%>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/reqboard/reqRe.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCVM_re3jcpnkn7iD9PPqMCbxBm9Qi0ipE&callback=initMap" async defer></script>
<script>
    //GoogleMap
    function initMap() {

        var curLatLng = {
            lat: ${reqboardDTO.lat},
            lng: ${reqboardDTO.lang}
        };

        var map = new google.maps.Map(document.getElementById('map'), {
            center: curLatLng,
            scrollwheel: false,
            zoom: 15
        });

        var marker = new google.maps.Marker({
            position: curLatLng,
            map: map,
            title: 'Hello World!'
        });
    }
</script>
<script>
    //?????????
    const userID = '<sec:authentication property="principal.userID"></sec:authentication>'

    $('#likebtn').click(function(){
        likeupdate();
    });

    function likeupdate() {
        var root = '/reqboard';

        const  likeurl = "/likeupdate";


        const  bno = $('#bno').val();

        const count = $('#likecheck').val();

        const data = {
            "userID": userID,
            "bno": bno,
            "count": count
        };


        $.ajax({
            url : root + likeurl,
            type : 'POST',
            contentType: 'application/json; charset=utf-8',
            data : JSON.stringify(data),
            success : function(result){
                console.log("??????" + result.result);
                if(count == 1){
                    console.log("????????? ??????");
                    $("input[type=hidden][name=likecheck]").val(0);
                    $('#likecheck').val(0);
                    $('#likebtn').attr('class','btn btn-light');


                }else if(count == 0){
                    console.log("?????????!");
                    $("input[type=hidden][name=likecheck]").val(1);
                    $('#likecheck').val(1);
                    $('#likebtn').attr('class','btn btn-danger');

                }
            }, error : function(result){
                console.log("??????" + result.result)
            }

        });
        return false;
    };

</script>


<script>
    //??????
    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", () => {
        actionForm.submit()
    }, false)

    document.querySelector(".btnMod").addEventListener("click", () => {

        const bno = '${reqboardDTO.bno}'

        actionForm.setAttribute("action", "/reqboard/modify")
        actionForm.innerHTML += `<input type='hidden' name='bno' value='\${bno}'>`
        actionForm.submit()
    }, false)

</script>


<script>

    //??????
    const modalImage = new bootstrap.Modal(document.querySelector('#modal-image'))

    function showOrigin(fileLink) {
        alert(fileLink)
        document.querySelector("#targetImage").src = `/viewFile1?file=\${fileLink}`
        modalImage.show()
    }

    const writer = '${reqboardDTO.writer}'

    function getList() {
        const target = document.querySelector(".direct-chat-messages")
        const bno = '${reqboardDTO.bno}'


        console.log("?????????:" + writer)

        function convertTemp(replyObj) {
            console.log(replyObj)


            const {rno, bno, reply, replyer, replyDate, modDate, group_id} = {...replyObj}


            console.log("???????????????" + replyer)

            if (rno == group_id) {


                const temp = `<div class="direct-chat-msg">
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${replyer} ??? </span>
                     <div  id = "commLastTime" class='\${replyDate}'></div>
                    <span class="direct-chat-name float-right" onclick="btnClick(\${rno})" style="margin-right: 8px">
<strong>????????????</strong>
</span>
<img class="direct-chat-img" src="/resources/img/profile.png" alt="message user image">

                <div class="direct-chat-text" data-rno='\${rno}' data-replyer='\${replyer}'>\${reply}</div></div>

            </div>`

                return temp

            } else {


                if(writer === replyer) {

                    const temp2 = `<div class="direct-chat-msg2" style="margin:5px 0 0 100px;">
                   <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${replyer} <div class="reSp">????????? ??? </div></span>
                     <div id="commLastTimeTwos" class='\${replyDate}'></div>
                    <span class="direct-chat-name float-right" onclick="btnClick(\${rno})" style="margin-right: 8px">
<strong>????????????</strong>
</span>
<img class="direct-chat-img" src="/resources/img/joy.jpg" alt="message user image">
                <div class="direct-chat-text" data-rno='\${rno}' data-replyer='\${replyer}'>\${reply}</div></div>
            </div>`
                    return temp2

                }else {
                    const temp3 = `<div class="direct-chat-msg2" style="margin:5px 0 0 100px;">
                   <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${replyer}  ??? </span>
                     <div id="commLastTimeTwos" class='\${replyDate}'></div>
                    <span class="direct-chat-name float-right" onclick="btnClick(\${rno})" style="margin-right: 8px">
<strong>????????????</strong>
</span>
<img class="direct-chat-img" src="/resources/img/park.jpg" alt="message user image">
                <div class="direct-chat-text" data-rno='\${rno}' data-replyer='\${replyer}'>\${reply}</div></div>
            </div>`
                    return temp3
                }
            }
        }



        getReplyList(bno).then(data => {
            console.log(data)
            let str = "";

            data.forEach(reply => {
                str += convertTemp(reply)
            })
            target.innerHTML = str
        })

    }

    (function () {
        getList()
    })()


    const modalDiv = $("#modal-sm")
    const reModalDiv = $(".remodal")
    const removeModel = $("#removeModel")

    let oper = null


    function btnClick(rno) {
        oper = 'add'
        //modalDiv.modal('show')
        // alert("rno: " + rno )

        reModalDiv.find("input[name='rno']").attr("value",rno)

        console.log(reModalDiv.html())

        reModalDiv.modal("show")
    }


    document.querySelector(".addReplyBtn").addEventListener("click", function () {
        oper = 'add'
    }, false)

    document.querySelector(".operBtn").addEventListener("click", function () {
        let group_id = 0;
        const bno = '${reqboardDTO.bno}'
        const replyer = document.querySelector("input[name='replyer']").value
        const reply = document.querySelector("input[name='reply']").value

        if (oper === 'add') {
            const replyObj = {bno, replyer, reply,group_id}
            console.log(replyObj)
            addReply(replyObj).then(result => {
                getList()
                // modalDiv.modal('hide')
                document.querySelector("input[name='replyer']").value = ""
                document.querySelector("input[name='reply']").value = ""
            })
        }

    }, false)

    document.querySelector(".operBtns2").addEventListener("click", function () {

        const bno = '${reqboardDTO.bno}'
        const replyer = reModalDiv.find("input[name='replyer']").val()
        const reply = reModalDiv.find("input[name='reply']").val()
        const rno   = reModalDiv.find("input[name='rno']").val()
        let group_id = rno;
        if (oper === 'add') {

            const replyObj = {bno, replyer, reply, group_id}

            console.log(replyObj)
            addReply(replyObj).then(result => {
                getList()
                reModalDiv.modal('hide')
                document.querySelector("input[name='replyer']").value = ""
                document.querySelector("input[name='reply']").value = ""
            })
        }

    }, false)

    const modModal = $("#modal-lg")
    const modReplyer = document.querySelector("input[name='replyerMod']")
    const modReply = document.querySelector("input[name='replyMod']")
    const modRno = document.querySelector("input[name='rno']")

    document.querySelector(".direct-chat-messages").addEventListener("click", (e) => {
        //dom ??????

        const target = e.target
        const bno = '${reqboardDTO.bno}'

        if (target.matches(".direct-chat-text")) {
            const rno = target.getAttribute("data-rno")
            const replyer = target.getAttribute("data-replyer")
            const reply = target.innerHTML
            console.log(rno, replyer, reply, bno)
            modRno.value = rno
            modReply.value = reply
            modReplyer.value = replyer

            document.querySelector(".btnRem").setAttribute("data-rno", rno)
            modModal.modal('show')
        }

    }, false)


    //??????????????????
    document.querySelector(".btnRem").addEventListener("click", (e) => {
        const rno = e.target.getAttribute("data-rno")
        const replyer = modReplyer.value
        const userID = '<sec:authentication property="principal.userID"></sec:authentication>'

        if(userID != replyer) {
            alert('????????? ????????? ????????? ????????? ???????????????.');
            modModal.modal("hide")
            return;
        }

        removeReply(rno).then(result => {
            getList()

            modModal.modal("hide")
            removeModel.modal("show")
        })
    }, false)

    document.querySelector(".btnModReply").addEventListener("click", (e) => {
        const replyObj = {rno: modRno.value, reply: modReply.value}
        console.log(replyObj)
        const replyer = modReplyer.value
        const userID = '<sec:authentication property="principal.userID"></sec:authentication>'

        if(userID != replyer) {
            alert('????????? ????????? ????????? ????????? ???????????????.');
            modModal.modal("hide")
            return;
        }
        modifyReply(replyObj).then(result => {
            getList()
            modModal.modal("hide")
        })
    }, false)


    //?????? ????????? ????????????
    function refreshDate() {

        $("#commLastTime").text(timeBefore($("#commLastTime").attr("class")));

        $('#commLastTime').each(function (index,item) {
            $('#commLastTime').attr('id','commLastTime1')
        });

    }
    function refreshDateTwos() {

        $("#commLastTimeTwos").text(timeBefore($("#commLastTimeTwos").attr("class")));

        $('#commLastTimeTwos').each(function (index,item) {
            $('#commLastTimeTwos').attr('id','commLastTimeTwos1')
        });
    }

    $(function () {
        refreshDate();
        refreshDateTwos();

        setInterval(function () {
            refreshDate()
            refreshDateTwos()
        },10000);
    })

    function timeBefore(times) {

        var time = ""+times;
        console.log(time)
        var now = new Date();

        var sYear = time.substring(0,4);
        var sMonth = time.substring(4,6)-1;
        var sDate = time.substring(6,8);
        var sHour = time.substring(8,10);
        var sMin = time.substring(10,12);
        var sSecond = time.substring(12,14);
        var sc = 1000;

        var today = new Date(sYear,sMonth,sDate,sHour,sMin,sSecond);
        //????????? ???
        console.log(today)
        var pastSecond = parseInt((now-today)/sc,10);

        var date;
        var hour;
        var min;
        var str = "";

        var restSecond = 0;
        if(pastSecond > 1036800) {
            date = parseInt(pastSecond / 1036800,10);
            restSecond = pastSecond % 1036800;
            str =  date + "?????? ??? ";

        }else if(pastSecond > 86400){
            date = parseInt(pastSecond / 86400,10);
            restSecond = pastSecond % 86400;
            str = date + "??? ??? ";

        }else if(pastSecond > 3600){
            hour = parseInt(pastSecond / 3600,10);
            restSecond = pastSecond % 3600;
            str =  str + hour + "?????? ??? ";

        }else if(pastSecond > 60){
            min = parseInt(pastSecond / 60,10);
            restSecond = pastSecond % 60;
            str =  str + min + "??? ???";
        }else{
            str =  pastSecond + "??? ???";
        }

        if(str=="0??? ???"){
            str = " ?????? ???";
        }

        return str;
    }

</script>
