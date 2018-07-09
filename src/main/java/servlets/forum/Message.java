package servlets.forum;



public class Message {

    private String nick;
    private String text;
    private String date;



    public Message() {
    }

    public Message(String nick, String text) {
        this.nick = nick;
        this.text = text;
    }

    public Message(String nick, String text, String date) {
        this.nick = nick;
        this.text = text;
        this.date = date;
    }

    public String getNick() {
        return nick;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return  nick +" : "+ text + " - " + date ;
    }
}
