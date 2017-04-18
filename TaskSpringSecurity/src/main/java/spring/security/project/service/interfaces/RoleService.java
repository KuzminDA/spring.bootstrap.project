package spring.security.project.service.interfaces;

import spring.security.project.model.Role;

import java.util.List;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface RoleService {
    Role getById(Long id);

    Role getByRoleName(String roleName);

    void addRole(Role role);

    void editRole(Role role);

    void deleteRole(Long id);

    List<Role> getAllRoles();
}
