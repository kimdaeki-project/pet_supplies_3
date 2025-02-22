<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/boot.jsp"></c:import>
<c:import url="../template/css.jsp"></c:import>
<style type="text/css">

.sum_text{
	color:#FF324D;
	font-weight: bold;

}

.addr_button{
	color: #323232;
    background: #ffffff;
    border: 1px solid #cbcbcb;
    min-width: 20px;
    height: 26px;
    line-height: 24px;
    font-size: 12px;
    text-align: center;
    display: inline-block;
    padding: 0 8px;
    vertical-align: middle;
    font-weight: normal;
}

.txt11{
	padding: 10px 0 8px 10px;
    color: #f76560;
    font-size: 12px;
    line-height: 1.5;
    background: #fff8f5;
    list-style: none;
    text-align: left;
    border-top: 1px solid #e8e5e4;
    border-bottom: 1px solid #e8e5e4;
    margin-bottom: 50px;
}

.payBtn button{
	width: 35%; 
	height: 50px;
	background-color: #f2f2f2;
	color: #777;
	font-weight: bold;
	border-color: #d7d5d5;
	border-style: solid;
}

</style>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>

<%-- 	<div class="path" style="display: block; float: right; position: relative; height: auto; margin-top: 50px; margin-right: 200px;">
		<ol><li style="display: inline;"><a href="${pageContext.request.contextPath}">Home ></a></li>
			<li style="display: inline;"><a href="${pageContext.request.contextPath}">장바구니 ></a></li>
			<li style="display: inline;" title="현재 위치"><strong>주문결제 ></strong></li>
			<li style="display: inline;">주문완료</li>
		</ol>
	</div> --%>

<!-- <div class="container" style="margin-top: 100px;  height: 3000px;"> -->

<div class="container-fulid mt-5"id="step" title="step2">
	<div class="row">
		
			<div class="col">
				<c:import url="./cartStep.jsp"></c:import>
<div class="row" style="margin-top: 20px;">
<div class="col-sm-1"></div>
<div class="col">
<div class="orderListArea">
	

<!-- 기본배송 -->

<div class="ec-base-table typeList gBorder">
<div style="text-align: center;">
<div>
						<div class="row" style="padding: 0px 15px 15px 15px;" >
							<table style="border-top: 1px solid black; width: 100%">
								<colgroup>
									

									<col style="width: 150px;" />
									<col style="width: 450px" />
									<col style="width: 150px" />
									<col style="width: 120px" />
									<col style="width: 100px" />

									<col style="width: 160px" />



								</colgroup>
								<thead>
									<tr class="table_title"  style="text-align: center; line-height: 60px;">
										<th scope="col" hidden="hidden" ><input type="checkbox" id="check_all" hidden="hidden"
											title="checkbox" ><div class="row" style="height: 10px;"></div><label style="margin: 0 auto;"
											for="check_all" class="material-icons checkbox"
											title="check_all"> check </label></th>
										<th scope="col">이미지</th>
										<th scope="col">상품정보</th>
										<th scope="col">판매가</th>
										<th scope="col">수량</th>
										<th scope="col">적립금</th>


										<th scope="col">합계</th>
										


									</tr>
								</thead>




								<c:forEach items="${cartSelect }" var="cart">
									<div hidden="hidden" id="${cart.id}${cart.cnum}_sd"></div>
									<tbody>
										<tr class="table_title">
											<td hidden="hidden">
												<input type="checkbox" class="check" id="${cart.id}${cart.cnum}_check" hidden="hidden" title="${cart.id}${cart.cnum}" name="${cart.cnum}">
												 <label	for="${cart.id}${cart.cnum}_check" class="material-icons checkbox"title="${cart.id}${cart.cnum}_check">check</label>
												 
											</td>

											<td><img src="${pageContext.request.contextPath}/resources/dogUpload/${cart.fileName }" style="width: 100px;height: 100px; margin: 15px 0px 15px 0px;"></td>

											<td id="productName">${cart.productName }</td>
	
											<c:if test="${cart.sale gt 0 }">
												
												<td>
													<del id="${cart.id}${cart.cnum}_price" class="price" style="color: black;">${cart.price }</del><span>(${cart.sale }%)</span>
													<div class="price" id="${cart.id}${cart.cnum}_sale" title="${cart.sale*(cart.price/100)}">${cart.price-(cart.sale*(cart.price/100) )}</div>
												</td>
											</c:if>
											<c:if test="${cart.sale eq 0 }">
												<div hidden="hidden" class="price" id="${cart.id}${cart.cnum}_sale" title="${cart.sale*(cart.price/100)}"></div>
												<td id="${cart.id}${cart.cnum}_price" class="price">${cart.price }</td>
											</c:if>
											
											
											<td>
												
													<button hidden="hidden" class="minus" title="${cart.id}${cart.cnum}" style="width: 20px; border: 1px solid #d9dde0;">-</button>
													<input class="text-center in" id="${cart.id}${cart.cnum}_amount"	title="${cart.id}${cart.cnum}" 
														style="color: #333; width: 40px; border: hidden;"
														value="${cart.cAmount }" name="${cart.cnum }"
														readonly="readonly"><span>개</span>
													<button hidden="hidden" class="plus" title="${cart.id}${cart.cnum}"style=" border: 1px solid #d9dde0;">+</button>
												
											</td>

											<td><span id="${cart.id}${cart.cnum}_point" name="${cart.point }"></span></td>

											<td>
												
												<c:if test="${cart.sale gt 0}">
													<span hidden="hidden" id="${cart.id}${cart.cnum}_total" class="sum_text"></span>
													<span id="${cart.id}${cart.cnum}_dc" class="sum_text"></span>
												</c:if>
												<c:if test="${cart.sale eq 0}">
													<span id="${cart.id}${cart.cnum}_total" class="sum_text"></span>
													
												</c:if>
												
											</td>

										</tr>
								

								</c:forEach>
											<tr class="table table-hove">
										<td colspan="8" style="text-align: right;">
										상품구매금액 <strong id="all_sum" class="all_sum">0원</strong>
										- 상품할인금액<strong id="discount"></strong>
										 + 배송비 <span id="deli">0원</span>
										   = 합계 : <strong class="txtEm gIndent10">
										   <span id="payment" class="paymentPrice">0</span></strong>
										</td>

										</tr>		
								
									</tbody>
							</table>

						</div>
						
						
