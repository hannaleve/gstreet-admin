<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../includes/header.jsp"%>

<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    tr {
        text-align: center;
    }

    <!--해시태그stlye-->
        * {
            margin: 0;
            padding: 0;
            list-style: none;
        }

    ul {
        padding: 16px 0;
    }

    ul li {
        display: inline-block;
        margin: 0 5px;
        font-size: 14px;
        letter-spacing: -.5px;
    }

    form {
        padding-top: 16px;
    }

    ul li.tag-item {
        padding: 4px 8px;
        background-color: #777;
        color: #000;
    }

    .tag-item:hover {
        background-color: #262626;
        color: #fff;
    }

    .del-btn {
        font-size: 12px;
        font-weight: bold;
        cursor: pointer;
        margin-left: 8px;
    }

    #map_ma {width:300%; height:400px; clear:both; border:solid 1px red;}

    .uploadResult {
        display: flex;
        justify-content: center;
        flex-direction: row;
    }

    .latlng { display: flex; flex-direction: row}

    .latlng form-control { padding: 10px; }
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
                            <h3 class="card-title">등록페이지</h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <form id="form1" action="/reqboard/register" method="post">
                            <div class="card-body">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">작성자</label>
                                    <input type="text" name = "writer" class="form-control" id="exampleInputEmail1" placeholder="Enter Writer" readonly value="<sec:authentication property="principal.userID"/>">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">제목</label>
                                    <input type="text" name = "title" class="form-control" placeholder="제목을 입력하세요." required>
                                </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label>내용</label>
                                            <textarea  name = "content"  class="form-control" rows="3" placeholder="내용을 입력하세요." required></textarea>
                                        </div>
                                    </div>
                                </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">현재 위치를 등록해주세요</label>
                                <div class="latlng">
                                <input type="text" name = "lat" class="form-control" id="exampleInputEmail3"  placeholder="위도를 입력하세요." required>
                                <input type="text" name = "lang" class="form-control" id="exampleInputEmail4"  placeholder="경도를 입력하세요." required>
                                </div>
                            </div>

                                <div class="row">
                                    <div class="col-sm-12">
                                        <!-- textarea -->
                                        <div class="form-group">
                                            <label>현 위치</label>
                                            <div lass="col-sm-12">
                                                <body onload="javascript:locationTest();">
                                                <div id="result" class="supported"></div>
                                                <br/>
                                                <div id="mapCanvas" style="height:400px; border:1px solid #e3e3e3"> </div>
                                                </body>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            <label for="exampleInputFile">첨부파일</label>
                            <div class="input-group" style="display: flex;">
                                <div class="custom-file">
                                    <input type="file" name="uploadFiles" class="custom-file-input" id="exampleInputFile" multiple>
                                    <label class="custom-file-label" for="exampleInputFile">파일선택</label>
                                </div>
                                <div class="input-group-append">
                                    <span class="input-group-text" id="uploadBtn">Upload</span>
                                </div>
                            </div>

                            <div class="uploadResult">

                            </div>

                                <div class="tr_hashTag_area">
                                    <div class="form-group">
                                        <input type="hidden" value="" name="tags" id="rdTag" />
                                    </div>

                                    <ul id="tag-list"></ul>

                                    <div class="form-group">
                                        <i class="fa fa-hashtag" aria-hidden="true"></i>
                                        <input type="text" id="tag" size="7" placeholder="해시태그 입력 예) 요청게시판,펀딩,영국" style="width: 300px;"/>
                                    </div>
                                </div>

                            <div class="temp"></div>
                            <div class="card-footer">
                                <input type="submit" value="확인" class="btn btn-primary" id="submitBtn">

                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>

    </section>
</div>

</div>

<%@include file="../includes/footer.jsp"%>



<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCVM_re3jcpnkn7iD9PPqMCbxBm9Qi0ipE&callback=handleLocation" ></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script src="/resources/js/reqboard/googleMap.js"></script>


<script>
//해시태그
    $(document).ready(function () {
    var tag = {};
    var counter = 0;

    function addTag(value) {
        tag[counter] = value;
        counter++;
    }

    function marginTag() {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }
    $("#tag").on("keypress", function (e) {
        var self = $(this);

        if (e.key === "Enter" || e.keyCode == 32) {

            var tagValue = self.val();


            if (tagValue !== "") {

                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })

                if (result.length == 0) {
                    $("#tag-list").append("<li class='tag-item nav-item px-4' style='padding: 8px; border-radius: 30px; color:white; background-color : #5fa4cc;'>"
                        + tagValue +
                        "<span class='del-btn btn-default pl-2' idx='" + counter + "'style='background-color:transparent; color: white; cursor: pointer;'>x</span></li>");
                    addTag(tagValue);
                    self.val("");
                } else {
                    alert("태그값이 중복됩니다.");
                }
            }
            e.preventDefault();
        }
    });

    $(document).on("click", ".del-btn", function (e) {
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
    });

    document.querySelector("#submitBtn").addEventListener("click", (e) => {
        e.stopPropagation()
        e.preventDefault()

        console.log('찍히긴 하는 걸까요?')

        var value = marginTag();
        $("#rdTag").val(value);


        const form1 = document.querySelector("#form1")

        const fileDivArr = uploadResultDiv.querySelectorAll("div")


        let str ="";
        for(let i = 0; i < fileDivArr.length; i++){
            const target = fileDivArr[i]
            const uuid = target.getAttribute("data-uuid")
            const fileName = target.getAttribute("data-filename")
            const uploadPath = target.getAttribute("data-uploadpath")
            const image = target.getAttribute("data-image")

            str += `<input type='hidden' name='files[\${i}].uuid' value='\${uuid}' >`
            str += `<input type='hidden' name='files[\${i}].fileName' value='\${fileName}' >`
            str += `<input type='hidden' name='files[\${i}].uploadPath' value='\${uploadPath}' >`
            str += `<input type='hidden' name='files[\${i}].image' value='\${image}' >`
        }

        document.querySelector(".temp").innerHTML = str

        form1.submit()

    }, false)
})
</script>

<script>
    //파일업로드
    const uploadResultDiv = document.querySelector(".uploadResult")

    document.querySelector("#uploadBtn").addEventListener("click",(e) => {

        const formData = new FormData()
        const fileInput = document.querySelector("input[name='uploadFiles']")

        for(let i = 0; i < fileInput.files.length; i++){
            formData.append("uploadFiles", fileInput.files[i])
        }

        console.log(formData)

        const headerObj = { headers: {'Content-Type': 'multipart/form-data'}}

        axios.post("/upload1", formData, headerObj).then((response) => {
            const arr = response.data
            console.log(arr)
            let str = ""
            for(let i = 0; i < arr.length; i++){
                const {uuid,fileName,uploadPath,image,thumbnail,fileLink} = {...arr[i]}

                if(image){
                    str += `<div data-uuid='\${uuid}' data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><img src='/viewFile1?file=\${thumbnail}'/><span>\${fileName}</span>
                            <button onclick="javascript:removeDiv(this)" >x</button></div>`
                }else {
                    str += `<div data-uuid='\${uuid}'data-filename='\${fileName}' data-uploadpath='\${uploadPath}' data-image='\${image}'><a href='/downFile1?file=\${fileLink}'>\${fileName}</a></div>`
                }
            }
            uploadResultDiv.innerHTML += str

        })

    },false)

    function removeDiv(ele){
        ele.parentElement.remove()
    }

</script>










