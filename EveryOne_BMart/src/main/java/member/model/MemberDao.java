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

	public void insertAddress(AddressBean address) {
		sqlSessionTemplate.insert(address+".insertAddress", address);
	}
	
	//����� ��� ��ȸ
	public List<AddressBean> getAddressList(String id) {
		List<AddressBean> alists = new ArrayList<AddressBean>();
		alists = sqlSessionTemplate.selectList(address+".getAddressList", id);
		return alists;
	}
	
	//����� ��Ͽ��� �ּ� ������ ���� ��ȸ
	public AddressBean getAddressByAnum(String anum) {
		AddressBean addr = new AddressBean();
		addr = sqlSessionTemplate.selectOne(address+".getAddressByAnum", anum);
		return addr;
	}
	
	//�ּ� ����
	public void updateAddress(AddressBean address) {
		sqlSessionTemplate.update(address+".updateAddress",address);
	}
	
	//�ּ� ����
	public void deleteAddress(int anum) {
		sqlSessionTemplate.delete(address+".deleteAddress",anum);
	}

	public EnterBean getEnter(String id) {
		EnterBean eb = null;
		eb = sqlSessionTemplate.selectOne(enter+".getEnter",id);
		return eb;
	}
	
	//���� �Ϸ�ż� ����� ���̺� �ִ��� Ȯ��
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
	
	
	//���� ����
	public void updateReview(ReviewBean rb) {
		sqlSessionTemplate.update(review+".updateReview",rb);
	}
	
	//���� ����
	public void deleteReview(int rnum) {
		sqlSessionTemplate.delete(review+".deleteReview", rnum);
	}

}