<!-- 
						<div class="row">
							<div class="col">
								
							</div>
						</div>
						

						<div class="row"
							style="margin:15px 0 15px 0; padding: 15px; text-align: center; font-weight: bold; color: black; border: 1px solid #9ca0aa;">
							
								<div class="col-sm-8" style="border-right: 1px solid gray;">

		
									<div class="row">
										<div class="col-sm-4">
											<div>총 상품금액</div>
											<div id="all_sum" class="all_sum">0원</div>
										</div>
										<div class="col-sm-1">
											<div>&nbsp;</div>
											<div style="color: gray;">+</div>
										</div>
										<div class="col-sm-3">
											<div>배송비</div>
											<div id="deli">0원</div>
										</div>
										<div class="col-sm-1">
											<div>&nbsp;</div>
											<div style="color: gray;">-</div>
										</div>
										<div class="col-sm-3">
											<div>할인금액</div>
											<div id="discount">0원</div>


										</div>


									</div>
									
								</div>
								<div class="col-sm-3">
									<div>결제 금액</div>
									<div style="color: #FF324D;" id="" class="paymentPrice">0원</div>

								</div>
						</div> -->
						
<ul class="ec-base-help controlInfo typeBtm" style="height: 20px;">
<li class="txtWarn txt11">상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.</li>
</ul>
			
					</div>




</div>

</div>

<!-- 주문정보 -->

<div class="orderArea  ec-shop-ordererForm" style="margin-top: 60px; border-top: 1px solid black;">
<div class="title" style="float: left; width: 100%; height: 25px; margin-top: 20px;">
	<p class="required" style="float: right;"><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수">필수입력사항</p>
	<h3 style=" font-weight: bold; font-size: medium;">주문 정보</h3>
</div>

<div class="ec-base-table typeWrite" style=" margin-top: 50px;">
<table class="table table-condensed" style="border-left: none; border-right: none;">
<colgroup>
<col style="width:139px;">
<col style="width:auto;">
</colgroup>

<!-- 국내 쇼핑몰 -->
<tbody class="address_form">
<tr>
<th scope="row">주문하시는 분<img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input id="oname" name="oname" class="inputTypeText" placeholder="" size="15" value="${member.name}" type="text"></td>
</tr>
<tr class="">
<th scope="row">주소 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td>   
	<input id="oaddress" name="ozipcode1"  class="inputTypeText" placeholder="" size="6" maxlength="6" readonly="1" value="${member.address}" type="text">
	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호"><br>
	<input id="oaddr1" name="addr1" class="inputTypeText" placeholder="" size="40" readonly="1" value="${member.addr1}" type="text"> <span class="txtInfo">기본주소</span><br>
	<input id="oaddr2" name="addr2"  class="inputTypeText" placeholder="" size="40" value="${member.addr2}" type="text"> <span class="txtInfo">나머지주소</span><span class="grid ">(선택입력가능)</span>
