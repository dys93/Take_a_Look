<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
.table-content tr > td:nth-child(1) {
	width: 135px;
	text-align: center;
	background: #eee;
}
.table-content tr > td:nth-child(2) {
	padding-left: 10px;
}
.table-content input[type=text], .table-content input[type=file], .table-content textarea {
	width: 97%;
}
</style>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/util.js"></script>
<script type="text/javascript">
    function sendMail() {
        var f = document.mailForm;
        var str;

        str = f.senderName.value;
        if(!str) {
            alert("이름을 입력하세요. ");
            f.senderName.focus();
            return;
        }
        
    	if(!isValidEmail(f.senderEmail.value)) {
            alert("정상적인 E-Mail을 입력하세요. ");
            f.senderEmail.focus();
            return;
    	}
        
    	if(!isValidEmail(f.receiverEmail.value)) {
            alert("정상적인 E-Mail을 입력하세요. ");
            f.receiverEmail.focus();
            return;
    	}
        
    	str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

   		f.action="${pageContext.request.contextPath}/mail/send";

        f.submit();
    }
    
    $(function(){
      	$("body").on("change", "#tb input[name=upload]", function(){
      		if(! $(this).val()) {
      			return;	
      		}
      		
      		var b=false;
      		$("#tb input[name=upload]").each(function(){
      			if(! $(this).val()) {
      				b=true;
      				return false;
      			}
      		});
      		if(b) {
      			return false;
      		}
      		
      		var $tr = $(this).closest("tr").clone(true);
            $tr.find("input").val("");
            $("#tb").append($tr);      		
      	});
    });
    
</script>

<div class="container body-container">
    <div class="body-title">
		<h2><i class="icofont-email"></i> 메일 보내기 </h2>
    </div>
    
    <div class="body-main wx-750 ml-30 pt-15">
		<form name="mailForm" method="post" enctype="multipart/form-data">
		<table class="table table-border table-content">
				
			<tbody id="tb">	
				<tr> 
					<td>보내는사람 이름</td>
					<td> 
						<input type="text" name="senderName" maxlength="100" class="boxTF" value="${sessionScope.member.mName}">
					</td>
				</tr>

				<tr> 
					<td>보내는사람 E-Mail</td>
					<td style="padding-left:10px;"> 
						<input type="text" name="senderEmail" maxlength="100" class="boxTF">
					</td>
				</tr>

				<tr> 
					<td>받는사람 E-Mail</td>
					<td> 
						<input type="text" name="receiverEmail" maxlength="100" class="boxTF">
					</td>
				</tr>

				<tr> 
					<td>제&nbsp;&nbsp;&nbsp;&nbsp;목</td>
					<td> 
						<input type="text" name="subject" maxlength="100" class="boxTF">
					</td>
				</tr>
			
				<tr> 
					<td valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
					<td valign="top"> 
						<textarea name="content" class="boxTA"></textarea>
					</td>
				</tr>
			  
				<tr>
					<td>첨&nbsp;&nbsp;&nbsp;&nbsp;부</td>
					<td> 
						<input type="file" name="upload" class="boxTF">
					</td>
				</tr> 
			</tbody>
		</table>

		<table class="table">
			<tr> 
				<td align="center">
					<button type="button" class="btn btn-dark" onclick="sendMail();">메일 전송</button>
					<button type="reset" class="btn">다시입력</button>
					<button type="button" class="btn" onclick="javascript:location.href='${pageContext.request.contextPath}/';">전송 취소</button>
				</td>
			</tr>
		</table>
		</form>
	</div>

</div>
