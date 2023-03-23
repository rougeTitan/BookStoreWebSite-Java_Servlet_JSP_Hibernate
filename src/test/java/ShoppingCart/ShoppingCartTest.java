package ShoppingCart;


import com.bookstore.controller.frontend.shoppingcart.ShoppingCart;
import com.bookstore.entity.Book;
import org.junit.BeforeClass;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

public class ShoppingCartTest {

    private static ShoppingCart cart;

    @BeforeClass
    public static void setUpBeforeClass() throws Exception {
        cart = new ShoppingCart();
        Book book = new Book(1);
        cart.addItem(book);
        cart.addItem(book);
    }

    @AfterAll
    public static void tearDownAfterClass() throws Exception {
    }

    @Test
    public void testAddItem() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        cart.addItem(book);
        cart.addItem(book);

        Map<Book, Integer> items = cart.getItems();
        int quantity = items.get(new Book(1));
        assertEquals(2, quantity);
    }

    @Test
    public void testRemoveItem() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        cart.addItem(book);

        cart.removeItem(book);
        assertTrue(cart.getItems().isEmpty());
    }

    @Test
    public void testRemoveItem2() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        cart.addItem(book);

        Book book2 = new Book(2);
        cart.addItem(book2);
        cart.removeItem(book2);

        assertNull(cart.getItems().get(book2));
    }

    @Test
    public void getTotalQuantity() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        cart.addItem(book);

        Book book2 = new Book();
        book2.setBookId(2);
        cart.addItem(book2);

        Book book3 = new Book();
        book3.setBookId(2);
        cart.addItem(book3);

        assertEquals(3,cart.getTotalQuantity());
    }

    @Test
    public void getTotalAmount1() {
        ShoppingCart shoppingCart = new ShoppingCart();
        assertEquals(0.0f,shoppingCart.getTotalAmount());
    }

    @Test
    public void getTotalAmount2() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        book.setPrice(10.5f);
        cart.addItem(book);

        Book book2 = new Book();
        book2.setBookId(1);
        book2.setPrice(14.5f);
        cart.addItem(book2);

        assertEquals(21.0f,cart.getTotalAmount());
    }

    @Test
    public void testClear() {
        ShoppingCart cart = new ShoppingCart();

        Book book = new Book();
        book.setBookId(1);
        book.setPrice(10.5f);
        cart.addItem(book);

        cart.clear();
        assertEquals(0, cart.getTotalQuantity());
    }

    @Test
    public void testUpdateCart() {
        ShoppingCart shoppingCart = new ShoppingCart();
        Book book1 = new Book(1);
        Book book2 = new Book(2);

        shoppingCart.addItem(book1);
        shoppingCart.addItem(book2);

        int[] bookIds = {1, 2};
        int[] quantities = {3, 4};

        shoppingCart.updateCart(bookIds, quantities);
        assertEquals(7, shoppingCart.getTotalQuantity());
    }


}
