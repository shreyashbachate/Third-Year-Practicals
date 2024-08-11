import java.util.Scanner;

import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class Main {

	public static void main(String[] args) throws Exception {
		// TODO Auto-generated method stub
		
		MongoClient mongo  = new MongoClient("localhost",27017);
		System.out.println("Connected");
		
		MongoDatabase database = mongo.getDatabase("te31303");
		
		MongoCollection<Document> collection = database.getCollection("myCollection");
		
		System.out.println("Collection Created Successfully");
		
		while(true)
		{
			System.out.println("Please choose following:\n1.Insert\n2.View\n3.Update\n4.Delete");
			Scanner sc = new Scanner(System.in);
			int ch = sc.nextInt();
			
			switch(ch)
			{
			case 1:
					System.out.println("Enter Name and Age :\n");
					String name = sc.next();
					int age = sc.nextInt();
					
					Document document = new Document()
							.append("name", name)
							.append("age", age);
					collection.insertOne(document);
					System.out.println("Document inserted Successfully");
					break;
					
			case 2:
					System.out.println("Document Databases Are :\n");
					
					FindIterable<Document> iterDoc = collection.find();
					MongoCursor<Document> it = iterDoc.iterator();
					int i=1;
					while(it.hasNext())
					{
						System.out.println(it.next());
						i++;
					}
					
					break;
					
			case 3:
					System.out.println("\n Enter age to update: ");
					age = sc.nextInt();
					System.out.println("\n Enter name : ");
					name = sc.next();
					
					collection.updateOne(Filters.eq("name",name),Updates.set("age", age));
					
					System.out.println("Updated successfully");
					break;
					
			case 4:
					System.out.println("\n Enter name to delete");
					name = sc.next();
					
					collection.deleteOne(Filters.eq("name",name));
					System.out.println("Deleted  Successfully");
					break;
					
			}
		}

	}

}
