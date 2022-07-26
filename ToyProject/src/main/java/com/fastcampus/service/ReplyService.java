package com.fastcampus.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.fastcampus.domain.Reply;
import com.fastcampus.persistence.ReplyRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyService {

	private final ReplyRepository replyRepository;
	
	@Transactional
	public void insertReply(Reply reply) {
		replyRepository.save(reply);
	}
	
	@Transactional
	public void deleteReply(int id) {
		replyRepository.deleteById(id);
	}
}
