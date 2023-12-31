package org.ict.sik.report.model.service;
import java.util.ArrayList;

import org.ict.sik.common.Search;
import org.ict.sik.report.model.vo.Report;

public interface ReportService {

	public ArrayList<Report> selectList(Search search);
	public String getReportId();
	public int insertReport(Report report);
	public int updateReport(Report report);
}
