package org.team.g2.memberboard.controller;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.team.g2.memberboard.dto.PageMaker4;
import org.team.g2.memberboard.dto.PageRequestDTO;
import org.team.g2.memberboard.dto.PageResponseDTO4;
import org.team.g2.memberboard.dto.MemberBoardDTO;
import org.team.g2.memberboard.service.MemberBoardService;
import org.team.g2.memberboard.service.StatService;
import org.team.g2.security.dto.MemberRoleDTO;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

@Controller
@RequestMapping("/memberboard/*")
@Log4j2
@RequiredArgsConstructor
public class MemberBoardController {

	@Inject
	PasswordEncoder passwordEncoder;

	@Autowired
	private JavaMailSender mailSender;

	private final MemberBoardService memberBoardService;

	private final StatService statService;


	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/list")
	public void getMemberList(PageRequestDTO pageRequestDTO, MemberBoardDTO memberBoardDTO, Model model, String userID, MemberRoleDTO memberRoleDTO) {
		log.warn("membergetlist!");
		log.warn("getLIST : " + pageRequestDTO);
		PageResponseDTO4<MemberBoardDTO> responseDTO = memberBoardService.getMemberDTOList(pageRequestDTO);
		model.addAttribute("memberdtoList", responseDTO.getDtoList());
		int total = responseDTO.getCount();
		int page = pageRequestDTO.getPage();
		int size = pageRequestDTO.getSize();

		model.addAttribute("pageMaker", new PageMaker4(page, size, total));

		model.addAttribute("memberinfo", memberRoleDTO);

		log.info("rolelist : " + memberRoleDTO);
		model.addAttribute("memberBoardDTO", memberBoardService.read4(userID));
		log.info("filetest model : " + model);
		model.addAttribute("memberRoleDTO",memberBoardService.getMemberRoleDTOList(userID));
		log.info("roletest model : " + model);
	}

	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public String getMemberRegister(@ModelAttribute MemberBoardDTO memberBoardDTO) {
		log.info("getmemberregister");
		return "/memberboard/register";
	}


	@RequestMapping(value ="/register" , method = RequestMethod.POST)
	public String postMemberRegister(MemberBoardDTO memberBoardDTO,RedirectAttributes redirectAttributes) {
		log.info("@param : ",memberBoardDTO);
		log.info("memberBoardDTO! :  " + memberBoardDTO);

		String beforePW = "";
		String encodePW = "";

		beforePW = memberBoardDTO.getUserPW();
		encodePW = passwordEncoder.encode(beforePW);
		memberBoardDTO.setUserPW(encodePW);

		String userID = memberBoardService.memberRegister(memberBoardDTO);
		log.info("memberBoardDTO2! :  " + memberBoardDTO);
		log.warn("registerPost!!!!!!!!!!!!!!!!!!!!!!!");
		log.warn("post userID : " + userID);

		redirectAttributes.addFlashAttribute("result", userID);
		return "redirect:/customLogin";
	}

	@GetMapping(value = {"/read"})
	public void read(String userID, PageRequestDTO pageRequestDTO, Model model) {
		log.info("readuserID : " + userID);
		log.info("pageRequestDTO : " + pageRequestDTO);
		log.info(model);
		model.addAttribute("memberBoardDTO", memberBoardService.read4(userID));
		model.addAttribute("memberRoleDTO",memberBoardService.getMemberRoleDTOList(userID));
		log.info(" 유저 정보 : "+memberBoardService.read4(userID));
	}

	@PostMapping("/read")
	public String read(MemberBoardDTO memberBoardDTO, RedirectAttributes redirectAttributes) {
		log.info("readpost memberboardDTO:" + memberBoardDTO);
		if (memberBoardService.readB(memberBoardDTO)) {
			redirectAttributes.addFlashAttribute("result", "modified");
		}
		redirectAttributes.addAttribute("userID", memberBoardDTO.getUserID());
		return "redirect:/memberboard/list";
	}

	@RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
	@ResponseBody
	public String mailCheckGET(String email) throws Exception {
		log.info("mailtest");
		log.info("인증메일 : " + email);

		int checkNum = (int) (Math.random() * 900000) + 100000;
		log.info("인증번호 : " + checkNum);

		String setFrom = "gstreetmaster@naver.com";
		String toMail = email;
		String title = "GSTREET 회원가입을 위한 이메일 인증입니다.";
		String content = "인증 번호는 " + "<b>" + checkNum + "</b>" + "입니다." + "<br>" +
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}

		//문자열로 변환
		return Integer.toString(checkNum);
	}

	@RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
	@ResponseBody
	public String memberIDCheckPost(String memberId) throws Exception {
		log.info("memberIDCheck Controller");
		int result = memberBoardService.idCheck(memberId);
		log.info("결과 : " + result);
		if (result != 0) {
			return "fail";
		} else {
			return "success";
		}
	}

	@GetMapping("/exmain")
	public void getStat(Model model) {
		log.info("getStat");
		model.addAttribute("stat",statService.getStatOne());
		model.addAttribute("stat2",statService.getStatTwo());
	}

	@GetMapping("/ban")
	public String getBan(String userID, PageRequestDTO pageRequestDTO, Model model, RedirectAttributes redirectAttributes) {
		log.info("ban model : " + model);

		redirectAttributes.addFlashAttribute("banResult", memberBoardService.ban(userID));
		return "redirect:/memberboard/list";
	}

	@GetMapping("/unban")
	public String getUnban(String userID, PageRequestDTO pageRequestDTO, Model model, RedirectAttributes redirectAttributes) {
		log.info("unban model : " + model);

		redirectAttributes.addFlashAttribute("unbanResult", memberBoardService.unban(userID));
		return "redirect:/memberboard/list";
	}

	@GetMapping("/grantMember")
	public String getGrantMember(String userID, Model model,RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("grantMemberResult", memberBoardService.grantMember(userID));
		return "redirect:/memberboard/list";
	}

	@GetMapping("/grantSeller")
	public String getGrantSeller(String userID, Model model,RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("grantSellerResult", memberBoardService.grantSeller(userID));
		return "redirect:/memberboard/list";
	}

	@GetMapping("/grantAdmin")
	public String getGrantAdmin(String userID, Model model,RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("grantAdminResult", memberBoardService.grantAdmin(userID));
		return "redirect:/memberboard/list";
	}


}
