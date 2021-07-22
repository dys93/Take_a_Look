<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    

<div class="petsitReserve">
		<h6>예약 가능 날짜</h6>
			<table style="width: 300px; border-spacing: 0;" >	
				<tr height="35">
					<td align="center">
						<span class="btnDate btnChange" data-date="${preMonth}">＜</span>
						<span class="titleDate">${year}년${month}월</span>
						<span class="btnDate btnChange" data-date="${nextMonth}">＞</span>
					</td>
				</tr>
			</table>	
			
			<table id="smallCalendar" style="width: 300px; margin-top:5px; border-spacing: 1px; background: #ccc; " >
				<tr align="center" height="33" bgcolor="#fff" style="font-size: 14px;">
					<td width="40" style="color:#ff0000;">일</td>
					<td width="40">월</td>
					<td width="40">화</td>
					<td width="40">수</td>
					<td width="40">목</td>
					<td width="40">금</td>
					<td width="40" style="color:#0000ff;">토</td>
				</tr>
									   		
				<c:forEach var="row" items="${days}" >
					<tr align="left" height="37" bgcolor="#fff">
						<c:forEach var="d" items="${row}">
							<td align="center" class="tdDay">
								${d}
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</table>
			<div class="scheduleBottom">
				<div class="bottom">
					<div class="boxL"></div>
					<p>이용 가능 날짜</p>
				</div>
				<div class="bottom">
					<div class="boxR"></div>
					<p>예약 불가 날짜</p>
				</div>
			</div>		
</div>				