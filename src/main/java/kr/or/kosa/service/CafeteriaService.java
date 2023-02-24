package kr.or.kosa.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.CafeteriaDao;
import kr.or.kosa.dto.Cafeteria;
import kr.or.kosa.security.User;

@Service
public class CafeteriaService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 메뉴 조회
	public List<Cafeteria> selectCafeteria(String universitycode, String domitoryname) {
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		List<Cafeteria> Menulist = cafeteriaDao.selectCafeteria(universitycode, domitoryname);
		return Menulist;
	}

	// 메뉴 추가
	public void insertMenu(String menu, String price) {
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		int menuPrice = Integer.parseInt(price);
		Map<String, Object> params = new HashMap<>();
		params.put("param1", user.getUniversityCode());
		params.put("param2", menu);
		params.put("param3", menuPrice);
		params.put("param4", user.getDomitoryName());
		cafeteriaDao.insertMenu(params);
	}

	// 메뉴 수정
	public void updateMenu(Cafeteria cafeteria) {
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		System.out.println("메뉴 수정 서비스");
		cafeteriaDao.updateMenu(cafeteria);
	}

	// 메뉴 삭제
	public void deleteMenu(int menuidx) {
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		cafeteriaDao.deleteMenu(menuidx);
	}

}
