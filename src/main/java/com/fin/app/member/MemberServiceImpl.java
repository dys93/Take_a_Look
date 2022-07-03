package com.fin.app.member;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fin.app.common.dao.CommonDAO;
import com.fin.app.mail.Mail;
import com.fin.app.mail.MailSender;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private MailSender mailSender;
	//커밋
	@Override
	public Member loginMember(String mId) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.loginMember", mId);
			dao.updateData("member.lastlogin", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			
			if(dto.getmEmail1().length()!=0 && dto.getmEmail2().length()!=0) {
				dto.setmEmail(dto.getmEmail1() + "@" + dto.getmEmail2());
			}
			
			if(dto.getmTel1().length()!=0 && dto.getmTel2().length()!=0 && dto.getmTel3().length()!=0) {
				dto.setmTel(dto.getmTel1() + "-" + dto.getmTel2() + "-" + dto.getmTel3());
			}
			
			long clientSeq = dao.selectOne("member.clientSeq");
			dto.setmNum(clientSeq);
			dao.insertData("member.client", dto);
			dao.insertData("member.insertMember", dto);
			dao.insertData("member.insertMemberDetail", dto);
			
			//dao.updateData("member.insertMember12", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if(dto.getmEmail1().length()!=0 && dto.getmEmail2().length()!=0) {
				dto.setmEmail(dto.getmEmail1() + "@" + dto.getmEmail2());
			}
			
			if(dto.getmTel1().length()!=0 && dto.getmTel2().length()!=0 && dto.getmTel3().length()!=0) {
				dto.setmTel(dto.getmTel1() + "-" + dto.getmTel2() + "-" + dto.getmTel3());
			}
			
			dao.updateData("member.updateMember1", dto);
			dao.updateData("member.updateMember2", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Member readMember(String mId) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.readMember", mId);
			
			if(dto!=null) {
				if(dto.getmEmail()!=null) {
					String [] s=dto.getmEmail().split("@");
					dto.setmEmail1(s[0]);
					dto.setmEmail2(s[1]);
				}

				if(dto.getmTel()!=null) {
					String [] s=dto.getmTel().split("-");
					dto.setmTel1(s[0]);
					dto.setmTel2(s[1]);
					dto.setmTel3(s[2]);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Member readMember2(String mEmail) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.readMember2", mEmail);
			
			if(dto!=null) {
				if(dto.getmId()!=null) {
					String s=dto.getmId();
					dto.setmId(s);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void deleteMember(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list=null;
		
		return list;
	}
	
	@Override
	public void findId(Member dto) throws Exception {
		
		String result;
		result = "고객님의 아이디는 <b>"+dto.getmId()+"</b> 입니다.<br>";
		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getmEmail());
		
		mail.setSenderEmail("ghiouw96@gmail.com");
		mail.setSenderName("Take A Look");
		mail.setSubject("아이디 안내");
		mail.setContent(result);
		
		boolean b = mailSender.mailSend(mail);
		
		if(b) {
			dto.getmId();

		} else {
			throw new Exception("이메일 전송 중 오류가 발생했습니다.");
		}
		
	}

	@Override
	public void generatePwd(Member dto) throws Exception {
		// 10 자리 임시 패스워드 생성
		StringBuilder sb = new StringBuilder();
		Random rd = new Random();
		String s="!@#$%^&*~-+ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz";
		for(int i=0; i<10; i++) {
			int n = rd.nextInt(s.length());
			sb.append(s.substring(n, n+1));
		}
		
		String result;
		result = dto.getmId()+"님의 새로 발급된 임시 패스워드는 <b>"
		         + sb.toString()+"</b> 입니다.<br>"
		         + "로그인 후 반드시 패스워드를 변경 하시기 바랍니다.";
		Mail mail = new Mail();
		mail.setReceiverEmail(dto.getmEmail());
		
		mail.setSenderEmail("ghiouw96@gmail.com");
		mail.setSenderName("Take A Look");
		mail.setSubject("임시 패스워드 발급");
		mail.setContent(result);
		
		boolean b = mailSender.mailSend(mail);
		
		if(b) {
			dto.setmPwd(sb.toString());
			updateMember(dto);
		} else {
			throw new Exception("이메일 전송 중 오류가 발생했습니다.");
		}
	}

}
