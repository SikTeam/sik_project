package org.ict.sik.report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ict.sik.common.Paging;
import org.ict.sik.common.Search;
import org.ict.sik.member.model.service.MemberService;
import org.ict.sik.member.model.vo.Member;
import org.ict.sik.member.model.vo.MemberDeptPosition;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReportController {
	private static final Logger logger = LoggerFactory.getLogger(ReportController.class);
	@Autowired
	private ReportService reportService;
	@Autowired
	private ReportSignService reportSignService;

	@Autowired
	private MemberService memberService;

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
	
	//결재자 정보 불러오기
	@RequestMapping("addApprover.do")
	@ResponseBody
	public Map<String, Object> ApproverMemberSelect(
			@RequestParam(name="page", required=false) String page,
			ModelAndView mv) {
		Map<String, Object> approver = new HashMap<>();
		int currentPage = 1;
		if (page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		int listCount = memberService.selectlistCount();
		Paging paging = new Paging(listCount, currentPage, limit, "addApprover.do");
		paging.calculator();
		
		ArrayList<MemberDeptPosition> list = memberService.selectList(paging);

		approver.put("approver", list);
		approver.put("paging", paging);
		logger.info(approver.toString());
		
		return approver;
	}	
	
	
	//결재 등록 페이지 이동
	@RequestMapping("getReportId.do")
	public ModelAndView getReportId(ModelAndView mv) {
		String reportId = reportService.getReportId();
		
		ArrayList<MemberDeptPosition> list = memberService.selectFullList();
		
		logger.info(reportId);
		if (reportId != null) {
			mv.addObject("reportId", reportId);
			mv.addObject("list", list);
			mv.setViewName("report/insertReport");
		} else {
			mv.addObject("message", "결재창 불러오기 실패.");
			mv.setViewName("common/error");
		}
		return mv;
	}

//	@RequestMapping(value="RequestMapping.do", method=RequestMethod .POST)
//	public String insertReport(
//
//	}
}
