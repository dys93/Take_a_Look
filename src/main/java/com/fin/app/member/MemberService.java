package com.fin.app.member;

import java.util.List;
import java.util.Map;


public interface MemberService {
	//로그인
	public Member loginMember(String mId);
	
	//삽입
	public void insertMember(Member dto) throws Exception;
	
	//추가
	public void updateMember(Member dto) throws Exception;
	
	//읽기
	public Member readMember(String mId);
	public Member readMember2(String mEmail);
	
	//삭제
	public void deleteMember(Map<String, Object>map) throws Exception;
	
	//데이터 갯수
	public int dataCount(Map<String, Object> map);
	public List<Member> listMember(Map<String, Object> map);

	//아이디 찾기
	public void findId(Member dto) throws Exception;
	
	//임시 비밀번호 생성
	public void generatePwd(Member dto) throws Exception;
}
