<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="board" items="${list}">
    <article class="blog_item">   
    
       <div class="blog_item_img">
            <img class="card-img rounded-0" height="350px" src="<%=application.getContextPath() %>/resources/assets/img/blog/dinner.png" alt="">
            <a href="javascript:boardDetails(${board.bno})" class="blog_item_date">
                <h3 style="text-align: center"><fmt:formatDate value="${board.bdate}" pattern="MM월 dd일" /></h3>
                <h2 style="text-align: center"><fmt:formatDate value="${board.bdate}" pattern="HH시 mm뿐" /></h2>
            </a>
         </div>
        <div class="blog_details">
             <a class="d-inline-block" href="javascript:boardDetails(${board.bno})">
                 <h2 class="blog-head" style="color: #2d2d2d;">${board.btitle }</h2>
             </a>
             <p class="blog_list_content">${board.bcontent }</p>
             <ul class="blog-info-link">
                 <li><a><i class="fa fa-user"></i>${board.ccontent }</a></li>
                 <li><a><i class="fa fa-comments"></i> ${board.commentnum }</a></li>
             </ul>
         </div>
       </article>  
       </c:forEach>
       <tr>
         <td colspan="4" style="text-align: center;">
        <a class="btn btn-outline-primary btn-sm" href="javascript:boardList('${pager.murl }',1)">처음</a>
               
               <c:if test="${pager.groupNo > 1}">
               <a class="btn btn-outline-info btn-sm" href="javascript:boardList('${pager.murl }',${pager.startPageNo-1})">이전</a>
               </c:if>
               
               <c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
               	  <c:if test="${pager.pageNo == i}">
               	  <a class="btn btn-danger btn-sm" href="javascript:boardList('${pager.murl }',${i})">${i}</a>
               	  </c:if>
                 
                  <c:if test="${pager.pageNo != i}">
               	  <a class="btn btn-outline-success btn-sm" href="javascript:boardList('${pager.murl }',${i})">${i}</a>
               	  </c:if>
           
               </c:forEach>
               
               <c:if test="${pager.groupNo < pager.totalGroupNo}">
               <a class="btn btn-outline-info btn-sm" href="javascript:boardList('${pager.murl }',${pager.endPageNo+1})">다음</a>
               </c:if>
               <a class="btn btn-outline-primary btn-sm" href="javascript:boardList('${pager.murl }',${pager.totalPageNo})">맨끝</a>
               </td>
        </tr>       
               
       <script type="text/javascript">
          function boardDetails(bno){    
             location.href="blog_details?bno="+bno;   
          }
       </script>