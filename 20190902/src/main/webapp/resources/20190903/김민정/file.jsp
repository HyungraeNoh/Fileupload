<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>파일업로드</title>
        <style>
        </style>
        <link rel="stylesheet" href="/resources/css/file.css">
        <script>    
			function checkFile(obj){
				console.log(obj.files);
				var dt = new DataTransfer();
				for(var i = 0 ; i < obj.files.length ; i++){
					var fileName = obj.files[i].name;
					var ext = fileName.substr(fileName.lastIndexOf(".") + 1, fileName.length);
					var node = document.createElement( 'li' );
					var name = "";
					if(ext == "txt"){
						name = "txt";
					} else if(ext == "gif" || ext == "png" || ext == "jpeg" || ext == "jpg") {
						name = "이미지"
					} else if(ext == "pdf") {
						name = "문서"
					} else {
						continue;
					}
					
					var textNode = document.createTextNode( name );
					node.appendChild( textNode );
					//node.classList.add('');
					document.getElementById("main").appendChild( node );
					dt.items.add(obj.files[i]);
				}
				obj.files = dt.files;
			}
		</script>
    </head>
    <body>
        <div class="container">
            <form action="" method="post" enctype="multipart/form-data">
                <ul id="main">
                	<li>
	                    <label for="file" >+</label>
	                    <input type="file" id="file" name="file" multiple=multiple onchange="checkFile(this)">    
                    </li>            
                </ul>
                <ul></ul>
            </form>
        </div>
    </body>
</html>