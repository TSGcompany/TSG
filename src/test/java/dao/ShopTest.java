package dao;

import com.lcvc.tsg.dao.ShopDao.ShopBorrowingDao;
import com.lcvc.tsg.dao.ShopDao.ShopMyCollectionDao;
import com.lcvc.tsg.dao.ShopDao.ShopIndexDao;
import com.lcvc.tsg.model.Book;
import com.lcvc.tsg.model.Borrowing;
import com.lcvc.tsg.model.Customer;
import com.lcvc.tsg.model.MyCollection;
import com.lcvc.tsg.test.SpringJunitTest;
import org.junit.Test;

import javax.annotation.Resource;
import java.util.List;

/**
 * @ClassName ShopTest
 * @Author Anle
 * @Date 2018/10/17 0017 下午 10:23
 * @Version 1.0
 **/
public class ShopTest extends SpringJunitTest {
    @Resource
    private ShopIndexDao shopIndexDao;
    @Resource
    private ShopBorrowingDao borrowingDao;
    @Resource
    private ShopMyCollectionDao shopMyCollectionDao;
    @Test
    public void getShopIndexBook(){
        List<Book> list  =  shopIndexDao.getShopIndexBook(0);
        for (Book book:list ) {
            System.out.println(book.getBook_name());
        }

    }
    //==============================获取所有的书名用于搜索框内的提示文字============================
    @Test
     public   void getBookNameAll(){
        for (String str:shopIndexDao.getBookNameAll()) {
            System.out.println(str);
        }

    }
    //=============================查看某个用户是否借阅过某本书========================
    @Test
    public   void  selectBorrowingforCustomer(){
         Borrowing borrowing = new Borrowing();
         Book book = new Book();
         book.setBook_id("TSG304177391827");
         borrowing.setBook_id(book);
        Customer customer = new Customer();
        customer.setId(20);
        borrowing.setCustomer_Id(customer);
    System.out.println(borrowingDao.selectBorrowingforCustomer(borrowing));

    }
    //=======================添加一条收藏记录===================
    @Test
   public void addCollection(){
        MyCollection collection  = new MyCollection();
        collection.setCollection_bookIcon("cc");
        collection.setCollection_bookName("kdfkd");
        collection.setCollection_bookNumber("RTes");
        collection.setIscollection(false);
        Customer  customer = new Customer();
        customer.setId(21);
        collection.setCollection_customerId(customer);
        System.out.println(shopMyCollectionDao.addCollection(collection));

    }


    @Test
    public void collectionCountWhereBookAndUser(){
        MyCollection myCollection = new MyCollection();
        Customer  customer = new Customer();
        customer.setId(21);
        myCollection.setCollection_customerId(customer);
        myCollection.setCollection_bookNumber("kdfkd");
        System.out.println(shopMyCollectionDao.collectionCountWhereBookAndUser(myCollection));
    }
}
