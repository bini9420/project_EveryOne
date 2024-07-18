
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/common.jsp"%>
<%@include file="../admin/a_top.jsp"%>




        <!-- Begin Page Content -->
                <div class="container-fluid">
     	<!-- DataTales Example -->
     		<div class="col-xl-9 col-lg-9 mx-auto">
                    <div class="card shadow mb-4" style="min-height: 600px;">
                        <div class="card-header py-3">
                            <h5 class="m-0 font-weight-bold text-primary title">개인정보 수정 </h5>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                   
                           <form:form commandName="adminLists" action="a_profileUpdate.mb" method="post" enctype="multipart/form-data">
                                <table class="table table-bordered" id="dataTable">
                                    <thead>
                                        <tr>
                                            <th>사진</th>
                                            <td><% String img = request.getContextPath()+"/resources/uploadImage/"; %>
                                            	<img src="<%=img%>${adminLists.image}" style="width:100" class="mt-1"/><br>
												<!-- 새로 upload -->
												<input type="file" name="upload" class="my-2">
												<input type="hidden" name="upload2" value="${adminLists.image}"></td>
										</tr>
										<tr>
                                            <th>아이디</th>
                                             <td> 
                                            	<input type="text" value="${adminLists.id}" disabled>
												<input type="hidden" name="id" value="${adminLists.id}">
											</td>
										</tr>
										<tr>
                                            <th>이름</th>
                                             <td> 
                                            	<input type="text" name="name" value="${adminLists.name}">
											</td>
										</tr>
										<tr>
                                            <th>비밀번호</th>
                                             <td> 
                                            	<input type="text" name="password" value="${adminLists.password}">
                                            </td>
											
										</tr>
										<tr>
                                            <th>전화번호</th>
											<td>
												<% String[] phone = {"010","011"}; %>
													<select name="phone1">
														<option value="">선택 안 함
														<c:forEach var="p" items="<%=phone%>">
															<option value="${p}" <c:if test="${p eq adminLists.phone1}">selected</c:if>>${p}
														</c:forEach>
													</select> - 
													<input type="text" name="phone2" value="${adminLists.phone2}" style="width: 70"> - 
													<input type="text" name="phone3" value="${adminLists.phone3}" style="width: 70">
											</td>
										</tr>
										<tr>
                                            <th>이메일주소</th>
                                        	<td>
                                        		<input type="text" name="email1" value="${adminLists.email1}" style="width: 150"> @ 
												<% String[] email = {"naver.com","gmail.com","daum.net","hanmail.net"}; %>
												<select name="email2">
													<option value="">선택 안 함
													<c:forEach var="e" items="<%=email%>">
														<option value="${e}" <c:if test="${e eq adminLists.email2}">selected</c:if>>${e}
													</c:forEach>
												</select>
                                        	</td>
                                        </tr>
                                    </thead>
                                </table>
                              <div class="profilebtn">
                             	<input type="submit" value="수정하기" class="btn btn-outline-primary mt-2 center">
                             </div>
                          </form:form>
                         </div>    
                       </div>   
                     </div>    
                   </div>   
                 </div>         
<%@include file="../admin/a_bottom.jsp" %>                               