<%@ page contentType="text/html; charset=utf-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="org.apache.http.HttpResponse"%>
<%@ page import="org.apache.http.NameValuePair"%>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity"%>
<%@ page import="org.apache.http.client.HttpClient"%>
<%@ page import="org.apache.http.client.methods.HttpPost"%>
<%@ page import="org.apache.http.impl.client.DefaultHttpClient"%>
<%@ page import="org.apache.http.message.BasicNameValuePair"%>
<%@ page import="more.StringUtility"%>
<%@ page import="more.Logs"%>

<%!//HTTP POST request
	//Web server POSTS to Tableau Server
	public String sendPost() throws Exception {

		String tabResult = "";
		String tabUrl = "http://124.9.6.34/trusted";
		String tabUser = "admin";

		HttpClient client = new DefaultHttpClient();
		HttpPost post = new HttpPost(tabUrl);

		// add header
		//post.setHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");

		List<NameValuePair> urlParameters = new ArrayList<NameValuePair>();
		urlParameters.add(new BasicNameValuePair("username", tabUser));

		post.setEntity(new UrlEncodedFormEntity(urlParameters));

		HttpResponse response = client.execute(post);
		Logs.showTrace("\nSending 'POST' request to URL : " + tabUrl);
		Logs.showTrace("Post parameters : " + post.getEntity());
		Logs.showTrace("Response Code : " + response.getStatusLine().getStatusCode());

		BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));

		StringBuffer result = new StringBuffer();
		String line = "";
		while ((line = rd.readLine()) != null) {
			result.append(line);
		}

		tabResult = result.toString();
		if (StringUtility.isValid(tabResult)) {
			tabResult.trim();
		} else {
			tabResult = "";
		}
		Logs.showTrace("********ticket: " + tabResult);
		return tabResult;
	}
%>









