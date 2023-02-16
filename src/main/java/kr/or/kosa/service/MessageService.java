package kr.or.kosa.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.MessageDao;
import kr.or.kosa.dto.Message;
import kr.or.kosa.security.User;

@Service
public class MessageService {
	
	private SqlSession sqlsession;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}

	//받은 쪽지 조회
	public List<Message> getReceivedMsg(String memberid){
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		
		List<Message> list = new ArrayList<>();
		list = dao.getReceivedMessage(memberid);
		return list;
	}
	
	//보낸 쪽지 조회
	public List<Message> getSendMsg(String memberid){
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		
		List<Message> list = new ArrayList<>();
		list = dao.getSendMessage(memberid);
		return list;
	}
	
	//쪽지 상세 조회
	public Message getMsg(int idx) {
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Message msg;
		msg = dao.getMessage(idx);
		System.out.println(msg);
		//받는 사람 = 로그인한 사람일 경우
		//status = 'N'이면 'Y'로바꿔줌
		System.out.println(msg.getStatus());
		System.out.println("N".equals(msg.getStatus()));
		System.out.println(msg.getStatus().equals("N"));
		if(msg.getStatus().equals("N")) {
			System.out.println("분기1");
			if(msg.getRmemberId().equals(user.getMemberId())) {
				System.out.println("분기2");
				dao.setMsgRead(idx);
			}
		}
		
		return msg;
	}
	
	//쪽지 쓰기
	public int sendMsg(Message msg) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		msg.setSmemberId(user.getMemberId());
		System.out.println(msg);
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		int result = 0;
		result = dao.sendMessage(msg);
		
		return result;
	}
	
}