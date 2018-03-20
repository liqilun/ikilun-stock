package com.ikilun;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import freemarker.template.Configuration;
import freemarker.template.TemplateModelException;

@Component
public class FreemarkerConfig {
	@Autowired
	private Configuration configuration;
	@Autowired
	private Config config;
	@PostConstruct
	public void setSharedVariable() throws TemplateModelException {
		configuration.setSharedVariable("basePath", "/");
		configuration.setSharedVariable("staticPath", config.getStaticPath());
	}
}
