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
		
		Message msg;
		msg = dao.getMessage(idx);
		return msg;
	}
	
	//쪽지 쓰기
	public int sendMsg(Message msg) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		msg.setSMemberId(user.getMemberId());
		System.out.println(msg);
		MessageDao dao = sqlsession.getMapper(MessageDao.class);
		int result = 0;
		result = dao.sendMessage(msg);
		
		return result;
	}
	
}