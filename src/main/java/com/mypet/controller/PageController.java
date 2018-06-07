package com.mypet.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mypet.annotation.LoginAuthority;
import com.mypet.model.RoleType;
import com.mypet.service.ApplicationService;
import com.mypet.service.NoticeService;
import com.mypet.service.PetService;
import com.mypet.ssm.po.Pet;
import com.mypet.ssm.po.User;

/**
 * 页面跳转controller
 * 
 * @author Dan
 */
@Controller
public class PageController {

	@Autowired
	private ApplicationService applicationService;

	@Autowired
	private PetService petService;

	@Autowired
	private NoticeService noticeService;

	/**
	 * 打开首页
	 */
	@RequestMapping("/")
	public String showIndex() {
		return "index";
	}

	/**
	 * 展示其他页面
	 * 
	 * @param page
	 * @return
	 */
	@RequestMapping("/{page}")
	public String showpage(@PathVariable String page) {
		return page;
	}

	@RequestMapping("/publishUser")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showPublishUser(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("publishUser");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/myInfo")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showMyInfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("myInfo");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/requestInfo")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showRequestInfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("myInfo");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/publishHistory")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showPublishHistory(HttpSession session,
			@RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("publishHistory");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		if (page == null || page < 1) {
			page = 1;
		}
		modelAndView.addObject("petList",
				petService.listPublishPetAll(u, page, 3));
		modelAndView.addObject("noticeList",
				noticeService.listPublishNoticeAll(u, page, 3));
		return modelAndView;
	}

	@RequestMapping("/petHistory")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showPetHistory(HttpSession session,
			@RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("petHistory");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		if (page == null || page < 1) {
			page = 1;
		}
		modelAndView.addObject("petList",
				petService.listPublishPetAll(u, page, 3));
		modelAndView.addObject("noticeList",
				noticeService.listPublishNoticeAll(u, page, 3));
		return modelAndView;
	}

	@RequestMapping("/publishInfo")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showPublishInfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("publishInfo");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/requestList")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showRequestList(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("requestList");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/publishPet")
	@LoginAuthority(RoleType.PUBLISH_USER)
	public ModelAndView showPublishPet(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("publishPet");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listPublish(u));
		modelAndView.addObject("petList", petService.listPublishPet(u));
		modelAndView
				.addObject("noticeList", noticeService.listPublishNotice(u));
		return modelAndView;
	}

	@RequestMapping("/requestUser")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showRequestUser(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("requestUser");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listRequest(u));
		modelAndView.addObject("petList", petService.listPet());
		modelAndView.addObject("noticeList", noticeService.listNotice());
		return modelAndView;
	}

	@RequestMapping("/myApply")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showMyApply(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("myApply");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listRequest(u));
		modelAndView.addObject("petList", petService.listPet());
		modelAndView.addObject("noticeList", noticeService.listNotice());
		return modelAndView;
	}

	@RequestMapping("/petList")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showPetList(HttpSession session,
			@RequestParam(required = false) Integer page) {
		ModelAndView modelAndView = new ModelAndView("petList");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listRequest(u));
		modelAndView.addObject("petList", petService.listPet());
		modelAndView.addObject("noticeList", noticeService.listNotice());
		return modelAndView;
	}

	@RequestMapping("/pubInfo")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showPubInfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView("pubInfo");
		User u = (User) session.getAttribute("user");
		modelAndView.addObject("applicationList",
				applicationService.listRequest(u));
		modelAndView.addObject("petList", petService.listPet());
		modelAndView.addObject("noticeList", noticeService.listNotice());
		return modelAndView;
	}

	@RequestMapping("/petInfo/{pid}")
	@LoginAuthority(RoleType.REQUEST_USER)
	public ModelAndView showPetInfo(@PathVariable Long pid) {
		ModelAndView modelAndView = new ModelAndView("petInfo");
		Pet pet = petService.getPetById(pid);
		modelAndView.addObject("pet", pet);
		return modelAndView;
	}

}
