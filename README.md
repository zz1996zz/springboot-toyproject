# springboot-toyproject

## Description  
- 게시글을 등록, 수정, 삭제 할 수 있습니다.
- 게시글 마다 덧글을 등록, 삭제할 수 있습니다.
- 단, 수정 및 삭제를 할 때는 등록한 사람만이 수정 및 삭제를 할 수 있습니다.

## Environment
- Eclipse
- H2 database
- SpringBoot
- Spring Data JPA
- JSP

## Files
- 포스트 상세화면 보기
  - welcome 페이지에서 회원가입 후 로그인을 하면 `상세 보기` 버튼이 생깁니다.
  - `welcome.jsp`에서 스프링 시큐리티를 통해 세션이 만들어지면 버튼이 보이게 했습니다.

- 포스트 수정하기
  - `post.jsp`에서 세션에 있는 유저 이름과 포스트에 조인된 유저 이름이 일치하면 `수정하기`버튼이 보이게 했습니다.
  - `수정하기` 버튼을 클릭하면 `PostController.java`에 있는 `updatePost`메소드를 통해 수정되게 했습니다.  

- 포스트 삭제하기
  - `post.jsp`에서 세션에 있는 유저 이름과 포스트에 조인된 유저 이름이 일치하면 `삭제하기`버튼이 보이게 했습니다.
  - `삭제하기` 버튼을 클릭하면 `PostController.java`에 있는 `deletePost`메소드를 통해 삭제되게 했습니다.
  - 삭제 시, 덧글들 또한 삭제되게 했습니다.

- 덧글 등록하기
  - 덧글 등록 시, `ReplyController.java`에 있는 `insert`메소드를 통해 DB에 등록되게 했습니다.

- 덧글 목록보기
  - `post.jsp`에서 포스트와 조인된 덧글의 사용자 이름과 세션에 있는 유저 이름이 일치하면 `삭제`버튼이 보이게 했습니다.

- 덧글 삭제하기
  - 덧글 삭제 버튼 클릭 시, `ReplyController.java`에 있는 `delete`메소드를 통해 삭제되게 했습니다.

## Usage
- H2 database와 톰캣이 설치되어 있어야한다.
  - 프로젝트 만들 당시 톰캣 9.0 버전을 사용하였다.
- 추가 후에 H2 database가 설치된 위치에 bin폴더안의 h2w.bat파일을 실행시켜 DB 엔진을 실행시킨다.
- H2 database를 실행 후에 main/resources에 있는 yml 파일에 jpa설정을 update -> create로 변경 후 실행한다.
  - 한번 실행 후에 다시 update로 변경한다.
