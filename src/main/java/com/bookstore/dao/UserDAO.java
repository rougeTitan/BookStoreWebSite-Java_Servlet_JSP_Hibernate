package com.bookstore.dao;

import com.bookstore.entity.Users;


import javax.persistence.EntityManager;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class UserDAO extends JpaDAO<Users> implements GenericDAO<Users> {

	public UserDAO(EntityManager entityManager) {
		super();
	}

	public UserDAO() {
	}


	@Override
	public Users create(Users user) {
		return super.create(user);
	}

	@Override
	public Users update(Users user) {
		return super.update(user);
	}

	@Override
	public Users get(Object userid) {
		return super.find(Users.class, userid);
	}

	@Override
	public void delete(Object userid) {
		super.delete(Users.class, userid);
	}

	@Override
	public List<Users> listAll() {
		return super.findWithNamedQuery("Users.findAll");
	}

	@Override
	public long count() {
		return super.countWithNamedQuery("Users.countAll");
	}

	public Users findByEmail(String email) {
		List<Users> listUsers = super.findWithNamedQuery("Users.findByEmail", "email", email);
		if (listUsers != null && listUsers.size() > 1) {
			return listUsers.get(0);
		}
		return null;
	}

	public boolean checkLogin(String email, String password) {
		Map<String, Object> parameters = new HashMap();
		parameters.put("email", email);
		parameters.put("password", password);
		List<Users> listUsers = super.findWithNamedQuery("Users.checkLogin", parameters);
		return listUsers.size() == 1;
	}

}
