/**
 * Project Name:xiuxing-origin-provide
 * File Name:SysUserRpcService.java
 * Package Name:com.xiuxinger.origin.rpc.impl
 * Date:2015年5月26日下午8:46:44
 *
*/

package com.xiuxinger.origin.rpc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiuxinger.origin.entity.SysUser;
import com.xiuxinger.origin.rpc.ISysUserRpcService;
import com.xiuxinger.origin.service.SysUserService;

/**
 * ClassName:SysUserRpcService <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月26日 下午8:46:44 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
@Service
public class SysUserRpcService implements ISysUserRpcService {
    
    protected Logger logger = LoggerFactory.getLogger(SysUserRpcService.class);

    @Autowired
    private SysUserService sysUserService;
    
    public SysUser login(SysUser sysUser) {
        
        return sysUserService.findList(sysUser).get(0);
    }

}
