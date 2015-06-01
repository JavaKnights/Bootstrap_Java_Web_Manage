/**
 * Project Name:xiuxing-origin-manage
 * File Name:CaptchaController.java
 * Package Name:com.xiuxinger.origin.web.controller
 * Date:2015年6月13日上午11:44:24
 *
*/

package com.xiuxinger.origin.web.controller;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.google.code.kaptcha.Producer;
import com.xiuxinger.origin.common.util.VerifyCodeUtil;

/**
 * ClassName:CaptchaController <br/>
 * Description: 防止Captcha机器人登陆. <br/>
 * Date:     2015年6月13日 上午11:44:24 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
@Controller  
@RequestMapping("/kaptcha/*")
public class CaptchaController {
    
    @Autowired
    private Producer captchaProducer = null;

    /**
     * 第三方验证码生成器
     * getKaptchaImage:(获取Google Kaptcha验证码). <br/>
     * TODO(这里描述这个方法适用条件 – 可选).<br/>
     * TODO(这里描述这个方法的执行流程 – 可选).<br/>
     * TODO(这里描述这个方法的使用方法 – 可选).<br/>
     * TODO(这里描述这个方法的注意事项 – 可选).<br/>
     *
     * @author zhuguidong
     * @param request
     * @param response
     * @return
     * @throws Exception
     * @since JDK 1.7
     */
    @RequestMapping 
    public ModelAndView getKaptchaImage(HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session = request.getSession();
        //获取session中的验证码
        //String code = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
        //System.out.println("******************验证码是: " + code + "******************");

        response.setDateHeader("Expires", 0);
        
        // Set standard HTTP/1.1 no-cache headers.  
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");  
          
        // Set IE extended HTTP/1.1 no-cache headers (use addHeader).  
        response.addHeader("Cache-Control", "post-check=0, pre-check=0");  
          
        // Set standard HTTP/1.0 no-cache header.  
        response.setHeader("Pragma", "no-cache");  
          
        // return a jpeg  
        response.setContentType("image/jpeg");  
          
        // create the text for the image  
        String capText = captchaProducer.createText();  
          
        // store the text in the session  
        session.setAttribute(Constants.KAPTCHA_SESSION_KEY, capText);  
          
        // create the image with the text  
        BufferedImage bi = captchaProducer.createImage(capText);  
        ServletOutputStream out = response.getOutputStream();  
          
        // write the data out  
        ImageIO.write(bi, "jpg", out);  
        try {  
            out.flush();  
        } finally {  
            out.close();  
        }  
        
        return null;
    }
    
    /** 
     * 自定义验证码生成器
     * 获取验证码图片和文本(验证码文本会保存在HttpSession中) 
     */  
    @RequestMapping("/getVerifyCodeImage")  
    public void getVerifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException {  
        //设置页面不缓存  
        response.setHeader("Pragma", "no-cache");  
        response.setHeader("Cache-Control", "no-cache");  
        response.setDateHeader("Expires", 0);  
        String verifyCode = VerifyCodeUtil.generateTextCode(VerifyCodeUtil.TYPE_NUM_ONLY, 4, null);  
        //将验证码放到HttpSession里面  
        request.getSession().setAttribute("verifyCode", verifyCode);  
        System.out.println("本次生成的验证码为[" + verifyCode + "],已存放到HttpSession中");  
        //设置输出的内容的类型为JPEG图像  
        response.setContentType("image/jpeg");  
        BufferedImage bufferedImage = VerifyCodeUtil.generateImageCode(verifyCode, 90, 30, 3, true, Color.WHITE, Color.BLACK, null);  
        //写给浏览器  
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());  
    }  
    
}
