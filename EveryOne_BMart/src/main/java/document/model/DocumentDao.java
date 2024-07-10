package document.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;
import utility.PagingPlus;

@Component
public class DocumentDao {

	String namespace = "document.Document";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public DocumentDao() {
		System.out.println("DocumentDao");
	}//생성자

	public List<DocumentBean> getAllDocument(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllDocument", map, rowBounds);
		
		System.out.println("Dao에서 list개수: " + lists.size());
		return lists;
	}//getAllDocument

	public int getTotalCount(Map<String,String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		
		System.out.println("Dao에서 totalCount: " + totalCount);
		return totalCount;
	}//getTotalCount

	public int getWaitDocument() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getWaitDocument");
		
		return count;
	}//getWaitDocument

	public int getTempDocument() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getTempDocument");
		
		return count;
	}//getTemporarilyDocument

	public int getReturnDocument() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getReturnDocument");
		
		return count;
	}//getReturnDocument

	public int getApproveDocument() {
		int count = -100;
		count = sqlSessionTemplate.selectOne(namespace + ".getApproveDocument");
		
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
		lists = sqlSessionTemplate.selectList(namespace + ".getAllWaitDocument");
		
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
		System.out.println("Dao에서 lists 개수: " + lists.size());
		
		return lists;
	}//getAllApproveDocument

	public int getApproveCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getApproveCount", map);
		System.out.println("Dao에서 count: " + count);
		
		return count;
	}//getApproveCount

	public List<DocumentBean> getWaitDocumentList() {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getWaitDocumentList");
		
		return lists;
	}//getWaitDocumentList

	public List<DocumentBean> getApproveDocumentList() {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getApproveDocumentList");
		
		return lists;
	}//getApproveDocumentList

	public List<DocumentBean> getTempDocumentList() {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getTempDocumentList");
		
		return lists;
	}//getTempDocumentList

	public List<DocumentBean> getReturnDocumentList() {
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getReturnDocumentList");
		
		return lists;
	}//getReturnDocumentList



}
