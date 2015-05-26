/**
 * Project Name:xiuxing-origin-provide
 * File Name:XiuxingSystemService.java
 * Package Name:com.xiuxinger.origin.main
 * Date:2015年5月26日下午8:48:55
 *
*/

package com.xiuxinger.origin.main;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * ClassName:XiuxingSystemService <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月26日 下午8:48:55 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
public class XiuxingSystemServer {

    private static Logger log = LoggerFactory.getLogger(XiuxingSystemServer.class);

    private static ClassPathXmlApplicationContext context;

    public static void main(String[] args) throws IOException {

        startup();
        log.info("provider {} started!", "XiuxingSystemServer");
        while (true) {
        }
    }

    /**
     *
     * 方法说明：启动服务，加载spring配置
     *
     * @param
     */
    private static void startup() {
        context = new ClassPathXmlApplicationContext("spring-test-context.xml");
        context.start();
    }
    
}
