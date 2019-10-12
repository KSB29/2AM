<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Summernote</title>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<body>
  <div id="summernote"><p>여기에 작성해주세요!</p></div>
  <script>
    $(document).ready(function() {
        $('#summernote').summernote({
        	lang: 'ko-KR',
            tabsize: 2,
        	height: 500,
        	disableResizeEditor: true,
       	  	focus: true
        });
    });
  </script>
</body>
</html>