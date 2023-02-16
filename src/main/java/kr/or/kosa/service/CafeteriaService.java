package kr.or.kosa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.kosa.dao.CafeteriaDao;
import kr.or.kosa.dto.Cafeteria;

@Service
public class CafeteriaService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

//  DB에 메뉴 인서트
	public List<Cafeteria> insertmenu(String universityCode, String menuname, String charge, String domitoryname) {
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		System.out.println("메뉴 인서트 서비스 옴?");
		int  row = cafeteriaDao.insertmenu(universityCode, menuname, charge, domitoryname);
		
		if( row >=1) {
			System.out.println("성공");
		}
		System.out.println("row : " + row);
		//연간일정 목록 불러오기
		List<Cafeteria> list = cafeteriaDao.selectCafeteria(universityCode,domitoryname);
		
		return list;
	}
	
	//메뉴목록 조회
	public List<Cafeteria> selectCafeteria(String universitycode, String domitoryname) {
		
		System.out.println("메뉴 셀렉트 서비스 옴? 1");
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		System.out.println("메뉴 셀렉트 서비스 옴?");
		List<Cafeteria> Menulist = cafeteriaDao.selectCafeteria(universitycode, domitoryname);
		
		System.out.println("Menulist : " + Menulist);
		
		return Menulist;
	}
	
	//외박 수정(update) : 사감이 승인을 했을 경우
	public int deleteMenu(int idx) {
		int result = 0;
		
		CafeteriaDao cafeteriaDao = sqlSession.getMapper(CafeteriaDao.class);
		result = cafeteriaDao.deleteMenu(idx);
		if( result >=1) {
			System.out.println("성공");
		}
		System.out.println("result : " + result);
		
		return result;
	}
	
}
