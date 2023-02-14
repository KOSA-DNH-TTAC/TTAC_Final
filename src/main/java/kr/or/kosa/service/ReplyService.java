package kr.or.kosa.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.ReplyDao;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.security.User;

@Service
public class ReplyService {
	private SqlSession sqlsession;
	 
	@Autowired
	public void setSqlsession(SqlSession sqlsession) {
	   this.sqlsession = sqlsession;
	}
	
	//새 댓글 작성
	public int newReply(String postidx, String reply) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ReplyDao dao = sqlsession.getMapper(ReplyDao.class);
		
		Reply newre = new Reply();
		
		String memberid = user.getMemberId();
		newre.setMemberId(memberid);
		newre.setIdx(Integer.parseInt(postidx));
		newre.setReplyContent(reply);
		
		int result = dao.newReply(newre);
		return result;
	}
	
	//답댓글 작성
	public int newRereply(String postidx, String parentidx, String reply) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		ReplyDao dao = sqlsession.getMapper(ReplyDao.class);
		
		Reply newre = new Reply();
		
		String memberid = user.getMemberId();
		newre.setMemberId(memberid);
		newre.setIdx(Integer.parseInt(postidx));
		newre.setParentReplyIdx(Integer.parseInt(parentidx));
		newre.setReplyContent(reply);
		
		int result = dao.newRereply(newre);
		return result;
	}
	
	//댓글 삭제
	public int deleteReply(String idx) {
		ReplyDao dao = sqlsession.getMapper(ReplyDao.class);
		int result = dao.deleteReply(idx);
		return result;
	}
}
