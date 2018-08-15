/**
 * This class is used as a wrapper class which controls and handles email addresses.
 *
 * @author Jaren Hendricks
 * @author Gareth Edwards
 * @author Nkosingiphile Sibandze
 * Date: 15 August 2018
 */
public class EmailAddress {

    private String recipient ; // eg 'hndjar002'
    private String domain ; // eg 'myuct.ac.za'

    /**
     * Stores the recipient and domain information.
     * @param recipient
     * @param domain
     */
    public EmailAddress( final String recipient, final String domain){
        this.recipient = recipient;
        this.domain = domain;
    }

    /**
     * Method will return the string format of an email address.
     * @return eg. recipient@gmail.com
     */
    public String toString() {
        return recipient + "@" + domain ;
    }
}
