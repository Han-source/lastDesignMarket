<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="www.dream.com.bulletinBoard.model.PostVO"%>
<%@include file="../includes/header.jsp"%>
<!--  class = .@@@ / id = #@@@ -->
<!--  TableHeader에 정의된 static method를 사용하기 위함 -->
<jsp:useBean id="tablePrinter"
   class="www.dream.com.framework.printer.TablePrinter" />
<style>

</style>
<%@ include file="../includes/subMenu.jsp"%>
<div class="inline-blockk" style="width: 80%;">
   <div class="container-fluid">
      <p></p>
      <!-- DataTales Example -->
      <div>

         <div>

            <form id="frmSearching" action="/product/readProduct" method="get">
            </form>
            <!--  내가 결제한 상품 목록만 조회  -->
            <div class="itemm_wrapper">
               <div class="itemm_container">
               
                  <div class="itemm_heading_title">

                     
                     <a><button id="btnSelllist" class="btn btn-default">판매중인 상품</button></a> 
                     <a><button id="btnSelledList" class="btn btn-default">판매완료한 상품</button></a>

                     <div style="width:80vw; auto position:absolute;">
                     
                     <section class="order-informationn-table">
                     <div style="width:1000px; margin-top:10px; margin-left:-200px; float:left;">
                     
                      <c:if test="${paymentList[status.index].trade.adminPermission  == 1}">
                                  <div class="item-order-statuss">
                                      <p>구매확정</p>
                                      <button>배송조회</button>
                                      <button>후기작성</button>
                                  </div>
                              </c:if>
                              
                        <div class="order-information-header">
                           <div class="item-shoppingCart-informationn info-top">상품정보</div>
                           <div class="item-order-datee">판매일자</div>
                           <div class="item-order-trdatee">거래종류</div>
                           <div class="item-order-buyer">구매자</div>
                           <div class="item-order-productFP">거래금액</div>
                        </div>
                           
                              <c:forEach items="${productUploaded}" var="product" varStatus="status">        
                        <div class="order-inforamtion-bottom">
                           <!-- start -->
                           <div class="order-info-wrapp">
                               <div class="item-shoppingCart-informationn info-bottom">
                                   <a class='anchor4product' href="${product.id}" >
                                   <div class="item-info-imagee">
                                         <div class="slider" id="${product.id}">
                                     <ul class="slider__images" style="list-style:none;">
                                        <c:forEach var="attachVoInStr" items="${product.attachListInGson}" varStatus="sta">
                                          <script>
                                             $(document).ready(function() {
                                                productImgListFunction('<c:out value="${productUploaded[status.index].attachListInGson[sta.index]}" />', '<c:out value="${productUploaded[status.index].listAttach[sta.index].uuid}" />', '<c:out value="${productUploaded[status.index].id}" />');
                                             });
                                          </script>                     
                                    </c:forEach>
                                    </ul>
                                    </div>  
                                       </div>
                                       <div class="item-info-text">
                                           <p><b style="font-color:black;">${product.title}</b></p>
                                       </div>
                                       
                                       <input type="hidden" id="child" name="child" value="${productUploaded[status.index].board.parentId}">
                                       <input type="hidden" id="boardId" name="boardId" value="${productUploaded[status.index].board.id}">                              
		                              <input type="hidden" id="buyerId" name="buyerId" value="${productUploaded[status.index].trade.buyerId}">                      
		                              <input type="hidden" id="tradeDate" name="tradeDate" value="${productUploaded[status.index].trade.tradeDate}">
		                               <input type="hidden" id="productPrice" name="productPrice" value="${productUploaded[status.index].trade.productFinalPrice}">
		                                   </a>
		                               </div>
		                                  <c:if test="${productUploaded[status.index].board.parentId == 5}">   
		                                  <div class="item-order-datee">
		                                      <span>직접거래</span>
		                                  </div>
		                               </c:if>
		                               <c:if test="${productUploaded[status.index].board.parentId == 6}">   
		                                  <div class="item-order-datee">
		                                      <span>안전거래</span>
		                                  </div>
		                               </c:if>
		                               <c:if test="${productUploaded[status.index].board.parentId == 7}">   
		                                  <div class="item-order-datee">
		                                      <span>경매거래</span>
		                                  </div>
		                               </c:if>
		                               <div class="item-order-trdatee">
		                                   <span>${productUploaded[status.index].trade.tradeDate}</span>
		                               </div>
		                               <div class="item-order-buyer">
		                                   <span>${productUploaded[status.index].trade.buyerId}</span>
		                               </div>
		                               <div class="item-order-productFP">
		                                   <p>${productUploaded[status.index].trade.productFinalPrice}원</p>
		                                   <p></p>
		                               </div>
		                           </div>
		                           <!-- end -->
		                         </div>
		                       
		                        </c:forEach>
		                        </div>
							<div id = "defaultChart">
									<button class="btn btn-success" style="right: 125px; top: 500px; position:fixed;">기간별 현황 조회 하기</button>
									<p style="right: 100px; top: 300px; position:fixed;">* 기본 7일간의 판매 현황 조회 *</p>
 								    <canvas id="lookChartProduct" style="right: 50px; top: 350px; position:fixed;"></canvas>
							</div>
							
