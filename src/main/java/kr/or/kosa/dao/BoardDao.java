package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.RollCall;

public interface BoardDao {

	// 게시판 이름 (종류)
	public List<Board> categoryList(String universitycode);

	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(String boardName, String universitycode);

	// 커스텀 생성 게시판
	public List<Post> customBoardList(String boardName, String universitycode);

	// 게시글 상세보기
	public List<Post> boardContent(String idx);
	
	// 게시글 상세보기 (객체로)
	public Post boardContentDTO(int idx) throws ClassNotFoundException, SQLException;

	// 댓글 목록
	public List<Reply> replyContent(String idx);

	// 대댓글 목록
	public List<Reply> reReplyContent(String replyIdx);

	// 글 작성(파일첨부 x)
	public int boardInsert(Post post) throws ClassNotFoundException, SQLException;

	// 파일 글 작성
	public int fileInsert(File file) throws ClassNotFoundException, SQLException;
	
	// 게시글 추천 여부 검사
	public int likeCount(String idx);
	public int likeCheck(String idx, String memberId);
	public void deletePostLike(String idx, String memberId);
	public void updateDislike(String idx);
	public void insertPostLike(String idx, String memberId);
	public void updateLike(String idx);
	

	// 점호하기
	public Domitory eveningCall(String domitoryname);
	
	//점호데이터 넣기
	public int eveningCallInsert(String memberId, String universitycode);
	
	//점호 데이터 중복 체킹
	public RollCall eveningCallCompare(String memberId, String universitycode, String date);
	
	//건물(동) 리스트 가져오기
	public List<Domitory> selectDomitory(String universityCode, String domitoryname);
	
	//전체 건물(동) 리스트 가져오기
	public List<Domitory> selectAllDomitory();
	
	//최근file 올린 idx 가져오기
	public int recentPostIdx();
	
	// 파일 상세보기
	public List<File> fileContent(String idx);
	
	// 게시글 수정하기
	public int boardEdit(Post post);
}