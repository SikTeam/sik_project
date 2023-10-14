package org.ict.sik.report.model.service;

import java.util.ArrayList;

import org.ict.sik.report.model.dao.ReportDao;
import org.ict.sik.report.model.vo.Report;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReportService")
public class ReportServiceImpl {
	@Autowired
	private ReportDao reportDao;
	
	@Override
	public ArrayList<Report> selectReportList {
		return reportDao.selectReportList();
		}
	}