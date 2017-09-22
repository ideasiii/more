package more;

import java.io.BufferedReader;
import java.io.BufferedWriter;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.CookieManager;
import java.net.HttpCookie;
import java.net.HttpURLConnection;

import java.net.URL;

import java.util.List;
import java.util.Map;

import java.util.concurrent.atomic.AtomicInteger;

/*
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
*/
/**
 * 銝��� request body & response body �� JSON ��� HTTP ���蝡�
 * 
 * @author Shun-An Lee <andysalee@iii.org.tw>
 */
public class HttpJsonClient {
	private static final String USER_AGENT = "III IDEAS SmartBuilding Attendee Vote Java SDK/20161220";
	private static final String CONTENT_TYPE = "application/json; charset=utf-8";

	private final java.net.CookieManager cookieManager;
	


	private static AtomicInteger calledCounter = new AtomicInteger(0);

	public static class JsonResponse {
		/**
		 * 隢���葉�������<br>
		 * ����撩�������蝺蒂������� response body �隞� parse � JSON Object ������� true��
		 */
		public boolean noError;

		/** noError � false �����隤斤��膩 */
		public String failMessage;

		/** 隢�����erver �������Ⅳ */
		public int code;

		/** 隡箸������ */
		//public Map<String, Object> body;
		public String body;

		private JsonResponse() {
			this.noError = false;
		}
	}

	public HttpJsonClient() {
		cookieManager = new java.net.CookieManager();
	}

	public static int getCalledCount() {
		return calledCounter.get();
	}
	
	public synchronized JsonResponse post(String url, String params) {	
		JsonResponse ret = new JsonResponse();
		StringBuffer responseBuffer = new StringBuffer();

		try {
			URL urlObject = new URL(url);
			HttpURLConnection con = (HttpURLConnection) urlObject.openConnection();

			con.setRequestMethod("POST");
			con.setRequestProperty("User-Agent", USER_AGENT);
			con.setRequestProperty("Content-Type", CONTENT_TYPE);
			// con.setRequestProperty("Accept-Charset", "UTF-8");

			if (cookieManager.getCookieStore().getCookies().size() > 0) {
				String serializedCookies = serializeCookies(cookieManager);

				
				con.setRequestProperty("Cookie", serializedCookies);
			}

			String serializedRequestJson = params;
		//	if (params == null) {
		//		serializedRequestJson = "{}";
		//	} else {
		//		serializedRequestJson = mapper.writeValueAsString(params);
		//	}


			con.setDoOutput(true);
			BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(con.getOutputStream(), "UTF-8"));
			wr.write(serializedRequestJson);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			ret.code = responseCode;

			storeCookies(con);

			InputStream is = con.getErrorStream();
			if (is == null) {
				is = con.getInputStream();
			}

			BufferedReader in = new BufferedReader(new InputStreamReader(is));
			String inputLine;

			while ((inputLine = in.readLine()) != null) {
				responseBuffer.append(inputLine);
			}

			in.close();
		} catch (IOException e) {
			e.printStackTrace();
			
			ret.failMessage = e.toString();
			return ret;
		}

	
		/*try {
			map = mapper.readValue(responseBuffer.toString(), new TypeReference<Map<String, Object>>() {
			});
		} catch (IOException e) {
			e.printStackTrace();
			logger.warning("Error parsing response body: " + e.toString());
			ret.failMessage = "Error parsing response body";
			return ret;
		}*/

		ret.body = responseBuffer.toString();
		ret.noError = true;

		return ret;
	}


	private void storeCookies(HttpURLConnection con) {
		Map<String, List<String>> headerFields = con.getHeaderFields();
		List<String> cookiesHeader = headerFields.get("Set-Cookie");

		if (cookiesHeader != null) {
			for (String cookie : cookiesHeader) {
				cookieManager.getCookieStore().add(null, HttpCookie.parse(cookie).get(0));
			}
		}
	}

	private static String serializeCookies(CookieManager cm) {
		if (cm == null || cm.getCookieStore().getCookies().size() <= 0) {
			return "";
		}

		List<HttpCookie> cookies = cm.getCookieStore().getCookies();
		StringBuilder sb = new StringBuilder();

		for (HttpCookie httpCookie : cookies) {
			sb.append(httpCookie.toString()).append(';');
		}

		sb.setLength(sb.length() - 1);

		return sb.toString();
	}
}
