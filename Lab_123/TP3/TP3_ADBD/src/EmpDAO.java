import java.sql.*;

public class EmpDAO extends DAO<Emp> {

    public EmpDAO(Connection connect) {
        super(connect);
    }

    @Override
    public Emp find(int id) {
        Emp emp = null;
        try {
            PreparedStatement preparedStatement = connect.prepareStatement(
                    "SELECT * FROM EMP WHERE empno = ?"
            );
            preparedStatement.setInt(1, id);
            ResultSet result = preparedStatement.executeQuery();
            if(result.next()){
                emp = new Emp();
                emp.setEmpNo(result.getLong(1));
                emp.setEname(result.getString(2));
                emp.setEfirst(result.getString(3));
                emp.setJob(result.getString(4));
                int mgrNo = result.getInt(5);
                if (emp.getEmpNo() != mgrNo){
                    Emp emp2 = find(mgrNo);
                    emp.setMgr(emp2);
                } else {
                    emp.setMgr(null);
                }
                emp.setHireDate(result.getDate(6));
                emp.setSal(result.getInt(7));
                emp.setComm(result.getInt(8));
                emp.setTel(result.getInt(9));
                int deptNo = result.getInt(10);
                DAO<Dept> DeptDao = new DeptDAO(connect);
                Dept dept = DeptDao.find(deptNo);
                emp.setDepartment(dept);
            }
            result.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return emp;
    }

    @Override
    public boolean create(Emp object) {
        return false;
    }

    @Override
    public boolean update(Emp object) {
        return false;
    }

    @Override
    public boolean delete(Emp object) {
        return false;
    }
}
