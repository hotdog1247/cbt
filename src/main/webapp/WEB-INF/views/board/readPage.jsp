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
		var bno = ${board.bno};
		$.ajax({
			url:"${pageContext.request.contextPath}/replies/"+bno+"/"+page,
			type:"get",
			dataType:"json",
			success:function(res){
				console.log(res);
				console.log("위에가 res");
				$(".replyLi").remove();
				var source = $("#template").html();
				var func = Handlebars.compile(source);
				$(".timeline").append(func(res));
				$("#replycnt").html(res.board.replycnt);
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
			window.location.href ="${pageContext.request.contextPath }/sboard/listPage?page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
		$("#removeBoard").click(function() {
			window.location.href ="${pageContext.request.contextPath }/sboard/deletePage?bno=${board.bno}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
 		$("#updateBoard").click(function() {
			window.location.href ="${pageContext.request.contextPath }/sboard/updatePage?bno=${board.bno}&page=${cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}";
		})
 		$("#repliesDiv").click(function() {
			getPageList(1);
		})
		$("#btnAdd").click(function() {
			var bno = ${board.bno};
			var replyer =$("#newReplyWriter").val();
			var replytext =$("#newReplyText").val();
			
			//서버 주소 /replies/
			//@RequestBody 서버에서 사용시
			// 1. headers = "Content-Type":"application/json"
			// 2. 보내는 data는 json String으로 변형해서 보내야 됨
			// - "{bno:bno}"
			
			var json = JSON.stringify({"bno": bno, "replyer":replyer, "replytext":replytext});
			
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
						//리스트 갱신
						getPageList(1);
/* 						var replycnt2 = $("#replycnt").text();
						console.log(replycnt2);
						var replycnt =parseInt(replycnt2);
						console.log(replycnt);
						replycnt++;
						$("#replycnt").text(replycnt); */
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
			/* $(this).parent().parent().find(".timeline-body").remove(); */
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
						//리스트 갱신
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
					//리스트 갱신
					getPageList(no);
/* 					var replycnt2 = $("#replycnt").text();
					var replycnt =parseInt(replycnt2);
					replycnt--;
					$("#replycnt").text(replycnt); */
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
						${board.bno }
					</div>
				</div>
					<div class="box-body">
						<div class="form-group">
							<label>Title</label>
							<input type="text" class="form-control" value="${board.title }" readonly>
						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="5" cols="30" class="form-control" readonly>${board.content }</textarea>
						</div>
						<div class="form-group">
							<label>Writer</label>
							<input type="text" class="form-control" value="${board.writer }" readonly>
						</div>
						<div class="form-group">
							<label>Files</label>
							<c:forEach var="file" items="${board.files }">
								<img src="displayFile?fileName=${file }" class="sImg" data-src="${file }">
							</c:forEach>
						</div>
						<input type="hidden" name="bno" value="${board.bno }">
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
					<h3 class="box-title">ADD NEW REPLY</h3>
				</div>
				<div class="box-body">
					<label>Writer</label>
					<input type="text" class="form-control" placeholder="user id" id="newReplyWriter" value="${Auth }" readonly>
					<label>Replytext</label>
					<input type="text" class="form-control" placeholder="Replytext" id="newReplyText">
				</div>
				<div class="box-footer">
					<button class="btn btn-primary" id="btnAdd">REPLY</button>
				</div>
			</div>
			<ul class="timeline">
				<li class="time-label" id="repliesDiv">
					<span class="bg-green">Replies list [<span id="replycnt">${board.replycnt}</span>]</span>
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