<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%pageContext.setAttribute("crlf", "\r\n"); %>
<%
 /**
  * @Class Name : EgovStplatCnfirm.jsp
  * @Description : 약관확인 JSP
  * @Modification Information
  * @
  * @  수정일         수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.03.31    조재영          최초 생성
  *
  *  @author 공통서비스 개발팀 조재영
  *  @since 2009.03.31
  *  @version 1.0
  *  @see
  *  
  */
%>

<script type="text/javaScript" language="javascript" defer="defer">

function fnAgree(){
	var checkField = document.stplatForm.checkField;
    if(checkField) {
        if(checkField.length > 1) {
            for(var i=0; i < checkField.length; i++) {
                if(checkField[i].checked) {
                }else{
                    alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                    checkField[i].focus();
                    return;
                }
            }
        } else {
            if(checkField.checked) {
            }else{
            	alert("약관에 동의하지 않으면 회원으로 가입할 수 없습니다.");
                checkField[i].focus();
                return;
            }
        }
    }
    
    //실명인증 기본페이지는 주민번호 실명확인으로 한다.
    //패키지 변경 document.stplatForm.action = "<c:url value='/uss/umt/EgovRlnmCnfirm.do'/>";
    //document.stplatForm.action = "<c:url value='/sec/rnc/EgovRlnmCnfirm.do'/>";
    document.stplatForm.action = "<c:url value='/main/Join.do'/>";
    document.stplatForm.submit();
}

function fnDisAgree(){
	alert("약관에 동의하지 않으면 회원가입을 하실수 없습니다.");
	return;
}

</script>

<!-- content start -->
<form name="stplatForm" method="post" >
<input type="hidden" name="sbscrbTy" value="${sbscrbTy}"/>
<!-- 실명인증의 기본옵션은 주민번호 실명확인임 : 주민번호 실명인증 으로 가기위한 초기화값 -->
<input type="hidden" name="ihidnum" value=""/>
<input type="hidden" name="realname" value=""/>
<!-- 실명인증후 다음단계에 대한 셋팅정보 -->
<input type="hidden" name ="nextUrlName" value="button.subscribe"/>
<input type="hidden" name ="nextUrl" value=
<c:if test="${sbscrbTy == 'USR01'}">"/uss/umt/EgovMberSbscrbView.do"</c:if>
<c:if test="${sbscrbTy == 'USR02'}">"/uss/umt/EgovEntrprsMberSbscrbView.do"</c:if>
<c:if test="${empty sbscrbTy}">""</c:if>
/>

<!-- 회원 양식 -->
<input name="userId" id="userId" type="hidden" value="<c:out value='${userManage.userId}'/>"/>
<input name="userNm" id="userNm" type="hidden" value="<c:out value='${userManage.userNm}'/>"/>
<input name="password" id="password" type="hidden" value="<c:out value='${userManage.password}'/>"/>  
<input name="deptId" id="deptId" type="hidden" value="<c:out value="${userManage.deptId}"/>"/>
<input name="moblphonNo" id="moblphonNo" type="hidden" value="<c:out value="${userManage.moblphonNo}"/>"/>
<input name="adres" id="adres" type="hidden" value="<c:out value="${userManage.adres}"/>" size="20"/>
<input name="imageFile" id="imageFile" type="hidden" value="<c:out value="${userManage.imageFile}"/>"/>
<input name="emails" id="emails" type="hidden" value="<c:out value="${userManage.emails}"/>"/>
		
<div class="contsBody">
	<h2>회원가입</h2>
	<div class="location">회원가입 > <strong>약관동의</strong></div>
	
	<div class="bbsDetail">
		<table summary="약관내용, 약관내용동의, 정보사용동의내용, 정보사용동의 순으로 보여지는 회원가입 약관동의입니다.">
		<colgroup>
			<col style="width:100" >
			<col style="width:auto" >
		</colgroup>
		<tbody>
		<c:forEach var="result" items="${stplatList}" varStatus="status">
	    <tr>
	    	<th rowspan="2" align="center">약관내용</th>
			
			<td>
				<label for="useStplatCn" class="disp_none">약관내용</label>   
                <textarea id="useStplatCn" cols="150" rows="30" readonly="readonly">
                	<c:out value="${result.useStplatCn}" escapeXml="false" />
                </textarea>
            </td>
        </tr>
        <tr>
		    <td>
		    	<label for="checkField" class="disp_none">약관내용동의</label>
				<input name="checkField" type="checkbox" title="약관내용" >약관내용에 동의합니다.
                <input name="checkuseStplatCn" type="hidden" value="<c:out value='${result.useStplatId}'/>">
            </td>
        </tr>
        <tr>
        	<th rowspan="2" align="center">정보동의내용</th>
        	
        	<td>
        		<label for="infoProvdAgeCn" class="disp_none">정보동의내용</label>
                <textarea id="infoProvdAgeCn" cols="150" rows="30" readonly="readonly">
                	<c:out value="${result.infoProvdAgeCn}" escapeXml="false" />
                </textarea>
            </td>
        </tr>
        <tr>
            <td>
            	<label for="checkField" class="disp_none">정보사용동의</label>
                <input name="checkField" title="정보동의내용"  type="checkbox">정보이용내용에 동의합니다.
                <input name="checkinfoProvdAgeCn" type="hidden" value="<c:out value='${result.useStplatId}'/>">
            </td>
        </tr>
        </c:forEach>
        
		</tbody>
		</table>
	</div>
	
	<div class="Btn">
		<span class="bbsBtn"><a href="javascript:fnAgree();" title="내용에 동의하고 사용자 등록 완료"><spring:message code="button.agree" /></a></span>
		<span class="bbsBtn"><a href="javascript:fnDisAgree();" title="비동의 메세지 팝업"><spring:message code="button.disagree" /></a></span>
	</div>
</div>
<br><br>
</form>
