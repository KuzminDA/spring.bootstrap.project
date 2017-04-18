package spring.security.project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import spring.security.project.model.Role;
import spring.security.project.model.User;
import spring.security.project.service.interfaces.RoleService;
import spring.security.project.service.interfaces.UserService;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Skrezhet on 09.04.2017.
 */
@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String homePage(ModelMap modelMap) {
        return "redirect:/user";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginPage(ModelMap modelMap) {
        return "login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logOut(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login?logout";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registrationPage(ModelMap modelMap) {
        return "registration";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.GET)
    public String addUserPage(ModelMap modelMap) {
        return "add";
    }

    @RequestMapping(value = "/admin/edit", method = RequestMethod.POST)
    public String updateUser(@RequestParam(value = "id") Long id,
                             @RequestParam(value = "name") String name,
                             @RequestParam(value = "login") String login,
                             @RequestParam(value = "password") String password,
                             @RequestParam(value = "role") Set<Role> roles) {
        if (roles.size() == 0 || password.equals("") || login.equals("") || name.equals("")) {
            return "redirect:/admin";
        }
        Set<Role> roleSet = new HashSet<>();
        for (Role role : roles) {
            try {
                roleSet.add(roleService.getByRoleName(role.getRoleName()));
            } catch (NoResultException exp) {

            }
        }
        User user = new User(id, name, login, password, roleSet);

        try {
            userService.editUser(user);
        } catch (Exception exp) {
            return "redirect:/admin";
        }
        return "redirect:/admin";
    }

    @RequestMapping(value = "/access_denied", method = RequestMethod.GET)
    public String deniesPage(ModelMap modelMap) {
        return "access_denied";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Long id) {
        userService.deleteUser(id);
        return "redirect:/admin";
    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage(ModelMap modelMap) throws Exception {
        modelMap.addAttribute("adminRole", new Role("Admin"));
        modelMap.addAttribute("userRole", new Role("User"));
        modelMap.addAttribute("users", userService.getAllUsers());
        return "admin";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String userPage(ModelMap modelMap) {
        Set<Role> roles = ((User) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getRoles();

        modelMap.addAttribute("adminRole", new Role("Admin"));
        modelMap.addAttribute("userRole", new Role("User"));
        modelMap.addAttribute("roles", roles);
        modelMap.addAttribute("name", getPrincipal());
        modelMap.addAttribute("role", getPrincipalRole());
        return "user";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String addUser(@RequestParam(value = "name") String name,
                          @RequestParam(value = "login") String login,
                          @RequestParam(value = "password") String password,
                          @RequestParam(value = "role") Set<Role> roles) throws UsernameNotFoundException {
        if (roles.size() == 0 || password.equals("") || login.equals("") || name.equals("")) {
            return "redirect:/registration?error";
        }
        Set<Role> roleSet = new HashSet<>();
        for (Role role : roles) {
            try {
                roleSet.add(roleService.getByRoleName(role.getRoleName()));
            } catch (NoResultException exp) {

            }
        }
        User user = new User(name, login, password, roleSet);

        try {
            userService.addUser(user);
        } catch (Exception exp) {
            return "redirect:/registration?duplicate";
        }

        return "redirect:/login";
    }

    @RequestMapping(value = "/admin/add", method = RequestMethod.POST)
    public String addUserPage(@RequestParam(value = "name") String name,
                              @RequestParam(value = "login") String login,
                              @RequestParam(value = "password") String password,
                              @RequestParam(value = "role") Set<Role> roles) throws UsernameNotFoundException {
        if (roles.size() == 0 || password.equals("") || login.equals("") || name.equals("")) {
            return "redirect:/admin/add?error";
        }
        Set<Role> roleSet = new HashSet<>();
        for (Role role : roles) {
            try {
                roleSet.add(roleService.getByRoleName(role.getRoleName()));
            } catch (NoResultException exp) {

            }
        }
        User user = new User(name, login, password, roleSet);

        try {
            userService.addUser(user);
        } catch (Exception exp) {
            return "redirect:/admin/add?duplicate";
        }
        return "redirect:/admin";
    }

    private String getPrincipal() {
        String userName = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof User) {
            userName = ((User) principal).getUsername();
        } else {
            userName = principal.toString();
        }
        return userName;
    }

    private String getPrincipalRole() {
        String role = null;
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        if (principal instanceof User) {
            User user = (User) principal;
            Set<Role> roles = user.getRoles();
            if (roles.contains(new Role("Admin"))) {
                role = "admin";
            } else {
                role = "user";
            }
        } else {
            role = principal.toString();
        }
        return role;
    }
}
