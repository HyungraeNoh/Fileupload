<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link rel="stylesheet" href="/web/resources/css/file.css">
<script>
	var dt = new DataTransfer();
	function formList() {
		console.log(dt);
	}
	/*   
		function file_Event(obj){
			console.log(obj.files);
			for (var i = 0; i < obj.files.length; i++) {
				var fileName = obj.files[i].name;
				var ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
				console.log(fileName, ext);
				
	/*				
				if("txt" == ext) {
					var node = document.createElement("LI");
					var textnode = document.createTextNode("글자");
					node.appendChild(textnode);
					node.classList.add("itemContainer");
					document.getElementById("mainContainer").appendChild(node);
				}
	 */
	/*
	 switch(ext){
	 case 'txt' :
	 var node = document.createElement("LI");
	 var textnode = document.createTextNode("글자");
	 node.appendChild(textnode);
	 node.classList.add("itemContainer");
	 document.getElementById("mainContainer").appendChild(node);
	 break;
	 case 'jpg' :
	 case 'jpeg' :
	 case 'png' :
	 var node = document.createElement("LI");
	 var textnode = document.createTextNode("이미지");
	 node.appendChild(textnode);
	 node.classList.add("itemContainer");
	 document.getElementById("mainContainer").appendChild(node);
	 break;
	 case 'pdf' :
	 case 'hwp' :
	 case 'doc' :
	 case 'ppt' :
	 var node = document.createElement("LI");
	 var textnode = document.createTextNode("문서");
	 node.appendChild(textnode);
	 node.classList.add("itemContainer");
	 document.getElementById("mainContainer").appendChild(node);
	 break;
	
	 case 'zip' :
	 case 'tar' :
	 case 'gz' :
	 var node = document.createElement("LI");
	 var textnode = document.createTextNode("압축파일");
	 node.appendChild(textnode);
	 node.classList.add("itemContainer");
	 document.getElementById("mainContainer").appendChild(node);
	 dt.items.add(obj.files[i]);
	 break;
	 }			
	 }
	 }
	 */

	function file_Event(obj) {
		console.log(obj.files);
		for (var i = 0; i < obj.files.length; i++) {
			var fileName = obj.files[i].name;
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1,
					fileName.length);
			console.log(fileName, ext);
			var text = "";
			if ("txt" == ext) {
				text = "텍스트";
			} else if ("pdf" == ext) {
				text = "문서";
			} else if ("jpg" == ext || "jpeg" == ext || "png" == ext) {
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
		obj.files = dt.files;
		console.log(obj.files)
	}
</script>
</head>
<body>
	<form action="" method="post" enctype="multipart/form-data">
		<ul id="mainContainer">
			<li class="subContainer" id="clickMe"><label for="file">+</label>
				<input class="dn" id="file" type="file" onchange="file_Event(this)" />
			</li>
			<!--             <li class="itemContainer">글자</li> -->
		</ul>
		<button type="button" onclick="formList()">확인</button>
		<input type="submit" value="전송">
	</form>
</body>
</html>