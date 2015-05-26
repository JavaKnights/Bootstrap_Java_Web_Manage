/**
 * Project Name:fengdi-common-provider File Name:BaseService.java Package
 * Name:com.fengdi.fds.service Date:2015年4月22日上午7:00:15 Copyright (c) 2015, xieyuan_love@qq.com All
 * Rights Reserved.
 *
 */

package com.xiuxinger.origin.common.base;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

/**
 * ClassName:BaseService <br/>
 * DESCRIPTION:service基类，定义基本的CRUD方法. <br/>
 * Date: 2015年4月22日 上午7:00:15 <br/>
 * 
 * @author Leoxxx
 * @version
 * @since JDK 1.7
 * @see
 */
@Transactional(readOnly = true)
public class BaseService<D extends BaseDao<T>, T extends BaseEntity<T>> {

	/**
	 * 持久层对象
	 */
	@Autowired
	protected D dao;

	/**
	 * 获取单条数据
	 * 
	 * @param id
	 * @return
	 */
	public T get(Integer id) {
		return dao.get(id);
	}

	/**
	 * 获取单条数据
	 * 
	 * @param entity
	 * @return
	 */
	public T get(T entity) {
		return dao.get(entity);
	}

	/**
	 * 查询列表数据
	 * 
	 * @param entity
	 * @return
	 */
	public List<T> findList(T entity) {
		return dao.findList(entity);
	}

	/**
	 * 
	 * 查询所有数据
	 * 
	 * 
	 * @return
	 */
	public List<T> findAllList(T entity) {
		return dao.findAllList(entity);
	}
	
	/**
	 * 插入数据
	 * 
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void insert(T entity) {
		dao.insert(entity);
	}
	
	/**
	 * 更新数据
	 * 
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void update(T entity) {
		dao.update(entity);
	}

	/**
	 * 删除数据
	 * 
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void delete(T entity) {
		dao.delete(entity);
	}
	
	/**
	 * 删除数据
	 * 
	 * @param entity
	 */
	@Transactional(readOnly = false)
	public void remove(T entity) {
		dao.remove(entity);
	}

//	/**
//	 * 查询分页数据
//	 * @param page 分页对象
//	 * @param entity
//	 * @return
//	 */
//	public PageInfomation<T, Map<String, Object>> findPage(T entity, int pageNum, int pageSize) {
//		PageHelper.startPage(pageNum, pageSize);
//		
//		List<T> list = dao.findList(entity);
//		
//		PageInfo<T> pageInfo = new PageInfo<T>(list);
//		PageInfomation<T, Map<String, Object>> pg = new PageInfomation<T, Map<String, Object>>(pageInfo.getPageNum(), pageInfo.getSize(), pageInfo.getTotal(), pageInfo.getPages(), list);
//		
//		return pg;
//	}
//	
//	/**
//     * 查询分页数据 添加额外数据
//     * @param page 分页对象
//     * @param entity
//     * @return
//     */
//    public PageInfomation<T, Map<String, Object>> findPage(T entity, int pageNum, int pageSize, Map<String, Object> otherDate) {
//        PageHelper.startPage(pageNum, pageSize);
//        
//        List<T> list = dao.findList(entity);
//        
//        PageInfo<T> pageInfo = new PageInfo<T>(list);
//        PageInfomation<T, Map<String, Object>> pg = new PageInfomation<T, Map<String, Object>>(pageInfo.getPageNum(), pageInfo.getSize(), pageInfo.getTotal(), pageInfo.getPages(), list, otherDate);
//        
//        return pg;
//    }
}
