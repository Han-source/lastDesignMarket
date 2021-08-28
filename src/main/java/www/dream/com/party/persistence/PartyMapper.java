package www.dream.com.party.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import www.dream.com.party.model.ContactPoint;
import www.dream.com.party.model.ContactPointTypeVO;
import www.dream.com.party.model.Member;
import www.dream.com.party.model.Party;
import www.dream.com.party.model.partyOfAuthVO;

/**
 * Mybatis를 활용하여 Party 종류의 객체를 관리하는 인터페이스
 * 
 * @author Park
 *
 */
public interface PartyMapper { // 13. persistence package에 PartyMapper interface 작성
	// 함수 정의 순서 LRCUD
	// 목록 조회
	// @Select("select * from s_party") // 15. @Select를 사용하여, sql에 만들어놓은 s_party
	// Table을 불러내볼것

	/** --------------------------- R ------------------------------- */

	// 모든 회원정보를 List로 받기
	public List<Party> getList(@Param("party") Party member); // 14. List Type으로 Return 받는 목록조회 함수 getList 생성 , Table에
																// 있는 User 정보를 읽어보자.
	// 회원정보로 Contact를 List로 받기

	public List<ContactPoint> getContactListByUserId(@Param("userId") String userId);

	// 비밀번호
	public int setPwd(Party p);

	/** 연락처 관련 정의 영역 **/
	public List<ContactPointTypeVO> getCPTypeList();

	public void joinMember(@Param("party") Member member);

	public int IDDuplicateCheck(@Param("userId") String userId);

	// db에 있는 회원 id로 찾기
	public Party findPartyByUserId(String userId);

	// 이름찾기
	public String findByName(@Param("name") String name);

	/** --------------------------- C ------------------------------- */

	// partyMapperTest.java에 있는 Code. 함수를 만들어 줄 것
	public void insert(@Param("user") Member newBie); // insert(newBie)에 대한 함수를 만들어볼건데 @Param 넣는건 늘 잘해줘야 한다.

	/** --------------------------- U ------------------------------- */

	// 회원 정보 수정 처리
	// 회원 이름 변경 처리
	public void changeUserName(@Param("user") Member newBie);

	// 회원 비밀번호 변경 처리
	public void changeUserPwd(@Param("user") Member newBie);
	
	// 회원 주소 변경 처리
	public void changeUserAddr(@Param("user") Member newBie, @Param("cp") ContactPoint cp);

	// 회원 핸드폰번호 변경 처리
	public void changeUserMobileNum(@Param("user") Member newBie, @Param("cp") ContactPoint cp);

	// 회원 집전화번호 변경 처리
	public void changeUserPhoneNum(@Param("user") Member newBie, @Param("cp") ContactPoint cp);

	
	// 권한 처리 관련 영역
	public partyOfAuthVO getMemberType();

	// 포인트 적립 처리
	public void EarnPoints(@Param("points") int points, @Param("userId") String userId);
	/** --------------------------- D ------------------------------- */

	// 회원 정보 삭제 처리
	public void deleteId(@Param("party") Party party);

}