</td>
</tr>
<tr class="">
<th scope="row">휴대전화 <span class=""><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></span>
</th>
<td><select id="ophone" name="phone">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="ophone1" name="phone1" maxlength="4" size="4" value="${member.phone1}" type="text">-<input id="ophone2" name="phone2" maxlength="4" size="4" value="${member.phone2}" type="text"></td>
</tr>

<tr>
<th scope="row">이메일 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td>
<input id="oemail1" name="email" class="mailId" value="${member.email}" type="text">
</td>
</tr>


</tbody>

</table>
</div>
</div>

<!-- 배송정보 -->

<div class="orderArea" style="margin-top: 50px;">

<div class="title"  style="float: left; width: 100%; height: 25px;">
<h3 style="font-size: medium; font-weight: bold; display: inline;">배송 정보</h3>
<p class="required" style="float: right;"><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"> 필수입력사항</p>
</div>

<div class="ec-base-table typeWrite">
<table class="table table-condensed">
<colgroup>
<col style="width:139px;">
<col style="width:auto;">
</colgroup>

<!-- 국내 배송지 정보 --><tbody class="">
<tr class="">
<th scope="row">배송지 선택</th>
<td>
<div class="address">
<input id="sameaddr0" name="sameaddr"  value="T" type="radio"><label for="sameaddr0">주문자 정보와 동일</label>
<input id="sameaddr1" name="sameaddr"  value="F" type="radio"><label for="sameaddr1">새로운배송지</label><span class="recent ec-shop-RecentDelivery displaynone">
</span>
<input type="button" id="btn_shipp_addr" class="btn addr_button" onclick="openAddressList()" value="주소록보기">
</div>
</td>
</tr>
<tr>
<th scope="row">받으시는 분 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></th>
<td><input class="input_Join ds" id="rname" name="rname" class="inputTypeText" placeholder="" size="15"  type="text"></td>
</tr>
<tr class="">
<th scope="row">주소 <img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" class="" alt="필수"></th>
 <td>
   <input style="width: 80px;" id="raddress" name="address" class="input_Join ds" placeholder="" readonly="readonly" maxlength="14" type="text">
   <input type="button" onclick="sample6_execDaumPostcode1()" value="우편번호"><br>
   <input style="width: 300px;" id="raddr1" name="addr1" class="input_Join ds" placeholder="" readonly="readonly" type="text" ><span> 기본주소</span> <br>
   <input style="width: 300px;" id="raddr2" name="addr2" class="ds" placeholder="" type="text"><span> 나머지 주소</span>
 
</tr>
<!-- 일반전화 -->
<tr class="">
<th scope="row">일반전화 <span class="displaynone"></span>
</th>
	<td>
		<select id="rphone1_1" name="rphone1_1" >
			<option value="02">02</option>
			<option value="031">031</option>
			<option value="032">032</option>
			<option value="033">033</option>
			<option value="041">041</option>
			<option value="042">042</option>
			<option value="043">043</option>
			<option value="044">044</option>
			<option value="051">051</option>
			<option value="052">052</option>
			<option value="053">053</option>
			<option value="054">054</option>
			<option value="055">055</option>
			<option value="061">061</option>
			<option value="062">062</option>
			<option value="063">063</option>
			<option value="064">064</option>
			<option value="0502">0502</option>
			<option value="0503">0503</option>
			<option value="0504">0504</option>
			<option value="0505">0505</option>
			<option value="0506">0506</option>
			<option value="0507">0507</option>
			<option value="070">070</option>
			<option value="010">010</option>
			<option value="011">011</option>
			<option value="016">016</option>
			<option value="017">017</option>
			<option value="018">018</option>
			<option value="019">019</option>
			<option value="0508">0508</option>
	</select>
	-<input class="ds" id="rphone1_2" name="rphone1_2" maxlength="4" size="4" type="text">
	-<input class="ds" id="rphone1_3" name="rphone1_3" maxlength="4" size="4" type="text">
	</td>
</tr>
<!-- 휴대전화 -->
<tr class="">
<th scope="row">휴대전화 <span class=""><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></span>
</th>
<td><select id="rphone" >
<option id="010">010</option>
<option id="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input class="input_Join ds" id="rphone1" maxlength="4"size="4" type="text">-<input class="input_Join ds" id="rphone2" maxlength="4"size="4"type="text"></td>
</tr>

