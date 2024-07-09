
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp" %>    
<%@include file="../admin/a_top.jsp"%>



 <form action="memberList.mb" method="post">


<!-- 
                    Topbar Search
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" name="keyword" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> -->

<!-- 
<select name="whatColumn">
			<option value="all">전체검색 
			<option value="pcategory">카테고리
			<option value="pname">상품명
			<option value="pnum">상품번호
			<option value="price">가격
			<option value="stock">재고량
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
	</form>
 -->

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">회원목록</h1>
                   

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Member List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>회원아이디</th>
                                            <th>회원이름</th>
                                            <th>전화번호</th>
                                            <th>이메일주소</th>
                                            <th>집주소</th>
                                          
                                        </tr>
                                    </thead>
                                    
                                   <c:forEach var="mb" items="${memberLists }">
                                   
                                   
                                   
                                   
                                
                                    <tfoot>
                                        <tr>
                                            <th>${mb.id }</th>
                                            <th>${mb.name }</th>
                                            <th>${mb.phone }</th>
                                            <th>${mb.email }</th>
                                            <th>${mb.address }${mb.addr1 }${mb.addr2 }</th>
                                            
                                        </tr>
                                    </tfoot>
                                    
                                      
           </c:forEach> 
	
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

           

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

<center>${pageInfo.pagingHtml }</center>
</form>

