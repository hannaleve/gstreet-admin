<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp" %>

<!--영이언니 시작-->
<body>
<h2 style="text-align: center;">펀딩 작성</h2><br><br>

<div style="width: 60%; margin: auto;">
    <form id="form1" action="/fundboard/register" method="post">

        <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control form-control-border" name="ftitle" placeholder="제목을 입력하세요.">
        </div>

        <div class="form-group">
            <label for="exampleInputBorder">작성자</label>
            <input type="text" class="form-control form-control-border" name="fwriter" id="exampleInputBorder">
        </div>

        <div class="form-group">
            <label>상품 금액</label>
            <input type="text" class="form-control form-control-border" name="fprice" placeholder="상품 금액을 입력하세요.">
        </div>

        <div class="form-group">
            <label>목표 금액</label>
            <input type="text" class="form-control form-control-border" name="goalPrice" placeholder="목표 금액을 입력하세요.">
        </div>

        <br>
        <textarea id="summernote" name="fcontent"></textarea>

        <div class="card card-primary">
            <!-- /.card-body -->
            <div class="temp"></div>
            <div class="tr_hashTag_area" style="text-align: center;">
                <span>#HashTag</span>
                <div class="form-group">
                    <input type="hidden" value="" name="tags" id="rdTag"/>
                </div>

                <ul id="tag-list" style="display: flex"></ul>

                <div class="form-group">
                    <input type="text" id="tag" size="7" placeholder="Space 혹은 , 로 해시태그를 등록해주세요." style="width: 300px;"/>
                </div>
            </div>
        </div>

        <div class="button" style="justify-content: right">
        <button id="submitBtn" type="submit" class="btn btn-default">확인</button>
        <button type="reset" class="btn btn-default">취소</button>
        </div>
    </form>
</div>

<!--영이언니 끝-->


</section><section style="background-color: #fff; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Helvetica Neue', Arial, sans-serif; color:#aaa; font-size:12px; padding: 0; align-items: center; display: flex;"><a href="https://mobirise.site/d" style="flex: 1 1; height: 3rem; padding-left: 1rem;"></a><p style="flex: 0 0 auto; margin:0; padding-right:1rem;"><a href="https://mobirise.site" style="color:#aaa;">mobirise.com</a> html web maker</p></section><script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>  <script src="assets/smoothscroll/smooth-scroll.js"></script>  <script src="assets/ytplayer/index.js"></script>  <script src="assets/theme/js/script.js"></script>

    <!-- Main content -->
    <section class="content">
    </section>
</div>
<!-- /.content-wrapper -->

<%@include file="../includes/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

<script> // 썸머노트
$(document).ready(function () {

    var setting = {
        height: 300,
        minHeight: null,
        maxHeight: null,
        focus: true,
        lang: 'ko-KR',
        disableResizedEditor:true,
        placeholder: '여기에 내용을 입력해주세요.',
        //콜백 함수
        callbacks: {
            onImageUpload: function (files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    if(files[i].size > 1024*1024*8){
                        alert("8MB 미만의 이미지만 등록 가능합니다.")
                        return;
                    }
                    uploadSummernoteImageFile(files[i], this);
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

                // 해시태그 중복 확인
                if (result.length == 0) {
                    $("#tag-list").append("<li class='tag-item nav-item px-4' style='padding: 8px; border-radius: 30px; color:white; background-color : #5fa4cc;'>"
                        + tagValue +
                        "<span class='del-btn btn-default pl-2' idx='" + counter + "' style='background-color:transparent; color: white; cursor: pointer;'><i class='fas fa-times'></i></span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("중복된 해시태그입니다!");
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
