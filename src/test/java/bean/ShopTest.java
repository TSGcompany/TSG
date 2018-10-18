package bean;

import com.lcvc.tsg.servers.Shop.ShopIndexBean;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * @ClassName ShopTest
 * @Author Anle
 * @Date 2018/10/18 0018 上午 11:28
 * @Version 1.0
 **/
public class ShopTest extends SpringJunitTest {
    @Resource
    public ShopIndexBean shopIndexBean;
    @Test
    public void getBookRandomNameAll(){//随机获取名字
      System.out.println(shopIndexBean.getBookRandomName());
    }

}
