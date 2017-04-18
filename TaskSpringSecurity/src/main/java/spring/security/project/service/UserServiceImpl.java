package spring.security.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.security.project.dao.interfaces.UserDao;
import spring.security.project.model.User;
import spring.security.project.service.interfaces.UserService;

import java.util.List;

/**
 * Created by Skrezhet on 09.04.2017.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao dao;

    @Override
    public User getById(Long id) {
        return dao.getByKey(id);
    }

    @Override
    public User getByLogin(String login) {
        return dao.getUserByLogin(login);
    }

    @Override
    public void addUser(User user) {
        dao.persist(user);
    }

    @Override
    public void editUser(User user) {
        dao.update(user);
    }

    @Override
    public void deleteUser(Long id) {
        dao.deleteByKey(id);
    }

    @Override
    public List<User> getAllUsers() {
        return dao.getAll();
    }
}
