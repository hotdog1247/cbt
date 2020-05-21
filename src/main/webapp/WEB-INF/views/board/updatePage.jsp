<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(function() {
	
		$(".imgChk").click(function() {
			if($(this).prop("checked")){
				$(this).parent().parent().find("img").css("opacity", 0.5).addClass("rmImg");	
			}
			else{
				$(this).parent().parent().find("img").css("opacity", 1).removeClass("rmImg");	
			}
		})
	})
</script>
<style>
	
</style>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">UPDATE</h3>
					<div class="box-body text-right">${board.bno }</div>
				</div>
				<form role="form" action="updatePage" method="post" name="updateForm" id="updateForm" enctype="multipart/form-data">
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="text" class="form-control" value="${board.title }" name="title">
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" class="form-control" name="content">${board.content }</textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" class="form-control" value="${board.writer }" name="writer" readonly>
						</div>
						<div class="form-group">
							<label>files</label>
							<input type="file" name="imgFiles" multiple="multiple">
							<div>
								<c:forEach var="file" items="${board.files }">
									<span><span><img src="displayFile?fileName=${file }" ></span><span><input type="checkbox" value="${file }" class="imgChk" name="files"></span></span>
								</c:forEach>
							</div>
						</div>
						<input type="hidden" name="bno" value="${board.bno }">
						<input type="hidden" name="page" value="${cri.page }">
						<input type="hidden" name="searchType" value="${cri.searchType }">
						<input type="hidden" name="keyword" value="${cri.keyword }">
					</div>
					<div class="box-footer">
						<button type="submit" class="btn btn-primary">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>