<!-- 							<div id = "duringChart"> -->
<!-- 								<p style="right: 100px; top: 300px; position:fixed;">* 기간별 판매 현황 조회 *</p> -->
<%-- 							   <canvas id="duringPurchase" style="right: 50px; top: 350px; position:fixed;"></canvas> --%>
<!-- 							</div> -->
							
                      </section> 
                      </div>

                        </div> 
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

                     <form id="frmSelllist" action="/business/myProductUploaded" method="get">
                        <input type="hidden" name="boardId" value="${boardId}">
                        <input type="hidden" name="child" value="${child}"> 
                        <input type="hidden" name="getMySelledList" value="0">
                     </form>

                     <form id="frmSelledList" action="/business/myProductSelled" method="get">
                        <input type="hidden" name="boardId" value="${boardId}">
                        <input type="hidden" name="child" value="${child}"> 
                        <input type="hidden" name="getMySelledList" value="1">
                     </form>

<%@include file="../includes/footer.jsp"%>
<script src="\resources\js\util\utf8.js"></script>
<script src="\resources\js\imgList\imgList.js"></script>
<!-- End of Main Content -->
<script type="text/javascript">
   $(document).ready(function() {
      makeChart();
   
   $("input[name='dateSelect']").on("click",function(){
        var a = $(this).val();
        if($(this).val() == 'dayOnlyOne'){
           $('#dayPurchase').show();
           $('#duringPurchase').hide();
        }else{
           $('#duringPurchase').show();
           $('#dayPurchase').hide();
        }
     });   
 
   var frmSearching = $('#frmSearching');
   
   $('.anchor4product').on('click', function(e) {
      e.preventDefault();
      var productId = $(this).attr('href')
      frmSearching.append("<input name='productId' type='hidden' value='" + productId + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
      var board = $('#boardId').val();
      var child = $(this).children('input#child').val();
      frmSearching.append("<input name='boardId' type='hidden' value='" + $('#boardId').val() + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
      frmSearching.append("<input name='child' type='hidden' value='" + $(this).children('input#child').val() + "'>"); // 문자열을 끝내고 이어받아서 return값 호출
      frmSearching.attr('action', '/business/readProduct');
      frmSearching.attr('method', 'get');
      frmSearching.submit();
   });
});
   
   
   function productImgListFunction(attachVOInJson, uuid, id){
      imgService.productImgList(attachVOInJson, uuid, id);
   }
   
   var frmSelllist = $('#frmSelllist');
      $('#btnSelllist').on('click', function(eInfo) {
           eInfo.preventDefault();

           //신규 조회이므로 1쪽을 보여줘야합니다
           $("input[name='pageNumber']").val("1");

           frmSelllist.submit();
   });
      
   var frmSelledList = $('#frmSelledList');
      $('#btnSelledList').on('click', function(eInfo) {
           eInfo.preventDefault();

           //신규 조회이므로 1쪽을 보여줘야합니다
           $("input[name='pageNumber']").val("1");

          frmSelledList.submit();
    });
      
</script>

<script>
   function makeChart() {
      var ctx = document.getElementById("lookChartProduct");
      var tradeDate = new Array();
      var price = new Array();
      <c:forEach items="${sellChart}" var="item" varStatus="status">
      tradeDate.push("${item.tradeDate}");
      price.push("${item.productFinalPrice}");
      </c:forEach>
      
      var chart = new Chart(ctx, {
         type : 'bar',
         data : {
            labels : tradeDate,
            datasets : [ {
               label : "날짜",
               borderColor : 'rgb(204, 102, 255)',
               data : price
            } ]   
         },
         options : {
            responsive : false,
            scales : {
               yAxes : [ {
                  ticks : {
                     beginAtZero : true
                  }
               } ]
            }
         }
      });
   }
   

</script>