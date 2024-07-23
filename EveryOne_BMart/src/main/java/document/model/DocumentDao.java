package document.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import utility.Paging;
import utility.PagingPlus;

@Repository("documentDao")
public class DocumentDao {

	String namespace = "document.Document"; 
	 
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	public List<DocumentBean> getAllDocument(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllDocument", map, rowBounds);
		
		//System.out.println("Dao���� list����: " + lists.size());
		return lists;
	}//getAllDocument

	public int getTotalCount(Map<String,String> map) { 
		int cnt = -100;
		cnt = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		
		System.out.println("Dao���� totalCount: " + cnt);
		return cnt;
	}//getTotalCount

	public int getWaitDocument(String id) {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitDocument", id);
		
		return count;
	}//getWaitDocument

	public int getTempDocument(String id) {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getTempDocument", id);
		
		return count;
	}//getTemporarilyDocument

	public int getReturnDocument(String id) {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getReturnDocument", id);
		
		return count;
	}//getReturnDocument

	public int getApproveDocument(String id) {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getApproveDocument", id);
		
		return count;
	}//getApproveDocument

	public DocumentBean getDocumentByDnum(String dnum) {
		DocumentBean document = null;
		document = sqlSessionTemplate.selectOne(namespace + ".getDocumentByDnum", dnum);
		
		return document;
	}//getDocumentByDnum

	public List<DocumentBean> getAllWaitDocument(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllWaitDocument", map, rowbounds);
		
		return lists;
	}//getAllWaitDocument
	
	public int getWaitCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitCount", map);
		
