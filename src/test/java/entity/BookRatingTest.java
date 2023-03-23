package entity;


import com.bookstore.entity.Book;
import com.bookstore.entity.Review;
import org.junit.jupiter.api.Test;

import java.util.HashSet;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.*;

public class BookRatingTest {

    @Test
    public void testAverageRating1() {
        Book book = new Book();
        Set<Review> reviews = new HashSet<>();
        Review review1 = new Review();
        review1.setRating(5);
        reviews.add(review1);
        book.setReviews(reviews);
        float averageRating = book.getAverageRating();
        assertEquals(5.0, averageRating);
    }

    @Test
    public void testAverageRating2() {
        Book book = new Book();
        float averageRating = book.getAverageRating();
        assertEquals(0.0, averageRating);
    }

    @Test
    public void testAverageRating3() {
        Book book = new Book();

        Set<Review> reviews = new HashSet<>();
        Review review1 = new Review();
        review1.setRating(5);
        reviews.add(review1);

        Review review2 = new Review();
        review2.setRating(4);
        reviews.add(review2);

        Review review3 = new Review();
        review3.setRating(3);
        reviews.add(review3);

        book.setReviews(reviews);

        float averageRating = book.getAverageRating();
        assertEquals(4.0, averageRating);
    }

    @Test
    public void testAverageRatingString1() {
        float averageRating = 0.0f;
        Book book = new Book();
        String ratingString = book.getAverageRatingString(averageRating);
        String expected = ("off,off,off,off,off");
        assertEquals(ratingString,expected);
    }
    @Test
    public void testAverageRatingString2() {
        float averageRating = 5.0f;
        Book book = new Book();
        String ratingString = book.getAverageRatingString(averageRating);
        String expected = ("on,on,on,on,on");
        assertEquals(ratingString,expected);
    }

    @Test
    public void testAverageRatingString3() {
        float averageRating = 3.0f;
        Book book = new Book();
        String ratingString = book.getAverageRatingString(averageRating);
        String expected = ("on,on,on,off,off");
        assertEquals(ratingString,expected);
    }

    @Test
    public void testAverageRatingString4() {
        float averageRating = 4.5f;
        Book book = new Book();
        String ratingString = book.getAverageRatingString(averageRating);
        String expected = ("on,on,on,on,half");
        assertEquals(ratingString,expected);
    }




}
