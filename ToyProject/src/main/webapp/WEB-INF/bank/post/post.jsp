<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
	<sec:authentication property="principal.username" var="secUsername" />
</sec:authorize>

<div class="container p-5 my-5 border">
	<h1>${post.title }</h1>
	<br> ${post.content } <br>
	<p>포스트 번호 : ${post.id }</p>
	<p>작성자 : ${post.user.username }</p>
	<hr>
	<button type="button" class="btn btn-secondary" id="go-back">돌아가기</button>
	<c:if test="${secUsername == post.user.username }">
		<button type="button" class="btn btn-warning" onClick="location.href='/post/updatePost/${post.id}'">수정하기</button>
	</c:if>
	<c:if test="${secUsername == post.user.username }">
		<button type="button" class="btn btn-danger" onClick="location.href='/post/deletePost/${post.id}'">삭제하기</button>
	</c:if>
	<br>

	<table class="table table-hover">
		<thead>
			<tr>
				<th>내용</th>
				<th style="text-align: right">작성자</th>
				<c:set var="contains" value="false" />
				<c:forEach var="reply" items="${post.replies }">
					<c:if test="${secUsername == reply.writer}">
						<c:set var="contains" value="true" />
					</c:if>
				</c:forEach>
				<c:if test="${contains == true}">
					<th style="text-align: right">삭제</th>
				</c:if>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="reply" items="${post.replies }">
				<tr>
					<td>${reply.content }</td>
					<td style="text-align: right">${reply.writer }</td>
					<c:if test="${secUsername == reply.writer }">
						<td style="text-align: right"><button type="button" class="btn btn-outline-dark btn-sm" onclick="location.href='/reply/delete/${reply.id}/${post.id }'">삭제</button></td>
					</c:if>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<form action="/reply/insert/${post.id }" method="post">
		<div class="form-floating mb-3 mt-3">
			<textarea class="form-control" id="comment" name="content" placeholder="댓글을 입력해주세요."></textarea>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button type="submit" class="btn btn-secondary float-right">댓글등록</button>
		</div>
	</form>
</div>

<script>
document.getElementById('go-back').addEventListener('click', () => {
	  window.history.back();
	});
</script>

<%@ include file="../layout/footer.jsp"%>
