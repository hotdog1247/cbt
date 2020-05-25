<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>
<style>
	body{
		margin: 0;
		padding:0;
	}
	#container1{
		width: 1300px;
		margin:0 auto;
		height:600px;		
		float: left;
		background-color: #003b32;
		border: 15px outset #572313;
		color: white;
	}
	#exams{
		height:570px;
		overflow: auto;
	}
	div.content{
		background: #b48464;
		min-height: 901px;
	}
</style>
	<div class="content">
		<div id="container1">
			<div id="exams">
				<c:forEach var="exam" items="${selectList}">
					<div class="exWrap ${exam.eNo%2==0?'right':'left' }">
						<p><span class="eNo">${exam.eNo }</span>. ${exam.eName }</p>
								<c:if test="${0 ne exam.eDescription}">
									<p><img src="${pageContext.request.contextPath}/displayFile?fileName=${exam.tNo.tYear}_${exam.tNo.tOrder}_${exam.tNo.tName}/img/${exam.eNo}.png" class="eDescription"></p>
								</c:if>
								<p><input type="radio" name="${exam.eNo}a" value="1" class="contentChk"><span class="content">${exam.eContent }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="2" class="contentChk"><span class="content">${exam.eContent2 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="3" class="contentChk"><span class="content">${exam.eContent3 }</span></p>
								<p><input type="radio" name="${exam.eNo}a" value="4" class="contentChk"><span class="content">${exam.eContent4 }</span></p>
							</div>
				</c:forEach>
			</div>
		</div>
	</div>
<%@ include file="include/footer.jsp" %>
