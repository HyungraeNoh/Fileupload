<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일업로드</title>
    <link rel="stylesheet" href="/web/resources/css/file.css">
    
    <script>
		var dt = new DataTransfer();
		function formList() {
			console.log(dt);
		}
		function file_Event(obj){
			console.log(obj.files);
			for (var i =0; i< obj.files.length;i++) {
				var fileName = obj.files[i].name;
				var ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
				console.log(fileName,ext);
 				var node=document.createElement("Li");
	 				if("txt" == ext) {
					//dt.items.add(file);
	 				//var html='<li class="itemContainer">글자</li>';

	 				var textnode=document.createTextNode("text");
	 				
				}else if("jpg"==ext | "jpeg"==ext | "png"==ext) {

	 				var textnode=document.createTextNode("이미지");

				}else if("pdf"==ext) {
	
	 				var textnode=document.createTextNode("문서");

				}else{
					break;
				}
	 				node.appendChild(textnode);
	 				node.classList.add("itemContainer");
	 				document.getElementById("mainContainer").appendChild(node);
	 				dt.items.add(obj.files[i]);
			}
			//obj.files = dt.files;
			//console.log(obj.files); 
		} 
	</script>
    
</head>

<body>
    <form action="" method="post" enctype="multipart/form-data">
        <ul id="mainContainer">
            <li class="subContainer" id="clickMe">
            	<label for="file">+</label>
                <input class="dn" name="file" id="file" type="file" onchange="file_Event(this)" multiple="multiple"/>
            </li>
            <!-- <li class="itemContainer">글자</li> -->
        </ul>
        <button type="button" onclick="formList()">확인</button>

    </form>
</body>

</html>