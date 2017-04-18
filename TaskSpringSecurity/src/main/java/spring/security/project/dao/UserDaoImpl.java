package spring.security.project.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import spring.security.project.dao.interfaces.UserDao;
import spring.security.project.model.User;

/**
 * Created by Skrezhet on 09.04.2017.
 */
@Repository
@Transactional
public class UserDaoImpl extends AbstractDao<Long, User> implements UserDao {
    @Override
    public User getUserByLogin(String login) {
        return (User) entityManager.createQuery("FROM User WHERE Login=:login").setParameter("login", login).getSingleResult();
    }
}
