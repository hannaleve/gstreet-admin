<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>

<style>
    #tag-list{
        display: flex;
        flex-direction: row;
    }
</style>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1>펀딩 글 수정</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="/fundboard/list">Home</a></li>
                        <li class="breadcrumb-item active">펀딩 글 수정</li>
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
                        <form id="form1" class="card-body">
                            <div class="form-group">
                                <label>글번호</label>
                                <input name="fno" class="form-control form-control-border"
                                       value="<c:out value="${boardDTO.fno}"></c:out>" disabled>
                            </div>
                            <div class="form-group">
                                <label>제목</label>
                                <input type="text" class="form-control form-control-border" name="ftitle"
                                       value="<c:out value="${boardDTO.ftitle}"></c:out>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputBorder4">펀딩 시작일</label>
                                <input type="text"  class="form-control form-control-border" id="exampleInputBorder4"
                                       value="<c:out value="${boardDTO.fregdate}"></c:out>" readonly>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputBorder5">펀딩 종료일</label>
                                <input type="text" class="form-control form-control-border" id="exampleInputBorder5"
                                       value="<c:out value="${boardDTO.fenddate}"></c:out>" readonly>
                            </div>
                            <div class="form-group">
                                <label>상품 금액</label>
                                <input type="text" name="fprice" class="form-control form-control-border"
                                       value="<c:out value="${boardDTO.fprice}"></c:out>">
                            </div>
                            <div class="form-group">
                                <label>목표 금액</label>
                                <input type="text" name="goalPrice" class="form-control form-control-border"
                                       value="<c:out value="${boardDTO.goalPrice}"></c:out>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail12">판매자</label>
                                <input type="text" name="fwriter" class="form-control form-control-border" id="exampleInputEmail12"
                                       value="<c:out value="${boardDTO.fwriter}"></c:out>" disabled>
                            </div>
                            <div>
                            <div class="form-group">
                                <label>내용</label>
                                <textarea id="summernote" name="fcontent" rows="15"  style="height: fit-content;"><c:out value="${boardDTO.fcontent}"></c:out></textarea>
                            </div>
                                    <div class="form-group">
                                        <input type="hidden" value="" name="tags" id="rdTag" />
                                    </div>
                                    <ul id="tag-list">
                                        <c:forEach items="${boardDTO.tags}" var="hash" >
                                            <li class='tag-item nav-item px-4' style='padding: 8px; border-radius: 30px; color:white; background-color : #5fa4cc;'>
                                                <c:out value="${hash.tags}"></c:out>
                                                <span class='del-btn btn-default pl-2' idx='" + counter + "' style='background-color:transparent; color: white; cursor: pointer;'>x</span></li>
                                        </c:forEach>
                                    </ul>
                                    <div class="form-group">
                                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                                        <input type="text" id="tag" size="7" placeholder="해시태그 입력 예) 요청게시판,펀딩,영국" style="width: 300px;"/>
                                    </div>
                                <div class="temp"></div>
                            </div>

                        <div class="card-footer">
                            <button type="button" class="btn-sm btn-default btnList float-right"><a href="/fundboard/list">목록으로</a></button>
                            <button type="submit" class="btn-sm btn-info btnMod float-right" id="submitBtn">글 수정</button>
                        </div>
                        </form>
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


<%@include file="../includes/footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script> // 썸머노트
$(document).ready(function () {
    var toolbar = [
        // 글꼴 설정
        ['fontname', ['fontname']],
        // 글자 크기 설정
        ['fontsize', ['fontsize']],
        // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
        ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
        // 글자색
        ['color', ['forecolor', 'color']],
        // 표만들기
        ['table', ['table']],
        // 글머리 기호, 번호매기기, 문단정렬
        ['para', ['ul', 'ol', 'paragraph']],
        // 줄간격
        ['height', ['height']],
        // 그림첨부
        ['insert', ['picture']],
        // 코드보기, 확대해서보기, 도움말
        ['view', ['codeview', 'fullscreen', 'help']]
    ];

    var setting = {
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        lang: 'ko-KR',
        toolbar: toolbar,
        //콜백 함수
        callbacks: {
            onImageUpload: function (files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                        this);
                }
            }
        }
    };

    $('#summernote').summernote(setting);
});

function uploadSummernoteImageFile(file, el) {
    data = new FormData();
    data.append("uploadFiles", file);
    $.ajax({
        data: data,
        type: "POST",
        url: "/upload",
        contentType: false,
        enctype: 'multipart/form-data',
        processData: false,
        success: function (data) {

            console.log(data[0]);
            $(el).summernote('editor.insertImage', "/view?file="+data[0].fileLink);
        }
    });
}
</script>

<script> // 수정, 삭제 버튼
const form = document.querySelector("#form1")
const actionForm = document.querySelector("#actionForm")
const fno = '${boardDTO.fno}'

form.innerHTML += `<input type='hidden' name='fno' value='\${fno}'>`

document.querySelector(".btnMod").addEventListener("click", (e) => {
    e.preventDefault()
    e.stopPropagation()

    form.setAttribute("action", "/fundboard/modify")
    form.setAttribute("method", "post")

    form.submit()
}, false)
</script>


<script> // 해시태그
$(document).ready(function () {
    var tags = {};
    var counter = 0;

    // 입력한 값을 태그로 생성한다.
    function addTag(value) {
        tags[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }

    // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag() {
        return Object.values(tags).filter(function (word) {
            return word !== "";
        });
    }

    $("#tag").on("keypress", function (e) {
        var self = $(this);

        //콤마나 스페이스바 눌렀을때 실행
        if (e.key === "," || e.keyCode == 32) {

            var tagValue = self.val(); // 값 가져오기

            // 해시태그 값 없으면 실행X
            if (tagValue !== "") {

                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tags).filter(function (word) {
                    return word === tagValue;
                })

                // 해시태그가 중복되었는지 확인
                if (result.length == 0) {
                    $("#tag-list").append("<li class='tag-item nav-item px-4' style='padding: 8px; border-radius: 30px; color:white; background-color : #5fa4cc;'>"
                        + tagValue +
                        "<span class='del-btn btn-default pl-2' idx='" + counter + "' style='background-color:transparent; color: white; cursor: pointer;'><i class='fas fa-times'></i></span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });

    // 삭제 버튼
    // 인덱스 검사 후 삭제
    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tags[index] = "";
        $(this).parent().remove();
    });

    document.querySelector("#submitBtn").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault() //현재 화면에 있는 파일 정보를 hidden 태그들로 변화
        const form1 = document.querySelector("#form1")

        console.log('찍히긴 하는 걸까요?')
        var value = marginTag(); // return array
        $("#rdTag").val(value);

        form1.submit()

    }, false)
})
</script>
</body>
</html>
