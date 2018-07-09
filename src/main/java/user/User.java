package user;

import java.io.Serializable;

public class User implements Serializable {


    private String loginName;
    private String passwdName;

    public User(String loginName, String passwdName) {
        this.loginName = loginName;
        this.passwdName = passwdName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPasswdName() {
        return passwdName;
    }

    public void setPasswdName(String passwdName) {
        this.passwdName = passwdName;
    }

    @Override
    public String toString() {
        return "User{" +
                "loginName='" + loginName + '\'' +
                ", passwdName='" + passwdName + '\'' +
                '}';
    }

   /*
    public String toFileString() {
        return loginName + "_" + passwdName;
    }
    */

}
