<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">쓰기</h3>
				</div>
<!-- 				<form role="form" action="register" method="post" enctype="multipart/form-data"> -->
				<form role="form" action="register" method="post">
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="text" name="bTitle" class="form-control" placeholder="Enter Title">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" name="bContent" class="form-control" placeholder="Enter Content"></textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" name="mId" class="form-control" placeholder="Enter Writer" value="${Auth }" readonly>
						</div>
						<!-- <div> -->
							<!-- <div class="form_group">
								<label>Image Files</label>
								<input type="file" class="form-control" multiple="multiple" name="imageFiles" id="files">
							</div> -->
						<!-- </div> -->
						<div class="box-footer">
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div id="dropBox"></div>
<script>
/* 	$("input[type='file']").change(function() {
		var files = $(this)[0].files;
		$("#dropBox").empty();
		for(var i= 0; i<files.length;i++){
			var reader = new FileReader();
			var file = files[i];
			reader.readAsDataURL(file);
			reader.onload = function(e){
				var $img = $("<img>").attr("src", e.target.result);//e.target.result = reader.result
				$("#dropBox").append($img);
			}	
		}
	}) */
</script>
<%@ include file="../include/footer.jsp" %>