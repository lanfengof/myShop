package com.funtl.my.shop.web.admin.service;/*
 * @Author: two
 */

import com.funtl.my.shop.commons.dto.BaseResult;
import com.funtl.my.shop.domain.TbUser;

import java.util.List;

public interface TbUserService {
    List<TbUser> selectAll();
    BaseResult save(TbUser tbUser);
    void delete(Long id);
    TbUser getById(Long id);
    void update(TbUser tbUser);
    List<TbUser> selectByUsrename(String username);
    TbUser login(String email,String password);
//    long selectMd5();
    List<TbUser> search(TbUser tbUser);
    void deleteMulti(String[] ids);
    List<TbUser> page(int start,int length);
    int count();
}
