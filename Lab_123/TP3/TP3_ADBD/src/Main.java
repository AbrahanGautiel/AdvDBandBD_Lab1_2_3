import java.sql.*;
import java.util.Scanner;

public class Main {

    public static Connection connexion = null;

    public static void displayDepartment() throws SQLException {
        Statement statement = connexion.createStatement();
        ResultSet result = statement.
                executeQuery( "SELECT deptno, dname, loc FROM dept" );

        while ( result.next() ) {
            int deptno = result.getInt( "deptno");
            String dname = result.getString( "dname" );
            String loc = result.getString("loc");

            System.out.println("Department " + deptno + " is for "
                    + dname + " and located in " + loc);
        }
        result.close();
    }

    public static void moveDepartment(int empno, int newDeptno) throws SQLException {
        /*Statement statement = connexion.createStatement();
        int result = statement.
                executeUpdate( "UPDATE EMP SET deptno = " + newDeptno +
                                    " WHERE empno = " + empno );
        */
        PreparedStatement preparedStatement = connexion.
                prepareStatement("UPDATE emp SET deptno = ? WHERE empno = ?");
        preparedStatement.setInt(1, newDeptno);
        preparedStatement.setInt(2, empno);
        int result = preparedStatement.executeUpdate();
        if (result > 0){
            System.out.println("Employee " + empno + " moved to department " + newDeptno);
        } else {
            System.out.println("Something occurred when trying to update");
        }
    }

    public static void displayTable(String tableName) throws SQLException {

        Statement statement = connexion.createStatement();
        ResultSet result = statement.
                executeQuery( "SELECT * FROM " + tableName );
        /*
        PreparedStatement preparedStatement = connexion.
                prepareStatement("SELECT * FROM  ?");

        preparedStatement.setString(1, tableName);
        ResultSet result = preparedStatement.executeQuery();
        */
        ResultSetMetaData rsmd = result.getMetaData();
        int columnsNumber = rsmd.getColumnCount();
        //Print columns header
        for (int i = 1 ; i <= columnsNumber ; i++){
            String columName = rsmd.getColumnName(i);
            System.out.print( columName.toUpperCase() + " | ");
        }

        //Print rows
        while (result.next()){
            System.out.print("\n");
            for (int i = 1 ; i <= columnsNumber ; i++){
                System.out.print(result.getString(i) + " | ");
            }
        }

        result.close();
    }

    public static void main(String[] args) {
        /* Load JDBC Driver. */
        try {
            Class.forName( "org.postgresql.Driver" );
        } catch ( ClassNotFoundException e ) {
            e.printStackTrace();
        }

        String url = "jdbc:postgresql://localhost/TP_1";
        String user = "postgres";
        String pass = "root";
        try {
            connexion = DriverManager.getConnection( url, user, pass );

            /* Requests to bdd will be here */
            System.out.println("Bdd Connected");

            /*Exercises are commented just to avoid exdcuting them all, to reproduce an exercise,
               just move the * and / next to "Exercise i"
             */


            /*Exercise 1
            displayDepartment();
            */

            Scanner sc = new Scanner(System.in);
            /*Exercise 2 and 5
            System.out.println("Select an employee to change their dept (e.g 7369)");
            int empno = sc.nextInt();

            System.out.println("Select which department you want to move them (10, 20, 30, 40)");
            int newDeptno = sc.nextInt();
            moveDepartment(empno, newDeptno);
            */

            /*Exercise 3 and 6
            System.out.println("Select the table to display");
            String tableName = sc.next();
            displayTable(tableName);
            */

            /*Exercise 10
            DAO<Dept> DeptDao = new DeptDAO(connexion);
            Dept dept20 = DeptDao.find(20);
            System.out.println(dept20);
            */

            /*Exercise 11
            DAO<Emp> EmpDao = new EmpDAO(connexion);
            Emp emp7369 = EmpDao.find(7369);
            System.out.println(emp7369);
            */

            /*Exescise 12*/
            DAOFactory factory = new DAOFactory(connexion);

            DAO<Dept> DeptDao = factory.getDeptDAO();
            Dept dept20 = DeptDao.find(20);
            System.out.println(dept20);

            DAO<Emp> EmpDao = factory.getEmpDAO();
            Emp emp7369 = EmpDao.find(7369);
            System.out.println(emp7369);
        } catch ( SQLException e ) {
            e.printStackTrace();
        } finally {
            if ( connexion != null )
                try {
                    connexion.close();
                } catch ( SQLException ignore ) {
                    ignore.printStackTrace();
                }
        }
    }
}