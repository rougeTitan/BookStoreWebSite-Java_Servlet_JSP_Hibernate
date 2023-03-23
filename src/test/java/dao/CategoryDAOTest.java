package dao;


import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CategoryDAOTest {

	private static CategoryDAO categoryDAO;
	
	@BeforeAll
	public static void setUpBeforeClass() throws Exception {
		categoryDAO = new CategoryDAO();
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
	      categoryDAO.close();
	}

	@Test
	void testCreateCategory() {
		Category newCat = new Category("core java");
		Category category = categoryDAO.create(newCat);
		assertTrue(category !=null && category.getCategoryId() > 0);
	}

	@Test
	void testUpdateCategory() {
		Category Cat = new Category("java core");
		Cat.setCategoryId(1);
		Category category = categoryDAO.update(Cat);
		assertEquals(Cat.getName(), category.getName());
	}

	@Test
	void testDeleteCategory() {
		Integer catId =13;
		categoryDAO.delete(catId);

		Category Cat = categoryDAO.get(catId);
		assertNull(Cat);
	}

	@Test
	void testListAll() {
		List<Category> listCategory = categoryDAO.listAll();
		listCategory.forEach(c -> System.out.println(c.getName() + ", "));
		assertTrue(listCategory.size()>0);
	}

	@Test
	void testCount() {
		long totalCategories = categoryDAO.count();
		assertEquals(3,totalCategories);
	}

	@Test
	void testGet() {
		Integer catId =1;
		Category Cat = categoryDAO.get(catId);
		assertNotNull(Cat);
	}

	@Test
	public void testFindByName(){
		String name = "Java Core";
		Category category = categoryDAO.findByName(name);
		assertNotNull(category);
	}

	@Test
	public void testFindByNameNotFound(){
		String name = "Java Core1";
		Category category = categoryDAO.findByName(name);
		assertNull(category);
	}

}
