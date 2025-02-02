package egovframework.com.sec.ram.web;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.SessionVO;
import egovframework.com.sec.ram.service.AuthorRoleManage;
import egovframework.com.sec.ram.service.AuthorRoleManageVO;
import egovframework.com.sec.ram.service.EgovAuthorRoleManageService;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

/**
 * 권한별 롤관리에 관한 controller 클래스를 정의한다.
 * @author 공통서비스 개발팀 이문준
 * @since 2009.06.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.03.11  이문준          최초 생성
 *   2011.09.07  서준식          롤 등록시 이미 등록된 경우 데이터 중복 에러 발생 문제 수정
 * </pre>
 */

@Controller
@SessionAttributes(types=SessionVO.class)
public class EgovAuthorRoleController {

    @Resource(name="egovMessageSource")
    EgovMessageSource egovMessageSource;
    
    @Resource(name = "egovAuthorRoleManageService")
    private EgovAuthorRoleManageService egovAuthorRoleManageService;
    
    /** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    /**
	 * 권한 롤 관계 화면 이동
	 * @return "egovframework/com/sec/ram/EgovDeptAuthorList"
	 * @exception Exception
	 */
    @RequestMapping("/sec/ram/EgovAuthorRoleListView.do")
    public String selectAuthorRoleListView() throws Exception {

        return "egovframework/com/sec/ram/EgovAuthorRoleManage";
    } 

	/**
	 * 권한별 할당된 롤 목록 조회
	 * 
	 * @param authorRoleManageVO AuthorRoleManageVO
	 * @return String
	 * @exception Exception
	 */
    @RequestMapping(value="/sec/ram/EgovAuthorRoleList.do")
	public String selectAuthorRoleList(@ModelAttribute("authorRoleManageVO") AuthorRoleManageVO authorRoleManageVO,
			                            ModelMap model) throws Exception {

    	/** paging */
    	PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(authorRoleManageVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(authorRoleManageVO.getPageUnit());
		paginationInfo.setPageSize(authorRoleManageVO.getPageSize());
		
		authorRoleManageVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		authorRoleManageVO.setLastIndex(paginationInfo.getLastRecordIndex());
		authorRoleManageVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());
		
		authorRoleManageVO.setSearchKeyword(authorRoleManageVO.getAuthorCode());
		
		authorRoleManageVO.setAuthorRoleList(egovAuthorRoleManageService.selectAuthorRoleList(authorRoleManageVO));
        model.addAttribute("authorRoleList", authorRoleManageVO.getAuthorRoleList());
        
        int totCnt = egovAuthorRoleManageService.selectAuthorRoleListTotCnt(authorRoleManageVO);
		paginationInfo.setTotalRecordCount(totCnt);
        model.addAttribute("paginationInfo", paginationInfo);

        return "egovframework/com/sec/ram/EgovAuthorRoleManage";
	}
    
	/**
	 * 권한정보에 롤을 할당하여 데이터베이스에 등록
	 * @param authorCode String
	 * @param roleCodes String
	 * @param regYns String
	 * @param authorRoleManage AuthorRoleManage
	 * @return String
	 * @exception Exception
	 */
	@RequestMapping(value="/sec/ram/EgovAuthorRoleInsert.do")
	public String insertAuthorRole(@RequestParam("authorCode") String authorCode,
			                       @RequestParam("roleCode") String roleCodes,
			                       @RequestParam("regYn") String regYns,
			                       @ModelAttribute("authorRoleManage") AuthorRoleManage authorRoleManage,
			                       HttpServletRequest request,
			                         SessionStatus status,
			                         ModelMap model) throws Exception {
		
		authorRoleManage.setRoleCode(roleCodes);
		authorRoleManage.setRegYn(regYns);
		
		if(authorCode.equals("ROLE_ADMIN")){
			model.addAttribute("message", "관리자 권한은 수정할 수 없습니다.");
			return "forward:/sec/ram/EgovAuthorRoleList.do";
    	}else{
    		if(regYns.equals("Y")){
    			egovAuthorRoleManageService.deleteAuthorRole(authorRoleManage);//2011.09.07
    			egovAuthorRoleManageService.insertAuthorRole(authorRoleManage);
    		}else {
    			egovAuthorRoleManageService.deleteAuthorRole(authorRoleManage);
    		}
    	}
		
		
//    	String [] strRoleCodes = roleCodes.split(";");
//    	String [] strRegYns = regYns.split(";");
//    	
//    	authorRoleManage.setRoleCode(authorCode);
//    	
//    	for(int i=0; i<strRoleCodes.length;i++) {
//    		authorRoleManage.setRoleCode(strRoleCodes[i]);
//    		authorRoleManage.setRegYn(strRegYns[i]);
//    		if(strRegYns[i].equals("Y")){
//    			egovAuthorRoleManageService.deleteAuthorRole(authorRoleManage);//2011.09.07
//    			egovAuthorRoleManageService.insertAuthorRole(authorRoleManage);
//    		}else {
//    			egovAuthorRoleManageService.deleteAuthorRole(authorRoleManage);
//    		}
//    	}
//
//        status.setComplete();
//        request.setAttribute("searchKeyword", "우어어어어");
        	
		return "forward:/sec/ram/EgovAuthorRoleList.do";
	}
}