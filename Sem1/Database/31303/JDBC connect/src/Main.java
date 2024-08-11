import java.sql.*;
import java.util.*;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try
		{
			int op= 0;
			int flag = 1;
			
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/te31303", "root","root");
			
			Statement stmt = conn.createStatement();
			
//			stmt.executeUpdate("create table info(roll int primary key,name varchar(20),branch varchar(20),cgpa int,city varchar(20));");
			
			while(flag ==1)
			{
				System.out.println("::::::  Hello Students ::::::");
				System.out.println("Please select following option to continue: ");
				System.out.println("1.Insert Record");
				System.out.println("2.Edit Details");
				System.out.println("3.Delete Record");
				System.out.println("4.Display Record");
				System.out.println("5.Display All Records");
				System.out.println("6.Exit");
				
				Scanner sc = new Scanner(System.in);
				op = sc.nextInt();
				
				switch(op)
				{
				case 1:
						System.out.println("Enter your RollNO :- ");
						int roll = sc.nextInt();
						System.out.println("Enter your Name :- ");
						String name = sc.next();
						System.out.println("Enter your Branch :- ");
						String branch = sc.next();
						System.out.println("Enter your cgpa :- ");
						int cgpa = sc.nextInt();
						System.out.println("Enter your City :- ");
						String city = sc.next();
						
						String s = "insert into info(roll,name,branch,cgpa,city)"+"values(?,?,?,?,?);";
						
						PreparedStatement stat = conn.prepareStatement(s);
						stat.setInt(1,roll);
						stat.setString(2,name);
						stat.setString(3,branch);
						stat.setInt(4, cgpa);
						stat.setString(5,city);
						
						stat.executeUpdate();
						break;
						
				case 2:
					System.out.println("Enter your RollNo to update :- ");
					 roll = sc.nextInt();
					System.out.println("Enter your Branch to update :- ");
					 branch = sc.next();
					System.out.println("Enter your City to update :- ");
					 city = sc.next();
					 
					 s = "update info set branch = ?,city = ? where roll = ?";
					 stat = conn.prepareStatement(s);
					 stat.setString(1, branch);
					 stat.setString(2, city);
					 stat.setInt(3,roll);
					 
					 stat.executeUpdate();
					 break;
					 
				case 3:
					System.out.println("Enter your RollNo to delete :- ");
					 roll = sc.nextInt();
					 
					 s = "delete from info where roll = ?";
					 stat = conn.prepareStatement(s);
					 stat.setInt(1, roll);
					 
					 stat.executeUpdate();
					 break;
					 
				case 4:
					System.out.println("Enter your RollNo to Show Record :- ");
					 roll = sc.nextInt();
					 
					 s = "select * from info where roll = ?";
					 stat = conn.prepareStatement(s);
					 stat.setInt(1, roll);
					 
					 ResultSet rs = stat.executeQuery();
					 rs.next();
					 
					 System.out.println("Roll No : "+rs.getInt("roll")+"\n Name : "+rs.getString("name")+"\n Branch : "+rs.getString("branch")+"\n CGPA : "+rs.getString("cgpa")+"\n City : "+rs.getString("city"));
					break;
					
				case 5:
					System.out.println("All records are :\n");
					
					s = "select * from info";
					stat = conn.prepareStatement(s);
					rs = stat.executeQuery();
					
					while(rs.next())
					{
						System.out.println("-------------------------------------------");
						System.out.println("Roll No : "+rs.getInt("roll")+"\n Name : "+rs.getString("name")+"\n Branch : "+rs.getString("branch")+"\n CGPA : "+rs.getString("cgpa")+"\n City : "+rs.getString("city"));
					}
						break;
						
						case 6:
							System.out.println("Terminating..............");
							flag = 0;
							break;
					default :
						System.out.println("Enter valid Choice");
						break;
						
				}
				
			}
			
		}
		catch(Exception e)
		{
			System.out.println(e);
		}

	}

}
