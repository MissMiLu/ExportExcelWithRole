package com.palmelf.erp.serviceImpl;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Service;

import com.palmelf.erp.service.BackupScheduleService;
import com.palmelf.erp.service.DbBackUpService;
import com.palmelf.erp.util.Constants;
@Service("backupScheduleService")
public class BackupScheduleServiceImpl implements BackupScheduleService
{
	/* (非 Javadoc) 
	* <p>Title: execute</p> 
	* <p>Description:备份调度执行方法 </p> 
	* @param jobCtx
	* @throws JobExecutionException 
	* @see org.quartz.Job#execute(org.quartz.JobExecutionContext) 
	*/
	public void execute(JobExecutionContext jobCtx ) throws JobExecutionException
	{
		String fineName = Constants.dbBackUp();
		String sqlName = Constants.BASE_PATH +"attachment" +File.separator+ "dbBackUp" + File.separator + fineName;
		SpringWiredBean sdf = SpringWiredBean.getInstance();
		DbBackUpService sdsdf = (DbBackUpService)sdf.getBeanById("dbBackUpService");
		sdsdf.addLog(sqlName,fineName,true);
	}
}
