/**
 * Project Name:mybatis
 * File Name:BaseDao.java
 * Package Name:com.leoxxx.mybatis.persistence
 * Date:2015年4月19日下午10:14:53
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
*/

package com.xiuxinger.origin.common.base;

import java.util.List;

/**
 * ClassName:BaseDao <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason:	 TODO DAO实现接口<br/>
 * Date:     2015年4月19日 下午10:14:53 <br/>
 * @author   xieyuan
 * @version  
 * @since    JDK 1.7
 * @see 	 
 */
public interface BaseDao<T> {

	/**
	 * 获取单条数据
	 * @param id
	 * @return
	 */
	public T get(Integer id);
	
	/**
	 * 获取单条数据
	 * @param entity
	 * @return
	 */
	public T get(T entity);
	
	/**
	 * 查询数据列表，如果需要分页，请设置分页对象，如：entity.setPage(new Page<T>());
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity);
	
	/**
	 * 查询所有数据列表
	 * 
	 * @return
	 */
	public List<T> findAllList(T entity);
	
	/**
	 * 插入数据
	 * @param entity
	 * @return
	 */
	public int insert(T entity);
	
	/**
	 * 更新数据
	 * @param entity
	 * @return
	 */
	public int update(T entity);
	
	
	/**
	 * 删除数据（逻辑删除，更新del_flag字段为1）
	 * @param entity
	 * @return
	 */
	public int delete(T entity);
	
	/**
	 * 删除数据（物理删除）
	 * @param entity
	 * @return
	 */
	public int remove(T entity);
}

