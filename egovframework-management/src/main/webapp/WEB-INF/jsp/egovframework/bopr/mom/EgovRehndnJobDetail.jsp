<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<%
 /**
  * @Class Name : EgovExecutJobDetail.jsp
  * @Description : 재처리 Job 관리 상세 화면
  * @Modification Information
  * @
  * @  수정일           수정자          수정내용
  * @ -------    --------  ---------------------------
  * @ 2012.07.18 유현웅           최초 생성
  *
  *  @author 유현웅
  *  @since 2012.07.18
  *  @version 1.0 
  *  @see
  */
%>
<c:set var="registerFlag" value="${'UPDATE'}"/>
<c:set var="registerFlagName" value="${'재처리 Job 관리 상세'}"/>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<!-- 
<validator:javascript formName="executJob" staticJavascript="false" xhtml="true" cdata="false"/>
--Validation 부분 이후 추가 필요
 -->
<script type="text/javaScript" language="javascript">
function fncSelectRehndnJobList() {
	var varFrom = document.getElementById("executJobManage");
	varFrom.action = "<c:url value='/bopr/mom/EgovRehndnJobList.do'/>";
	varFrom.submit();       
}

function fncExecutResultRestart()
{
	var varFrom = document.getElementById("executJobManage");
	varFrom.action = "<c:url value='/bopr/mom/insertRehndn.do' />";
	varFrom.submit();
}
function fncReturn() {
	history.back();
}
</script>

<form:form name="executJobManage" modelAttribute="executJobManage" method="post">
<div class="contsBody">
	<h2>재처리 관리</h2>
	<div class="location">배치운영 > 재처리 관리 > <strong>상세정보</strong></div>

	<div class="Btn">
		<span class="bbsBtn"><a title="재처리관리 목록" href="javascript:fncSelectRehndnJobList()">목록</a></span>
		<span class="bbsBtn"><a title="재처리 수행" href="javascript:fncExecutResultRestart()">재처리</a></span>
	</div>

	<div class="bbsDetail">
		<table  summary="배치명, Job 실행 ID, 인스턴스ID, 버전, 수행일시, 종료일시, 상태, 수행결과코드, 수행결과메세지, 최종수정시점 등의 재처리Job관리 상세정보입니다.">
		<caption>재처리Job관리 상세정보</caption>
		<colgroup>
			<col style="width:20%" >
			<col style="width:auto" >
		</colgroup>
		<tbody>
		<tr>
			<th><img src="/images/egovframework/bopr/blt4.gif" alt="필수입력" />배치명</th>
			<td>
			<label for="jobName" class="disp_none">배치명</label>
			<input name="jobName" id="jobName" title="배치명" type="text" readonly value="<c:out value='${executJob.jobName}'/>" maxLength = "13" size="20" /></td>
		</tr>
		<tr>
			<th><img src="/images/egovframework/bopr/blt4.gif" alt="필수입력" />Job 실행 ID</th>
			<td>
			<label for="jobExecutionId" class="disp_none">Job 실행 ID</label>
			<input name="jobExecutionId" id="jobExecutionId" title="Job 실행 ID" type="text" readonly value="<c:out value='${executJob.jobExecutionId}'/>" maxLength = "13" size="20" /></td>
		</tr>
		<tr>
			<th><img src="/images/egovframework/bopr/blt4.gif" alt="필수입력" />Job 인스턴스 ID</th>
			<td>
			<label for="jobInstanceId" class="disp_none">Job 인스턴스 ID</label>
			<input name="jobInstanceId" id="jobInstanceId" title="Job 인스턴스 ID" type="text" readonly value="<c:out value='${executJob.jobInstanceId}'/>"  maxLength="13" size="20" />
     		</td>
		</tr>
		<tr>
			<th>버전</th>
			<td>
			<label for="version" class="disp_none">버전</label>
			<input name="version" id="version" title="버전" type="text" readonly value="<c:out value='${executJob.version}'/>" maxLength="10" size="20" /></td>
		</tr>
		<tr>
			<th>수행일시</th>
			<td>
			<label for="startTime" class="disp_none">수행일시</label>
			<input name="startTime" id="startTime" title="수행일시" type="text" readonly value="<c:out value="${executJob.startTime}"/>" maxLength="18" size="20" /></td>
		</tr>
		<tr>
			<th>종료일시</th>
			<td>
			<label for="endTm" class="disp_none">종료일시</label>
			<input name="endTm" id="endTm" title="종료일시" type="text" value="<c:out value="${executJob.endTm}"/>" maxLength="20" size="20" readonly /></td>
		</tr>
		<tr>
			<th>상태</th>
			<td>
			<label for="sttus" class="disp_none">상태</label>
			<input name="sttus" id="sttus" title="상태" type="text" value="<c:out value="${executJob.sttus}"/>" maxLength="80" size="20" readonly /></td>
		</tr>
		<tr>
			<th>수행결과코드</th>
			<td>
			<label for="exitCode" class="disp_none">수행결과코드</label>
			<input name="exitCode" id="exitCode" title="수행결과코드" type="text" value="<c:out value="${executJob.exitCode}"/>" maxLength="20"size="20" readonly/></td>
		</tr>
		<tr>
			<th>수행결과메세지</th>
			<td>
			<label for="exitMessage" class="disp_none">수행결과메세지</label>
			<textarea name="exitMessage" id="exitMessage" title="수행결과메세지" readonly="readonly" rows="5" cols="80"><c:out value="${executJob.exitMessage}"/></textarea>
			</td>
		</tr>
		<tr>
			<th>최종수정시점</th>
			<td>
			<label for="lastUpdtPnttm" class="disp_none">최종수정시점</label>
			<input name="lastUpdtPnttm" id="lastUpdtPnttm" title="최종수정시점" type="text" value="<c:out value="${executJob.lastUpdtPnttm}"/>" maxLength="20" size="20" readonly/></td>
		</tr>
		</tbody>
		</table>
	</div>
</div>

<!-- 검색조건 유지 -->
<input type="hidden" name="searchCondition" value="<c:out value='${executJobVO.searchCondition}'/>"/>
<input type="hidden" name="searchKeyword" value="<c:out value='${executJobVO.searchKeyword}'/>"/>
<input type="hidden" name="pageIndex" value="<c:out value='${executJobVO.pageIndex}'/>"/>
<input type="hidden" name="message" value="<c:out value='${message}'/>"/>
</form:form>