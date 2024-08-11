
import java.sql.*;
import java.util.Scanner;


public class Assignment8 {
	public static Scanner scan=new Scanner(System.in);
	
	public static String size10(String word) {
		StringBuilder ans = new StringBuilder(word);
		while(ans.length() != 10) {
			ans.append(" ");
		}
		
		return ans.toString();
	}
	public static void getLine(int varNo) {
		StringBuilder ans = new StringBuilder();
		for(int i = 0;i<(varNo*10 + 2+varNo -1);i++) {
			ans.append("-");
		}
		System.out.println(ans.toString());
	}
	public static void main(String[] args) {
		try {
			System.out.print("Enter the name of the database to be used: ");
			String dbName = scan.next();
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://10.10.10.51:3306/"+dbName,"te31203","te31203");
			System.out.println("Connection to the database "+dbName+" Established");
			Statement st= con.createStatement();
		
			System.out.print("Enter the name of the table to be used: ");
			String tableName = scan.next();
			char ch='y';
			while(ch=='y') {
				System.out.println("\n---------DB operation---------");
				System.out.println("1. Insert into mySql");
				System.out.println("2. Update Password");
				System.out.println("3. Delete record");
				System.out.println("4. Show all Data");
				System.out.println("5. Write own query");
				System.out.println("6. Change table name");
				System.out.println("7.Exit \n");
				System.out.print("Choose operation: ");
				int c=scan.nextInt();
				ResultSet rs;
				switch(c) {
					case 1:
						String id,pass;
						System.out.print("Enter the user id: ");
						id=scan.next();
						System.out.print("Enter the Password: ");
						pass=scan.next();
						st.execute("insert into "+tableName+" values('"+id +"','"+pass +"')");
						System.out.println("Inserted Succesfully");
						break;
					case 2:
						String i,p;
						System.out.print("Enter the user id: ");
						i=scan.next();
						System.out.print("Enter the Password: ");
						p=scan.next();
						st.execute("update "+tableName+" set password= '"+ p +"' where id='"+ i +"' ");
						System.out.println("Updated Succesfully");
						break;
					case 3:
						String idd;
						System.out.print("Enter the user id: ");
						idd=scan.next();
						st.execute("delete from "+tableName+" where id='"+ idd +"' ");
						System.out.println("Deleted Succesfully");
						break;
					case 4:
						rs = st.executeQuery("select * from "+tableName);
						getLine(2);
						System.out.println("|"+size10("id")+"|"+size10("password")+"|");
						getLine(2);
						while (rs.next()) {
							System.out.println("|"+size10(rs.getString(1)) +"|"+size10(rs.getString(2))+"|");
						}
						getLine(2);
						break;
					case 5:
						System.out.print("Query: ");
						String query = scan.next();
						rs = st.executeQuery(query);
						System.out.println("Querey executed!");
						break;
					case 6:
						System.out.print("Enter the new name of the table to be used: ");
						tableName = scan.next();
					case 7:
						System.out.println("Exiting.......");
						break;
					}
			}
		con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}