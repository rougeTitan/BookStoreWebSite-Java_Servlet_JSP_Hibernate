package dao;


import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;


public class ReviewDAOTest {

    private static ReviewDAO reviewDAO;

    @BeforeAll
    public static void setUpBeforeClass() throws Exception {
        reviewDAO = new ReviewDAO();
    }

    @AfterAll
    public static void tearDownAfterClass() throws Exception {
        reviewDAO.close();
    }

    @Test
    public void testCreatReview() {
        Review review = new Review();
        Book book = new Book();
        book.setBookId(1);
        review.setBook(book);
        Customer customer = new Customer();
        customer.setCustomerId(14);
        review.setBook(book);
        review.setCustomer(customer);

        review.setHeadline("This is a very good book!");
        review.setRating(5);
        review.setComment("This is one of the best books I have ever read. I would like to recommend it to you all");

        Review savedReview = reviewDAO.create(review);
        assertTrue(savedReview.getReviewId() > 0);
    }

    @Test
    public void testGetReview() {
        Integer reviewId = 17;
        Review review = reviewDAO.get(reviewId);
        assertNotNull(review);
    }

    @Test
    public void testUpdateReview() {
        Integer reviewId = 17;
        Review review = reviewDAO.get(reviewId);
        review.setHeadline("Excellent Book");
        Review updateReview = reviewDAO.update(review);
        assertEquals(review.getHeadline(), updateReview.getHeadline());
    }

    @Test
    public void testCount() {
        long totalReviews = reviewDAO.count();
        System.out.println("Total Reviews: " + totalReviews);
        assertTrue(totalReviews > 0);
    }

    @Test
    public void testListAll() {
        List<Review> listReview = reviewDAO.listAll();
        for (Review review : listReview) {
            System.out.println(review.getReviewId() + " - " + review.getBook().getTitle()
                    + " - " + review.getCustomer().getFirstname()
                    + " - " + review.getHeadline() + " - " + review.getRating());
        }
        assertTrue(listReview.size() > 0);
    }

    @Test
    public void testDeleteReview() {
        int reviewId = 17;
        reviewDAO.delete(reviewId);
        Review review = reviewDAO.get(reviewId);
        assertNull(review);
    }

    @Test
    public void testFindByCustomerAndBookNotFound() {
        Integer customerId = 100;
        Integer bookId = 99;
        Review result = reviewDAO.findByCustomerAndBook(customerId,bookId);
        assertNull(result);
    }

    @Test
    public void testfindByCustomerAndBookFound() {
        Integer customerId = 14;
        Integer bookId = 1;
        Review result = reviewDAO.findByCustomerAndBook(customerId,bookId);
        assertNotNull(result);
    }

    @Test
    public void testlistMostRecentReview() {
        List<Review> recentReview = reviewDAO.listMostRecent();
        assertEquals(1,recentReview.size());
    }

}
