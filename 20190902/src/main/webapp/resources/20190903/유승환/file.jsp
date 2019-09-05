<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>파일 업로드</title>
   	<link rel="stylesheet" href="/web/resources/css/file.css">
   	<script type="text/javascript">
   		var dt = new DataTransfer();
   		function formList(){
   			console.log(dt);
   		}
	   	function file_Event(obj){
//			console.log(obj.files);
			for(var i = 0; i < obj.files.length; i++){
				var fileName = obj.files[i].name;
				var ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
				console.log(fileName, ext);
				var text = "";
				if("txt" == ext) {
//					var html = '<li class="itemContainer">글자</li>';
					text = "텍스트";     
				}else if ("jpg" == ext || "gif" == ext || "png" == ext){
					text = "이미지";
				}else if ("pdf" == ext || "odp" == ext){
					text = "문서";
				}else {
					continue; // continue로 잘못된 대상 예외처리
				}
				var node = document.createElement("LI");                 
				var textnode = document.createTextNode(text);         
				node.appendChild(textnode);
				node.classList.add("itemContainer");
				document.getElementById("mainContainer").appendChild(node);
				dt.items.add(obj.files[i]);
			}
			obj.files = dt.files;
			console.log(obj.files);
	   	}		
   	</script>
</head>

<body>
    <form action="/file" method="post" enctype="multipart/form-data">
        <ul id="mainContainer">
            <li class="subContainer" id="clickMe">
            	<label for="file">+</label>
                <input class="dn" id="file" type="file" onchange="file_Event(this)" multiple="multiple" name="file" />
            </li>
<!--             <li class="itemContainer">글자</li> -->
        </ul>
        <button type="button" onclick="formList()">확인</button>
        <input type="submit" value="전송">
    </form>
</body>

</html>