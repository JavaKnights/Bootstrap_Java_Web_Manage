/**
 * Project Name:xiuxing-origin-common
 * File Name:BaseEntity.java
 * Package Name:com.xiuxinger.origin.common.base
 * Date:2015年5月26日下午8:19:13
 *
*/

package com.xiuxinger.origin.common.base;

import java.io.Serializable;

/**
 * ClassName:BaseEntity <br/>
 * Description: 简单描述. <br/>
 * Date:     2015年5月26日 下午8:19:13 <br/>
 * @author   zhuguidong
 * @since    JDK 1.7
 * @see 	 
 */
public class BaseEntity<T> implements Serializable{

    /**
     * 
     */
    private static final long serialVersionUID = -7733139333845789190L;
    
    /**
     * 删除标记（0：正常；）
     */
    public static final int DEL_FLAG_NORMAL = 0;
    /**
     * 删除标记（1：删除；）
     */
    public static final int DEL_FLAG_DELETE = 1;
    
    /**
     * ID
     */
    private Integer id;
    
    /**
     * 删除标识(0：正常; 1：删除;)
     */
    private Integer delFlag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(Integer delFlag) {
        this.delFlag = delFlag;
    }
    
    
    
    
    
    

}
