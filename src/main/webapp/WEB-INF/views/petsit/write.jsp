<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');

@font-face {/*본문 내용*/
    font-family: 'Cafe24SsurroundAir';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {/*강조하는 곳*/
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>

<script type="text/javascript">
//수정시 등록되어있는 이미지 삭제하기 
<c:if test="${mode=='update'}"> 
$(function(){
	$(".delete-img").click(function(){ //이미지를 클릭하면 
		if(! confirm("이미지를 삭제 하시겠습니까 ?")) { //삭제여부 물어봄
			return false;
		}
		var $img = $(this);
		var petImgNum = $img.attr("data-petImgNum");
		var url="${pageContext.request.contextPath}/petsit/deleteFile";
		$.post(url, {petImgNum:petImgNum}, function(data){
			$img.remove();
		}, "json");
		
	});
});
</c:if>


function sendOk() {
    var f = document.petsitForm;

    var str = f.petTitle.value;
    if(!str) {
        alert("제목을 입력하세요. ");
        f.petTitle.focus();
        return;
    }

    str = f.petContent.value;
    if(!str) {
       alert("소개글을 입력하세요. ");
       f.petContent.focus();
        return;
    }
        
    var mode="${mode}";
    if(mode=="write"||mode=="update" && f.upload.value!="") {
    	if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {
    		alert('파일 형식이 올바르지 않습니다. 이미지 파일만 첨부 가능합니다.');
    		f.upload.focus();
    		return;
    	}
    }
    	
    f.action="${pageContext.request.contextPath}/petsit/${mode}";
	//action: 폼 데이터(form data)를 서버로 보낼 때 해당 데이터가 도착할 URL을 명시
        		
	f.submit(); 
 }
    
function deleteSend() {
    var query = "petNum=${dto.petNum}&${query}";
    var url = "${pageContext.request.contextPath}/petsit/delete?" + query;
    	
    if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
    	location.href=url;
    }
}
    
</script>

<div class="petsitWrite" align="center">
<div class="body"  style="width: 1300px; min-height: 1580px;">
	<div class="write"><h3>펫시터  소개글 작성</h3></div>
	<div class="body-title">
		<form name="petsitForm" method="post" enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td class="ahead">제&nbsp;&nbsp;&nbsp;목</td>
				<td class="needVer"><span class="tip">작성 tip!</span> &nbsp;&nbsp;&nbsp; 펫시터를 하면서 중요하게 생각하는 단어를 포함시켜 작성해 보세요! <td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="text" name="petTitle" maxlength="800" class="NboxTF" value="${dto.petTitle}">
				</td>
			</tr>
			<tr>
				<td class="ahead">작성자</td>
				<td class="needVer">
					${sessionScope.member.mNick}
				</td>
			</tr>
			<tr>
				<td class="ahead">근무 주소</td>
				<td>
					<input type="text" name="petAddr" class="boxShort" placeholder="시, 구, 동 순으로 입력해 주세요">
				</td>
			</tr>
			<tr>
				<td class="ahead">소&nbsp;&nbsp;&nbsp;개</td>
				<td class="needVer">
					<span class="tip">작성 tip!</span> &nbsp;&nbsp;&nbsp; 펫시터를 시작하게 된 계기와 케어에 대한 정보를 제공해 주세요!  
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<textarea name="petContent" class="boxContent">${dto.petContent}</textarea>
				</td>
			</tr>
			<tr>
				<td class="ahead">기본&nbsp;&nbsp;&nbsp;옵션</td>
				<td class="needVer"><span class="tip">작성 tip!</span> &nbsp;&nbsp;&nbsp; 조건들을 정확하게 선택하여 주시고 이외 조건이 있다면 소개글에!  <td>
			</tr>	
			<tr>
				<td rowspan="7"></td>
				<td>
					<div class="spaceNeed">반려동물</div>
					<label><input type="radio" name="petYN" value="0" checked="checked"> 예 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="petYN" value="1"> 아니오</label>
				</td>
			</tr>			
			<tr>
				<td>	
					<div class="spaceNeed">대형견</div>
					<label><input type="radio" name="petLarge" value="1" checked="checked"> 가능 </label>&nbsp;&nbsp;&nbsp;				
					<label><input type="radio" name="petLarge" value="0"> 불가능 </label>
				</td>
			</tr>
			<tr>
				<td>	
					<div class="spaceNeed">마당</div>
					<label><input type="radio" name="petYard" value="1" checked="checked"> 있음 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="petYard" value="0"> 없음 </label>
				</td>
			</tr>
			<tr>
				<td>	
					<div class="spaceNeed">가족형태</div>
					<label><input type="radio" name="petFamily" value="1" checked="checked"> 2인 이하 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="petFamily" value="2"> 3인 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="petFamily" value="3"> 4인 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="petFamily" value="4"> 4인 초과 </label>
				</td>
			</tr>
			<tr>
				<td>	
					<div class="spaceNeed">산책로</div>
					<label><input type="radio" name="petWalk" value="1" checked="checked"> 있음 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="petWalk" value="0"> 없음 </label>
				</td>
			</tr>	
			<tr>
				<td>	
					<div class="spaceNeed">주거형태</div>&nbsp;
					<label><input type="radio" name="petLiving" value="1" checked="checked"> 아파트 </label>&nbsp;&nbsp;&nbsp;				
					<label><input type="radio" name="petLiving" value="2"> 단독주택 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="petLiving" value="3"> 빌라 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="petLiving" value="4"> 오피스텔 </label>
				</td>
			</tr>		
			<tr>
				<td>	
					<div class="spaceNeed">자녀</div>
					<label><input type="radio" name="petChild" value="1" checked="checked"> 없음 </label>&nbsp;&nbsp;&nbsp; 				
					<label><input type="radio" name="petChild" value="2"> 미취학아동 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="radio" name="petChild" value="3"> 초등생 </label>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>	
			<tr>
				<td class="spaceNeed ahead">	
					근무가능요일
				</td>
				<td>
					<label><input type="checkbox" name="mon" value="1"> 월 </label>&nbsp;&nbsp;&nbsp;				
					<label><input type="checkbox" name="tue" value="1"> 화 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" name="wed" value="1"> 수 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" name="thu" value="1"> 목 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" name="fri" value="1"> 금 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" name="sat" value="1"> 토 </label>&nbsp;&nbsp;&nbsp;
					<label><input type="checkbox" name="sun" value="1"> 일 </label>&nbsp;&nbsp;&nbsp;
				</td>
			</tr>		
			<tr>
				<td class="spaceNeed ahead">	
					자격증 취득일			
				</td>
				<td>
					<input type="date" name="petCertif" maxlength="20"  class="boxTF"> 
				</td>
			</tr>
			<tr>
				<td class="ahead">집사진 3장 첨부</td>
				<td>
					<input type="file" name="upload" class="boxTF" multiple="multiple"><span><span class="tip">작성 tip!</span>&nbsp;&nbsp;&nbsp;강아지를 위한 공간이 있음을 강조해 보세요!</span>
				</td>
			</tr>
			<c:if test="${mode=='update'}">
				<tr id="${vo.petNum}">
					<td>첨부된파일</td>
					<td>
						<div class="uploadedImg">
							<c:forEach var="vo" items="${listFile}">
								<img class="delete-img" src="${pageContext.request.contextPath}/upload/petsit/${vo.petImg}"
									data-petImgNum="${vo.petImgNum}">
							</c:forEach>
						</div>		
					</td>
				</tr>
			</c:if>	
			<tr>
				<td class="ahead needVer" style="width:60px;">계좌 번호</td>
				<td>
					<input type="text" name="petAct" class="boxShort needCol" placeholder="급여용 계좌번호 입력란">
				</td>
			</tr>	
		</table>		
		
		<table class="table table-footer">
			<tr>
				<td>
					<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/petsit/list';">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="petNum" value="${dto.petNum}">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="mId" value="${dto.mId}">
					</c:if>
				</td>
			</tr>
		</table>	
		</form>
	</div>
</div>
</div>