</tbody>

<!-- 국내 배송관련 정보 --><tbody class="delivery ">
<tr class="">
<th scope="row">배송메시지 <span class=""><img src="${pageContext.request.contextPath}/resources/images/ico_required.gif" alt="필수"></span>
</th>
<td>
<textarea class="input_Join" id="omessage" name="omessage" maxlength="255" cols="70"></textarea>
<div class="devMessage">
<ul class="gIndent5" style="list-style: none;" >
<li>배송메시지란에는 배송시 참고할 사항이 있으면 적어주세요.</li>
</ul>
</div>
</td>
</tr>

</tbody>
</table>
</div>
</div>

<!-- 결제예정금액  -->


<div class="totalArea" style="border-bottom: 1px solid black; border-top: 1px solid black;">

<div class="title" style="margin-top: 20px;">
	<h3 style="font-size: medium; font-weight: bold;">결제 예정 금액</h3>
</div>
<div class="ec-base-table typeList gBorder total">
<table class="table" style="text-align: center;">
<colgroup>
<col style="width:33.33%">
<col style="width:33.33%" class="">
<col style="width:33.33%">
</colgroup>
<tr class="table-danger">
<th scope="col">
<strong>총 주문 금액</strong>
</th>
<th scope="col" class="">
<strong id="total_addsale_text">총 할인금액</strong>
</th>
<th scope="col"><strong>총 결제예정 금액</strong></th>
</tr>

<tbody class="center"><tr>
<td><div class="box txt16">
<div style="color: black; font-weight: bold;"><span id="pp" class="paymentPrice">0</span></div>
</div></td>

<td class="option "><div class="box txt16">
<strong>-</strong>
<span id="discount2" class="txt23"><strong>0원</strong></span>
</div></td>
<td><div class="box txtEm txt16">
<strong>=</strong> <span style="color: #FF324D; font-weight: bold;" class="Ap paymentPrice">0원</span>
</div></td>
</tr></tbody>
</table>
</div>
</div>

<div class="detail">
<div class="ec-base-table gMerge ">

<table class="table">

<colgroup>
<col style="width:139px">
<col style="width:auto">
</colgroup>

<tbody>
<tr class="table-danger">
<th scope="row"><strong>총 할인금액</strong></th>
<td id="total_addsale_price_view"><strong>0원</strong></td>
</tr>
<tr class=" mCouponSelect">
<th scope="row">쿠폰할인</th>

<td><input id="c_in" readonly="readonly" style="width: 100px;" value="0">원  
<a href="javascript:popup()" style="background-color: #FF324D; width: 80px; height: 30px; text-align: center;" type="button"><span style="font-size: small; color: white;">쿠폰적용</span></a>
</td>
</tr>

</tbody>
</table>
</div>


<div class="ec-base-table gMerge ">
<table class="table">

<colgroup>
<col style="width:139px">
<col style="width:auto">
</colgroup>

<!-- 적립금 --><tbody class=""><tr>
<th scope="row">적립금</th>
<td>
<p> <input id="input_point" name="input_point" class="inputTypeText text-center" placeholder="" size="10" value=""  type="text"> 원 (총 사용가능 적립금 : <strong id="memberPoint">${member.point}</strong>원)</p>
<ul class="info" style="list-style: square;" >
<li>적립금은 최소 0 이상일 때 결제가 가능합니다.</li>
<li id="mileage_max_unlimit" class="">최대 사용금액은 제한이 없습니다.</li>
<li id="mileage_max_limit" class="">1회 구매시 적립금 최대 사용금액은 0입니다.</li>
<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면 주문이 완료됩니다.</li>
<li id="mileage_shipfee" class="displaynone">적립금 사용 시 배송비는 적립금으로 사용 할 수 없습니다.</li>
<li id="mileage_exception" class="displaynone">적립금 사용 시 해당 상품에 대한 적립금은 적립되지 않습니다.</li>
</ul>
</td>
</tr></tbody>

</table>
</div>
</div>

<!-- 결제수단 -->

<div class="paymentarea">

<div class="title" style="width: 100%; height: 25px; display: block;">
<h3 style="font-size: medium; font-weight: bold; display: inline;">결제수단</h3>
<!-- <span class="txtEm gIndent20 ">
<input type="checkbox" id="save_paymethod" name="save_paymethod" value=""><label for="save_paymethod">지금 선택한 결제수단을 다음에도 사용</label>
</span> -->
</div>


<div class="All" style="border-top: 1px solid black; border-bottom:1px solid black;  width: 100%; height: 500px;">

