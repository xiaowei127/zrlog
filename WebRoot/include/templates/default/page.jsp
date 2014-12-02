<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="header.jsp"></jsp:include>
<c:choose>
	<c:when test="${empty requestScope.data}">
		<c:set var="pageLevel" value="1" scope="request"/>
		<div id="main">
		<section id="primary">
			<div id="content" role="main">
				<article id="post-0" class="post no-results not-found">
					<header class="entry-header">
						<h1 class="entry-title">未找到</h1>
					</header>
					<!-- .entry-header -->
	
					<div class="entry-content">
						<p>抱歉，没有符合您搜索条件的结果。请换其它关键词再试。</p>
						<form method="post" id="searchform" action="${rurl }post/search">
							<label for="s" class="assistive-text">搜索</label> <input
								type="text" class="field" name="key" id="s" placeholder="搜索" />
							<input type="submit" class="submit" name="submit"
								id="searchsubmit" value="搜索" />
						</form>
					</div>
					<!-- .entry-content -->
				</article>
				<!-- #post-0 -->
	
	
			</div>
			<!-- #content -->
		</section>
		<!-- #primary -->
	</c:when>
	<c:otherwise>
		<c:set var="pageLevel" value="2" scope="request"/>
		     <div class="main clearfloat">
      
      
      
      <section>
      <!--[if lt IE 9]>
      <div class="tips not-ie" id="tipsWrap">
        <span class="close" id="clostBtn" title="Close">关闭</span>
        <div class="tips-content">
          <span class="notice">为了您有更好的浏览体验，请升级使用以下浏览器：</span><span class="browsers"><a href="http://www.google.com/chrome" class="chrome" title="谷歌浏览器">Chrome</a><a href="http://www.mozilla.org/en-US/firefox/new/" class="ff" title="火狐">Firefox</a><a href="http://www.opera.com/download/" class="opera" title="Opera">Opera</a><a href="http://www.apple.com/safari/download/" class="safari" title="Safari">Safari</a></span>
        </div>
        <script>$('#clostBtn').click( function(){ $('#tipsWrap').css('display','none'); } ); </script>
      </div>
      <![endif]--> 
        
          
            
              
                <!--<div class="slider-warp">
<div id="slides" class="slides">
  <img src="/files/slides/banner_slider_01.jpg" alt="" width="700" height="210" />
  <img src="/files/slides/banner_slider_02.jpg" alt="" width="700" height="210" />
  <img src="/files/slides/banner_slider_03.jpg" alt="" width="700" height="210"/>
</div>
</div>-->
	<c:if test="${not empty requestScope.data}">
				<c:forEach var="log" items="${requestScope.data.rows}">
                <article class="entry">

  
 <h2 class="post-title"><a rel="bookmark" href="${rurl}post/${log.alias}">${log.title}</a></h2>


  <div class="content">
       
    	<p>${log.digest}</p>
  
  </div>
  <div class="meta">
  <p class="category"><a rel="tag" href="${rurl}post/sort/${log.typeAlias}">${log.typeName}</a> </p>
  <p class="published">/<time datetime="${log.releaseTime}">&nbsp;${log.releaseTime.year+1900}年${log.releaseTime.month+1}月${log.releaseTime.date}日</time></p>
  <p class="commentlink"><a href="${rurl}post/${log.alias}#comment-list" class="comments_invite">查看评论 [${log.commentSize}]</a></p>
  </div> 

</article>   
</c:forEach>
</c:if>
<c:if test="${requestScope.data.total>1}">
	<div class="page_navi">
        <c:if test="${requestScope.data.page>1}">
				<A title="跳转到第一页" class="extend" href="${rurl}${requestScope.yurl}1">第一页 </A>
				<A href="${rurl}${requestScope.yurl}${requestScope.data.page-1}">上一页 </A>
				</c:if>
				<c:choose>
				<c:when test="${requestScope.data.total>11}">
					<c:choose>
						<c:when test="${requestScope.data.page<3 or requestScope.data.total-4<requestScope.data.page}">
							<c:forEach begin="1" end="3" step="1" var="i">
								<a <c:if test="${i eq requestScope.data.page}">class="current"</c:if> href="${rurl}${requestScope.yurl}<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="${requestScope.data.page-2}" end="${requestScope.data.page}" step="1" var="i">
								<a <c:if test="${i eq requestScope.data.page}">class="current"</c:if> href="${rurl}${requestScope.yurl}<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<c:forEach begin="${requestScope.data.total-3}" end="${requestScope.data.total}"
					step="1" var="i">
					<a <c:if test="${i eq requestScope.data.page}">class="current"</c:if> href="${rurl}${requestScope.yurl}<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<c:forEach begin="1" end="${requestScope.data.total}"
					step="1" var="i">
						<a <c:if test="${i eq requestScope.data.page}">class="current"</c:if> href="${rurl}${requestScope.yurl}<c:out value="${i}"></c:out>"><c:out value="${i}"></c:out></a>		
				</c:forEach>
				</c:otherwise>
				</c:choose>
				<c:if test="${requestScope.data.total ne requestScope.data.page}">
				<A href="${rurl}${requestScope.yurl}${requestScope.data.page+1}">下一页 </A>
				<A title="跳转到最后一页" class="extend"
					href="${rurl}${requestScope.yurl}${requestScope.data.total}">
					最后一页 </A></c:if>
                          </div>
                          </c:if>
      </section>

	</c:otherwise>
</c:choose>
<jsp:include page="plugs.jsp"></jsp:include>
    </div>
<jsp:include page="footer.jsp"></jsp:include>
