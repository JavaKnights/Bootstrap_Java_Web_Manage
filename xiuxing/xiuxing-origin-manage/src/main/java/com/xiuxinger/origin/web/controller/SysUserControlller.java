/**
 * Project Name:xiuxing-origin-manage
 * File Name:SysUserControlller.java
 * Package Name:com.xiuxinger.origin.controller
 * Date:2015年5月27日下午8:21:08
 *
*/

package com.xiuxinger.origin.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.code.kaptcha.Constants;
import com.xiuxinger.origin.entity.SysUser;
import com.xiuxinger.origin.rpc.ISysUserRpcService;

/**
 * ClassName:SysUserControlller <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月27日 下午8:21:08 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
@Controller
public class SysUserControlller {
    
    private static Logger log = LoggerFactory.getLogger(SysUserControlller.class);
    
    //@Autowired
    private ISysUserRpcService sysUserRpcService;
    
    /***
     * 重定向到首页
     */
    public static final String REDIRECT_INDEX = "redirect:/index.do";
    
    /***
     * 重定向到登录首页
     */
    public static final String REDIRECT_JIANZHAN_INDEX = "redirect:/login.do";
    /**
     * 重定向到安全中心
     */
    public static final String REDIRECT_CENTER= "redirect:/goSecurityCenter.do";
    /***
     * 转发到login页面
     */
    public static final String FORWARD_LOGIN = "forward:/login.do";
    
    /***
     * 登录后首页工作台
     */
    public static final String WORKSTATION = "workstation";
    
    /***
     * 登录用户允许访问的页面session名称
     */
    public static final String SESSION_USER_ALLOW_PAGES = "currentUserAllowPages";
    
    /***
     * 首页PageView
     */
    public static final String INDEX = "index";
    /***
     * 没有认证
     */
    public static final String NO_AUTHORIZED = "error/noauthorized";
    
    /***
     * 允许匿名访问的页面
     */
    public static final String []ALLOW_ANONYMOUS_LIST = {"/login.do","/logout.do","/doLogin.do"};
    /**
     * 登录用户不需要授权可以访问的页面
     */
    public static final String []SESSION_USER_ALLOW_LIST = {"/offline/tradeTidAddress.do"};

    /***
     * 登陆页PageView
     */
    public static final String LOGIN = "login";
    /***
     * 异常页PageView
     */
    public static final String ERROR = "error/error";
    
    /***
     * 登录用户session名称
     */
    public static final String SESSION_USER_INFO = "currentUser";
    public static final String SESSION_USER_LOGIN_NAME = "UserName";
    
    /**
     * 
     * login:(这里用一句话描述这个方法的作用). <br/>
     * TODO(这里描述这个方法适用条件 – 可选).<br/>
     * TODO(这里描述这个方法的执行流程 – 可选).<br/>
     * TODO(这里描述这个方法的使用方法 – 可选).<br/>
     * TODO(这里描述这个方法的注意事项 – 可选).<br/>
     *
     * @author zhuguidong
     * @param sysUser
     * @return
     * @since JDK 1.7
     */
    @RequestMapping("/doLogin.do")
    public String login(HttpServletRequest request, Model model, SysUser sysUser){
    
        try {
            //获取HttpSession中的验证码  
            String verifyCode = (String)request.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);  
            //获取用户请求表单中输入的验证码  
            String submitCode = WebUtils.getCleanParam(request, "verifyCode");
            
            System.out.println("用户[" + sysUser.getSysUserName() + "]登录时输入的验证码为[" + submitCode + "],HttpSession中的验证码为[" + verifyCode + "]");  
            if (StringUtils.isEmpty(submitCode) || !StringUtils.equals(verifyCode, submitCode.toLowerCase())){  
                request.setAttribute("message_login", "验证码不正确");  
                return "error";  
            }  
            
            SysUser user = sysUserRpcService.login(sysUser);
            
            if(null == user){
                
                return "error";
            }
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
            
        }
        
        return "index";
    }
    
    /**
     * 
     * login:(这里用一句话描述这个方法的作用). <br/>
     * TODO(这里描述这个方法适用条件 – 可选).<br/>
     * TODO(这里描述这个方法的执行流程 – 可选).<br/>
     * TODO(这里描述这个方法的使用方法 – 可选).<br/>
     * TODO(这里描述这个方法的注意事项 – 可选).<br/>
     *
     * @author zhuguidong
     * @param sysUser
     * @return
     * @since JDK 1.7
     */
    @RequestMapping("/")
    public String index(){
    
        return "login";
    }
    
    @RequestMapping("/index.do")
    public String indexPage(Model model,HttpServletRequest hrs){
        //--------页面不需要add session的变量---获取操作员信息---@ModelAttribute(Action.SESSION_USER_INFO) Operator currentUser,------ 
        model.addAttribute("contextPath",hrs.getContextPath()); 
        SysUser user = (SysUser)hrs.getAttribute(SESSION_USER_INFO);
        if(user != null)log.info(user.toString());
        log.info("-------------index，跳转到首页-----------");
        return INDEX;
    }
    
    @RequestMapping("/defaultContent.do") 
    public String workstation(){
        return "commons/content";
    }

}
