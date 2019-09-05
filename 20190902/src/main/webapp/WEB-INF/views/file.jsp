<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
    <link rel="stylesheet" href="/resources/css/file.css">
    <script>
    	var dt = new DataTransfer();
    	function formList(){
    		console.log(dt);
    	}
		function file_Event(obj){
			console.log(obj.files);
			for (var i = 0; i < obj.files.length; i++) {
				var fileName = obj.files[i].name;
				var ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
				console.log(fileName, ext);
				var extLower = ext.toLowerCase();
				var text = "";
				if("txt" == extLower) {
					text = "텍스트";
				} else if("pdf" == extLower){
					text = "문서";
				} else if("jpg" == extLower || "jpeg" == extLower || "png" == extLower) {
					text = "이미지";
				} else {
					continue;
				}
				var node = document.createElement("LI");
				var textnode = document.createTextNode(text);
				node.appendChild(textnode);
				node.classList.add("itemContainer");
				document.getElementById("mainContainer").appendChild(node);
				dt.items.add(obj.files[i]);
			}
		}
	</script>
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <ul id="mainContainer">
            <li class="subContainer" id="clickMe">
            	<label for="file">+</label>
                <input class="dn" id="file" type="file" onchange="file_Event(this)"/>
            </li>
<!--             <li class="itemContainer">글자</li> -->
        </ul>
        <input type="submit" value="전송">
        <button type="button" onclick="formList()">확인</button>
    </form>
</body>
</html>