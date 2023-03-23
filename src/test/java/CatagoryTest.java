

import com.bookstore.entity.Category;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class CatagoryTest {

	public static void main(String[] args) {
		Category newCat = new Category("Core Java");

		EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
		EntityManager entityManager = entityManagerFactory.createEntityManager();

		entityManager.getTransaction().begin();
		entityManager.persist(newCat);
		entityManager.getTransaction().commit();
		entityManager.close();
		entityManagerFactory.close();

		System.out.println("A category Object was Persisted");
	}
}
