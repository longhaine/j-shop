package DAO;

import java.io.IOException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.json.JSONObject;

public class OrdersD {
	public int Order(JSONObject order ,float price) throws IOException {
		JSONObject request = new JSONObject();
		request.put("order", order);
		request.put("price", price);
		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost("http://localhost:3000/orders");
		StringEntity params = new StringEntity(request.toString());
		post.addHeader("content-type", "application/json");
		post.setEntity(params);
		HttpResponse response = httpClient.execute(post);
		ResponseHandler<String> responseHandler = new BasicResponseHandler();
		String responseBody = responseHandler.handleResponse(response);
		httpClient.close();
		JSONObject jsoObject = new JSONObject(responseBody);
		int idOrder = jsoObject.getInt("idOrder");
		return idOrder;
	}
}
