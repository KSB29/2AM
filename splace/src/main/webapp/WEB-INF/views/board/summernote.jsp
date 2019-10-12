<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<body>
  <textarea id="summernote"></textarea>
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	lang: 'ko-KR',
            tabsize: 2,
        	height: 500,
        	disableResizeEditor:  true,
       	  	focus: true,
       	  	placeholder: '여기에 작성해주세요!',
       	  	toolbar: [
       	  	   ['style', ['style']],
	       	   ['font', ['bold', 'underline', 'clear']],
	       	   ['fontname', ['fontname']],
	       	   ['color', ['color']],
	       	   ['para', ['ul', 'ol', 'paragraph', 'height']],
	       	   ['table', ['table']],
	       	   ['insert', ['link']],
	       	   ['view', ['fullscreen', 'codeview', 'undo', 'redo', 'help']],
       	 	]
        });
    });
  </script>
</body>
</html>