package DAO;


import user.User;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class SerializableDAO implements DAO {
    private static final String PATH = "/home/lin/app/tomcat/webapps/login/User.txt"; //PLEASE NOTE, the path is specified for my operating system
                                                                                      //with my settings.

    public List<User> getUsers() {
        try (ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream(PATH))) {

            return (List<User>) inputStream.readObject();

        } catch (Exception e) {
            System.out.println("Ошибка при чтений файла или файла не существует!  get user");
        }

        return new ArrayList<>();
    }

    @Override
    public void addUsers(User user) {

        List<User> users = getUsers();
        users.add(user);

        try (ObjectOutputStream outputStream = new ObjectOutputStream((new FileOutputStream(PATH)))) {
            outputStream.writeObject(users);
        } catch (Exception e) {
            System.out.println("Ошибка при записи! add user");
        }
    }
}
