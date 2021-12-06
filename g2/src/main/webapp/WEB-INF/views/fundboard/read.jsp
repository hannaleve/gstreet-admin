<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    .direct-chat-messages { height: fit-content; }
    .content-wrapper { background-color: white; margin:auto; width: 90%; justify-content: center;}
    #exampleInputBorder1, #exampleInputBorder2, #exampleInputBorder3, #exampleInputBorder4,
    #exampleInputBorder5, #exampleInputBorder6, #exampleInputBorder8,#exampleInputBorder9,
    #exampleInputBorder10 { background-color: white; }
</style>

<!--바뀐 리드 게시판 시작-->
<body>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" style="margin: auto;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>펀딩 게시판</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">펀딩</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>
    <h2 style="text-align: center;">
        <div rows="15" disabled style="height: fit-content;"><c:out value="${boardDTO.ftitle}"></c:out></div>
    </h2>

    <br><hr><br>

<div style="margin: auto;">

    <div class="form-group">
        <label for="exampleInputBorder1">글 번호</label>
        <input type="text" name="fno" class="form-control form-control-border" id="exampleInputBorder1"
               value="<c:out value="${boardDTO.fno}"/>" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder3">판매자</label>
        <input type="text" name="fwriter" class="form-control form-control-border" id="exampleInputBorder3"
               value="<c:out value="${boardDTO.fwriter}"/>" readonly>
    </div>

<div class="fund-content" style="display: flex; flex-direction: row">
    <div class="left-content" style="width: 75%;">
    <div class="form-group">
        <label>내용</label>
        <div class="form-control" id="exampleInputBorder2" rows="15" disabled style="overflow: auto; height: fit-content; text-align: -webkit-center;"><c:out value="${boardDTO.fcontent}" escapeXml="false"></c:out></div>
    </div>
    </div>

    <div class="right-content" style="width: 22%; margin-left: auto; flex-direction: column;">
    <div class="form-group">
        <label for="exampleInputBorder6">상품 금액</label>
        <input type="text" name="fprice" class="form-control form-control-border" id="exampleInputBorder6"
               value="<c:out value="${boardDTO.fprice}"/>" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder8">목표 금액</label>
        <input type="text" name="goalPrice" class="form-control form-control-border" id="exampleInputBorder8"
               value="<c:out value="${boardDTO.goalPrice}"/>" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder9">모인 금액</label>
        <input type="text" name="amountPrice" class="form-control form-control-border" id="exampleInputBorder9"
               value="90000" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder10">달성율</label>
        <input type="text" name="goalPercent" class="form-control form-control-border" id="exampleInputBorder10"
               value="" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder4">펀딩 시작일</label>
        <input type="text" name="fregdate" class="form-control form-control-border" id="exampleInputBorder4"
               value="<c:out value="${boardDTO.fregdate}"/>" readonly>
    </div>

    <div class="form-group">
        <label for="exampleInputBorder5">펀딩 종료일</label>
        <input type="text" name="fenddate" class="form-control form-control-border" id="exampleInputBorder5"
               value="<c:out value="${boardDTO.fenddate}"/>" readonly>
    </div>

    <div class="form-group">
        <label>해시태그</label>
                <div style="color: #1d6fa5"><b>
                    <c:forEach items="${boardDTO.tags}" var="hash" >
                        <a href="/fundboard/list?page=1&size=10&type=H&keyword=${hash.tags}">#<c:out value="${hash.tags}"></c:out></a>
                    </c:forEach>
                </b></div>
            </div>

        <div class="form-group">
        <label>종료까지 남은 시간</label>
        <h4><em id="timeDeal"></em></h4>
        </div>
    </div>

    </div>
</div>

        <br>

</div>

<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/smoothscroll/smooth-scroll.js"></script>
<script src="assets/ytplayer/index.js"></script>
<script src="assets/theme/js/script.js"></script>

<!--바뀐 리드 게시판 끝-->

                            <!-- DIRECT CHAT -->
                            <div class="card direct-chat direct-chat-primary">
                                <div class="card-header">
                                    <h3 class="card-title">댓글</h3>
                                </div>
                                <!-- /.card-header -->
                                <div class="card-body">
                                    <!-- Conversations are loaded here -->
                                    <div>
                                    <div class="direct-chat-messages">
                                    </div>
                                    </div>
                                    <!--/.direct-chat-messages-->
                                </div>
                                <!-- Contacts are loaded here -->
                                <!-- /.card-body -->
                                <div class="card-footer">
                                        <div class="input-group">
                                            <input type="text" name="freplyer" class="form-control" placeholder="작성자">
                                        </div>
                                        <div class="input-group">
                                            <textarea type="text" id="freply" name="freply" rows="3" class="form-control"
                                                      placeholder="Type Message..."></textarea>
                                            <button type="button" class="btn btn-secondary addReplyBtn">Add Reply</button>
                                        </div>
                                </div>
                                <!-- /.card-footer-->
                            </div>
                            <!— /.card-body —>
                        </div>
                        <div class="card-footer">
                            <button type="button" class="btn-sm btn-default btnList float-right">목록으로</button>
                            <button type="button" class="btn-sm btn-info btnMod float-right">글 수정</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>


