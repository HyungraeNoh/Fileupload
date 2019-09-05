<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>파일 업로드</title>
		<link rel="stylesheet" href="/web/resources/css/file.css">
    </head>
    
    <script>
    	var dt = new DataTransfer();
    	
		function formList() {
			console.log(dt);
		}
		
    	function file_Event(obj) {
    		console.log("test");
    		var node;
    		let cnt = 0;
    		
    		for(var i = 0; i < obj.files.length; i++) {
    			var fileName = obj.files[i].name;
    			var ext = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length);
    			console.log(fileName, ext);
    			console.log(obj.files);
    			if("txt" == ext) {
    				node = document.createElement("LI");
    				var textnode = document.createTextNode(fileName);
    				node.appendChild(textnode);
    				document.getElementById("mainContainer").appendChild(node);
    			} else if("pdf" == ext) {
    				node = document.createElement("LI");
    				var textnode = document.createTextNode("문자");
    				node.appendChild(textnode);
    				document.getElementById("mainContainer").appendChild(node);
    			} else if("jpg" == ext || "jpeg" == ext || "png" == ext) {
    				node = document.createElement("LI");
    				img = document.createElement("img");
    				img.width = 100;
    				img.height = 100;
    				img.src = "https://tpc.googlesyndication.com/simgad/11863321910164275197?sqp=4sqPyQQ7QjkqNxABHQAAtEIgASgBMAk4A0DwkwlYAWBfcAKAAQGIAQGdAQAAgD-oAQGwAYCt4gS4AV_FAS2ynT4&rs=AOga4qmM9eGmTSnaB8OgkbFycusVXYN0aw";
    				document.getElementById("mainContainer").appendChild(node).appendChild(img);
    			} else {
    				continue;
    			}
    			
    			dt.items.add(obj.files[i]);
    		}
    		
    		obj.files = dt.files;
    	}
    </script>
   
    <body>
        <div class="container">
            <form action="/web/upload" method="post" enctype="multipart/form-data">
                <ul>
                	<li>
	                    <label for="file" >+</label>
	                    <input type="file" id="file" multiple=multiple onchange="file_Event(this)">    
                    </li> 
                </ul>
                <ul id="mainContainer">
                	<!-- <li class="itemContainer">1</li> -->
                </ul>
                <input type="submit" value="업로드">
            </form>
        </div>
    </body>
</html>