<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Footer -->
<style>
.footer{
	border-top: 1px solid #ececec;
    background: #f1f1f1;
    width: 100%;
    margin: 0px auto 0;
    padding-top: 60px;
    padding-right: 0px;
    padding-bottom: 80px;
    padding-left: 0px;
    min-height: 300px;
}
.footer p  {
	padding: 0;
}

.xans-layout-footer {
    width: 1160px;
    margin: 0 auto;
    line-height: 22px;
    font-size: 14px;
    color: #747474;
}
#btm_cs {
    float: left;
    margin: 0 20px 0 60px;
}
#btm_cs .tel {
    color: #333;
    font-size: 29px;
    margin: 10px 0;
    font-family: mst500;
}
#btm_cs .title {
    margin: 0 0 5px;
    color: #b0b0b0;
}
#btm_cs p {
    margin: 0;
    color: #333;
}
#btm_bank {
    float: left;
    margin: 0 20px 0 100px;
}
#btm_bank .title {
    margin: 0 0 5px;
    color: #b0b0b0;
}
#btm_bank p {
    margin: 0;
    font-size: 14px;
    color: #333;
}
#btm_company {
    float: left;
    margin: 0 20px 0 100px;
}
#btm_company .title {
    margin: 0 0 5px;
    color: #b0b0b0;
}
#btm_company span {
    margin: 2px 0;
    color: #333;
}

#btm_bank .line, #btm_company .line, #btm_cs .line, #btm_menu .line {
    border-top: 1px solid #b0b0b0;
    width: 30px;
    margin-bottom: 10px;
}


</style>


	<div class="footer">
	<div class="xans-element- xans-layout xans-layout-footer"><!-- // 하단 회사정보1 -->
<div id="btm_cs" class="">
        <p class="line"></p>
        <p class="title"><i class="fas fa-phone"></i> CUSTOMER CENTER</p> 
        <p class="tel"> 02-336-8546</p> <!-- // 관리자 설정 시 자동노출 // -->
        <p></p> <!-- // 관리자 설정 시 자동노출 // -->
    </div>
<div id="btm_bank">
        <p class="line"></p>
        <p class="title"><i class="fas fa-money-check"></i> BANK INFO</p>
        <p>신한은행 110-412-123456</p> <!-- // 입금계좌2 // --> <!-- // 미사용시 주석으로 숨김처리하시거나 삭제해 주세요 // -->
        <p>예금주 : (주) take a look</p> <!-- // 예금주 // --> 
    </div>
<!-- 하단 회사정보1 //-->
<!-- // 하단 회사정보2 -->
<div id="btm_company" class="">
        <p class="line"></p>
        <p class="title"><i class="fas fa-building"></i> COMPANY INFO</p>
        <span>상호 : take a look </span> / <span>대표 : 정주희</span> / <span>전화 :02-336-8546</span> / <span>팩스 : </span><br/><span>사업자 등록번호 : [123-45-67890]</span> <br/><span>통신판매업신고 제1234-서울마포-1234호</span> <br/><span>주소 : 서울특별시 마포구 월드컵북로 21 풍성빌딩 2,3,4층 쌍용강북교육센터</span><br/><span>개인정보관리책임자 : <a href="#">정주희(takealook@naver.com)</a></span><br/><span>Copyright take a look. All rights reserved.</span>
    </div>
</div>
	
	</div>
