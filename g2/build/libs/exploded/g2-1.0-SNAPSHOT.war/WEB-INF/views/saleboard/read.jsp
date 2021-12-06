<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>


<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>거래 게시판</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">거래게시판</li>
                    </ol>
                </div>
            </div>
        </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container-fluid">
            <div class="row">
                <!-- left column -->
                <div class="col-md-12">
                    <!-- general form elements -->
                    <div class="card card-purple">
                        <div class="card-header">
                            <h3 class="card-title">G-Street</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <div class="form-group">
                                <label>글번호</label>
                                <input name="sno" class="form-control"
                                       value='<c:out value="${saleBoardDTO.sno}"/>' readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label>카테고리</label>
                                <input type="text" name="s_category" class="form-control"
                                       value="<c:out value="${saleBoardDTO.s_category}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail12">판매자</label>
                                <input type="text" name="s_writer" class="form-control" id="exampleInputEmail12"
                                       value="<c:out value="${saleBoardDTO.s_writer}"/>" readonly>
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail13">제목</label>
                                <input type="text" name="s_title" class="form-control" id="exampleInputEmail13"
                                       value="<c:out value="${saleBoardDTO.s_title}"/>" readonly>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <!— textarea —>
                                    <div class="form-group">
                                        <label>내용</label>
                                        <pre>
                                        <div rows="15" disabled><c:out
                                                value="${saleBoardDTO.s_content}" escapeXml="false"></c:out>
                                        </div>
                                        </pre>
                                    </div>
                                    <form id="Form2" action="/saleboard/list" method="get">
                                        <c:if test="${prevNum != null}">
                                            <button type="button" class="float-left"
                                                    onclick="javascript:moveRead(${prevNum})"
                                                    style="border:0; background-color: transparent; outline:0;">
                                                <i class="fas fa-arrow-left"></i> 이전
                                            </button>
                                        </c:if>
                                        <c:if test="${nextNum != null}">
                                            <button type="button" class="float-right"
                                                    onclick="javascript:moveRead(${nextNum})"
                                                    style="border:0; background-color: transparent; outline:0;">
                                                다음 <i class="fas fa-arrow-right"></i>
                                            </button>
                                        </c:if>
                                    </form>
                                </div>
                            </div>


                            <!-- DIRECT CHAT -->
                            <div class="card direct-chat direct-chat-cyan">
                                <div class="card-header" style="border: none">
                                    <h3 class="card-title">댓글</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- Conversations are loaded here -->
                                <div class="replyDiv">
                                    <div class="direct-chat-messages" style="height: 300px">
                                    </div>
                                </div>
                                <!--/.direct-chat-messages-->
                                <!-- Contacts are loaded here -->
                                <!-- /.card-body -->
                                <div class="card-footer" style="background-color: transparent">
                                    <form action="#" method="post">
                                        <div class="input-group">
                                            <input type="text" name="replier" class="form-control" placeholder="작성자"
                                                   maxlength="20" readonly>
                                        </div>
                                        <div class="input-group">
                                            <textarea type="text" id="reply" name="reply" rows="3" class="form-control"
                                                      placeholder="Type Message..."></textarea>
                                            <button type="button" class="btn btn-secondary operBtn">Send</button>
                                        </div>
                                    </form>
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


<form id="actionForm" action="/saleboard/list" method="get">
    <input type="hidden" name="page" value="${pageRequestDTO.page}">
    <input type="hidden" name="size" value="${pageRequestDTO.size}">

    <c:if test="${pageRequestDTO.type != null}">
        <input type="hidden" name="type" value="${pageRequestDTO.type}">
        <input type="hidden" name="keyword" value="${pageRequestDTO.keyword}">
    </c:if>
</form>

<div>
    <div class="modal fade" id="modal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header" style="border: none">
                    <h4 class="modal-title" style="text-align: center">댓글 등록 완료</h4>
                </div>
                <div class="modal-body">
                    <p style="text-align: center">댓글이 등록 되었습니다.</p>
                </div>
                <div class="modal-footer float-right" style="border: none">
                    <button type="button" class="btn btn-default closeBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="modReModal" name ="modReModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="border: none">
                <h4 class="modal-title">댓글 수정</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body align-items-md-center">
                <input type="hidden" name="rno">
                <input type="text" name="replierMod"> <br>
                <br>
                <textarea type="text" name="replyMod" rows="3" cols="90" required></textarea>

            </div>
            <div class="modal-footer justify-content-between" style="border: none">
                <button type="button" class="btn btn-default modCancel float-right" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning modSubmit">확인</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<div class="modal fade" id="reReply">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" style="border: none">
                <h4 class="modal-title">대댓글 등록</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body align-items-md-center">
                <input type="hidden" name="rno">
                <input type="text" name="reReplier"> <br>
                <br>
                <textarea type="text" name="reReply" rows="3" cols="90" required></textarea>

            </div>
            <div class="modal-footer justify-content-between" style="border: none">
                <button type="button" class="btn btn-default reCancel float-right" data-dismiss="modal">취소</button>
                <button type="button" class="btn btn-warning reSubmit">등록</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>


