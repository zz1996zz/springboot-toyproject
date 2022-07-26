<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container mt-3">
	<form action="/post/updatePost/${post.id }" method="post">
		<div class="mb-3">
			<label for="title">Title:</label> <input type="text" class="form-control" name="title" placeholder="Enter title" value="${post.title }">
		</div>
		<div class="mb-3">
			<label for="content">Content:</label>
			<textarea class="form-control" rows="5" id="content" name="content">${post.content }</textarea>
		</div>
		<button type="button" class="btn btn-secondary" id="go-back">돌아가기</button>
		<button type="submit" class="btn btn-warning">포스트 수정</button>
	</form>

</div>

<script>
	$(document).ready(function() {
		$("#content").summernote({
			height : 300
		});
	});
	
	document.getElementById('go-back').addEventListener('click', () => {
		  window.history.back();
		});
</script>

<%@ include file="../layout/footer.jsp"%>
