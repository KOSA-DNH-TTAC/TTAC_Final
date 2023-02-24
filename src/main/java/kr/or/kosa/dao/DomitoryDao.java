package kr.or.kosa.dao;

import java.util.List;

import kr.or.kosa.dto.Domitory;
import kr.or.kosa.dto.RollCall;

public interface DomitoryDao {
	//기숙사 DB 넣기
	public int insertDomitory(String universitycode, String domitoryname, String domitoryfloor);
	
	//점호/////////////////////////////////////
	// 점호하기
	public Domitory eveningCall(String domitoryname);
		
	//점호데이터 넣기
	public int eveningCallInsert(String memberId, String universitycode,String domitiryName);
		
	//점호 데이터 중복 체킹
	public RollCall eveningCallCompare(String memberId, String universitycode, String date);
	
	//건물(동) 리스트 가져오기
	public List<Domitory> selectDomitory(String universityCode, String domitoryname);
		
	//전체 건물(동) 리스트 가져오기
	public List<Domitory> selectAllDomitory();
}
