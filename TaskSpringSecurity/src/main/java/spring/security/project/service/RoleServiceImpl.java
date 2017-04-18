package spring.security.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import spring.security.project.dao.interfaces.RoleDao;
import spring.security.project.model.Role;
import spring.security.project.service.interfaces.RoleService;

import java.util.List;

/**
 * Created by Skrezhet on 09.04.2017.
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleDao dao;

    @Override
    public Role getById(Long id) {
        return dao.getByKey(id);
    }

    @Override
    public Role getByRoleName(String roleName) {
        return dao.getRoleByRoleName(roleName);
    }

    @Override
    public void addRole(Role role) {
        dao.persist(role);
    }

    @Override
    public void editRole(Role role) {
        dao.update(role);
    }

    @Override
    public void deleteRole(Long id) {
        dao.deleteByKey(id);
    }

    @Override
    public List<Role> getAllRoles() {
        return dao.getAll();
    }
}
