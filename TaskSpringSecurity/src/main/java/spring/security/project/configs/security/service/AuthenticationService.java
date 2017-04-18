package spring.security.project.configs.security.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import spring.security.project.model.User;
import spring.security.project.service.interfaces.UserService;


/**
 * Created by SKYNET on 07.04.2017.
 */
@Service
public class AuthenticationService implements UserDetailsService {
    @Autowired
    UserService service;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = service.getByLogin(username);

        if(user == null) {
            throw  new UsernameNotFoundException("Username " + username + " not found");
        }

        return user;
    }
}
