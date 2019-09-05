<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
<link rel="stylesheet" href="/t0902/resources/css/file.css" />
<script>
    console.log("22");
    let imageMIME=new Array("jpg","png","gif","jpe");
    var dt = new DataTransfer();
    
    function formList(){
    	console.log(dt);
    }
	function file_Event(obj){
		console.log("here",obj.files);

		for(var file of obj.files){
			let fileName = file.name;
			let ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
			console.log(fileName,ext);
			let inputH="";
			if("txt"==ext){
				inputH="텍스트"
			}else if(imageMIME.includes(ext)){
				console.log("hhlhlhlhl");
				inputH="이미지"
			}else if("pdf"==ext){
				inputH="문서"
			}else{
				continue;
			}
			
			let node = document.createElement("LI");
            let textNode = document.createTextNode(inputH);
            node.append(textNode);
            node.classList.add("itemContainer");
            document.getElementById("mainContainer").appendChild(node);
            dt.items.add(file);
		}
		obj.files=dt.files;
	}
    </script>

</head>

<body>
	<form method="post" action="/t0902/file" enctype="multipart/form-data">
		<ul id="mainContainer">
			<li class="subContainer" id="clickMe"><label for="file">+</label>
				<input class="dn" name="file" id="file" onchange="file_Event(this)" type="file" />
			</li>
		</ul>
		<button type="button" onclick="formList()">확인</button><br>
		<input type="submit" value="보내기">
	</form>
</body>

</html>