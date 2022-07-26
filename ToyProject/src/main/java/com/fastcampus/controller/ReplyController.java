package com.fastcampus.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.fastcampus.domain.Post;
import com.fastcampus.domain.Reply;
import com.fastcampus.security.jpa.UserDetailsImpl;
import com.fastcampus.service.PostService;
import com.fastcampus.service.ReplyService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ReplyController {

	private final ReplyService replyService;
	private final PostService postService;
	
	@PostMapping("/reply/insert/{postId}")
	public String insert(@PathVariable int postId, @ModelAttribute Reply reply, @AuthenticationPrincipal UserDetailsImpl userDetails) {
		Post post = postService.getPost(postId);
		reply.setPost(post);
		reply.setWriter(userDetails.getUsername());
		replyService.insertReply(reply);
		return "redirect:/post/" + postId;
	}
	
	@GetMapping("/reply/delete/{replyId}/{postId}")
	public String delete(@PathVariable int replyId, @PathVariable int postId) {
		replyService.deleteReply(replyId);
		return "redirect:/post/" + postId;
	}
}
