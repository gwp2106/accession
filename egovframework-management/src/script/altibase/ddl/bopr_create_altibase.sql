﻿
DROP TABLE TN_BATCH_EXECUT_PARAMTR ;


DROP TABLE TN_BATCH_DLBRT_ATCH_FILE ;



DROP TABLE TN_BATCH_ATCH_FILE ;



DROP TABLE TN_BATCH_BEAN ;



DROP TABLE TN_NTFCINFO ;



DROP TABLE TN_SCHDUL_RESULT ;



DROP TABLE TN_JOB_DLBRT_RESULT ;



DROP TABLE TN_SMSRECPTN ;



DROP TABLE TC_CMMNDETAILCODE ;



DROP TABLE TC_CMMNCODE ;



DROP TABLE TC_CMMNCLCODE ;



DROP TABLE TE_BOPRSEQ ;



DROP TABLE TN_STPLATINFO ;



DROP TABLE TN_AUTHORROLERELATE ;



DROP TABLE TN_ROLEINFO ;



DROP TABLE TN_EMPLYRSCRTYESTBS ;



DROP TABLE TN_FILEDETAIL ;



DROP TABLE TN_FILE ;



DROP TABLE TN_ROLES_HIERARCHY ;



DROP TABLE TN_AUTHORINFO ;



DROP TABLE TN_USERS ;



DROP TABLE TN_KNWLDG_CMT ;



DROP TABLE TN_SETUP ;



DROP TABLE TN_BATCH_EXECUT ;



DROP TABLE TN_BATCH_PARAMTR ;



DROP TABLE TN_REHNDN ;



DROP TABLE TH_SCHDUL ;



DROP TABLE TN_SCHDUL ;



DROP TABLE TN_SCHDUL_PARAMTR ;



DROP TABLE TN_NTCN ;



DROP TABLE TN_NTCN_RECPTN ;



DROP TABLE TN_KNWLDG ;



DROP TABLE TN_SMS ;



DROP TABLE TN_ISSUE ;



DROP TABLE TN_ISSUE_CMT ;



DROP TABLE TN_FTP_INTRLCK ;



DROP TABLE TN_EMAIL_INTRLCK ;



DROP TABLE TN_BATCH_DLBRT_RESULT ;



DROP TABLE TN_BATCH_DLBRT ;



DROP TABLE TN_JOB_DLBRT ;



DROP TABLE TH_BATCH ;



DROP TABLE TN_BATCH ;




CREATE TABLE TN_BATCH_EXECUT_PARAMTR
(
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	PARAMTR_NM            VARCHAR2(255)  NULL ,
	PARAMTR               VARCHAR2(255)  NULL ,
	BATCH_EXECUT_NO       VARCHAR2(20)  NOT NULL 
);




ALTER TABLE TN_BATCH_EXECUT_PARAMTR
	ADD CONSTRAINT  XPK배치실행파라미터 PRIMARY KEY (BATCH_EXECUT_NO,BATCH_ID, PARAMTR_NM);



