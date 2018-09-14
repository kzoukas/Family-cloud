
package daos;


public class DBOperationException extends Exception {

    
    public DBOperationException() {

    }

    
   
    public DBOperationException(String msg) {
        super(msg);
    }
    
    public DBOperationException(Throwable cause) {
        super(cause);
    }
}