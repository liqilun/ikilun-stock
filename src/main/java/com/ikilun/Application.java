package com.ikilun;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.core.convert.converter.Converter;
import org.springframework.http.HttpStatus;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.ikilun.util.DateUtil;

@SpringBootApplication
// @EnableAutoConfiguration(exclude={DataSourceAutoConfiguration.class})
public class Application extends WebMvcConfigurerAdapter {
	public static void main(String[] args) {
		try {
			SpringApplication.run(Application.class, args);
		} catch (Exception e) {
		}
	}

	/*
	 * @Bean public Queue queue() { return new ActiveMQQueue("ikiQueue"); }
	 */
	// 启动的时候要注意，由于我们在controller中注入了RestTemplate，所以启动的时候需要实例化该类的一个实例
	@Autowired
	private RestTemplateBuilder builder;

	// 使用RestTemplateBuilder来实例化RestTemplate对象，spring默认已经注入了RestTemplateBuilder实例
	@Bean
	public RestTemplate restTemplate() {
		return builder.build();
	}

	@Bean
	public Converter<String, Date> addNewConvert() {
		return new Converter<String, Date>() {
			@Override
			public Date convert(String source) {
				return DateUtil.parseDate(source);
			}
		};
	}

	@Bean
	public Converter<String, Timestamp> addNewConvert2() {
		return new Converter<String, Timestamp>() {
			@Override
			public Timestamp convert(String source) {
				return DateUtil.parseTimestamp(source);
			}
		};
	}

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {
		return new EmbeddedServletContainerCustomizer() {
			@Override
			public void customize(ConfigurableEmbeddedServletContainer container) {
				container.addErrorPages(new ErrorPage(HttpStatus.NOT_FOUND,
						"/error/404"));
				container.addErrorPages(new ErrorPage(
						HttpStatus.INTERNAL_SERVER_ERROR, "/error/500"));
				container.addErrorPages(new ErrorPage(
						java.lang.Throwable.class, "/error/500"));
			}
		};
	}
}