<%@include file="../includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/reply2.js"></script>

<script>

    function after(result) {
        console.log("after...........")
        console.log("result", result)
    }

    //doA().then(result => console.log(result))
    //doB(after)
    //const reply = doC(reply).then(result => console.log(result))

    const actionForm = document.querySelector("#actionForm")

    document.querySelector(".btnList").addEventListener("click", () => {
        actionForm.submit()
    }, false)

    document.querySelector(".btnMod").addEventListener("click", () => {

        const sno = '${saleBoardDTO.sno}'

        actionForm.setAttribute("action", "/saleboard/modify")
        actionForm.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
        actionForm.submit()
    }, false)

    function getList() {
        const target = document.querySelector(".direct-chat-messages")
        const sno = '${saleBoardDTO.sno}'

        function convertTemplate(replyObj) {
            const {rno, sno, reply, replier, replyDate, modDate} = {...replyObj}


            const template = `<div class="direct-chat-msg">
                                            <div class="direct-chat-infos clearfix">
                                                <span class="direct-chat-name float-left" style="font-size: medium">\${replier}</span>
<button type="button" class="btn-sm float-right" onclick="replyDel('\${rno}')" style="border:0; background-color: transparent; outline:0;"><i class="fas fa-trash"></i></button>
<button type="button" class="btn-sm float-right replyMod" data-rno='\${rno}' data-replier='\${replier}' data-reply='\${reply}' data-toggle="modal" data-target="#modReModal" style="border:0; background-color: transparent; outline:0;"><i class="fas fa-edit"></i></button>
</div>
<div class="direct-chat-text" data-rno='\${rno}' data-replier='\${replier}' style="border-color: transparent; background-color: lavender">\${reply}</div>
<span class="direct-chat-timestamp float-right">\${replyDate}</span><br>`
            return template
        }

        getReplyList(sno).then(data => {
            console.log(data) // array
            let str = "";

            data.forEach(reply => {
                str += convertTemplate(reply)
            })
            target.innerHTML = str
        })
    }

    (function () {
        getList()
    })()

    const modalDiv = $("#modal")


    document.querySelector(".operBtn").addEventListener("click", function () {

        const replierInput = document.querySelector("input[name='replier']")
        const replyInput = document.querySelector("textarea[name='reply']")

        const sno = '${saleBoardDTO.sno}'
        const replier = replierInput.value
        const reply = replyInput.value


        const replyObj = {sno, replier, reply}
        console.log(replyObj)
        addReply(replyObj).then(result => {
            getList()
            modalDiv.modal('show')
            replierInput.value = ""
            replyInput.value = ""
        })
    }, false)

    document.querySelector(".closeBtn").addEventListener("click", function () {
        $("#modal").hide()
        location.reload()
    }, false)


    const modModal = document.querySelector("#modReModal")
    const modReplier = document.querySelector("input[name='replierMod']")
    const modReply = document.querySelector("textarea[name='replyMod']")
    const modRno = document.querySelector("input[name='rno']")


    document.querySelector(".direct-chat-messages").addEventListener("click", (e) => {

        //dom 관련
        const target = e.target
        const sno = '${saleBoardDTO.sno}'

        console.log("target===============:" + target)
        console.log("target=====================:" + target)
        console.log(sno)

        if (target.matches(".direct-chat-text")) {
            const rno = target.getAttribute("data-rno")
            console.log(rno)
            const replier = target.getAttribute("data-replier")
            console.log(replier)
            const reply = target.innerHTML
            console.log(reply)
            console.log(rno, replier, reply, sno)
            modRno.value = rno
            modReply.value = reply
            modReplier.value = replier

            modModal.modal('show')
        }

    }, false)

    document.querySelector(".modSubmit").addEventListener("click", function (e) {

        const replyObj = {rno: modRno.value, reply: modReply.value, replier: modReplier.value}

        console.log(replyObj)

        modifyReply(replyObj).then(result => {
            getList()
            modModal.modal("hide")
        })

    }, false)


    function replyDel(rno) {
        removeReply(rno).then(result => {
            getList()
        })
    }

    const Form2 = document.querySelector("#Form2")

    function moveRead(sno) {
        Form2.setAttribute("action", "/saleboard/read")
        Form2.innerHTML += `<input type='hidden' name='sno' value='\${sno}'>`
        Form2.submit();
    }


</script>

</body>
</html>