package spring.security.project.service.interfaces;

import spring.security.project.model.User;

import java.util.List;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface UserService {
    User getById(Long id);

    User getByLogin(String login);

    void addUser(User user);

    void editUser(User user);

    void deleteUser(Long id);

    List<User> getAllUsers();
}