<div class="payment" style="width: 75%; height: 500px; float: left;">
<div class="payBtn" style="width: 100%; height: 150px; text-align: center;">

<button id="credit" style="margin-top: 40px;" >신용카드</button>
<button id="phonpay" >핸드폰결제</button>
<button id="account" style="color: black; margin-top: 10px;">무통장입금</button>
<button id="kakaopay" style="margin-top: 20px;"><img src="${pageContext.request.contextPath}/resources/images/payment_text_small.png"></button>
</div>

<div class="payContents" style="border-top: 1px solid #d7d5d5; width: 100%; height: 200px; text-align: center; margin-top: 35px">

<div id="credit_box" style="display: none; font-size: small; text-align: left; margin-left: 100px; margin-top: 20px;">
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p style="display: inline;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p><br>
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p style="display: inline;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
</div>

<div id="phonpay_box" style="display: none; font-size: small; text-align: left; margin-left: 100px; margin-top: 20px;">
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p style="display: inline;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
</div>

<div id="account_box" style="display: none;">

<!-- 무통장입금 -->
<table class="table table-bordered" id="payment_input_cash" style="float: left; text-align: left; font-size:small; height: 80px;">
<tbody>
<tr>
<th scope="row">입금자명</th>
<td><input id="pname" name="pname" class="inputTypeText" size="15" maxlength="20" value="" type="text"></td>
</tr>
<tr>
<th scope="row">입금은행</th>
<td>
<select id="bankaccount" name="bankaccount" >
<option value="-1">::: 선택해 주세요. :::</option>
<option value="농협 000-0000-0000-11">농협:000-0000-0000-11 (주)펫코리아</option>
</select><p class="gBlank5 "><a href="#none" id="btn_bank_go" class="btn_function btncolor_basic"><span class="ico_arrow_r">은행사이트 바로가기</span></a></p>
</td>
</tr>
</tbody>
</table>

<div id="pg_paymethod_info" class="payHelp" style="display: block; font-size: small; height: 250px;">
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p id="pg_paymethod_info_shipfee" class="ec-base-help" style="display: inline;">최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.<br><b><font size="3" color="red">★ 무통장입금 시 <u>주문완료를 꼭 확인 후</u> 해당 계좌로 입금 부탁드립니다. ★</font><b></b></b></p>
<p id="pg_paymethod_info_pg" class="ec-base-help" style="display: none;">소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
</div>

<!-- 
<div class="agree">
<table class="table table-condensed" style="float: left; text-align: left; font-size:small; height: 50px;">

<tbody class="receipt">
<tr id="cashreceipt_display_area">
<th style="width: 180px;">현금영수증 신청</th>
<td>

<div class="methods">
<input id="cashreceipt_regist0" name="cashreceipt_regist"  value="1" type="radio" onclick="setDisplay()"><label for="cashreceipt_regist0">현금영수증 신청</label>
<input id="cashreceipt_regist1" name="cashreceipt_regist"  value="99" type="radio" onclick="setDisplay()" checked="checked"><label for="cashreceipt_regist1">신청안함</label>
</div>

<div id="cashreceipt_form_area" class="ec-base-table cash" style="display: none;font-size: small; height: 10px;">

<table class="table table-condensed">
<tbody>
<tr>
<th>구분</th>
<td>
<input id="cashreceipt_user_type20" name="cashreceipt_user_type2"value="0" type="radio" checked="checked" onclick="setDisplay1()"><label for="cashreceipt_user_type20">개인</label>
<input id="cashreceipt_user_type21" name="cashreceipt_user_type2" value="1" type="radio" onclick="setDisplay1()"><label for="cashreceipt_user_type21">사업자</label></td>
</tr>
<tr class="mobile" id="cashreceipt_mobile_display_area">
<th scope="row">핸드폰 번호</th>
<td><select id="cashreceipt_user_mobile1" name="cashreceipt_user_mobile[]">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="cashreceipt_user_mobile2" name="cashreceipt_user_mobile[]" maxlength="4" type="text" style="width: 50px;">-<input id="cashreceipt_user_mobile3" name="cashreceipt_user_mobile[]" maxlength="4"type="text"style="width: 50px;"></td>
</tr>
<tr class="regno" id="cashreceipt_regno_display_area" style="display: none;">
<th>사업자 번호</th>
<td><input id="cashreceipt_reg_no" name="cashreceipt_reg_no" placeholder="사업자번호" value="" type="text" style="width: 200px;"></td>
</tr>
</tbody>
</table>