<form id="actionForm" action="/fundboard/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<div class="modal fade" id="modal-lg">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">댓글 수정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="frno">
                <input type="text" name="freplyerMod">
                <input type="text" name="freplyMod">

            </div>
            <div class="modal-footer justify-content-between">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-info btnModReply">Modify</button>
                <button type="button" class="btn btn-danger btnRem">Remove</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%@include file="../includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script> // 남은 시간 계산
function countDownTimer(dt, id) {
    var end = new Date(dt);
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;
    function showRemaining() {
        var now = new Date();
        var distance = end - now;
        if (distance < 0) {
            clearInterval(timer);
            document.getElementById(id).innerHTML = '이미 종료된 펀딩입니다.';
            return;
        }
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);
        document.getElementById(id).innerHTML = days + '일 ';
        document.getElementById(id).innerHTML += hours + '시간 ';
        document.getElementById(id).innerHTML += minutes + '분 ';
        document.getElementById(id).innerHTML += seconds + '초';
    }
    timer = setInterval(showRemaining, 1000);
}
countDownTimer('${boardDTO.fenddate}', 'timeDeal'); // 2020-12-06 오후10시 50분까지
</script>

<script> // 펀딩 달성율

function calcGoal(){

const goalPrice = '${boardDTO.goalPrice}'; // 목표 금액
const amount = document.querySelector("#exampleInputBorder9").value; // 모인 금액

    let result = (amount / goalPrice) * 100;

    document.getElementById('exampleInputBorder10').value = result+'%';
}

</script>

<script> // 수정, 삭제 버튼
const actionForm = document.querySelector("#actionForm")

document.querySelector(".btnList").addEventListener("click", () => {
    actionForm.submit()
}, false)

document.querySelector(".btnMod").addEventListener("click", () => {

    const fno = '${boardDTO.fno}'

    actionForm.setAttribute("action", "/fundboard/modify")
    actionForm.innerHTML += `<input type='hidden' name='fno' value='\${fno}'>`
    actionForm.submit()
}, false)
</script>

<script src="/resources/js/reply1.js"></script>

<script> // 댓글
    function getList() {

        const target = document.querySelector(".direct-chat-messages")
        const fno = '${boardDTO.fno}' //230
        function convertTemp(replyObj) {

            console.log(replyObj)

            const {frno, fno, freply, freplyer, freplydate, fmoddate} = {...replyObj}

            const temp = `<div class="direct-chat-msg">
                <div class="direct-chat-infos clearfix">
                    <span class="direct-chat-name float-left">\${frno} -- \${freplyer}</span>
                    <span class="direct-chat-timestamp float-right">\${freplydate}</span>
                </div>
                <div class="direct-chat-text" data-frno='\${frno}' data-freplyer='\${freplyer}'>\${freply}</div>
            </div>`

            return temp
        }

        getReplyList(fno).then(data => {
            console.log(data) // array
            let str = "";

            data.forEach(freply => {
                str += convertTemp(freply)
            })
            target.innerHTML = str
        })
}

//최초 실행
(function () {
    calcGoal()
    getList()
})()

document.querySelector(".addReplyBtn").addEventListener("click", function () {

    const fno = '${boardDTO.fno}'
    const freplyer = document.querySelector("input[name='freplyer']").value
    const freply = document.querySelector("textarea[name='freply']").value

        const replyObj = {fno, freplyer, freply}  // {bno:bno, replyer:replyer, reply:reply}
        console.log(replyObj)
        addReply(replyObj).then(result => {
            getList()
            document.querySelector("input[name='freplyer']").value = ""
            document.querySelector("textarea[name='freply']").value = ""
        })

}, false)

//수정/삭제 dom
const modModal = $("#modal-lg")
const modReplyer = document.querySelector("input[name='freplyerMod']")
const modReply = document.querySelector("input[name='freplyMod']")
const modRno = document.querySelector("input[name='frno']")


document.querySelector(".direct-chat-messages").addEventListener("click", (e) => {

    const target = e.target
    const fno = '${boardDTO.fno}'

    if (target.matches(".direct-chat-text")) {
        const frno = target.getAttribute("data-frno")
        const freplyer = target.getAttribute("data-freplyer")
        const freply = target.innerHTML
        console.log(frno, freplyer, freply, fno)
        modRno.value = frno
        modReply.value = freply
        modReplyer.value = freplyer

        document.querySelector(".btnRem").setAttribute("data-frno", frno)

        modModal.modal('show')

    }

}, false)

document.querySelector(".btnRem").addEventListener("click", (e) => {
    const frno = e.target.getAttribute("data-frno")

    removeReply(frno).then(result => {
        getList()
        modModal.modal("hide")
    })
}, false)

document.querySelector(".btnModReply").addEventListener("click", (e) => {
    const replyObj = {frno: modRno.value, freply: modReply.value}
    console.log(replyObj)

    modifyReply(replyObj).then(result => {
        getList()
        modModal.modal("hide")
    })
}, false)
</script>

