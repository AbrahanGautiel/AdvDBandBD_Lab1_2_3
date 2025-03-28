import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeptDAO extends DAO<Dept> {

    public DeptDAO(Connection connect) {
        super(connect);
    }

    @Override
    public Dept find(int id) {
        Dept dept = null;
        try {
            PreparedStatement preparedStatement = connect.prepareStatement(
                    "SELECT * FROM DEPT WHERE deptno = ?"
            );
            preparedStatement.setInt(1, id);
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()){
                dept = new Dept();
                dept.setDeptNo(result.getInt(1));
                dept.setDname(result.getString(2));
                dept.setLoc(result.getString(3));
            }
            result.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dept;
    }

    @Override
    public boolean create(Dept object) {
        return false;
    }

    @Override
    public boolean update(Dept object) {
        return false;
    }

    @Override
    public boolean delete(Dept object) {
        return false;
    }
}
