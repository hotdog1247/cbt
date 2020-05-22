<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>
<script>
	var no = 1;
	function getPageList(page){
		$("#list").empty();
		$("#pagination").empty();
		var bNo = ${board.bNo};
		$.ajax({
			url:"${pageContext.request.contextPath}/replies/"+bNo+"/"+page,
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				console.log("위에가 res");
				$(".replyLi").remove();
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				$(".timeline").append(func(res));
				$("#replycnt").html(res.board.replyCnt);
				$("#pagination").empty();
				for(var i =res.pageMaker.startPage; i<=res.pageMaker.endPage;i++){
					var $li = $("<li>");
					if(i == no){
						$li.addClass("active");
					}
					var $a = $("<a>").html(i);
					$li.append($a);
					$("#pagination").append($li);
				}
			}
		})
	}
	Handlebars.registerHelper("hotdog", function(value){
		var d = new Date(value);
		console.log("시간 : "+d);
		var y = d.getFullYear();
		var m = d.getMonth()+1;
		var day = d.getDate();
		var yoil = d.getDay();
		if(yoil == 1){
			yoil = "월";
		}
		else if(yoil == 2){
			yoil = "화";
		}
		else if(yoil == 3){
			yoil = "수";
		}
		else if(yoil == 4){
			yoil = "목";
		}
		else if(yoil == 5){
			yoil = "금";
		}
		else if(yoil == 6){
			yoil = "토";
		}
		else{
			yoil = "일";
		}
		return y +"/"+ m +"/"+day+" : "+yoil;
	})
	$(function() {
		$("#goList").click(function() {
			window.location.href ="${pageContext.request.contextPath }/board/list?page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
		$("#removeBoard").click(function() {
			window.location.href ="${pageContext.request.contextPath }/board/delete?bno=${board.bNo}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
 		$("#updateBoard").click(function() {
			window.location.href ="${pageContext.request.contextPath }/board/update?bNo=${board.bNo}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
 		$("#repliesDiv").click(function() {
			getPageList(1);
		})
		$("#btnAdd").click(function() {
			var bNo = ${board.bNo};
			var mId =$("#newReplyWriter").val();
			var replytext =$("#newReplyText").val();			
			//{"rNo" :1, bNo:{bNo:1, mId : {mId:1}}}
			var json = JSON.stringify({"bNo": {"bNo":bNo}, "mId":{"mId": mId}, "rContent":replytext});
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/",
				method:"post",
				headers:{"Content-Type":"application/json"},
				data:json,
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res == "SUCCESS"){
						alert("댓글이 등록됨");
						getPageList(1);
					}
				}
			})
		})
	})
	$(document).on("click", "#pagination li", function(){
		no = $(this).text();
		getPageList(no);
	})
	$(document).on("click", ".btnMod", function(){
		var rno2 = $(this).parent().parent().parent().attr("data-rno");
		var rno = parseInt(rno2);
		console.log("rno : "+rno);
		var replytext = $(this).parent().parent().find(".timeline-body").text();
		if($(this).html()=="Modify"){
			$(this).html("OK");	
			$(this).parent().parent().find(".timeline-body").hide();
			var $replytext2 = $("<input type='text' value='"+replytext+"' class='timeline-body2'>");
			$(this).parent().parent().find(".timeline-body").after($replytext2);
		}
		else{
			$(this).html("Modify");
			replytext = $(this).parent().parent().find(".timeline-body2").val();
			var json = JSON.stringify({"rno": rno, "replytext":replytext});
			
			$.ajax({
				url:"${pageContext.request.contextPath}/replies/"+rno,
				method:"put",
				headers:{"Content-Type":"application/json"},
				data:json,
				dataType:"text",
				success:function(res){
					console.log(res);
					if(res == "SUCCESS"){
						alert("댓글이 수정됨");
						getPageList(no);
					}
				}
			})
			$(this).parent().parent().find(".timeline-body2").hide();
			$(this).parent().parent().find(".timeline-body").show();
		}
	})
	$(document).on("click", ".btnDel", function(){
		var rno2 = $(this).parent().parent().parent().attr("data-rno");
		var rno = parseInt(rno2);
		console.log("삭제애서의 댓글번호 : "+rno);
		var json = JSON.stringify({"rno": rno});
			
		$.ajax({
			url:"${pageContext.request.contextPath}/replies/"+rno+"",
			method:"delete",
			headers:{"Content-Type":"application/json"},
			data:json,
			dataType:"text",
			success:function(res){
				console.log(res);
				if(res == "SUCCESS"){
					alert("댓글이 삭제됨");
					getPageList(no);
				}
			}
		})
	})
</script>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title">READ</h3>
					<div class="box-body text-right">
						${board.bNo }
					</div>
				</div>
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="text" class="form-control" value="${board.bTitle }" readonly>
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" class="form-control" readonly>${board.bContent }</textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" class="form-control" value="${board.mId.mId }" readonly>
						</div>
						<input type="hidden" name="bno" value="${board.bNo }">
					</div>
				<div class="box-footer">
					<button class="btn btn-warning" id="updateBoard">Modify</button>
					<button class="btn btn-danger" id="removeBoard">Remove</button>
					<button class="btn btn-primary" id="goList">Go List</button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box box-success">
				<div class="box-header">
					<h3 class="box-title">댓글달기</h3>
				</div>
				<div class="box-body">
					<label>ID</label>
					<input type="text" class="form-control" placeholder="user id" id="newReplyWriter" value="${Auth }" readonly>
					<label>내용</label>
					<input type="text" class="form-control" placeholder="Replytext" id="newReplyText">
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" id="btnAdd">작성</button>
				</div>
			</div>
			<ul class="timeline">
				<li class="time-label" id="repliesDiv">
					<span class="bg-green">Replies list [<span id="replycnt">${board.replyCnt}</span>]</span>
				</li>
			</ul>
			<div class="text-center">
				<ul id="pagination" class="pagination pagination-sm no-margin"></ul>
			</div>
		</div>
	</div>
</div>

<script id="template" type="text/x-handlebars-template">
	{{#each list}}
	<li class="replyLi" data-rno="{{rno}}">
		<i class="fa fa-comments bg-blue"></i>
		<div class="timeline-item">
			<span class="time">
				<i class="fa fa-clock-o"></i>{{hotdog regdate}}
			</span>
			<h3 class="timeline-header"><strong>{{rno}}</strong>- {{replyer}}</h3>
			<div class="timeline-body">{{replytext}}</div>
			<div class="timeline-footer">
				<a class="btn btn-primary btn -xs btnMod">Modify</a>
				<a class="btn btn-danger btn -xs btnDel">Delete</a>
			</div>
		</div>
	</li>
	{{/each}}
</script>
<%@ include file="../include/footer.jsp" %>