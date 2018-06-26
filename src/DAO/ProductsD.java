package DAO;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Scanner;

import org.json.JSONArray;

public class ProductsD {
	public JSONArray getPopularItems() throws IOException {
		String path ="http://localhost:3000/products/popular";
		URL url = new URL(path);
		Scanner scan = new Scanner(url.openStream());
		String json ="";
		while(scan.hasNext())
		{
			json = json + scan.nextLine();
		}
		scan.close();
		JSONArray arrobject = new JSONArray(json);
		return arrobject;
	}
	public JSONArray getProductsByGender(String gender) throws IOException {
		String path ="http://localhost:3000/products/gender/"+gender;
		URL url = new URL(path);
		Scanner scan = new Scanner(url.openStream());
		String json ="";
		while(scan.hasNext())
		{
			json = json + scan.nextLine();
		}
		scan.close();
		JSONArray arrobject = new JSONArray(json);
		return arrobject;
	}
	public JSONArray getProductByCategory(String gender,String category) throws IOException {
		String path ="http://localhost:3000/products/gender/"+gender+"/category/"+category;
		URL url = new URL(path);
		Scanner scan = new Scanner(url.openStream());
		String json ="";
		while(scan.hasNext())
		{
			json = json + scan.nextLine();
		}
		scan.close();
		JSONArray arrobject = new JSONArray(json);
		return arrobject;
	}
	public JSONArray getProductById(String id) throws IOException {
		String path ="http://localhost:3000/products/id/"+id;
		URL url = new URL(path);
		Scanner scan = new Scanner(url.openStream());
		String json ="";
		while(scan.hasNext())
		{
			json = json + scan.nextLine();
		}
		scan.close();
		JSONArray arrobject = new JSONArray(json);
		return arrobject;
	}
}
