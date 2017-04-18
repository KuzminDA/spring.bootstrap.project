package spring.security.project.dao.interfaces;

import spring.security.project.model.User;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface UserDao extends GenericDao<Long, User> {
    User getUserByLogin(String login);
}
