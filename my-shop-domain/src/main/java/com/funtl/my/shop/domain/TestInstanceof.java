package com.funtl.my.shop.domain;

import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/*
 * @Author: two
 */
class BeanInfo {

    private String open_status;
    private int id;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOpen_status() {
        return open_status;
    }

    public void setOpen_status(String open_status) {
        this.open_status = open_status;
    }
}

class A extends BeanInfo {

    private String aid;

    public String getAid() {
        return aid;
    }

    public void setAid(String aid) {
        this.aid = aid;
    }
}

class B extends BeanInfo {

    private String bid;

    public String getBid() {
        return bid;
    }

    public void setiId(String bid) {
        this.bid = bid;
    }

}

public class TestInstanceof {

    /**
     * @param args
     */
    public static void main(String[] args) {

        List<BeanInfo> list = new ArrayList<BeanInfo>();
        A a = new A();
        a.setOpen_status("a");
        a.setAid("aid");
        list.add(a);

        B b = new B();
        b.setOpen_status("b");
        b.setiId("bid");
        b.setId(2);
        list.add(b);

        for (int i = 0; i < list.size(); i++) {
            if (list.get(i) instanceof A) {
                A aa = (A) list.get(i);
                System.out.println("A类 --> open_status = "
                        + aa.getOpen_status());
                System.out.println("A类 --> aid = " + aa.getAid());

            } else if (list.get(i) instanceof B) {
                B bb = (B) list.get(i);
                System.out.println("B类 --> open_status = "
                        + bb.getOpen_status());
                System.out.println("B类 --> id = "
                        + bb.getId());
                System.out.println("B类 --> bid = " + bb.getBid());

            } else {
                System.out.println("都不是啊");
            }
        }

    }
}
@Component
class C {
    public C() {
    }
}
@Component
class D extends C {
    public D() {
    }

    public void cIsD(){

    }
}