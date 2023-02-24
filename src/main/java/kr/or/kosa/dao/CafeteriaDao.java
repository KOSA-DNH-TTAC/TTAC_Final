package kr.or.kosa.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.kosa.dto.Cafeteria;

public interface CafeteriaDao {

	// 메뉴 리스트
	public List<Cafeteria> selectCafeteria(@Param("universitycode") String universitycode,
			@Param("domitoryname") String domitoryname);

	// 메뉴 추가
	public void insertMenu(Map<String, Object> params);

	// 메뉴 수정
	public void updateMenu(Cafeteria cafeteria);

	// 메뉴 삭제
	public void deleteMenu(@Param("menuidx") int menuindex);
}