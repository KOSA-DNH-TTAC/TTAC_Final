package kr.or.kosa.dao;

import kr.or.kosa.dto.Reply;

public interface ReplyDao {

	// 댓글 작성
	public int newReply(Reply reply);

	// 답댓글 작성
	public int newRereply(Reply reply);

	// 댓글 삭제
	public int deleteReply(String idx);

	// 답댓글 삭제
	public int deleteRereply(String parentidx);
}
