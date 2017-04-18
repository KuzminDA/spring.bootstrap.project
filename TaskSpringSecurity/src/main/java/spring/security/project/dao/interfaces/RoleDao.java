package spring.security.project.dao.interfaces;

import spring.security.project.model.Role;

/**
 * Created by Skrezhet on 09.04.2017.
 */
public interface RoleDao extends GenericDao<Long, Role> {
    Role getRoleByRoleName(String roleName);
}