</div>
</td>
</tr>
</table>
</div> -->

</div>

<div id="kakaopay_box" style="display: none; font-size: small; text-align: left; margin-left: 100px; margin-top: 20px;">
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p class="ec-base-help" style="display: inline;">휴대폰에 설치된 카카오톡 앱에서 비밀번호 입력만으로 빠르고 안전하게 결제가 가능한 서비스 입니다.</p><br>
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p class="ec-base-help" style="display: inline;">안드로이드의 경우 구글 플레이, 아이폰의 경우 앱 스토어에서 카카오톡 앱을 설치 한 후,<br>
						최초 1회 카드 및 계좌 정보를 등록하셔야 사용 가능합니다.</p><br>
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p class="ec-base-help" style="display: inline;">인터넷 익스플로러의 경우 8 이상에서만 결제 가능합니다.</p><br>
<i class='fas fa-paw' style="font-size: 20px; display: inline; width: 100px;"></i>
<p class="ec-base-help" style="display: inline;">BC카드 중 신한, 하나, 국민카드는 결제가 불가능합니다.</p>
				
</div>


</div>

</div>

<!-- 최종결제금액 -->

<div class="total" style="border-left:1px solid #d7d5d5; width: 25%; height: 500px; float: left;">

<h4 style="margin-top: 40px;">
<strong id="current_pay_name" style="margin-left: 50px;"></strong>
 <span style="font-size: medium;">최종결제 금액</span>
</h4>

<div style="color: #FF324D; font-weight: bold; font-size: 36px; width: 100%; text-align: center; height:100px; border-bottom: 1px solid gray; margin-top: 18px;" class="Ap paymentPrice" id="AllPrice">0원</div>
<div class="paymentAgree" id="chk_purchase_agreement" style="margin-left: 10px; margin-top: 20px;">
<input id="chk_purchase_agreement0" name="chk_purchase_agreement" type="checkbox" style="display: inline; float: left; width: 30px; margin-top: 7px;"><label for="chk_purchase_agreement0" style="font-size: small;">결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
</div>

<div class="button" style="margin-top: 15px; margin-left: 20px; text-align: center;">
<input type="button" style="background-color: #FF324D; color: white; width: 250px; height: 50px; border: none;" class="btn_submit btncolor_dominant" id="btn_payment" value="결제하기">
</div>

<div class="mileage" style="margin-top: 30px; ">
<dl class="ec-base-desc gLarge right" style="height:50px; font-size: small; border-bottom: 1px solid gray; border-top: 1px solid gray;">
<dt style=" float: left; margin-left: 20px;margin-top: 12px;"><strong>총 적립예정금액</strong></dt>
<dd id="mAllMileageSum" class="txtWarn" style=" float: right; margin-top: 12px; margin-right: 20px;"></dd>
</dl>

<dl class="ec-base-desc gLarge right" style="font-size: small;">



</dl>


</div>
</div>
</div>
<div class="col-sm-2"></div>

</div>
</div>
</div>
<div class="col-sm-2"></div>
</div>
</div>
</div>
</div>
<div id="member_id" hidden="hidden">${member.id}</div>
<div id="direct_cnum" hidden="hidden">${cnum}</div>

<script type="text/javascript" src="../resources/js/cart.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript">
	var sumP = 0;
	var save = 0;
	
	var text;
	$(".plus").each(function(){
		var title = $(this).attr("title");
		var amount = $("#"+title+"_amount").val();
		var point = $("#"+title+"_point").attr("name");
		sumP = sumP + (amount*point);
		save = sumP;
		

	});
	sumP=save;
	
$("#input_point").blur(function(){
		sumP=save;
	 	var minus_p = $(this).val()*1;
		var memberPoint1 = $("#memberPoint").text();
		var memberPoint = memberPoint1*1;

		if(minus_p <= memberPoint){
			sumP = sumP-minus_p;
		} else{
			sumP=save;
		}
		
	});
	
	

</script>


