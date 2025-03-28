import java.sql.Connection;

public class DAOFactory {

    private final Connection connection;

    public DAOFactory(Connection connection) {
        this.connection = connection;
    }

    DAO<Emp> getEmpDAO(){
       return new EmpDAO(connection);
    }

    DAO<Dept> getDeptDAO(){
        return new DeptDAO(connection);
    }
}