CREATE TABLE TC_CMMNCLCODE
(
	CL_CODE               CHAR(3)  NOT NULL ,
	CL_CODE_NM            VARCHAR2(60)  NULL ,
	CL_CODE_DC            VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TC_CMMNCLCODE
	ADD CONSTRAINT  XPK분류코드 PRIMARY KEY (CL_CODE);



CREATE TABLE TC_CMMNCODE
(
	CODE_ID               VARCHAR2(6)  NOT NULL ,
	CL_CODE               CHAR(3)  NOT NULL ,
	CODE_ID_NM            VARCHAR2(60)  NULL ,
	CODE_ID_DC            VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TC_CMMNCODE
	ADD CONSTRAINT  XPK코드 PRIMARY KEY (CODE_ID);



CREATE INDEX XIF1코드 ON TC_CMMNCODE
(CL_CODE  ASC);



CREATE TABLE TC_CMMNDETAILCODE
(
	CODE_ID               VARCHAR2(6)  NOT NULL ,
	CODE                  VARCHAR2(15)  NOT NULL ,
	CODE_NM               VARCHAR2(60)  NULL ,
	CODE_DC               VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TC_CMMNDETAILCODE
	ADD CONSTRAINT  XPK코드상세 PRIMARY KEY (CODE_ID,CODE);



CREATE INDEX XIF1코드상세 ON TC_CMMNDETAILCODE
(CODE_ID  ASC);



CREATE TABLE TE_BOPRSEQ
(
	TABLE_NAME            VARCHAR2(20)  NOT NULL ,
	NEXT_ID               NUMBER(30)  NULL 
);





ALTER TABLE TE_BOPRSEQ
	ADD CONSTRAINT  XPK아이디 PRIMARY KEY (TABLE_NAME);



CREATE TABLE TH_BATCH
(
	BATCH_NO              VARCHAR2(20)  NOT NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	BATCH_NM              VARCHAR2(100)  NULL ,
	BATCH_DC              VARCHAR2(1000)  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NULL ,
	DELETE_AT             CHAR(1)  NULL ,
	JOB_SE_CODE           CHAR(6)  NULL ,
	ONLINE_EXECUT_AT      CHAR(1)  NULL
);





ALTER TABLE TH_BATCH
	ADD CONSTRAINT  XPK배치마스타이력 PRIMARY KEY (BATCH_NO,BATCH_ID);



CREATE INDEX XIF1배치마스타이력 ON TH_BATCH
(BATCH_ID  ASC);



CREATE TABLE TH_SCHDUL
(
	SCHDUL_NM             VARCHAR2(255)  NULL ,
	EXECUT_CYCLE          VARCHAR2(2)  NULL ,
	EXECUT_SCHDUL_DE      CHAR(20)  NULL ,
	SCHDUL_REGIST_PNTTM   DATE  NOT NULL ,
	SCHDUL_NO             VARCHAR2(20)  NOT NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	EXECUT_SCHDUL_HOUR    CHAR(2)  NULL ,
	EXECUT_SCHDUL_MNT     CHAR(2)  NULL ,
	EXECUT_SCHDUL_SECND   CHAR(2)  NULL 
);





ALTER TABLE TH_SCHDUL
	ADD CONSTRAINT  XPK일정이력 PRIMARY KEY (SCHDUL_REGIST_PNTTM,SCHDUL_NO,BATCH_ID);



CREATE INDEX XIF1일정이력 ON TH_SCHDUL
(SCHDUL_NO  ASC,BATCH_ID  ASC);



CREATE TABLE TN_AUTHORINFO
(
	AUTHOR_CODE           VARCHAR2(30)  NOT NULL ,
	AUTHOR_NM             VARCHAR2(50)  NULL ,
	AUTHOR_DC             VARCHAR2(100)  NULL ,
	AUTHOR_CREAT_DE       DATE  NULL 
);





ALTER TABLE TN_AUTHORINFO
	ADD CONSTRAINT  XPK권한정보 PRIMARY KEY (AUTHOR_CODE);



CREATE TABLE TN_AUTHORROLERELATE
(
	ROLE_CODE             VARCHAR2(50)  NOT NULL ,
	AUTHOR_CODE           VARCHAR2(30)  NOT NULL ,
	CREAT_DT              DATE  NULL 
);





ALTER TABLE TN_AUTHORROLERELATE
	ADD CONSTRAINT  XPK권한롤관계 PRIMARY KEY (ROLE_CODE,AUTHOR_CODE);



CREATE INDEX XIF1권한롤관계 ON TN_AUTHORROLERELATE
(ROLE_CODE  ASC);



CREATE INDEX XIF2권한롤관계 ON TN_AUTHORROLERELATE
(AUTHOR_CODE  ASC);



CREATE TABLE TN_BATCH
(
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	BATCH_NM              VARCHAR2(100)  NULL ,
	BATCH_DC              VARCHAR2(1000)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NULL ,
	ONLINE_EXECUT_AT      CHAR(1)  NULL ,
	DELETE_AT             CHAR(1)  NULL ,
	JOB_SE_CODE           CHAR(6)  NULL 
);





ALTER TABLE TN_BATCH
	ADD CONSTRAINT  XPK배치마스타 PRIMARY KEY (BATCH_ID);



CREATE TABLE TN_BATCH_ATCH_FILE
(
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	ATCH_FILE_ID          VARCHAR2(20)  NOT NULL ,
	BATCH_FILE_NM         VARCHAR2(200)  NULL ,
	WDTB_PATH             VARCHAR2(100)  NULL ,
	ATCH_SE_CODE          CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TN_BATCH_ATCH_FILE
	ADD CONSTRAINT  XPK배치첨부파일 PRIMARY KEY (BATCH_ID, ATCH_FILE_ID);



CREATE TABLE TN_BATCH_BEAN
(
	BEAN_ID               VARCHAR2(255)  NOT NULL ,
	BATCH_ID              VARCHAR2(20) NOT NULL 
);





ALTER TABLE TN_BATCH_BEAN
	ADD CONSTRAINT  XPK배치빈 PRIMARY KEY (BEAN_ID);



CREATE TABLE TN_BATCH_DLBRT
(
	BATCH_DLBRT_NO        VARCHAR2(20)  NOT NULL ,
	BATCH_NM              VARCHAR2(100)  NULL ,
	BATCH_DC              VARCHAR2(1000)  NULL ,
	BATCH_SETUP_ATCH_FILE_ID  VARCHAR2(20)  NULL ,
	BATCH_ATCH_FILE_ID    VARCHAR2(20)  NULL ,
	BATCH_WDTB_PATH       VARCHAR2(100)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	BATCH_ID              VARCHAR2(20)  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NOT NULL ,
	BATCH_SETUP_WDTB_PATH  VARCHAR2(100)  NULL ,
	TEST_AT               CHAR(1)  NULL ,
	WDTB_AT               CHAR(1)  NULL ,
	PROCESS_SE_CODE       CHAR(3)  NULL 
);





ALTER TABLE TN_BATCH_DLBRT
	ADD CONSTRAINT  XPK배치심의 PRIMARY KEY (JOB_DLBRT_NO,BATCH_DLBRT_NO);



CREATE INDEX XIF1배치심의 ON TN_BATCH_DLBRT
(JOB_DLBRT_NO  ASC);



CREATE TABLE TN_BATCH_DLBRT_ATCH_FILE
(
	BATCH_DLBRT_NO        VARCHAR2(20)  NOT NULL ,
	ATCH_FILE_ID          CHAR(20)  NOT NULL ,
	ATCH_SE_CODE          CHAR(1)  NULL ,
	WDTB_PATH             VARCHAR2(100)  NULL ,
	PROCESS_SE_CODE       CHAR(3)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NOT NULL 
);





ALTER TABLE TN_BATCH_DLBRT_ATCH_FILE
	ADD CONSTRAINT  XPK배치심의첨부파일 PRIMARY KEY (BATCH_DLBRT_NO,ATCH_FILE_ID,JOB_DLBRT_NO);



CREATE INDEX XIF1배치심의첨부파일 ON TN_BATCH_DLBRT_ATCH_FILE
(JOB_DLBRT_NO  ASC,BATCH_DLBRT_NO  ASC);



CREATE TABLE TN_BATCH_DLBRT_RESULT
(
	BATCH_DLBRT_RESULT_NO  VARCHAR2(20)  NOT NULL ,
	BATCH_DLBRT_RESULT_CODE  CHAR(2)  NULL ,
	BATCH_DLBRT_CN        VARCHAR2(1000)  NULL ,
	BATCH_DLBRT_AT        CHAR(1)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	BATCH_DLBRT_NO        VARCHAR2(20)  NOT NULL ,
	BATCH_WDTB_AT         CHAR(1)  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NOT NULL 
);





ALTER TABLE TN_BATCH_DLBRT_RESULT
	ADD CONSTRAINT  XPK배치심의결과 PRIMARY KEY (JOB_DLBRT_NO,BATCH_DLBRT_NO,BATCH_DLBRT_RESULT_NO);



CREATE INDEX XIF1배치심의결과 ON TN_BATCH_DLBRT_RESULT
(BATCH_DLBRT_NO  ASC,JOB_DLBRT_NO  ASC);



CREATE TABLE TN_BATCH_EXECUT
(
	BATCH_EXECUT_NO       VARCHAR2(20)  NOT NULL ,
	EXECUT_MTHD_CODE      CHAR(2)  NULL ,
	EXECUT_TIME           VARCHAR2(14)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	JOB_EXECUTION_ID      VARCHAR2(20)  NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL 
);





ALTER TABLE TN_BATCH_EXECUT
	ADD CONSTRAINT  XPK배치실행 PRIMARY KEY (BATCH_EXECUT_NO,BATCH_ID);



CREATE INDEX XIF1배치실행 ON TN_BATCH_EXECUT
(BATCH_ID  ASC);



CREATE TABLE TN_BATCH_PARAMTR
(
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	PARAMTR_NM            VARCHAR2(200)  NULL 
);





ALTER TABLE TN_BATCH_PARAMTR
	ADD CONSTRAINT  XPK배치파라미터 PRIMARY KEY (BATCH_ID, PARAMTR_NM);



CREATE TABLE TN_EMAIL_INTRLCK
(
	EMAIL_INTRLCK_NO      VARCHAR2(20)  NOT NULL ,
	EMAIL_INTRLCK_NM      VARCHAR2(100)  NULL ,
	EMAIL_ADRES           VARCHAR2(50)  NULL ,
	IP_INFO               VARCHAR2(23)  NULL ,
	USER_ID               VARCHAR2(20)  NULL ,
	PASSWORD              VARCHAR2(200)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TN_EMAIL_INTRLCK
	ADD CONSTRAINT  XPKMail_연동 PRIMARY KEY (EMAIL_INTRLCK_NO);



CREATE TABLE TN_EMPLYRSCRTYESTBS
(
	SCRTY_DTRMN_TRGET_ID  VARCHAR2(20)  NOT NULL ,
	AUTHOR_CODE           VARCHAR2(30)  NULL ,
	MBER_TY_CODE          VARCHAR2(15)  NULL 
);





ALTER TABLE TN_EMPLYRSCRTYESTBS
	ADD CONSTRAINT  XPK회원보안 PRIMARY KEY (SCRTY_DTRMN_TRGET_ID);



CREATE TABLE TN_FILE
(
	ATCH_FILE_ID          VARCHAR2(20)  NOT NULL ,
	CREAT_DT              DATE  NULL ,
	USE_AT                CHAR(1)  NULL 
);





ALTER TABLE TN_FILE
	ADD CONSTRAINT  XPK첨부파일 PRIMARY KEY (ATCH_FILE_ID);



CREATE TABLE TN_FILEDETAIL
(
	ATCH_FILE_ID          VARCHAR2(20)  NOT NULL ,
	FILE_SN               NUMBER(10)  NOT NULL ,
	FILE_SIZE             NUMBER(8)  NULL ,
	FILE_CN               CLOB  NULL ,
	FILE_EXTSN            VARCHAR2(20)  NULL ,
	ORIGNL_FILE_NM        VARCHAR2(255)  NULL ,
	STRE_FILE_NM          VARCHAR2(255)  NULL ,
	FILE_STRE_COURS       VARCHAR2(2000)  NULL 
);





ALTER TABLE TN_FILEDETAIL
	ADD CONSTRAINT  XPK첨부파일상세 PRIMARY KEY (ATCH_FILE_ID,FILE_SN);



CREATE INDEX XIF1첨부파일상세 ON TN_FILEDETAIL
(ATCH_FILE_ID  ASC);



CREATE TABLE TN_FTP_INTRLCK
(
	FTP_INTRLCK_NO        VARCHAR2(20)  NOT NULL ,
	FTP_INTRLCK_NM        VARCHAR2(100)  NULL ,
	FTP_ADRES             VARCHAR2(100)  NULL ,
	USER_ID               VARCHAR2(20)  NULL ,
	PASSWORD              VARCHAR2(200)  NULL ,
	BATCH_WDTB_PATH       VARCHAR2(100)  NULL ,
	CFG_WDTB_PATH         VARCHAR2(100)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	PROCESS_SE_CODE       CHAR(3)  NULL 
);





ALTER TABLE TN_FTP_INTRLCK
	ADD CONSTRAINT  XPKFTP연동 PRIMARY KEY (FTP_INTRLCK_NO);



CREATE TABLE TN_ISSUE
(
	ISSUE_NO              VARCHAR2(20)  NOT NULL ,
	ISSUE_SJ              VARCHAR2(50)  NULL ,
	ISSUE_CN              VARCHAR2(1000)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	ATCH_FILE_ID          CHAR(20)  NULL ,
	ISSUE_STTUS_CODE      CHAR(2)  NULL ,
	ISSUE_OCCRRNC_DE      DATE  NULL ,
	ISSUE_LV_CODE         CHAR(2)  NULL ,
	ISSUE_TY_CODE         CHAR(2)  NULL ,
	OTHBC_AT			  CHAR(1) NULL 
);





ALTER TABLE TN_ISSUE
	ADD CONSTRAINT  XPK이슈 PRIMARY KEY (ISSUE_NO);



CREATE TABLE TN_ISSUE_CMT
(
	ANSWER_NO             VARCHAR2(20)  NOT NULL ,
	ISSUE_STTUS_CODE      CHAR(2)  NOT NULL ,
	ANSWER_CN             VARCHAR2(1000)  NULL ,
	ANSWER_REGISTER_ID    VARCHAR2(20)  NULL ,
	ANSWER_REGIST_PNTTM   DATE  NULL 
);





ALTER TABLE TN_ISSUE_CMT
	ADD CONSTRAINT  XPK이슈_답변 PRIMARY KEY (ANSWER_NO,ISSUE_STTUS_CODE);
	
	
CREATE TABLE TN_JOB_DLBRT
(
	JOB_DLBRT_NO          VARCHAR2(20)  NOT NULL ,
	JOB_SE_CODE           CHAR(6)  NULL ,
	JOB_DLBRT_NM          VARCHAR2(50)  NOT NULL ,
	JOB_DLBRT_CN          VARCHAR2(1000)  NULL ,
	REMARK                VARCHAR2(2500)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	ATCH_FILE_ID          CHAR(20)  NULL 
);





ALTER TABLE TN_JOB_DLBRT
	ADD CONSTRAINT  XPK업무심의 PRIMARY KEY (JOB_DLBRT_NO);



CREATE TABLE TN_JOB_DLBRT_RESULT
(
	JOB_DLBRT_RESULT_NO   VARCHAR2(20)  NOT NULL ,
	JOB_DLBRT_RESULT_CODE  CHAR(2)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	JOB_DLBRT_NO          VARCHAR2(20)  NOT NULL ,
	JOB_DLBRT_CN          VARCHAR2(1000)  NULL 
);





ALTER TABLE TN_JOB_DLBRT_RESULT
	ADD CONSTRAINT  XPK업무심의결과 PRIMARY KEY (JOB_DLBRT_NO,JOB_DLBRT_RESULT_NO);



CREATE INDEX XIF1업무심의결과 ON TN_JOB_DLBRT_RESULT
(JOB_DLBRT_NO  ASC);



CREATE TABLE TN_KNWLDG
(
	KNWLDG_NO             VARCHAR2(20)  NOT NULL ,
	KNWLDG_NM             VARCHAR2(60)  NULL ,
	KNWLDG_CN             VARCHAR2(2500)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	ATCH_FILE_ID          CHAR(20)  NULL ,
	OTHBC_AT              CHAR(1)  NULL ,
	KNWLDG_TY_CODE        VARCHAR2(3)  NULL ,
	DSUSE_DE              VARCHAR2(10)  NULL ,
	DSUSE_ENNC            CHAR(1)  NULL ,
	RDCNT                 NUMBER(10)  NULL 
);





ALTER TABLE TN_KNWLDG
	ADD CONSTRAINT  XPK지식 PRIMARY KEY (KNWLDG_NO);



CREATE TABLE TN_KNWLDG_CMT
(
	ANSWER_NO             VARCHAR(20)  NOT NULL ,
	NTT_ID                VARCHAR(20)  NULL ,
	WRTER_ID              VARCHAR2(20)  NULL ,
	WRTER_NM              VARCHAR2(56)  NULL ,
	ANSWER                VARCHAR2(200)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	PASSWORD              VARCHAR2(200)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	CMT_KNWLDG_EVL        VARCHAR2(2)  NULL 
);





ALTER TABLE TN_KNWLDG_CMT
	ADD CONSTRAINT  XPK지식댓글 PRIMARY KEY (ANSWER_NO);



CREATE TABLE TN_NTCN
(
	NTCN_NO               VARCHAR2(20)  NOT NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	SCHDUL_NO             VARCHAR2(20)  NOT NULL ,
	NTCN_SJ               VARCHAR2(60)  NULL ,
	EVENT_CODE            CHAR(2)  NULL ,
	MSSAGE_NM             VARCHAR2(60)  NULL ,
	MSSAGE_DC             VARCHAR2(200)  NULL ,
	REMARK                VARCHAR2(2500)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	NTCN_CODE             VARCHAR2(20)  NULL 
);





ALTER TABLE TN_NTCN
	ADD CONSTRAINT  XPK알림 PRIMARY KEY (NTCN_NO,BATCH_ID,SCHDUL_NO);



CREATE INDEX XIF1알림 ON TN_NTCN
(BATCH_ID  ASC);




CREATE TABLE TN_NTCN_RECPTN
(
	NTCN_NO               VARCHAR2(20)  NOT NULL ,
	RECPTN_USER_ID        VARCHAR2(20)  NOT NULL 
);





ALTER TABLE TN_NTCN_RECPTN
	ADD CONSTRAINT  XPK알림수신자 PRIMARY KEY (NTCN_NO,RECPTN_USER_ID);
	
	

CREATE TABLE tn_ntfcinfo (
  NTFC_NO varchar2(20) NOT NULL,
  NTFC_SJ varchar2(60) NOT NULL,
  NTFC_CN varchar2(100) NOT NULL,
  NTFC_TIME char(14) NOT NULL,
  BH_NTFC_INTRVL varchar2(20) NOT NULL,
  FRST_REGIST_PNTTM date NOT NULL,
  LAST_UPDUSR_PNTTM date DEFAULT NULL,
  FRST_REGISTER_ID varchar2(20) NOT NULL,
  LAST_UPDUSR_ID varchar2(20) DEFAULT NULL
);





ALTER TABLE tn_ntfcinfo
	ADD CONSTRAINT  XPK알림정보 PRIMARY KEY (NTFC_NO);




CREATE TABLE TN_REHNDN
(
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	REHNDN_NO             VARCHAR2(20)  NOT NULL ,
	JOB_INSTANCE_ID       VARCHAR2(20)  NULL ,
	JOB_EXECUTION_ID      VARCHAR2(20)  NULL ,
	REHNDN_RESN           VARCHAR2(1000)  NULL ,
	REHNDN_PNTTM          DATE  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
	 
);





ALTER TABLE TN_REHNDN
	ADD CONSTRAINT  XPK재처리관리 PRIMARY KEY (REHNDN_NO,BATCH_ID);



CREATE INDEX XIF1재처리관리 ON TN_REHNDN
(BATCH_ID  ASC);



CREATE TABLE TN_ROLEINFO
(
	ROLE_CODE             VARCHAR2(50)  NOT NULL ,
	ROLE_CREAT_DE         DATE  NULL ,
	ROLE_SORT             NUMBER(10)  NULL ,
	ROLE_TY               VARCHAR2(80)  NULL ,
	ROLE_DC               VARCHAR2(1000)  NULL ,
	ROLE_PTTRN            VARCHAR2(300)  NULL ,
	ROLE_NM               VARCHAR2(60)  NULL 
);





ALTER TABLE TN_ROLEINFO
	ADD CONSTRAINT  XPK롤정보 PRIMARY KEY (ROLE_CODE);



CREATE TABLE TN_ROLES_HIERARCHY
(
	PARNTS_ROLE           VARCHAR2(30)  NOT NULL ,
	CHILD_ROLE            VARCHAR2(30)  NOT NULL 
);





ALTER TABLE TN_ROLES_HIERARCHY
	ADD CONSTRAINT  XPK롤계층 PRIMARY KEY (PARNTS_ROLE,CHILD_ROLE);



CREATE TABLE TN_SCHDUL
(
	SCHDUL_NO             VARCHAR2(20)  NOT NULL ,
	SCHDUL_NM             VARCHAR2(255)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	EXECUT_CYCLE          VARCHAR2(2)  NULL ,
	EXECUT_SCHDUL_DE      CHAR(20)  NULL ,
	EXECUT_SCHDUL_HOUR    CHAR(2)  NULL ,
	EXECUT_SCHDUL_MNT     CHAR(2)  NULL ,
	EXECUT_SCHDUL_SECND   CHAR(2)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL 
);





ALTER TABLE TN_SCHDUL
	ADD CONSTRAINT  XPK일정 PRIMARY KEY (SCHDUL_NO,BATCH_ID);



CREATE INDEX XIF1일정 ON TN_SCHDUL
(BATCH_ID  ASC);



CREATE TABLE TN_SCHDUL_PARAMTR
(
	SCHDUL_NO             VARCHAR2(20)  NOT NULL ,
	BATCH_ID              VARCHAR2(20)  NOT NULL ,
	PARAMTR_NM            VARCHAR2(255) NOT NULL ,
	PARAMTR               VARCHAR2(255)  NULL 
);





ALTER TABLE TN_SCHDUL_PARAMTR
	ADD CONSTRAINT  XPK일정파라미터 PRIMARY KEY (SCHDUL_NO,BATCH_ID,PARAMTR_NM);



CREATE TABLE TN_SCHDUL_RESULT
(
	SCHDUL_NO             VARCHAR2(20)  NOT NULL ,
	SCHDUL_RESULT_NO      VARCHAR2(20)  NOT NULL ,
	JOB_EXECUTION_ID      CHAR(18)  NULL ,
	START_TIME            CHAR(14)  NULL ,
	END_TIME              VARCHAR2(20)  NULL ,
	PROCESS_RESULT        VARCHAR2(20)  NULL ,
	ERROR_CN              VARCHAR2(2000)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TN_SCHDUL_RESULT
	ADD CONSTRAINT  XPK일정결과 PRIMARY KEY (SCHDUL_NO,SCHDUL_RESULT_NO);



CREATE TABLE TN_SETUP
(
	USER_ID               VARCHAR2(20)  NOT NULL ,
	EXECUT_CYCLE          VARCHAR2(2)  NULL ,
	JOB_SE_CODE     	  VARCHAR2(200)  NULL ,
	LIST_COUNT            CHAR(18)  NULL ,
	BATCH_STTUS           VARCHAR2(20)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TN_SETUP
	ADD CONSTRAINT  XPK메인설정 PRIMARY KEY (USER_ID);



CREATE TABLE TN_SMS
(
	SMS_ID                CHAR(20)  NOT NULL ,
	TRNSMIS_TELNO         VARCHAR2(12)  NULL ,
	TRNSMIS_CN            VARCHAR2(80)  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL 
);





ALTER TABLE TN_SMS
	ADD CONSTRAINT  XPK문자 PRIMARY KEY (SMS_ID);



CREATE TABLE TN_SMSRECPTN
(
	SMS_ID                CHAR(20)  NOT NULL ,
	RECPTN_TELNO          VARCHAR2(12)  NOT NULL ,
	RESULT_CODE           CHAR(4)  NULL ,
	RESULT_MSSAGE         VARCHAR2(4000)  NULL 
);





ALTER TABLE TN_SMSRECPTN
	ADD CONSTRAINT  XPK문자결과 PRIMARY KEY (SMS_ID,RECPTN_TELNO);



CREATE TABLE TN_STPLATINFO
(
	USE_STPLAT_ID         CHAR(20)  NOT NULL ,
	USE_STPLAT_NM         VARCHAR2(100)  NULL ,
	USE_STPLAT_CN         CLOB  NULL ,
	INFO_PROVD_AGRE_CN    CLOB  NULL ,
	FRST_REGISTER_ID      VARCHAR2(20)  NULL ,
	FRST_REGIST_PNTTM     DATE  NULL ,
	LAST_UPDUSR_ID        VARCHAR2(20)  NULL ,
	LAST_UPDT_PNTTM       DATE  NULL 
);





ALTER TABLE TN_STPLATINFO
	ADD CONSTRAINT  XPK약관 PRIMARY KEY (USE_STPLAT_ID);



CREATE TABLE TN_USERS
(
	USER_ID               VARCHAR2(20)  NOT NULL ,
	AGRE_AT               CHAR(1)  NULL ,
	JOB_SE_CODE           CHAR(6)  NULL ,
	REGIST_DE             DATE  NULL ,
	IMAGE_FILE            VARCHAR2(60)  NULL ,
	EMAILS                VARCHAR2(50)  NULL ,
	ADRES                 VARCHAR2(100)  NULL ,
	MOBLPHON_NO           VARCHAR2(15)  NULL ,
	DEPT_ID               VARCHAR2(10)  NULL ,
	USE_AT                CHAR(1)  NULL ,
	PASSWORD              VARCHAR2(200)  NULL ,
	USER_NM               VARCHAR2(60)  NULL 
);





ALTER TABLE TC_CMMNDETAILCODE
	ADD  FOREIGN KEY (CODE_ID) REFERENCES TC_CMMNCODE(CODE_ID);



ALTER TABLE TH_BATCH
	ADD  FOREIGN KEY (BATCH_ID) REFERENCES TN_BATCH(BATCH_ID);



ALTER TABLE TH_SCHDUL
	ADD  FOREIGN KEY (SCHDUL_NO,BATCH_ID) REFERENCES TN_SCHDUL(SCHDUL_NO,BATCH_ID);



ALTER TABLE TN_AUTHORROLERELATE
	ADD  FOREIGN KEY (ROLE_CODE) REFERENCES TN_ROLEINFO(ROLE_CODE) ON DELETE CASCADE;



ALTER TABLE TN_AUTHORROLERELATE
	ADD  FOREIGN KEY (AUTHOR_CODE) REFERENCES TN_AUTHORINFO(AUTHOR_CODE) ON DELETE CASCADE;

ALTER TABLE TN_ROLES_HIERARCHY
 ADD FOREIGN KEY (PARNTS_ROLE) REFERENCES TN_AUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE;
 
ALTER TABLE TN_ROLES_HIERARCHY 
 ADD FOREIGN KEY (CHILD_ROLE) REFERENCES TN_AUTHORINFO (AUTHOR_CODE) ON DELETE CASCADE;

	

ALTER TABLE TN_BATCH_ATCH_FILE
	ADD  FOREIGN KEY (BATCH_ID) REFERENCES TN_BATCH(BATCH_ID);



ALTER TABLE TN_BATCH_DLBRT
	ADD  FOREIGN KEY (JOB_DLBRT_NO) REFERENCES TN_JOB_DLBRT(JOB_DLBRT_NO);



ALTER TABLE TN_BATCH_DLBRT_ATCH_FILE
	ADD  FOREIGN KEY (JOB_DLBRT_NO,BATCH_DLBRT_NO) REFERENCES TN_BATCH_DLBRT(JOB_DLBRT_NO,BATCH_DLBRT_NO);



ALTER TABLE TN_BATCH_DLBRT_RESULT
	ADD  FOREIGN KEY (JOB_DLBRT_NO,BATCH_DLBRT_NO) REFERENCES TN_BATCH_DLBRT(JOB_DLBRT_NO,BATCH_DLBRT_NO);



ALTER TABLE TN_BATCH_EXECUT
	ADD  FOREIGN KEY (BATCH_ID) REFERENCES TN_BATCH(BATCH_ID);



ALTER TABLE TN_FILEDETAIL
	ADD  FOREIGN KEY (ATCH_FILE_ID) REFERENCES TN_FILE(ATCH_FILE_ID);



ALTER TABLE TN_JOB_DLBRT_RESULT
	ADD  FOREIGN KEY (JOB_DLBRT_NO) REFERENCES TN_JOB_DLBRT(JOB_DLBRT_NO);




ALTER TABLE TN_REHNDN
	ADD  FOREIGN KEY (BATCH_ID) REFERENCES TN_BATCH(BATCH_ID);



ALTER TABLE TN_SCHDUL ADD FOREIGN KEY (BATCH_ID) REFERENCES TN_BATCH(BATCH_ID);

