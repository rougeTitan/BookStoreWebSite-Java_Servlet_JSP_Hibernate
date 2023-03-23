package dao;

import com.bookstore.dao.UserDAO;
import com.bookstore.entity.Users;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceException;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class UserDaoTest {

	private static UserDAO userDAO;
	private static EntityManager entityManager;

	@BeforeEach
	public void setUpClass() throws Exception {
		userDAO = new UserDAO(entityManager);
	}

	@Test
	public void testCreateUsers() {

		Users user1 = new Users();
		user1.setEmail("jennei@gmail.com");
		user1.setFullName("Jennie Black");
		user1.setPassword("1234567890");
		user1 = userDAO.create(user1);
		assertTrue(user1.getUserId() > 0);

	}

	@Test
	public void testCreateUsersFieldsNotSet() {
       PersistenceException exception = Assertions.assertThrows(PersistenceException.class,()->{
		   Users user1 = new Users();
		   user1 = userDAO.create(user1);
	   },"PersistenceException expected");

       Assertions.assertEquals("org.hibernate.PropertyValueException: not-null property references a null or transient value : com.bookstore.entity.Users.email",exception.getMessage());
	}

	@Test
	public void testUpdateUsers() {

		Users user = new Users();
		user.setUserId(1);
		user.setEmail("xun@codejava.net");
		user.setFullName("Xun Xia");
		user.setPassword("password2");

		user = userDAO.update(user);

		String expected = "password2";
		String actual = user.getPassword();
		assertEquals(expected, actual);

	}

	@Test
	public void testGetUsersFound() {
		Integer userId = 2;
		Users user = userDAO.get(userId);

		if (user != null) {
			System.out.println(user.getEmail());
		}
		assertNotNull(user);
	}

	@Test
	public void testGetUsersNotFound() {
		Integer userId = 99;
		Users user = userDAO.get(userId);
		assertNull(user);
	}

	@Test
	public void testDeleteUsers() {
		Integer userId = 6;
		userDAO.delete(userId);
		Users user = userDAO.get(userId);
		assertNull(user);
	}

	//test case runs but required junit4
	//	@Test
	//	public void testDeleteNonExistUsers() {
	//		Integer userId = 55;
	//		userDAO.delete(userId);
	//	}

	@Test
	public void testFindByEmail() {
	//change the name as per your db entry
	String email = "dummy@invitrogen.com";
	Users user = userDAO.findByEmail(email);
	assertNotNull(user);
	}

	@Test
	public void testListAll() {
		List<Users> listUsers = userDAO.listAll();
		for (Users user : listUsers)
		{
			System.out.println(user.getEmail());
		}
		Assertions.assertTrue(listUsers.size() > 0);
	}

	//change the value based on the total count of the users in db
	@Test
	public void testCount() {
	long totalUsers = userDAO.count();
		Assertions.assertEquals(15, totalUsers);
	}

	@Test
	public void testCheckLoginSuccess() {
		String email = "jennei@gmail.com";
		String password = "1234567890";
		boolean loginResult = userDAO.checkLogin(email, password);
		Assertions.assertTrue(loginResult);
	}

	@Test
	public void testCheckLoginFail() {
		String email = "123@gmail.com";
		String password = "123490";
		boolean loginResult = userDAO.checkLogin(email, password);
	 	assertFalse(loginResult);
	}

	@AfterAll
	public static void tearDownAfterClass() throws Exception {
		userDAO.close();
	}

}
