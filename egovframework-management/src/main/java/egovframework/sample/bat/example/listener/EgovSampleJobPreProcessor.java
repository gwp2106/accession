/*
 * Copyright 2006-2007 the original author or authors. *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.sample.bat.example.listener;

import org.egovframe.rte.bat.core.listener.EgovJobPreProcessor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.core.JobExecution;

/**
 * 잡 단계 이전에 호출되는 리스너 클래스
 *
 * @author 배치실행개발팀
 * @since 2012.06.27
 * @version 1.0
 * @see <pre>
 *      개정이력(Modification Information)
 *
 *   수정일      수정자           수정내용
 *  ------- -------- ---------------------------
 *  2012.06.27  배치실행개발팀     최초 생성
 * </pre>
 */
public class EgovSampleJobPreProcessor extends EgovJobPreProcessor {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovSampleJobPreProcessor.class);

	/**
	 * Job 수행 이전에 호출되는 부분
	 */
	public void beforeJob(JobExecution jobExecution) {

		LOGGER.info(">>>>>>>> beforeJob :::  Start {}", jobExecution.getJobInstance().getJobName());
	}

}
