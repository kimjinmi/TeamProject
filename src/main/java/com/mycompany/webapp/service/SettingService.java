package com.mycompany.webapp.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.mycompany.webapp.dao.MemberDao;


@Service
public class SettingService {

	@Resource
	private MemberDao member;
	
	
}
