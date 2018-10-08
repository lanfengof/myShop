package com.funtl.my.shop.web.admin.dao;
/*
 * @Author: two
 */

import com.funtl.my.shop.domain.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TbUserDao {
    /**
     * 查询用户表全部信息
     */
    List<TbUser> selectAll();

    /**
     * 新增用户
     * @param tbUser
     */
    void insert(TbUser tbUser);

    /**
     * 删除用户信息
     */
    void delete(Long id);

    /**
     * 根据id查找用户
     * @param id
     * @return
     */
    TbUser getById(Long id);

    /**
     * 更新用户信息
     * @param tbUser
     */
    void update(TbUser tbUser);

    /**
     * 根据用户名模糊查找
     * @param username
     * @return
     */
    List<TbUser> selectByUsername(String username);

    /**
     * 根据邮箱查询用户
     */
    TbUser getByEmail(String email);

//    long selectMd5();

    /**
     * 搜索
     */
    List<TbUser> search(TbUser tbUser);

    /**
     * 批量删除
     */
    void deleteMulti(String[] ids);

    /**
     * 分页查询
     */
    List<TbUser> page(Map<String,Object> params);

    /**
     * 查询总记录数
     */
    int count();
}
