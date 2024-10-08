package egovframework.bopr.sim.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.bopr.sim.service.SchdulResultVO;
import egovframework.com.cmm.service.impl.EgovComAbstractDAO;

@Repository(value="SchdulResultDAO")
public class SchdulResultDAO extends EgovComAbstractDAO {

	/**
	 * 일정 실행 결과 목록 조회 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @return List<SchdulResultVO>
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public List<SchdulResultVO> selectSchdulResultList(SchdulResultVO schdulResultVO) throws Exception
	{
		return (List<SchdulResultVO>) list("SchdulResultDAO.selectSchdulResultList", schdulResultVO);
	}

	/**
	 * 일정 실행 결과 목록 Total Count 조회 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @return int
	 * @throws Exception
	 */
	public int selectSchdulResultListTotCnt(SchdulResultVO schdulResultVO) throws Exception
	{
		return (Integer)selectOne("SchdulResultDAO.selectSchdulResultListTotCnt", schdulResultVO);
	}

	/**
	 * 일정 실행 결과 상세 정보 조회 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @return SchdulResultVO
	 * @throws Exception
	 */
	public SchdulResultVO selectSchdulResult(SchdulResultVO schdulResultVO) throws Exception
	{
		return (SchdulResultVO)selectOne("SchdulResultDAO.selectSchdulResult", schdulResultVO);
	}

	/**
	 * 일정 실행 결과 신규 등록 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @throws Exception
	 */
	public void insertSchdulResult(SchdulResultVO schdulResultVO) throws Exception
	{
		insert("SchdulResultDAO.insertSchdulResult", schdulResultVO);
	}

	/**
	 * 일정 실행 결과 수정 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @throws Exception
	 */
	public void updateSchdulResult(SchdulResultVO schdulResultVO) throws Exception
	{
		update("SchdulResultDAO.updateSchdulResult", schdulResultVO);
	}

	/**
	 * 일정 실행 결과 삭제 DAO
	 * @param schdulResultVO SchdulResultVO
	 * @throws Exception
	 */
	public void deleteSchdulResult(SchdulResultVO schdulResultVO) throws Exception
	{
		delete("SchdulResultDAO.deleteSchdulResult", schdulResultVO);
	}
}
