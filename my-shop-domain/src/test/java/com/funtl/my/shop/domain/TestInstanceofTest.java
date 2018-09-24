package com.funtl.my.shop.domain;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/*
 * @Author: two
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-context.xml")
public class TestInstanceofTest {
    @Autowired
    private C c;
    @Autowired
    private D d;

    @Test
    public void cIsD() {
        System.out.println(c instanceof D);//false
        System.out.println(d instanceof D);//true
        System.out.println(c instanceof C);//true
        System.out.println(d instanceof C);//true
        Integer b = Integer.valueOf("100", 16);
        Integer c = Integer.valueOf("100", 10);
        System.out.println(b);
        System.out.println(c);
//报错        System.out.println(c instanceof C);
        System.out.println(d instanceof D);//true
        System.out.println(c instanceof Integer);//true
        System.out.println(Integer.valueOf('A'));//65
        System.out.println(Integer.parseInt("128") == (Integer) 128);
    }
}
