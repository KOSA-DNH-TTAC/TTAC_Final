package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.RollCall;

public interface BoardDao {

	// 게시판 이름 (종류)
	public List<Board> categoryList();

	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(String boardName);

	// 커스텀 생성 게시판
	public List<Post> customBoardList(String boardName);

	// 게시글 상세보기
	public List<Post> boardContent(String idx);

	// 댓글 목록
	public List<Reply> replyContent(String idx);

	// 대댓글 목록
	public List<Reply> reReplyContent(String replyIdx);

	// 글 작성(파일첨부 x)
	public int boardInsert(Post post) throws ClassNotFoundException, SQLException;

	// 파일 글 작성
	public int fileInsert(File file) throws ClassNotFoundException, SQLException;

	// 점호하기
	public Domitory eveningCall(double lat, double lon);

	// 점호하기
	public int eveningCallInsert(String memberId, String universitycode);
}