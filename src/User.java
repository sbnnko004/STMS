
public abstract class User {

    //Attributes
    private String firstName;
    private String lastName;
    private String email;
    private int userID;
    private String password;
    private String username;


    public User(String userName,String firstName,String lastName, String emailAddress) {
        this.firstName=firstName;
        this.lastName=lastName;
        this.email=emailAddress;
        this.setUserName(userName);
    }

    public User(String userName,String firstName,String lastName, String emailAddress, int userID, String passWord) {
        this.setUserName(userName);
        this.firstName=firstName;
        this.lastName=lastName;
        this.email=emailAddress;
        this.userID=userID;
        this.password=passWord;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }
    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }
    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return email;
    }
    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.email = emailAddress;
    }
    /**
     * @return the pS_no
     */
    public int getUserID() {
        return userID;
    }
    /**
     * @return the passWord
     */
    public String getPassWord() {
        return password;
    }
    /**
     * @param passWord the passWord to set
     */
    public void setPassWord(String passWord) {
        this.password = passWord;
    }
    /**
     * @return the userName
     */
    public String getUserName() {
        return username;
    }
    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.username = userName;
    }

}
