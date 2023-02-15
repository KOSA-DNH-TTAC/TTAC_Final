package kr.or.kosa.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	//댓글 삭제(부모댓글일시 자식 댓글도 삭제되게)
	@Transactional(rollbackFor = Exception.class)
	public Map<String, Integer> deleteReply(String idx) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		ReplyDao dao = sqlsession.getMapper(ReplyDao.class);
		int parentResult = 0;
		int rereplyResult = 0;
		try {
			parentResult = dao.deleteReply(idx);
			map.put("parentResult", parentResult);
			rereplyResult = dao.deleteRereply(idx);
			map.put("rereplyResult", rereplyResult);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
}
