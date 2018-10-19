package bean;

import com.lcvc.tsg.dao.ShopDao.ShopIndexDao;
import com.lcvc.tsg.servers.Shop.ShopIndexBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName ShopTest
 * @Author Anle
 * @Date 2018/10/18 0018 上午 11:28
 * @Version 1.0
 **/
public class ShopTest extends SpringJunitTest {
    @Resource
    public ShopIndexBean shopIndexBean;
    @Resource
    private ShopIndexDao shopIndexDao;
    @Test
    public void getBookRandomNameAll(){//随机获取名字
     // System.out.println(shopIndexBean.getBookRandomName());
//        List listNew = shopIndexDao.getBookNameAll();
//        listNew.add("aa");
//        listNew.add("bb");
//        listNew.add("cc");
//        listNew.add("vv");
        System.out.println(createRandomList( shopIndexDao.getBookNameAll()));


    }
    private  String createRandomList(List list) {
        // TODO Auto-generated method stub
        Map map = new HashMap();
              String str=null;
            while (map.size() < 1) {
                int random = (int) (Math.random() * list.size());
                if (!map.containsKey(random)) {
                    map.put(random, "");
                    str=list.get(random).toString();
                }
            }
            return str;

    }

}
