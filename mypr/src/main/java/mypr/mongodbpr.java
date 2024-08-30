package mypr;
import org.bson.Document;

import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.UpdateResult;

import java.util.Stack;
public class mongodbpr {
	MongoClientURI m=new MongoClientURI("mongodb+srv://sanjays82943:12345@cluster0.ergyn.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0");
	MongoClient mp=new MongoClient(m);
	MongoDatabase db=mp.getDatabase("login");
	Stack<pogo> st=new Stack<pogo>();
	
	public Stack<pogo> wuiu(String tbnam){	
		MongoCollection<Document> md=db.getCollection(tbnam);
		FindIterable<Document> fd=md.find();
		for(Document i: fd) {
			 String name=(String) i.get("name");
			   String sub=(String) i.get("Subject");
			   int year=(int) i.get("Year");
	          	pogo p=new pogo(name, sub, year);
	          	st.push(p);
	}
		return st;
}
	public Stack<pogo> shoudta(String tbname,String data) {
		MongoCollection<Document> md=db.getCollection(tbname);
		FindIterable<Document> fd=md.find(Filters.eq("name",data));
		for(Document i: fd) {
			   String name=(String) i.get("name");
			   String sub=(String) i.get("Subject");
			   int year=(int) i.get("Year");
			   pogo p=new pogo(name,sub,year);
			   st.push(p);	
		}
		return st;
		
	}

	

	public int store(String tbnam,String name,String sub,int year) {
    	MongoCollection<Document> md=db.getCollection(tbnam);
    	Document dc=new Document("name",name);
    	dc.append("Subject", sub);
    	dc.append("Year", year);
    	md.insertOne(dc);
    	int a = 0;
    	a++;
		return a;
    }
    
    public int delet(String tbname,int year) {
    	MongoCollection<Document> md=db.getCollection(tbname);
    	md.updateOne(Filters.eq("name","sanjay"),Updates.set("Year", year));
    	int a=0;
    	a++;
    	return a;
    }
}
