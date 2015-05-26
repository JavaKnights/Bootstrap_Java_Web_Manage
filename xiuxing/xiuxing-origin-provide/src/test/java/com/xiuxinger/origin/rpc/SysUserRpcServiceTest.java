/**
 * Project Name:xiuxing-origin-provide
 * File Name:SysUserRpcServiceTest.java
 * Package Name:com.xiuxinger.origin.rpc
 * Date:2015年5月27日下午8:57:39
 *
*/

package com.xiuxinger.origin.rpc;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xiuxinger.origin.common.base.BaseEntity;
import com.xiuxinger.origin.entity.SysUser;
import com.xiuxinger.origin.service.SysUserService;

/**
 * ClassName:SysUserRpcServiceTest <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月27日 下午8:57:39 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-test-context.xml")
public class SysUserRpcServiceTest {
    
    @Autowired
    private SysUserService sysUserService;
    
    @Test
    public void testCURD() {

        Integer id = 1;
        String sysUserName = "test string";
        String sysPassword = "test string";

        SysUser sysUser = new SysUser();
        
        //sysUser.setId(id);
        sysUser.setSysUserName(sysUserName);
        sysUser.setSysPassword(sysPassword);

        //test insert
        sysUserService.insert(sysUser);
        id = sysUser.getId();
        
        
        //test get by id
        SysUser destSysUser = sysUserService.get(id);
        
        
        
        
        
        //test find list
        List<SysUser> sysUserList = sysUserService.findAllList(new SysUser());

        //test update
        sysUserName = "update string";
        sysPassword = "update string";
        
        destSysUser.setSysUserName(sysUserName);
        destSysUser.setSysPassword(sysPassword);
        
        sysUserService.update(destSysUser);
        SysUser updatedSysUser = sysUserService.get(id);
        
        

        //test delete
        sysUserService.delete(destSysUser);
        //assertEquals(sysUserService.get(id).getDelFlag().intValue(), BaseEntity.DEL_FLAG_DELETE);

    }



}
