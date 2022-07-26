package com.fastcampus.domain;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Data
@Table(name = "USERS")
@Entity
public class User {

	@Id //식별자 변수(=Primary Key) 선언
	@GeneratedValue(strategy = GenerationType.IDENTITY) //1부터 시작해서 자동으로 1씩 값이 증가하도록 설정한다. 정수형일때만 가능
	private int id; // 회원 일련번호
	
	@Column(nullable = false, length = 50, unique = true)
	private String username; // 아이디
	
	@Column(length = 50)
	private String password; // 비밀번호
	
	@Column(nullable = false, length = 100)
	private String email; // 이메일
	
	private String role;
	
	@CreationTimestamp // 현재 시간 정보가 자동으로 설정된다.
	private Timestamp createDate;
}