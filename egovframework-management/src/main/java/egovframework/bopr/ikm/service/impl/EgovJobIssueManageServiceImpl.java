package egovframework.bopr.ikm.service.impl;

import java.util.List;

import egovframework.bopr.ikm.service.EgovJobIssueManageService;
import egovframework.bopr.ikm.service.IssueAnwserVO;
import egovframework.bopr.ikm.service.JobIssueManage;
import egovframework.bopr.ikm.service.JobIssueManageVO;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * JobIssue관리에 관한 ServiceImpl 클래스
 * @jobIssue 배치운영환경 김지완
 * @since 2012.07.16
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2012.07.16  김지완          최초 생성
 *
 * </pre>
 */

@Service("egovJobIssueManageService")
public class EgovJobIssueManageServiceImpl extends EgovAbstractServiceImpl implements EgovJobIssueManageService {
    
	@Resource(name="jobIssueManageDAO")
    private JobIssueManageDAO jobIssueManageDAO;

    /**
	 *JobIssue 목록 조회
	 * @param jobIssueManageVO JobIssueManageVO
	 * @return List<JobIssueManageVO>
	 * @exception Exception
	 */
    public List<JobIssueManageVO> selectJobIssueList(JobIssueManageVO jobIssueManageVO) throws Exception {
        return jobIssueManageDAO.selectJobIssueList(jobIssueManageVO);
    }
    
	/**
	 * JobIssue 등록
	 * @param jobIssueManage JobIssueManage
	 * @exception Exception
	 */
    public void insertJobIssue(JobIssueManage jobIssueManage) throws Exception {
    	jobIssueManageDAO.insertJobIssue(jobIssueManage);
    }

    /**
	 * JobIssue 수정
	 * @param jobIssueManage JobIssueManage
	 * @exception Exception
	 */
    public void updateJobIssue(JobIssueManage jobIssueManage) throws Exception {
    	jobIssueManageDAO.updateJobIssue(jobIssueManage);
    }
    
    /**
	 * 이슈 상태만 수정
 	 * @param jobIssueManage JobIssueManage
	 * @exception Exception
	 */
	public void updateIssueSttus(JobIssueManage jobIssueManage) throws Exception{
		jobIssueManageDAO.updateIssueSttus(jobIssueManage);
	}

    /**
	 * JobIssue 삭제
	 * @param jobIssueManage JobIssueManage
	 * @exception Exception
	 */
    public void deleteJobIssue(JobIssueManage jobIssueManage) throws Exception {
    	jobIssueManageDAO.deleteJobIssue(jobIssueManage);
    }

    /**
	 * JobIssue 조회
	 * @param jobIssueManageVO JobIssueManageVO
	 * @return int
	 * @exception Exception
	 */
    public int selectJobIssueListTotCnt(JobIssueManageVO jobIssueManageVO) throws Exception {
        return jobIssueManageDAO.selectJobIssueListTotCnt(jobIssueManageVO);
    }

    /**
	 * JobIssue 조회
	 * @param jobIssueManageVO JobIssueManageVO
	 * @return JobIssueManageVO
	 * @exception Exception
	 */
    public JobIssueManageVO selectJobIssue(JobIssueManageVO jobIssueManageVO) throws Exception {
    	JobIssueManageVO resultVO = jobIssueManageDAO.selectJobIssue(jobIssueManageVO);
        if (resultVO == null){
        	throw processException("info.nodata.msg");
        }
            
        return resultVO;
    }
  
	/**
	 * 해당 이슈에 대한 답글을 조회
	 * @param issueAnwserVO IssueAnwserVO
	 * @return List<IssueAnwserVO>
	 * @exception Exception
	 */
	public List<IssueAnwserVO> selectIssueAnswerList(IssueAnwserVO issueAnwserVO) throws Exception{
		return jobIssueManageDAO.selectIssueAnswerList(issueAnwserVO);
	}
	
    /**
	 * 해당 이슈에 대한 답글을 입력
	 * @param issueAnwserVO IssueAnwserVO
	 * @exception Exception
	 */
	public void insertIssueAnswer(IssueAnwserVO issueAnwserVO) throws Exception {
		jobIssueManageDAO.insertIssueAnswer(issueAnwserVO);
	}
	
	/**
	 * 해당 이슈에 대한 답글을 수정
	 * @param issueAnwserVO IssueAnwserVO
	 * @exception Exception
	 */
	public void updateIssueAnswer(IssueAnwserVO issueAnwserVO) throws Exception{
		jobIssueManageDAO.updateIssueAnswer(issueAnwserVO);
	}
	
	/**
	 * 해당 이슈에 대한 답글을 삭제
	 * @param issueAnwserVO IssueAnwserVO
	 * @exception Exception
	 */
	public void deleteIssueAnswer(IssueAnwserVO issueAnwserVO) throws Exception{
		jobIssueManageDAO.deleteIssueAnswer(issueAnwserVO);
	}

//    
//    /**
//	 * 모든 권한목록을 조회한다.
//	 * @param jobIssueManageVO JobIssueManageVO
//	 * @return List<JobIssueManageVO>
//	 * @exception Exception
//	 */
//	public List<JobIssueManageVO> selectJobIssueAllList(JobIssueManageVO jobIssueManageVO) throws Exception {
//    	return jobIssueManageDAO.selectJobIssueAllList(jobIssueManageVO);
//    }
}
