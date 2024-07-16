package member.model;



import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.AddressBean;
import model.EnterBean;
import model.MemberBean;
import model.ReviewBean;
import model.ReviewDetailBean;
import utility.ReviewPaging;


@Component("MemberDao")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "member";
	private String address = "address";
	private String enter = "enter";
	private String business = "business";
	private String review = "review";
	private String reviewDetail = "reviewDetail";
	
	public MemberBean getMember(String id) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace + ".getMember", id);
		return member;
	}

	public void updateMember(MemberBean member) {
		sqlSessionTemplate.update(namespace+".updateMember", member);
	}

	public void updateMemberImage(MemberBean member) {
		sqlSessionTemplate.update(namespace+".updateMemberImage", member);
	}

	public int getAddressCount(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(address+".getAddressCount", id);
		return cnt;
	}

	public void insertAddress(AddressBean addr) {
		sqlSessionTemplate.insert(address+".insertAddress", addr);
	}
	
	//배송지 목록 조회
	public List<AddressBean> getAddressList(String id) {
		List<AddressBean> alists = new ArrayList<AddressBean>();
		alists = sqlSessionTemplate.selectList(address+".getAddressList", id);
		return alists;
	}
	
	//배송지 목록에서 주소 수정을 위한 조회
	public AddressBean getAddressByAnum(String anum) {
		AddressBean addr = new AddressBean();
		addr = sqlSessionTemplate.selectOne(address+".getAddressByAnum", anum);
		return addr;
	}
	
	//주소 수정
	public void updateAddress(AddressBean addr) {
		sqlSessionTemplate.update(address+".updateAddress", addr);
	}
	
	//주소 삭제
	public void deleteAddress(int anum) {
		sqlSessionTemplate.delete(address+".deleteAddress",anum);
	}

	public EnterBean getEnter(String id) {
		EnterBean eb = null;
		eb = sqlSessionTemplate.selectOne(enter+".getEnter",id);
		return eb;
	}
	
	//승인 완료돼서 사업자 테이블에 있는지 확인
	public int checkBusiness(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(business+".checkBusiness", id);
		return cnt;
	}

	public int getReviewCountById(String id) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(reviewDetail+".getReviewCountById", id);
		System.out.println("reviewcount: "+count);
		return count;
		
	}

	public List<ReviewDetailBean> getReviewById(String id, ReviewPaging pageInfo) {
		RowBounds rb = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<ReviewDetailBean> rdetail = new ArrayList<ReviewDetailBean>();
		rdetail = sqlSessionTemplate.selectList(reviewDetail+".getReviewById", id, rb);
		return rdetail;
	}

	public ReviewDetailBean getReviewDetailByRnum(String rnum) {
		ReviewDetailBean rdb = null;
		rdb = sqlSessionTemplate.selectOne(reviewDetail+".getReviewDetailByRnum",rnum);
		return rdb;
	}
	
	
	//리뷰 수정
	public void updateReview(ReviewBean rb) {
		sqlSessionTemplate.update(review+".updateReview",rb);
	}
	
	//리뷰 삭제
	public void deleteReview(int rnum) {
		sqlSessionTemplate.delete(review+".deleteReview", rnum);
	}

	//아이디 중복체크
	public int checkId(String id) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".checkId", id);
		return cnt;
	}

	public void insertMember(MemberBean member) {
		sqlSessionTemplate.insert(namespace+".insertMember", member);
	}
	
	//아이디 찾기
	public MemberBean getMemberId(MemberBean member) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(namespace+".getMemberId", member);
		return mb;
	}

	//비밀번호 찾기
	public MemberBean getMemberPw(MemberBean member) {
		MemberBean mb = null;
		mb = sqlSessionTemplate.selectOne(namespace+".getMemberPw", member);
		return mb;
	}

	//kakao 정보 저장
	public void kakaoinsert(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".kakaoInsert",mb);
	}

	// 카카오 정보 확인
	public MemberBean findkakao(MemberBean mb) {
		System.out.println("find id: "+mb.getId());
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace+".findKakao", mb);
		return member;
	}

	//네이버 정보 확인
	public MemberBean findnaver(MemberBean mb) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace+".findnaver", mb);
		return member;
	}

	//네이버 정보 저장
	public void naverinsert(MemberBean mb) {
		sqlSessionTemplate.insert(namespace+".naverinsert",mb);
	}

}