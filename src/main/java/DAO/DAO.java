package DAO;


import user.User;

import java.util.List;

public interface DAO {

    void addUsers(User user);

    List<User> getUsers();
}
