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

	public List<DocumentBean> getAllDocument(Map<String, String> map, PagingPlus pageplus) {
		RowBounds rowBounds = new RowBounds(pageplus.getOffset(), pageplus.getLimit());
		
		List<DocumentBean> lists = new ArrayList<DocumentBean>();
		lists = sqlSessionTemplate.selectList(namespace + ".getAllDocument", map, rowBounds);
		
		//System.out.println("Dao에서 list개수: " + lists.size());
		return lists;
	}//getAllDocument

	public int getTotalCount(Map<String,String> map) {
		int totalCount = -100;
		totalCount = sqlSessionTemplate.selectOne(namespace + ".getTotalCount", map);
		
		//System.out.println("Dao에서 totalCount: " + totalCount);
		return totalCount;
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
		System.out.println("Dao에서 lists 개수: " + lists.size());
		
		return lists;
	}//getAllApproveDocument

	public int getApproveCount(Map<String, String> map) {
		int count = -1;
		count = sqlSessionTemplate.selectOne(namespace + ".getApproveCount", map);
		System.out.println("Dao에서 count: " + count);
		
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
		
		return cnt;
	}//updateDocument

	public void deleteDocument(String dnum) {
		sqlSessionTemplate.delete(namespace + ".deleteDocument", dnum);
	}//deleteDocument


}
