package dao;


import com.bookstore.dao.BookDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import javax.persistence.EntityNotFoundException;
import javax.persistence.PersistenceException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class BookDAOTest {

	public static BookDAO bookDao;

	@BeforeAll
	public static void setUpBeforeClass() throws Exception {
			bookDao = new BookDAO();
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
		bookDao.close();
	}

	@Test
	void testCreateBook() throws IOException, ParseException {
		Book newBook = new Book();

		Category category = new Category("java core");
		category.setCategoryId(1);
		newBook.setCategory(category);

		newBook.setTitle("Effective Java (2nd Edition");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		newBook.setPrice(34.87f);
		newBook.setIsbn("0321356683");

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		newBook.setPublishDate(publishDate);

		String imagePath = "src/main/resources/books/Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		Book createdBook = bookDao.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	@Test
	public void testCreate2Book() throws ParseException, IOException {
		Book newBook = new Book();

		Category category = new Category("java core");
		category.setCategoryId(1);
		newBook.setCategory(category);

		newBook.setTitle("Spring in Action: Covers Spring 4");
		newBook.setAuthor("Craig Walls");
		newBook.setDescription("Spring in Action, Fourth Edition is a hands-on guide to the Spring Framework.");
		newBook.setPrice(33.99f);
		newBook.setIsbn("161729120X");

		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("11/28/2014");
		newBook.setPublishDate(publishDate);

		String imagePath = "src/main/resources/books/Java 8 in Action.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);

		Book createdBook = bookDao.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	@Test
	void testUpdateBook() throws IOException, ParseException {
		Book existBook = new Book();
		existBook.setBookId(1);

		Category category = new Category("Java Core");
		category.setCategoryId(1);
		existBook.setCategory(category);

		existBook.setTitle("Effective Java (3rd Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotations, autoboxing");
		existBook.setPrice(40f);
		existBook.setIsbn("0321356683");

		SimpleDateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = dateFormat.parse("05/28/2008");
		existBook.setPublishDate(publishDate);

		String imagePath = "src/main/resources/books/Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);

		Book updateBook = bookDao.update(existBook);
		assertEquals(updateBook.getTitle(),"Effective Java (3rd Edition)");
	}

	@Test
	public void testDeleteBookFail() {
		PersistenceException exception = Assertions.assertThrows(EntityNotFoundException.class, () -> {
			Integer bookId = 100;
			bookDao.delete(bookId);
			assertTrue (true);
		}, "EntityNotFoundException expected");
		Assertions.assertEquals("Unable to find com.bookstore.entity.Book with id 100", exception.getMessage());
	}

	@Test
	public void testDeleteBookSuccess() {
		Integer bookId = 37;
		bookDao.delete(bookId);
		assertTrue(true);
	}

	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDao.get(bookId);
		assertNull(book);
	}
	
	@Test
	public void testGetBookSuccess() {
		Integer bookId = 38;
		Book book = bookDao.get(bookId);
		assertNotNull(book);
	}

	@Test
	public void testListAll() {
		List<Book> listBooks = bookDao.listAll();
		for (Book book : listBooks) {
			System.out.println(book.getAuthor() + "-" + book.getTitle());
		}
		assertFalse(listBooks.isEmpty());
	}

	@Test
	public void testBookFindByTitleNotExist() {
		String title = "Think in Java";
		Book book = bookDao.findByTitle(title);
		assertNull(book);
	}
	
	@Test
	public void testBookFindByTitleExist() {
		String title = "Spring in Action: Covers Spring 4";
		Book book = bookDao.findByTitle(title);
		System.out.println(book.getAuthor());
		System.out.println(book.getPrice());

		assertNotNull(book);
	}
	
	@Test
	public void testCount() {		
		long totalBooks = bookDao.count();	
		assertEquals(totalBooks,2 );
	}

	@Test
	public void testCountByCategory(){
		int categoryId = 1;
		long numOfBooks =bookDao.countByCategory(categoryId);
		assertTrue(numOfBooks>0);
	}
	
	@Test
	public void testListByCategory() {		
		int categoryId = 1;
		List<Book>listBooks = bookDao.listByCategory(categoryId);
		assertTrue(listBooks.size()>0);
	}
	@Test
	public void testListNewBooks() {		
		List<Book>listNewBooks = bookDao.listNewBooks();
		for (Book aBook : listNewBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getPublishDate());
		}
		assertEquals(4,listNewBooks.size());
	}

	@Test
	public void testSearchBookInAuthor() {
		String keyword = "Craig";
		List<Book> result = bookDao.search(keyword);

		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}

		assertEquals(1, result.size());
	}

	@Test
	public void testSearchBookInDescription() {
		String keyword = "Spring in Action";
		List<Book> result = bookDao.search(keyword);

		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}

		assertEquals(1, result.size());
	}
	
	@Test
	public void testSearchBookInTitle() {		
		String keyword = "java";
		List<Book>result = bookDao.search(keyword);
		for (Book aBook : result) {
			System.out.println(aBook.getTitle());
		}
		assertEquals(6, result.size());
	}

	@Test
	public void testBestSellingBook() {
		List<Book> topBestSellingBooks = bookDao.listBestSellingBooks();

		for (Book book : topBestSellingBooks) {
			System.out.println(book.getTitle());
		}
		assertEquals(0, topBestSellingBooks.size());
	}

	@Test
	public void testTopFavouredBook() {
		List<Book> topFavoredBooks = bookDao.listMostFavouredBooks();
		for (Book book : topFavoredBooks) {
			System.out.println(book.getTitle());
		}
		assertEquals(0, topFavoredBooks.size());
	}
}

