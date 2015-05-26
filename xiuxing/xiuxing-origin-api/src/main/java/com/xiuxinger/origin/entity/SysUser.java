/**
 * Project Name:xiuxing-origin-api
 * File Name:SysUser.java
 * Package Name:com.xiuxinger.origin.entity
 * Date:2015年5月26日下午8:16:28
 *
*/

package com.xiuxinger.origin.entity;

import com.xiuxinger.origin.common.base.BaseEntity;



/**
 * ClassName:SysUser <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月26日 下午8:16:28 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
public class SysUser extends BaseEntity<SysUser>{

    /**
     * 
     */
    private static final long serialVersionUID = -2145514478632061756L;
    
    /**
     * 系统管理员登录名
     */
    private String sysUserName;
    
    /**
     * 管理员密码
     */
    private String sysPassword;

    public String getSysUserName() {
        return sysUserName;
    }

    public void setSysUserName(String sysUserName) {
        this.sysUserName = sysUserName;
    }

    public String getSysPassword() {
        return sysPassword;
    }

    public void setSysPassword(String sysPassword) {
        this.sysPassword = sysPassword;
    }
    
    

}
