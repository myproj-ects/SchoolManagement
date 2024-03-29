package webd4201.johna;

/**
 * College Interface will act as a 'super parent' to all extended classes in this program
 * @author Akhil John Sunny
 * @version 1.0 (Janaury 8th, 2022)
 * @since January 8th, 2022
 */
public interface CollegeInterface {


    //CONSTANTS
    /**
     * College Interface for school named Durham College
     */
    public static final String college_name = "Durham College";
    /**
     * The phone number that reaches Durham College
     */
    public static final String phone_number = "(905) 721-2000";


    /**
     * Returns the user type depending on the child class it is called.
     * @return String User type
     */
    public abstract String getTypeForDisplay();

}
