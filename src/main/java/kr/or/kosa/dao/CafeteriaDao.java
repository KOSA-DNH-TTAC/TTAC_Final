package kr.or.kosa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Cafeteria;

public interface CafeteriaDao {
	
	//메뉴 리스트 받아오기
	public List<Cafeteria> selectCafeteria(@Param("universitycode")String universitycode, @Param("domitoryname")String domitoryname);
	//메뉴 인서트
	public int insertmenu(@Param("universitycode")String universitycode, @Param("menu")String menu, @Param("menuPrice")String menuPrice, @Param("domitoryname")String domitoryname);
	//메뉴삭제
	public int deleteMenu(@Param("menuidx")int menuindex);
}