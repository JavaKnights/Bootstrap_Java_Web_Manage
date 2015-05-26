/**
 * Project Name:xiuxing-origin-api
 * File Name:ISysUserRpcService.java
 * Package Name:com.xiuxinger.origin.rpc
 * Date:2015年5月26日下午8:44:51
 *
*/

package com.xiuxinger.origin.rpc;

import com.xiuxinger.origin.entity.SysUser;

/**
 * ClassName:ISysUserRpcService <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月26日 下午8:44:51 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
public interface ISysUserRpcService {

    /**
     * 
     * login:(管理员登录方法). <br/>
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
    public SysUser login(SysUser sysUser);
    
}
