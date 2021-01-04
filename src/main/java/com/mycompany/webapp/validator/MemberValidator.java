package com.mycompany.webapp.validator;

import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.mycompany.webapp.dto.MemberDto;

import com.mycompany.webapp.service.SignupService;

public class MemberValidator implements Validator {
	private static final Logger logger = LoggerFactory.getLogger(MemberValidator.class);

	@Resource
	private SignupService signupservice;

	@Override
	public boolean supports(Class<?> clazz) {
		return MemberDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberDto member = (MemberDto) target;
		logger.info(member.getMnickname());

		// 닉네임검사
		if (member.getMnickname() == null || member.getMnickname().trim().equals("")) {
			errors.rejectValue("mnickname", "errors.mnickname.required");
		} else {

		}
		// password검사
		if (member.getMpassword() == null || member.getMpassword().trim().equals("")) {
			errors.rejectValue("mpassword", "errors.mpassword.required");
		} else if (member.getMpassword().length() < 8) {
			errors.rejectValue("mpassword", "errors.mpassword.minlength", new Object[] { 8 }, "8자 이상");
		} else {
			String passwordRegex = "/^[a-zA-Z0-9]*$/";
			Pattern passwordPattern = Pattern.compile(passwordRegex);
			// 정규표현식과 matching이 되는가 //matches()=>일치하면 true
			if (!passwordPattern.matcher(member.getMpassword()).matches()) {
				errors.rejectValue("mpassword", "errors.mpassword.invalid");
			}
		}
		// phonenum검사
		if (member.getMphonenum() == null || member.getMphonenum().trim().equals("")) {
			errors.rejectValue("mphonenum", "errors.mphonenum.required");
		} else {
			String phonenumRegex = "/^\\d{2,3}-\\d{3,4}-\\d{4}$/";
			Pattern phonenumPattern = Pattern.compile(phonenumRegex);
			if (!phonenumPattern.matcher(member.getMphonenum()).matches()) {
				errors.rejectValue("mphonenum", "errors.mphonenum.invalid");
			}
		}
	}
}
