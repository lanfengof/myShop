package com.funtl.my.shop.web.admin.service.test;
/*
 * @Author: two
 */

import com.funtl.my.shop.domain.TbUser;
import com.funtl.my.shop.web.admin.service.TbUserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class TbUserServiceTest {

    @Autowired
    private TbUserService tbUserService;

    @Test
    public void testSelectAll() {
        List<TbUser> tbUsers = tbUserService.selectAll();
        for (TbUser tbUser : tbUsers) {
            System.out.println(tbUser.getUsername());
            System.out.println(tbUser.getEmail());
        }
    }

    @Test
    public void TestInsert() {
        TbUser tbUser = new TbUser();
        tbUser.setUsername("Lan1");
        tbUser.setPhone("13512341234");
        tbUser.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));
        tbUser.setEmail("lan@funtl.com");
        tbUser.setCreated(new Date());
        tbUser.setUpdated(new Date());
        tbUserService.save(tbUser);
    }

    @Test
    public void testMD5() {
        System.out.println(DigestUtils.md5DigestAsHex("123456".getBytes()));
    }

    @Test
    public void testDelete() {
        tbUserService.delete(2L);
    }

    @Test
    public void testGetById() {
        TbUser tbUser = tbUserService.getById(1L);
        System.out.println(tbUser.getUsername());
    }

    @Test
    public void testUpdate() {
        TbUser tbUser = tbUserService.getById(3L);

        tbUser.setUsername("李四");
        tbUser.setEmail("lisi@funtl.com");
        tbUser.setPhone("13198765432");
        tbUserService.update(tbUser);
    }

    @Test
    public void testSelectByUsername() {
        List<TbUser> tbUsers = tbUserService.selectByUsrename("张");
        for (TbUser tbUser : tbUsers) {
            System.out.println(tbUser.getUsername());
        }
    }
    /*@Test
    public void testMd5(){
        System.out.println(tbUserService.selectMd5());
    }*/

    @Test
    public void test() {

//        new O().main();
    }

}

class V {
    public int i = 10;
    public String toString() {
        return "V{" +
                "i=" + i +
                '}';
    }
}
class O {
    public void main() {
        O o = new O();
        o.ametod();
    }
    public void ametod() {
        int i = 99;
        V v = new V();
        v.i = 30;
        another(v, i);
        System.out.println("ametod:"+v.toString());
    }
    public void another(V v, int i) {
        i = 0;
        v.i = 20;
        System.out.println("another.v.hashCode:"+v.hashCode());
        V v2 = new V();
        v = v2;
//        改变地址引用,方法运行完毕引用消失
        System.out.println("another:"+v.toString());
        v.i=v2.i;
        /*System.out.println(v.i);
        System.out.println(i);*/
    }
}


