<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="/resources/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">
<!-- <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet"> -->
<!-- Custom fonts for this template end-->

<!-- <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet"> -->
<!-- Css Styles -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<!--     <link rel="stylesheet" href="/resources/css/dropdw.css" type="text/css"> -->
<link rel="stylesheet" href="/resources/css/custom.css">
<link rel="stylesheet" href="/resources/css/banner.css" type="text/css">

<!-- End of Topbar -->

      <form id="frmSearching" action="/business/readProduct" method="get">
      </form>
      
      <form id="frmPermissionAgree" action="/business/adminPermission" method="post">
      		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
      </form>
      
      <form id="frmPermissionDisAgree" action="/business/adminPermission" method="post">
      		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'>
      </form>
<!-- Begin Page Content -->
<div class="inline-blockk">
<nav class="side_menu_nav">
<ul class="side_Menu_Bar">
   <li class="side_Menu_Bar_li"><a class="activeMeenu" href="/post/adminManage">쇼핑몰 판매 현황</a></li>
   <li class="side_Menu_Bar_li"><a class="activeMeenu" href="/business/adminPermission">거래 상품 관리자 허가</a></li>
 </ul>
</nav>
</div>
<div class="inline-blockk" style="width: 80%;">
      <div style="margin-bottom: 30px; margin-top: 30px;">
         <h6 align="center" >거래 허가</h6>
      </div>
      <hr>
		<section class="order-informationn-table">
                    <div class="order-information-header" style="width: 90%;">
                        <div class="item-informationn info-top">상품정보</div>
                        <div class="item-order-datee">주문일자</div>
                        <div class="item-order-numberr-admin">주문번호</div>
                        <div class="item-order-amountt">판매자</div>
                        <div class="item-order-buyer">구매자</div>
                        <div class="item-order-statuss-admin">주문 상태</div>
                    </div>
                  <c:forEach items="${adminPermission}" var="product" varStatus="status">                                           
                        <div class="order-inforamtion-bottom" style="width: 90%;">
                           <!-- start -->
                           <div class="order-info-wrapp">
                               <div class="item-informationn info-bottom">
                                   <a class='anchor4product' href="${product.id}" >
                                   <div class="item-info-imagee">
                                         <div class="slider" id="${product.id}">
                                     <ul class="slider__images" style="list-style:none;">
                                        <c:forEach var="attachVoInStr" items="${product.attachListInGson}" varStatus="sta">
                                          <script>
                                             $(document).ready(function() {
                                                productImgListFunction('<c:out value="${adminPermission[status.index].attachListInGson[sta.index]}" />', '<c:out value="${adminPermission[status.index].listAttach[sta.index].uuid}" />', '<c:out value="${adminPermission[status.index].id}" />');
                                             });
                                          </script>                     
                                    </c:forEach>
                                    </ul>
                                    </div>  
                                       </div>
                                       <div class="item-info-text">
                                           <p>판매자 : ${post.writer.userId}</p>
                                           <p>상품명 : ${product.title}</p>
                                           
                                   
                                       </div>
                                       <input type="hidden" id="child" name="child" value="${adminPermission[status.index].board.parentId}">
                                       <input type="hidden" id="boardId" name="boardId" value="${adminPermission[status.index].board.id}">                              
									   <input type="hidden" id="tradeId" name="tradeId" value="${adminPermission[status.index].trade.tradeId}">							 
									   <input type="hidden" id="tradeDate" name="tradeDate" value="${adminPermission[status.index].trade.tradeDate}">
							 		   <input type="hidden" id="productPrice" name="productPrice" value="${adminPermission[status.index].trade.productFinalPrice}">
                                   </a>
                               </div>
                               <div class="item-order-datee">
                                   <span>${adminPermission[status.index].trade.tradeDate}</span>
                               </div>
                               <div class="item-order-numberr-admin">
                                   <span>${adminPermission[status.index].trade.tradeId}</span>
                               </div>
                               <div class="item-order-amountt">
                                   <p>${adminPermission[status.index].trade.productFinalPrice}원</p>
                                   <p></p>
                               </div>
                               <div class="item-order-buyer">
                                   <p>${adminPermission[status.index].trade.productFinalPrice}원</p>
                                   <p></p>
                               </div>
                               <div class="item-order-statuss-admin">
                                   <button type="button" id="purchaseAgreePermission" value="${adminPermission[status.index].trade.tradeId}">거래 완료</button>
                                   <button type="button" id="purchaseDisAgreePermission" value="${adminPermission[status.index].trade.tradeId}">거래 취소</button>
                               </div>
                           </div>
                           <!-- end -->
                         </div>
                        <div class="card-body" style="float: left; width: 50%; padding:10px;">

                              
							  
                           <br>

                           <br>

                        </div> 
               </c:forEach>
               </section>   
		
		
		
	</div>

    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/mixitup.min.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="/resources/js/sb-admin-2.min.js"></script>
	<script src="/resources/js/js-image-slider.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.js"></script>
	<script src = "https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>

	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
	<script src="\resources\js\imgList\imgList.js"></script>
	<script src="\resources\js\util\utf8.js"></script>
	
<script>
function productImgListFunction(attachVOInJson, uuid, id){
    imgService.productImgList(attachVOInJson, uuid, id, 120, 120);
 }
 
var frmSearching = $('#frmSearching');
$('.anchor4product').on('click', function(e) {
    e.preventDefault();
    var a = $(this).children('input#tradeId').val();
    
    var productId = $(this).attr('href')
    frmSearching.append("<input name='productId' type='hidden' value='" + productId + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
    var board = $('#boardId').val();
    var s = $(this).children('input#tradeId').val();
    
    frmSearching.append("<input name='boardId' type='hidden' value='" + $('#boardId').val() + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
    frmSearching.append("<input name='child' type='hidden' value='" + $(this).children('input#child').val() + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
    
    frmSearching.submit();
 });
 
 var frmPermissionAgree = $('#frmPermissionAgree');
 
 $('#purchaseAgreePermission').on("click", function () {
	 frmPermissionAgree.append("<input name='permissionAgree' type='hidden' value='0'>");
	 var a = $(this).val();
	 frmPermissionAgree.append("<input name='tradeId' type='hidden' value='" + $(this).val() + "'>");
	 frmPermissionAgree.submit();
})

 var frmPermissionDisAgree = $('#frmPermissionDisAgree');
 $('#purchaseDisAgreePermission').on("click", function () {
	 frmPermissionDisAgree.append("<input name='permissionDisAgree' type='hidden' value='0'>");
	 var a = $(this).val();
	 frmPermissionDisAgree.append("<input name='tradeId' type='hidden' value='" + $(this).val() + "'>");
	 frmPermissionDisAgree.submit();
})
 
</script>