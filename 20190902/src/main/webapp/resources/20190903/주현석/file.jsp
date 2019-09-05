 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/web/resources/css/hr.css">
    
    <script>
    var dt =new DataTransfer();
	function formList(){
		console.log(dt);
	}
	function file_e(obj){
		console.log(obj.files);
		for(var i =0; i <obj.files.length; i++){
			console.log(obj.files[i]);
			var fileName = obj.files[i].name;
			var file = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
			console.log(fileName,file);
		
			var text;
			if("txt" == file){
				//var html =   '<li class="itemContainer">글자</li>';
				text = "글자";
			}else if("bmp" == file || "jpg" == file || "gif"==file || "png"==file){
				text = "이미지";
			}else if("pdf" == file ){
				text = "문서";
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
    <form action="" enctype="multipart/form-data" method="POST">
        <ul id="mainContainer">
            <li class="subContainer" id="clickMe">
            	<label for="file">+</label>
                <input class="dn" id="file" type="file" onchange="file_e(this)" multiple="multiple"/>
            </li>
        </ul>
        <button type="button" onclick="formList()">확인</button>
    </form>
</body>

</html>


















