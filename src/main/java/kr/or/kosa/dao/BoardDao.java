package kr.or.kosa.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Product;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.dto.RollCall;
import kr.or.kosa.utils.Criteria;

public interface BoardDao {

	// 게시판 이름 (종류)
	public List<Board> categoryList(String universitycode);

	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(@Param("boardname")String boardName, @Param("universitycode")String universitycode, @Param("startpage")int startpage, @Param("pagepernum")int pagepernum);
	
	// 게시판 학교, 이름으로 boardidx 가져오기
	public int selectBoardIdx(Board board) throws ClassNotFoundException, SQLException;
	
	//게시판 전체 글 수 구하기
	public int totalPostCount(@Param("boardname")String boardname, @Param("universitycode")String universitycode);
	
	//글 페이징
	public List<Post> listPage(Criteria cri);
	
	//검색한 글 수 구하기

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
	
	// 건의사항 글 작성(파일첨부 x)
	public int opinionInsert(Post post) throws ClassNotFoundException, SQLException;

	// 파일 글 작성(최신 idx)
	public int fileInsert(File file) throws ClassNotFoundException, SQLException;
	
	// 파일 글 작성
	public int fileWrite(File file) throws ClassNotFoundException, SQLException;
	
	// 거래 글 작성
	public int productInsert(Product product) throws ClassNotFoundException, SQLException;
	
	// 게시글 추천 여부 검사
	public int likeCount(String idx);
	public int likeCheck(String idx, String memberId);
	public void deletePostLike(String idx, String memberId);
	public void updateDislike(String idx);
	public void insertPostLike(String idx, String memberId);
	public void updateLike(String idx);
	
	
	/////////////////////////
	
	//관리자 게시판 카테고리
	public List<Board> getAdminCategory(String universitycode);
	
	//관리자 커스텀 게시판 수정
	public int updateBoardName(@Param("boardname")String boardname, @Param("boardidx")String boardidx);
	
	//관리자 커스텀 게시판 생성
	public int newCustomBoard(@Param("universitycode")String universitycode, @Param("boardname")String boardname);
	
	//관리자 커스텀 게시판 비활성화(삭제)
	public int deleteBoard(String boardidx);
	
	///////////////////////////
	

	//최근file 올린 idx 가져오기
	public int recentPostIdx();
	
	// 파일 상세보기
	public List<File> fileContent(String idx);
	
	// 파일 하나만 상세보기
	public File fileDetailContent(String idx, String fileRealName);
	
	// 파일 상세보기
	public int fileDelete(String idx, String fileName);
	
	// 거래게시글 상세보기
	public Product productContent(String idx);
	
	// 게시글 수정하기
	public int boardEdit(Post post);
}