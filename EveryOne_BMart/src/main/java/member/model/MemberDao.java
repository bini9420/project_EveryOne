package member.model;



import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import document.model.EnterBean;


@Component("MemberDao")
public class MemberDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	private String namespace = "member";
	private String addr = "address";
	private String enter = "enter";
	private String business = "business";
	
	public MemberBean getBmartMember(String id) {
		MemberBean member = null;
		member = sqlSessionTemplate.selectOne(namespace + ".getBmartMember", id);
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
		cnt = sqlSessionTemplate.selectOne(addr+".getAddressCount", id);
		return cnt;
	}

	public void insertAddress(AddressBean address) {
		sqlSessionTemplate.insert(addr+".insertAddress", address);
	}
	
	//����� ��� ��ȸ
	public List<AddressBean> getAddressList(String id) {
		List<AddressBean> alists = new ArrayList<AddressBean>();
		alists = sqlSessionTemplate.selectList(addr+".getAddressList", id);
		return alists;
	}
	
	//����� ��Ͽ��� �ּ� ������ ���� ��ȸ
	public AddressBean getAddressByAnum(String anum) {
		AddressBean addr = new AddressBean();
		addr = sqlSessionTemplate.selectOne(addr+".getAddressByAnum", anum);
		return addr;
	}
	
	//�ּ� ����
	public void updateAddress(AddressBean address) {
		sqlSessionTemplate.update(addr+".updateAddress",address);
	}
	
	//�ּ� ����
	public void deleteAddress(int anum) {
		sqlSessionTemplate.delete(addr+".deleteAddress",anum);
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

}