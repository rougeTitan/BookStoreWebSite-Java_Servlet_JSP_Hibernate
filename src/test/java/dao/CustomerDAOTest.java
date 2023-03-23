package dao;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.entity.Customer;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

class CustomerDAOTest {
	private static CustomerDAO customerDao;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		customerDao = new CustomerDAO();
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		customerDao.close();
	}

	@Test
	void testCreateCustomer() {
		Customer customer = new Customer();
		customer.setEmail("tom@gmail.com");
		customer.setFirstname("Tom Bruce");
		customer.setLastname("Buck");
		customer.setCity("Evanston");
		customer.setState("Illinous");
		customer.setCountry("US");
		customer.setAddressLine1("100 North Avenue");
		customer.setAddressLine2("Apt 231");
		customer.setPassword("pass100tomword");
		customer.setPhone("18001890");
		customer.setZipcode("300100");
		
		Customer savedCustomer = customerDao.create(customer);
		assertTrue(savedCustomer.getCustomerId() > 0);
	}

	@Test
	void testGet() {
		//change as per requirement
		Integer customerId = 12;
		Customer customer = customerDao.get(customerId);
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDao.get(12);
		String firstName = "Tommy";
		customer.setFirstname(firstName);
		
		Customer updatedCustomer = customerDao.update(customer);
		assertEquals(firstName, updatedCustomer.getFirstname());
	}

	@Test
	public void testDeleteObject() {
		Integer customerId = 12;
		customerDao.delete(customerId);
		Customer customer = customerDao.get(1);
		assertNull(customer);
	}
	
	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDao.listAll();
		for (Customer customer : listCustomers) {
			System.out.println(customer.getFirstname());
		}
		assertFalse(listCustomers.isEmpty());
	}
	
	@Test 
	public void testCountAll() {
		long totalCustomers = customerDao.count();
		
		assertEquals(1,totalCustomers);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "tom@gmail.com";
		Customer customer = customerDao.findByEmail(email);
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckInSuccess() {
		String email = "tom@gmail.com";
		String password = "pass100tomword";
		Customer customer = customerDao.checkLogin(email, password);
		assertNotNull(customer);
	}
	
	@Test
	public void testCheckInFail() {
		String email = "tom@gmail.com";
		String password = "passtomword";
		Customer customer = customerDao.checkLogin(email, password);
		assertNull(customer);
	}

}
