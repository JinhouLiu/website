package com.website.web.system;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.web.filter.OncePerRequestFilter;

import com.octo.captcha.service.CaptchaService;
import com.octo.captcha.service.CaptchaServiceException;

/**
 * @author 刘锦厚
 * 
 */
public class JCaptchaFilter extends OncePerRequestFilter {


	/** 验证 captcha 的 url。默认值为：/j_spring_security_check */
	private String securityCheckUrl = "/j_spring_security_check";
	
	/** 生成 captcha 的 url。默认值为：/j_captcha.jpg */
	private String captchaUrl = "/j_captcha.action";
	
	/** 验证失败时默认指向的 url。*/
	private String failureUrl = "/login.action";
	
	@Resource(name="captchaService")
	private CaptchaService captchaService;
	
	private String captchaParamName = "j_captcha";
	
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.filter.OncePerRequestFilter#doFilterInternal(
	 * javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, javax.servlet.FilterChain)
	 */
	@Override
	protected void doFilterInternal(HttpServletRequest request,
			HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
	
		String servletPath = request.getServletPath();
		if (StringUtils.startsWith(servletPath, captchaUrl)){
			//生成 captcha 图片
			genernateCaptchaImage(request, response);
		} else {
			//验证 captcha
			if (validateCaptchaChallenge(request)) {
				filterChain.doFilter(request, response);
			} else {
				redirectFailureUrl(request, response);
			}
		}
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.filter.OncePerRequestFilter#shouldNotFilter(javax
	 * .servlet.http.HttpServletRequest)
	 */
	@Override
	protected boolean shouldNotFilter(HttpServletRequest request)
			throws ServletException {
		String servletPath = request.getServletPath();
		if (StringUtils.startsWith(servletPath, securityCheckUrl)
				|| StringUtils.startsWith(servletPath, captchaUrl)) {
			//拦截指定的请求
			return false;
		} else
			//对其他请求放行
			return true;
	}
	
	/**
	 * 生成 captcha 图片。
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	protected void genernateCaptchaImage(final HttpServletRequest request,  
            final HttpServletResponse response) throws IOException {  
 
		//设置禁止客户端缓存的Header
		// Http 1.0 header
        response.setDateHeader("Expires", 1L); 
        response.addHeader("Pragma", "no-cache"); 
        // Http 1.1 header  
        response.setHeader("Cache-Control", "no-cache, no-store, max-age=0");
        response.setContentType("image/jpeg");
 
        ServletOutputStream out = response.getOutputStream(); 
        try { 
            String captchaId = request.getSession(true).getId(); 
            BufferedImage challenge = (BufferedImage) captchaService 
                    .getChallengeForID(captchaId, request.getLocale()); 
            ImageIO.write(challenge, "jpg", out); 
            out.flush(); 
        } catch (CaptchaServiceException e) {
            logger.error(e.getMessage(), e); 
        } finally { 
            if(out!=null){ 
                out.close();
            }
        }
    }
	
	/**
     * 验证 captcha。
     */  
	private boolean validateCaptchaChallenge(final HttpServletRequest request) {
        try { 
            String captchaID = request.getSession().getId();
            String challengeResponse = request.getParameter(captchaParamName);
			return captchaService.validateResponseForID(captchaID,
					challengeResponse);
        } catch (CaptchaServiceException e) {
            logger.error(e.getMessage(), e);
            return false;
        }
    }
	
	private void redirectFailureUrl(final HttpServletRequest request,
			final HttpServletResponse response) throws IOException, ServletException {
		SimpleUrlAuthenticationFailureHandler failureHandler = new SimpleUrlAuthenticationFailureHandler();
		failureHandler.setDefaultFailureUrl(failureUrl);
	    failureHandler.onAuthenticationFailure(request, response, new BadCredentialsException("无效的验证码"));
	}

	/**
	 * @return the securityCheckUrl
	 */
	public String getSecurityCheckUrl() {
		return securityCheckUrl;
	}

	/**
	 * @param securityCheckUrl the securityCheckUrl to set
	 */
	public void setSecurityCheckUrl(String securityCheckUrl) {
		this.securityCheckUrl = securityCheckUrl;
	}

	/**
	 * @return the captchaUrl
	 */
	public String getCaptchaUrl() {
		return captchaUrl;
	}

	/**
	 * @param captchaUrl the captchaUrl to set
	 */
	public void setCaptchaUrl(String captchaUrl) {
		this.captchaUrl = captchaUrl;
	}

	/**
	 * @return the failureUrl
	 */
	public String getFailureUrl() {
		return failureUrl;
	}

	/**
	 * @param failureUrl the failureUrl to set
	 */
	public void setFailureUrl(String failureUrl) {
		this.failureUrl = failureUrl;
	}

}