package webd4201.johna;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;
import java.util.Date;
import java.util.Vector;
/**
 * @author Akhil John Sunny
 * @date March 11 2022
 */

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static Student astudent;
       
    /**
     * Method when the page opens in post mode
     * @see HttpServlet#HttpServlet()
     */
  
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        StringBuffer errorBuffer = new StringBuffer();
        /**
         * Try to get the connection
         */
        try {// Try to get the connection
            Connection c = DatabaseConnect.initialize();
            Student.initialize(c);
            User.initialize(c);
            HttpSession session = request.getSession(true);
            
            String studentId = new String();
            String firstName = new String();
            String lastName = new String();
            String programCode = new String();
            String programDescription = new String();
            String year = new String();
            String email = new String();
            String password = new String();
            String confirmPassword = new String();
            
            long possibleId = 0L;
            int selectedYear = 0;
            boolean noErrors = true;

            // Declare date objects to be converted into SQL dates.
            Date enrolled = new Date();
            Date lastAccessed = new Date();

            // Convert both dates into SQL dates
            java.sql.Date enrolDate = new java.sql.Date(enrolled.getTime());
            java.sql.Date lastAccess = new java.sql.Date(lastAccessed.getTime());
            /**
             * Try to get the connection
             */
            try {
            	 
                // Retrieve data from page
                studentId = request.getParameter("ID").trim();
                firstName = request.getParameter("FirstName").trim();
                lastName = request.getParameter("LastName").trim();
                programCode = request.getParameter("ProgramCode").trim();
                programDescription = request.getParameter("ProgramDescription").trim();
                year = request.getParameter("Year");    
                email = request.getParameter("Email").trim();
                password = request.getParameter("Password");
                confirmPassword = request.getParameter("ConfirmPassword");
                
	            // Try to convert the id to long
	            possibleId = Long.parseLong(studentId);
	           
	            
	            if (studentId == null) {
	            	studentId = "";
                    noErrors = false;
                } else if (studentId.length() == 0) {
                    errorBuffer.append("<strong>Student ID field "
                            + "cannot be empty.</strong>");

                    studentId = "";
                    noErrors = false;
                }
	            //Validating id
	            if (studentId.length() > User.ID_NUMBER_LENGTH) {
	                errorBuffer.append("<strong>Your ID cannot be longer than ");
	                errorBuffer.append(User.ID_NUMBER_LENGTH +" characters.");
	                errorBuffer.append(" Please try again.</strong>");
	                
	                studentId = "";
	                noErrors = false;
	            }
	            
	            //Validate firstName
	            if (firstName.length() == 0) {
                    errorBuffer.append("<strong>First Name cannot be empty.</strong>");

                    firstName = "";
                    noErrors = false;
                }
	            //Validate lastName
                if (lastName.length() == 0) {
                    errorBuffer.append("<strong>Last Name cannot be empty.</strong>");

                    lastName = "";
                    noErrors = false;
                }
                //Validate programCode
                if (programCode.length() == 0) {
                    errorBuffer.append("<strong>Program Code cannot be empty.</strong>");

                    programCode = "";
                    noErrors = false;
                }
                //Validate programDescription
                if (programDescription.length() == 0) {
                    errorBuffer.append("<strong>Program Description cannot be empty.</strong>");

                    programDescription = "";
                    noErrors = false;
                }
	            // Try to parse the selected value for year into an integer.
	            selectedYear = Integer.parseInt(year);
	            
	            // Validate email address
	            if (email.length() == 0) {
                    errorBuffer.append("<strong>Email cannot be empty.</strong>");

                    email = "";
                    noErrors = false;
                } else if (!User.validateEmail(email)) {
                    errorBuffer.append("<strong>Email is invalid.</strong>");
                    
                    email = "";
                    noErrors = false;
                }
	            
	            // Validate password
	            if (password.length() == 0) {
                    errorBuffer.append("<strong>Password cannot be empty.</strong>");

                    password = "";
                    noErrors = false;
                } else if (confirmPassword.length() == 0) {
                    errorBuffer.append("<strong>Confirm Password cannot be empty.</strong>");

                    confirmPassword = "";
                    noErrors = false;
                } else if (password.length() <= User.MINIMUM_PASSWORD_LENGTH
                            && password.length() >= User.MAXIMUM_PASSWORD_LENGTH) {
                        errorBuffer.append("<strong>Password cannot be less than ");
                        errorBuffer.append(User.MINIMUM_PASSWORD_LENGTH);
                        errorBuffer.append(" characters and more than ");
                        errorBuffer.append(User.MAXIMUM_PASSWORD_LENGTH);
                        errorBuffer.append(" characters.</strong>");

                        password = "";
                        confirmPassword = "";
                        noErrors = false;
                        
                  }
	            
                else if (!password.equals(confirmPassword)) {
                	
                    errorBuffer.append("Confirm Password should match");
                    noErrors = false;
                }

	            
	           // If there are no errors try to go to the database
	            if (noErrors) {
	            	
	            	astudent = new Student();	                
	                String strongPassword = astudent.hashPassword(password);

                    Student aStudent = new Student(possibleId, strongPassword, firstName, lastName, email,
                    		lastAccess, enrolDate,true,  's',  programCode, programDescription, selectedYear, new Vector<>());

                    session.setAttribute("aStudent", aStudent);
                    
                    try {
                    	

                        // Disable auto-commit mode
                        c.setAutoCommit(false);
                        boolean userCreated = userDA.create(aStudent);
                        System.out.println("User created is" + userCreated);
                        boolean studentCreated = StudentDA.create(aStudent);
                        System.out.println("Student created is" + studentCreated);
                        if (userCreated && studentCreated) {
                            c.commit();
                            session.setAttribute("message", "Your account has been successfully created.");
                            session.setAttribute("errors", "");
                            response.sendRedirect("./dashboard.jsp");
                        } else {
                            c.rollback();
                            session.setAttribute("message", "");
                            session.setAttribute("errors", "Failed to create account.");
                            response.sendRedirect("./register.jsp");
                        }	
  

                        

                    } catch (SQLException sqle) {
                    	System.out.println(sqle);
                    	
                        errorBuffer.append("Something went wrong with the database"
                                + " transaction.");
                        session.setAttribute("errors", errorBuffer.toString());
                        response.sendRedirect("./register.jsp");

                    } finally {}

                } else {// If there is error return to register page
                	
                	 errorBuffer.append("Please try again with valid inputs");
                     session.setAttribute("errors", errorBuffer.toString());
                     response.sendRedirect("./register.jsp");
                }
	            

            } catch (NumberFormatException nfe) {

                
                
                errorBuffer.append("Please try again.</strong>");
                session.setAttribute("login", "");

                session.setAttribute("errors", errorBuffer.toString());
                response.sendRedirect("./register.jsp");
            }

        } catch (Exception e) { //not connected
        	
            System.out.println(e);
            String line1 = "<h2>A network error has occurred!</h2>";
            String line2 = "<p>Please notify your system "
                    + "administrator and check log. " + e.toString() + "</p>";
            formatErrorPage(line1, line2, response);
        }
    }
    /**
     * @param request HTTP request
     * @param response HTTP response
     * @throws ServletException if a general exception error was encountered
     * @throws IOException if a general InputOutput error was encountered
     */
    public void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    /**
     * Method to fromat the error page
     * @param first
     * @param second
     * @param response
     * @throws IOException
     */
    // Method to show ouput error messages
    public void formatErrorPage(String first, String second,
            HttpServletResponse response) throws IOException {
        PrintWriter output = response.getWriter();
        response.setContentType("text/html");
        output.println(first);
        output.println(second);
        output.close();
    }

            

}