		return count;
	}//getWaitCount

	public List<DocumentBean> getAllTempDocument(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllTempDocument", map, rowbounds);
		
		return lists;
	}//getAllTempDocument
	

	public int getTempCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getTempCount", map);
		
		return count;
	}//getTempCount

	public List<DocumentBean> getAllReturnDocument(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllReturnDocument", map, rowbounds);
		
		return lists;
	}//getAllReturnDocument
	
	public int getReturnCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getReturnCount", map);
		
		return count;
	}//getReturnCount

	public List<DocumentBean> getAllApproveDocument(Map<String, String> map, Paging pageInfo) {
		RowBounds rowbounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit());

		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllApproveDocument", map, rowbounds);
		System.out.println("Dao���� lists ����: " + lists.size());
		
		return lists;
	}//getAllApproveDocument

	public int getApproveCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getApproveCount", map);
		System.out.println("Dao���� count: " + count);
		
		return count;
	}//getApproveCount

	public List<DocumentBean> getWaitDocumentList(String id) {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getWaitDocumentList", id);
		
		return lists;
	}//getWaitDocumentList

	public List<DocumentBean> getApproveDocumentList(String id) {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getApproveDocumentList", id);
		
		return lists;
	}//getApproveDocumentList

	public List<DocumentBean> getTempDocumentList(String id) {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getTempDocumentList", id);
		
		return lists;
	}//getTempDocumentList

	public List<DocumentBean> getReturnDocumentList(String id) {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getReturnDocumentList", id);
		
		return lists;
	}//getReturnDocumentList
	
	public int insertDocument(DocumentBean document) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".insertDocument", document); 
		  
		return cnt;
	}//insertProduct

	public int whatNumber(String category) {
		int maxNum = 0;
		if(sqlSessionTemplate.selectOne(namespace + ".whatNumber", category) != null) {
			maxNum = sqlSessionTemplate.selectOne(namespace + ".whatNumber", category); 
		}
		
		return maxNum; 
	}//whatNumber

	public int tempSaveDocument(DocumentBean document) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".tempSaveDocument", document); 
		  
		return cnt;
	}//tempSaveDocument

	public int updateDocument(DocumentBean document) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".updateDocument", document);
		System.out.println("cnt:" + cnt);
		
		return cnt;
	}//updateDocument

	public void deleteDocument(String dnum) {
		sqlSessionTemplate.delete(namespace + ".deleteDocument", dnum);
	}//deleteDocument

	
	//�� �����ڿ� ������ > ��ü������
	public List<DocumentBean> getAllDocumentForAdmin(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllDocumentForAdmin", map, rowBounds);
		
		return lists;
	}//getAllDocumentForAdmin

	
	//�� �����ڿ� ���� ��ü ���ڵ��� ���� ���ϱ�
	public int getTotalCountForAdmin(Map<String, String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getTotalCountForAdmin", map);
		
		return totalCount;
	}//getTotalCountForAdmin

	
	//�� �����ڿ� ���� �󼼺��⿡�� ���� ��ư Ŭ���� ���� Į�� 0->1�� ����, ���� ���� 0->1�� ����
	public void updateApproval(String dnum) {
		sqlSessionTemplate.update(namespace + ".updateApproval", dnum);
	}//updateApproval

	
	//�� �����ڿ� ���� �󼼺��⿡�� �ݷ� ��ư Ŭ���� �ݷ�����(reason Į��) ����
	public void updateReason(Map<String, String> map) {
		sqlSessionTemplate.update(namespace + ".updateReason", map);
	}//updateReason

	
	//�� �����ڿ� ������ > ��������
	public List<DocumentBean> getAllWaitDocumentForAdmin(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllWaitDocumentForAdmin", map, rowBounds);
		
		return lists;
	}//getAllWaitDocumentForAdmin

	
	//�� �����ڿ� �����⹮�� ���� ���ϱ�
	public int getWaitTotalCountForAdmin(Map<String, String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getWaitTotalCountForAdmin", map);
		
		return totalCount;
	}//getTotalCountForAdmin
	
	
	//�� �����ڿ� ������ > ����Ϸ���
	public List<DocumentBean> getAllCompleteDocumentForAdmin(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllCompleteDocumentForAdmin", map, rowBounds);
		
		return lists;
	}//getAllCompleteDocumentForAdmin

	
	//�� �����ڿ� ����ϷṮ�� ���� ���ϱ�
	public int getCompleteTotalCountForAdmin(Map<String, String> map) {
		int totalCount = -100;  
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getCompleteTotalCountForAdmin", map);
		
		return totalCount;
	}//getTotalCountForAdmin

	//�� ������û ������ �ش� ���̵� �ִ��� Ȯ��
	public int checkProduct(String id) {
		int cnt = -1; 
		cnt = sqlSessionTemplate.selectOne(namespace + ".checkProduct", id);
		
		return cnt;
	}//checkProduct

	
	public int getWaitDocumentForAdmin() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitDocumentForAdmin");

		return count;
	}//getWaitDocumentForAdmin

	public int requestDocument(DocumentBean document) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".requestDocument", document);
		
		return cnt;
	}//requestDocument

	public int requestDocumentByDnum(String dnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.update(namespace + ".requestDocumentByDnum", dnum);
		
		return cnt;
	}//requestDocumentByDnum

	//�� ������ Main ȭ�鿡 ���� ���Ǽ� ǥ��
	public int getWaitCountForAdmin() {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitCountForAdmin");
		
		return count;
	}//getWaitCountForAdmin

	public String getPrdname(String dnum) {
		String pname = null;
		pname = sqlSessionTemplate.selectOne(namespace + ".getPrdname", dnum);
		
		return pname;
	}//getPrdname

	//�� ������ > �����û ���ν� Product ���̺��� adĮ�� 0->1�� ����
	public void updateProductAd(String pname) {
		sqlSessionTemplate.update(namespace + ".updateProductAd", pname);
	}//updateProductAd

	//�� ������ > ������û ���ν� business ���̺��� ������ id(writer) ��ȸ
	public String getWriter(String dnum) {
		String writer = null;
		writer = sqlSessionTemplate.selectOne(namespace + ".getWriter", dnum);
		
		return writer; 
	}//getWriter

	//�� ������ > ������û ���ν� business ���̺��� id�� �������� ���ڵ� ����
	public void deleteBusinessId(String writer) {
		sqlSessionTemplate.delete(namespace + ".deleteBusinessId", writer);
	}//deleteBusinessId

	public String getPrdcategory(String dnum) {
		String prdCategory = null;
		prdCategory = sqlSessionTemplate.selectOne(namespace + ".getPrdcategory", dnum);
		
		return prdCategory;
	}//getPrdcategory

	public int checkPrdcategory(String prdcategory) {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".checkPrdcategory", prdcategory);
		
		return count;
	}//checkPrdcategory

	public void insertCategory(String prdcategory) {
		sqlSessionTemplate.insert(namespace + ".insertCategory", prdcategory);
	}//insertCategory

	public int getPrdcategoryById(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getPrdcategoryById", map);
		
		return count;
	}//getPrdcategoryById

}