<script>
	
	
	
	
	/* 배송정보 유효성검사 */
	//-- 이름
	var nameCheck = true;
	$("#rname").blur(function() {
		var name = $(this).val();
		if(name.length<=0){
			alert("이름이 입력되지않았습니다");
			nameCheck = false;
		}
	});
	
	//-- 주소
	var addrCheck = true;
	$("#raddr1").blur(function() {
		if($(this).val().length<=0){
			alert("주소가 입력되지않았습니다");
			addrCheck = false;
		}	
	});
	
   	$("#raddr2").blur(function() {
		if($(this).val().length=0){
			AddrCheck = true;
		}
	});
   	
	//-- 번호
	var phoneCheck = true;
	$("#rphone1").blur(function() {
		if($(this).val().length<=0){
			alert("번호가 입력되지않았습니다");
			phoneCheck = false;
		}
	});
	$("#rphone2").blur(function() {
		if($(this).val().length<=0){
			alert("번호가 입력되지않았습니다");
			phoneCheck = false;
		}
	});
	
	//-- 배송메세지
	var msgCheck = true;
	$("#omessage").blur(function() {
		if($(this).val().length<=0){
			alert("배송메세지 입력은 필수 입니다");
			msgCheck = false;
		}
	});
	
	//-- 입금자명 유효성 검사
	var pnameCheck = true;
	$("#pname").blur(function() {
	var pname = $("#pname").val();
		 for (var i=0; i<pname.length; i++)  { 
		    var chk = pname.substring(i,i+1); 
		    if(chk.match(/[0-9]|[a-z]|[A-Z]/)) { 
		    	pnameCheck = false;
		    }else if(chk.match(/([^가-힣\x20])/i)){
		    	pnameCheck = false;
		    }else if($("#pname").val() == " "){
		    	pnameCheck = false;
		    }else if(pname.length <= 0){
		    	pnameCheck = false;
		    }else{
		    	pnameCheck = true;
		    }
		}  
	});
	
 	
	/* 결제버튼 */
	
	$("#btn_payment").click(function(a) {
 		var c = true;
		var check = $(".input_Join");
		var agree = $("#chk_purchase_agreement0").prop("checked"); 
		var point = sumP;
		var id = $("#member_id").text();
		console.log(point);
		console.log(id);
		
	 	for(i=0;i<check.length;i++){
			if(check[i].value.length<=0){
				c=false;
				break;
			}
		}
			if(!(nameCheck && addrCheck && phoneCheck && msgCheck && c)){
				alert("배송정보는 필수 입력입니다");
			}else if(!agree){
				alert("필수 약관에 동의해주세요");
				a.preventDefault();
			}else{
				var pay = $("#current_pay_name").text();
				var kakaopay = $("#kakaopay").attr("id");
				var account = $("#account").text();
				var totalPrice = $("#AllPrice").text();
				var text = totalPrice.split("원").join("");
				var AllPrice = text.split(",").join("");
				var pname = $("#pname").val();
				var bankaccount = $("#bankaccount").val();
				var productName = $("#productName").text();
				
		 		 if(pay == kakaopay){
					location.href="./kakaoPay?name="+productName+"&totalPrice="+AllPrice;	
				}else if(pay == account){
					if(pname.length <= 0){
						alert("입금자명이 입력되지 않았습니다");
					}else if(!pnameCheck){
						alert("입금자명을 제대로 입력해주세요");
					}else if(bankaccount <= 0){
						alert("입금은행을 선택해주세요");
					}else{
						location.href="./accountPaySuccess?pname="+pname;
					}
				}else if(pay.length<=0){
					alert("결제방식을 선택해주세요");
				}
		 	 	$.ajax({
		 			type:"post",
		 			url:"./member/pointUpdate",
		 			data:{
		 				point:point,
		 				id:id
		 			}
		 			
		 		}); 
			} 

	});

	/* 배송지입력 주문자정보와동일/새로운배송지 선택 */
	$("#sameaddr0").click(function() {
		var name = $("#oname").val();
		var address = $("#oaddress").val();
		var addr1 = $("#oaddr1").val();
		var addr2 = $("#oaddr2").val();
		var phone = $("#ophone").val();
		var phone1 = $("#ophone1").val();
		var phone2 = $("#ophone2").val();
		
		$("#rname").val(name);
		$("#raddress").val(address);
		$("#raddr1").val(addr1);
		$("#raddr2").val(addr2);
		$("#rphone").val(phone);
		$("#rphone1").val(phone1);
		$("#rphone2").val(phone2);

	});
	
	$("#sameaddr1").click(function() {
		$(".ds").val('');

	});
	
	

	$("#credit").click(function() {
		 $("#credit_box").show(); 
		 $("#phonpay_box").hide(); 
		 $("#account_box").hide(); 
		 $("#kakaopay_box").hide(); 
		 $("#current_pay_name").text("신용카드");
	});
	
	$("#phonpay").click(function() {
		 $("#phonpay_box").show(); 
		 $("#credit_box").hide(); 
		 $("#account_box").hide(); 
		 $("#kakaopay_box").hide(); 
		 $("#current_pay_name").text("핸드폰결제");
	});
	
	$("#account").click(function() {
		 $("#account_box").show(); 
		 $("#phonpay_box").hide(); 
		 $("#credit_box").hide(); 
		 $("#kakaopay_box").hide(); 
		 $("#current_pay_name").text("무통장입금");
	});
	
	$("#kakaopay").click(function() {
		 $("#kakaopay_box").show(); 
		 $("#phonpay_box").hide(); 
		 $("#account_box").hide(); 
		 $("#credit_box").hide(); 
		 $("#current_pay_name").text("kakaopay");
	});
	
	//-- 현금영수증 선택
	function setDisplay(){
	    if($('input:radio[id=cashreceipt_regist0]').is(':checked')){
	        $('#cashreceipt_form_area').show();
	    }else if($('input:radio[id=cashreceipt_regist1]').is(':checked')){
	    	$('#cashreceipt_form_area').hide();
	    }
	}
	//-- 현금영수증 개인/사업자 선택
	function setDisplay1(){
	    if($('input:radio[id=cashreceipt_user_type20]').is(':checked')){
	        $('#cashreceipt_mobile_display_area').show();
	        $('#cashreceipt_regno_display_area').hide();
	    }else if($('input:radio[id=cashreceipt_user_type21]').is(':checked')){
	        $('#cashreceipt_regno_display_area').show();
	        $('#cashreceipt_mobile_display_area').hide();
	    }
	}
	
	//-- 쿠폰창 

 	function popup(){
            var url = "../coupon/couponList";
            var name = "coupon";
            var option = "width = 850, height = 900, top = 0, left = 0, location = no"
            window.open(url, name, option);
        } 
	
  	window.onmessage = function(e){

 		var coupon = e.data*1;

 		$("#total_addsale_price_view").html("<strong>"+coupon+"원</strong>");
 		$("#discount2").html("<strong>"+coupon+"원</strong>");
 		
		//-- 최종결제금액
 		var pay = $("#pp").text();
 		pay = removeCommas(pay);
 		pay = pay*1;
 		
 		all = pay-coupon;
 		all = addCommas(all)+"원";
 		$(".Ap").text(all);
 		
 	  } 
 	
 	//-- 적립창 유효성 검사

	 	$("#input_point").blur(function() {
			var memberPoint1 = $("#memberPoint").text();
			var input_point1 = $(this).val();
			
			var memberPoint = memberPoint1*1;
			var input_point = input_point1*1;
			
			if(input_point > memberPoint){
				alert("사용가능한 적립금액을 확인해주세요");
				$("#input_point").val(" ");
				input_point=0;
			}
	
			var coupon1 = $("#c_in").val();
			var coupon = coupon1*1;
			
			var dis = coupon+input_point;
			console.log("dis : " +dis);
	 		
	 		$("#total_addsale_price_view").html("<strong>"+dis+"원</strong>");
	 		$("#discount2").html("<strong>"+dis+"원</strong>");;
	 		
	 		//-- 최종결제금액
	 		var pay = $("#pp").text();
	 		pay = removeCommas(pay);
	 		pay = pay*1;
	 		
	 		all = pay-dis;
	 		all = addCommas(all)+"원";
	 		$(".Ap").text(all);
			
		});

 		
 	
	function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            
            
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                $("#oaddr2").val(extraAddr);
            
            } else {
            	 $("#oaddr2").val(''); 
          /*       document.getElementById("sample6_extraAddress").value = ''; */
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			$("#oaddress").val(data.zonecode);

			$("#oaddr1").val(data.address);
			
			$("#oaddr2").focus();


        }
    }).open();

    }

	function sample6_execDaumPostcode1() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	            
	            
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수

	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }

	            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	            if(data.userSelectedType === 'R'){
	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	                // 조합된 참고항목을 해당 필드에 넣는다.
	                $("#raddr2").val(extraAddr);
	            
	            } else {
	            	 $("#raddr2").val(''); 
	          /*       document.getElementById("sample6_extraAddress").value = ''; */
	            }

	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#raddress").val(data.zonecode);

				$("#raddr1").val(data.address);
				
				$("#raddr2").focus();

	
	        }
	    }).open();

	    }


</script>

<!-- 배송 정보 스크립트 -->		
<script type="text/javascript">
    
        function openAddressList()
        {
            // window.name = "부모창 이름"; 
            window.name = "parentForm";
            // window.open("open할 window", "자식창 이름", "팝업창 옵션");
            window.open("./address_list",
                    "childForm", "width=1000, height=700, resizable = no, scrollbars = no");    
        }
 
</script>

</body>
</html>