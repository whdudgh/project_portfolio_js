package ezen.porfolio.member.dao;

import java.util.List;

import ezen.porfolio.member.dto.Member;


/**
 *  데이타 베이스 회원 관리 명세
 *  @author 조영호
 *
 */
public interface MemberDao {
	
	public boolean create(Member member);
	public Member findByUser(String id, String passwd);
	public List<Member> findByAll();
}
