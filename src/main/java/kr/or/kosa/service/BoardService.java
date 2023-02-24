package kr.or.kosa.service;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.kosa.aws.AwsS3;
import kr.or.kosa.dao.BoardDao;
import kr.or.kosa.dto.Board;
import kr.or.kosa.dto.File;
import kr.or.kosa.dto.Post;
import kr.or.kosa.dto.Product;
import kr.or.kosa.dto.Reply;
import kr.or.kosa.security.User;
import kr.or.kosa.utils.Criteria;

@Service
public class BoardService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 게시판 글 전체 개수(페이징을 위한)
	public int totalCount(String boardname) {
		BoardDao boarddao = sqlSession.getMapper(BoardDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		return boarddao.totalPostCount(boardname, user.getUniversityCode());
	}

	// 게시판 리스트
	public List<Board> categoryList() {

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();

		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Board> categoryList = boardDao.categoryList(universityCode);
		return categoryList;
	}

	// 기본 제공 게시판 글 목록
	public List<Post> allBoardList(String allBoard, Criteria cri) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();

		List<Post> allBoardList = boardDao.allBoardList(allBoard, universityCode, cri.getPageStart(),
				cri.getPerPageNum());
		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Post p : allBoardList) {
			String writedate = p.getWriteDate().substring(0, 10);
			if (formatNowDate.equals(writedate)) {
				p.setWriteDate(p.getWriteDate().substring(11, 16));
			} else {
				p.setWriteDate(writedate.substring(5));
			}
		}
		return allBoardList;
	}

	// 커스텀 생성 게시판 목록
	public List<Post> customBoardList(String boardName) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);

		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String universityCode = user.getUniversityCode();

		List<Post> customBoardList = boardDao.customBoardList(boardName, universityCode);

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Post p : customBoardList) {
			String writedate = p.getWriteDate().substring(0, 10);
			if (formatNowDate.equals(writedate)) {
				p.setWriteDate(p.getWriteDate().substring(11, 16));
			} else {
				p.setWriteDate(writedate.substring(5));
			}
		}
		return customBoardList;
	}
	//

	// 게시글 상세보기
	public List<Post> boardContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Post> boardContent = boardDao.boardContent(idx);
		boardContent.get(0).setWriteDate(boardContent.get(0).getWriteDate().substring(2, 16));

		return boardContent;
	}

	public int selectBoardIdx(Board board) throws ClassNotFoundException, SQLException {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.selectBoardIdx(board);
	}

	// 게시글 상세보기 (객체로)
	public Post boardContentDTO(int idx) throws ClassNotFoundException, SQLException {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		Post post = boardDao.boardContentDTO(idx);
		return post;
	}

	// 파일 상세보기
	public List<File> fileContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<File> fileContent = boardDao.fileContent(idx);
		return fileContent;
	}

	// 파일 삭제하기
	@Transactional(rollbackFor = Exception.class)
	public int fileDelete(String idx, String fileName) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		AwsS3 awsS3 = AwsS3.getInstance();
		File file = new File();

		file = boardDao.fileDetailContent(idx, fileName);
		awsS3.delete(file.getFileName());

		return boardDao.fileDelete(idx, fileName);
	}

	// 거래 게시판 상세보기
	public Product productContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.productContent(idx);
	}

	// 댓글 목록 보기
	public List<Reply> replyContent(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Reply> replyContent = boardDao.replyContent(idx);

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Reply r : replyContent) {
			String replyDate = r.getReplyDate().substring(0, 10);
			if (formatNowDate.equals(replyDate)) {
				r.setReplyDate(r.getReplyDate().substring(11, 16));
			} else {
				r.setReplyDate(replyDate.substring(5));
			}
		}
		return replyContent;
	}

	// 대댓글 목록 보기
	public List<Reply> reReplyContent(String replyIdx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		List<Reply> reReplyContent = boardDao.reReplyContent(replyIdx);

		Date nowDate = new Date();

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		String formatNowDate = simpleDateFormat.format(nowDate);

		for (Reply r : reReplyContent) {
			String replyDate = r.getReplyDate().substring(0, 10);
			if (formatNowDate.equals(replyDate)) {
				r.setReplyDate(r.getReplyDate().substring(11, 16));
			} else {
				r.setReplyDate(replyDate.substring(5));
			}
		}
		return reReplyContent;
	}

	// 거래게시판 글쓰기
	public int productWrite(Product product) {
		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.productInsert(product);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 자유게시판 글쓰기
	public int freeBoardWrite(Post post) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.boardInsert(post);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 건의사항 글쓰기
	public int opinionWrite(Post post) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.opinionInsert(post);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 파일첨부 글쓰기 (가장 최근글 idx 가져온걸로 글쓰는거)
	public int fileWrite(File file, int idx) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.fileWrite(file);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 파일첨부 글쓰기 (가장 최근글 idx 가져온걸로 글쓰는거)
	public int fileWrite(File file) {

		int result = 0;

		try {
			BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
			result = boardDao.fileInsert(file);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 추천 여부 검사, DB 업데이트, 추천 개수 출력
	// 추천 여부 카운트 > 개수에 따라 RUD > 업데이트된 추천 개수 출력
	@Transactional(rollbackFor = Exception.class)
	public int likeCheck(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String likeMemberId = user.getMemberId();

		int likeCheck = boardDao.likeCheck(idx, likeMemberId);

		if (likeCheck == 0) {
			boardDao.insertPostLike(idx, likeMemberId);
			boardDao.updateLike(idx);
			int likeCount = boardDao.likeCount(idx);
			return likeCount;
		} else {
			boardDao.deletePostLike(idx, likeMemberId);
			boardDao.updateDislike(idx);
			int likeCount = boardDao.likeCount(idx);
			return likeCount;
		}
	}

	// 추천 아이콘 ajax
	public int myPostLikeCheck(String idx) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String likeMemberId = user.getMemberId();
		int myPostLikeCheck = boardDao.likeCheck(idx, likeMemberId);
		return myPostLikeCheck;
	}

	// 최근 글 idx가져오기
	public int recentPostIdx() {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		return boardDao.recentPostIdx();
	}

	// 게시글 수정 or 삭제
	public int boardContentEdit(Post post) {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);
		int result = boardDao.boardEdit(post);

		return result;
	}

	// 게시글 수정 or 삭제 (파일 포함)
	@Transactional(rollbackFor = Exception.class)
	public int boardContentEdit(Post post, List<MultipartFile> files) throws IOException {
		BoardDao boardDao = sqlSession.getMapper(BoardDao.class);

		int idx = 0;
		String fileUrl = "";

		// 글부터 수정
		int result = boardDao.boardEdit(post);

		// 파일 있는지 없는지
		if (files != null) {
			MultipartFile multiFile = files.get(0);
			if (multiFile.getSize() != 0) {
				AwsS3 awsS3 = AwsS3.getInstance();

				idx = post.getIdx();

				for (MultipartFile multipartfile : files) {

					UUID uuid = UUID.randomUUID();
					File fileOne = new File();

					String fileName = post.getUniversityCode() + "/" + "board" + "/" + idx + "/" + uuid.toString() + "_"
							+ multipartfile.getOriginalFilename();
					fileUrl = "https://d37qu1avlirbuh.cloudfront.net/" + fileName;
					fileOne.setIdx(idx);
					fileOne.setFileUrl(fileUrl);
					fileOne.setFileName(fileName);
					fileOne.setFileRealName(multipartfile.getOriginalFilename());
					fileOne.setFileSize(multipartfile.getSize());

					this.fileWrite(fileOne, idx);

					awsS3.upload(multipartfile, fileName);
				}

			}
		}

		return result;
	}

	// 파일첨부 글 쓰기
	@Transactional(rollbackFor = Exception.class)
	public int postListInsert(Post post, List<MultipartFile> files) throws IOException {

		int idx = 0;
		int result = 0;
		String route = "";
		String url = "";
		String fileUrl = "";
		MultipartFile multiFile = files.get(0);

		result = this.freeBoardWrite(post);

		if (multiFile.getSize() != 0) {
			AwsS3 awsS3 = AwsS3.getInstance();

			idx = this.recentPostIdx();

			for (MultipartFile multipartfile : files) {

				UUID uuid = UUID.randomUUID();
				File fileOne = new File();

				String fileName = post.getUniversityCode() + "/" + "board" + "/" + idx + "/" + uuid.toString() + "_"
						+ multipartfile.getOriginalFilename();

				fileUrl = "https://d37qu1avlirbuh.cloudfront.net/" + fileName;
				fileOne.setFileUrl(fileUrl);
				fileOne.setFileName(fileName);
				fileOne.setFileRealName(multipartfile.getOriginalFilename());
				fileOne.setFileSize(multipartfile.getSize());

				this.fileWrite(fileOne);

				awsS3.upload(multipartfile, fileName);
			}

		}

		return result;
	}

	// 거래게시판 글쓰기
	@Transactional(rollbackFor = Exception.class)
	public int postListInsert(Post postDTO, Product productDTO, List<File> fileDTO, List<MultipartFile> files)
			throws IOException {

		int idx = 0;
		int result = 0;
		String route = "";
		String url = "";
		String fileUrl = "";
		MultipartFile multiFile = files.get(0);

		result = this.freeBoardWrite(postDTO);

		if (multiFile.getSize() != 0) {
			AwsS3 awsS3 = AwsS3.getInstance();
			idx = this.recentPostIdx();

			result = this.productWrite(productDTO);

			for (MultipartFile multipartfile : files) {
				route = postDTO.getUniversityCode() + "/" + "board" + "/" + idx + "/"
						+ multipartfile.getOriginalFilename();
				awsS3.upload(multipartfile, route);
			}

			for (File file : fileDTO) {
				url = postDTO.getUniversityCode() + "/" + "board" + "/" + idx + "/" + file.getFileRealName();
				fileUrl = "https://d37qu1avlirbuh.cloudfront.net/" + url;
				file.setFileUrl(fileUrl);
				this.fileWrite(file);
			}
		}

		return result;
	}

}
