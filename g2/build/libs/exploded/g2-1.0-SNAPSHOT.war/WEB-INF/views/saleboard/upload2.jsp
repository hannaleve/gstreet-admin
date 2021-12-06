<%--
  Created by IntelliJ IDEA.
  User: youngster
  Date: 2021/10/25
  Time: 6:05 am
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <input type="file" name="uploadFiles" multiple><button id="uploadBtn">Upload</button>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

    <script>

        document.querySelector("#uploadBtn").addEventListener("click",(e) => {

            const formData = new FormData()
            const fileInput = document.querySelector("input[name='uploadFiles']")

            for(let i = 0; i < fileInput.files.length; i++) {

                console.log(fileInput.files[i])

                formData.append("uploadFiles", fileInput.files[i])
            }

            console.dir(formData)

        },false)
    </script>
</body>
</html>
