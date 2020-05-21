<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<div class="content">
	<div class="row">
		<div class="col-sm-12">
			<div class="box box-primary">
				<div class="box-header">
					<h4 class="box-title">관리자 비난 및 욕설은 제재</h3>
					<div class="box-body">
						<select name="searchType" id="searchType">
							<option value="n" ${cri.searchType==null? 'selected':'' }>----</option>
							<option value="t" ${cri.searchType=='t'? 'selected':'' }>Title</option>
							<option value="c" ${cri.searchType=='c'? 'selected':'' }>Content</option>
							<option value="w" ${cri.searchType=='w'? 'selected':'' }>Writer</option>
							<option value="tc" ${cri.searchType=='tc'? 'selected':'' }>Title&Content</option>
							<option value="cw" ${cri.searchType=='cw'? 'selected':'' }>Content&Writer</option>
							<option value="tcw" ${cri.searchType=='tcw'? 'selected':'' }>Title&Content&Writer</option>
						</select>
						<input type="text" name="keywordInput" id="keywordInput" value="${cri.keyword }">
						<button id="btnSearch">Search</button>
						<button id="btnRegister">Register</button>
					</div>
				</div>
				<form role="form" action="register" method="post">
					<div class="box-body">
						<table class="table table-bordered">
							<tr>
								<th style="width:10px">BNO</th>
								<th>TITLE</th>
								<th>WRITER</th>
								<th>REGDATE</th>
								<th style="width: 40px">VIEWCNT</th>
							</tr>
							<c:forEach var="board" items="${list }">
								<tr>
									<td>${board.bNo }</td>
									<td>
										<a href="${pageContext.request.contextPath}/board/read?bNo=${board.bNo}&page=${pageMaker.cri.page}&searchType=${cri.searchType}&keyword=${cri.keyword}">${board.bTitle } [${board.replyCnt}]</a>
									</td>
									<td>${board.mId }</td>
									<td><fmt:formatDate value="${board.bDate }" pattern="yyyy-MM-dd HH:mm"/></td>
									<td><span class="badge bg-red">${board.viewCnt }</span></td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="box-footer">
						<div class="text-center">
							<ul class="pagination">
								<c:if test="${pageMaker.prev == true }">
									<li><a href="list?page=${pageMaker.startPage-1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&laquo</a></li>
								</c:if>
								<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
									<li class="${pageMaker.cri.page == idx?'active':'' }"><a href="list?page=${idx}&searchType=${cri.searchType}&keyword=${cri.keyword}">${idx }</a></li>
								</c:forEach>
								<c:if test="${pageMaker.next == true }">
									<li><a href="list?page=${pageMaker.endPage+1 }&searchType=${cri.searchType}&keyword=${cri.keyword}">&raquo</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	$("#btnSearch").click(function() {
		var searchType = $("#searchType").val();
		var keyword = $("#keywordInput").val();
		location.href="list?searchType="+searchType+"&keyword="+keyword+"";
	})
	$("#btnRegister").click(function() {
		location.href="register";
	})
</script>
<%@ include file="../include/footer.jsp" %>