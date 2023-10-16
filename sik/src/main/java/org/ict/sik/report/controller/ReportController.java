package org.ict.sik.report.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.ict.sik.common.Paging;
import org.ict.sik.common.Search;
import org.ict.sik.member.model.vo.Member;
import org.ict.sik.report.model.service.ReportService;
import org.ict.sik.report.model.vo.Report;
import org.ict.sik.reportsign.model.service.ReportSignService;
import org.ict.sik.reportsign.model.vo.ReportSign;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired
	private ReportService reportService;
	@Autowired
	private ReportSignService reportSignService;
	//결재페이지 리스트
	@RequestMapping("reportList.do")
	public ModelAndView reportList(@RequestParam(name = "page", required = false) String page, ModelAndView mv, HttpSession session) {
		Member member = (Member)session.getAttribute("loginMember");
		String memberId = member.getMemberId();
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = reportSignService.listCount(memberId);
		logger.info("listCount : "+listCount);
		
		Paging paging = new Paging(listCount, currentPage, limit, "reportList.do");
		paging.calculator();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(memberId);
		
		ArrayList<ReportSign> list = reportSignService.selectList(search);
		ArrayList<Report> list2 = reportService.selectList(search);
		logger.info(search + memberId);

		if (list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("list2",list2);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("memberId", memberId);
			mv.setViewName("report/reportList");
		} else {
			mv.addObject("message", "결재리스트 없다.");
			mv.setViewName("common/error");
		}
		return mv;
	}
}
