package sdk.ideas;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SchemeSocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.conn.ssl.TrustStrategy;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.http.client.HttpClient;

import sdk.ideas.StringUtility;

public class HttpsClient
{
	public HttpsClient()
	{

	}

	@Override
	protected void finalize() throws Throwable
	{
		super.finalize();
	}

	private SSLSocketFactory buildSSLSocketFactory() throws Exception
	{
		TrustStrategy ts = new TrustStrategy()
		{
			public boolean isTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException
			{
				return true; // heck yea!
			}
		};

		SSLSocketFactory sf = null;
		/* build socket factory with hostname verification turned off. */
		sf = new SSLSocketFactory(ts, SSLSocketFactory.ALLOW_ALL_HOSTNAME_VERIFIER);
		return sf;
	}

	private void configureSSLHandling(HttpClient hc) throws Exception
	{
		Scheme http = new Scheme("http", 80, PlainSocketFactory.getSocketFactory());
		SSLSocketFactory sf = buildSSLSocketFactory();
		Scheme https = new Scheme("https", 443, (SchemeSocketFactory) sf);
		SchemeRegistry sr = hc.getConnectionManager().getSchemeRegistry();
		sr.register(http);
		sr.register(https);
	}

	private HttpClient buildHttpClient() throws Exception
	{
		HttpClient hc = new DefaultHttpClient();
		configureSSLHandling(hc);
		return hc;
	}

	public String sendPost(String url, Map<String, String> parm) throws Exception
	{

		String result = "";
		HttpClient client = null;
		client = buildHttpClient();
		HttpPost post = new HttpPost(url);

		if (parm.size() > 0)
		{
			List<NameValuePair> params = new ArrayList<NameValuePair>();
			for (Entry<String, String> item : parm.entrySet())
			{
				params.add(new BasicNameValuePair(item.getKey(), item.getValue()));
			}
			UrlEncodedFormEntity ent = new UrlEncodedFormEntity(params, StandardCharsets.UTF_8);
			post.setEntity(ent);
		}

		HttpResponse responsePOST = client.execute(post);
		HttpEntity resEntity = responsePOST.getEntity();

		if (resEntity != null)
		{
			result = EntityUtils.toString(resEntity);
		}

		client.getConnectionManager().shutdown();

		if (StringUtility.isValid(result))
		{
			result.trim();
		}
		else
		{
			result = "";
		}
		return result;
	}

	public String sendPost(String url, String stringData) throws Exception
	{

		String result = "";
		HttpClient client = null;
		client = buildHttpClient();
		HttpPost post = new HttpPost(url);
		post.addHeader("Content-Type", "application/json");
		post.setEntity(new StringEntity(stringData));

		HttpResponse responsePOST = client.execute(post);
		HttpEntity resEntity = responsePOST.getEntity();

		if (resEntity != null)
		{
			result = EntityUtils.toString(resEntity);
		}

		client.getConnectionManager().shutdown();

		if (StringUtility.isValid(result))
		{
			result.trim();
		}
		else
		{
			result = "";
		}
		return result;
	}

	public String sendGet(String url) throws Exception
	{
		String result = "";
		HttpClient client = null;
		try
		{
			client = buildHttpClient();

			HttpGet get = new HttpGet(url);

			HttpResponse response = client.execute(get);

			HttpEntity resEntity = response.getEntity();
			

			if (resEntity != null)
			{
				result = EntityUtils.toString(resEntity);
			}

		}
		catch (Exception e)
		{
			throw new Exception(e.toString());
		}
		finally
		{
			client.getConnectionManager().shutdown();
		}

		if (StringUtility.isValid(result))
		{
			result.trim();
		}
		else
		{
			result = "";
		}
		return result;
	}

	
	public String sendGet(String url, Response resp) throws Exception
	{
		String result = "";
		HttpClient client = null;
		try
		{
			client = buildHttpClient();

			HttpGet get = new HttpGet(url);

			HttpResponse response = client.execute(get);

			HttpEntity resEntity = response.getEntity();
			resp.mnCode = response.getStatusLine().getStatusCode();

			if (resEntity != null)
			{
				result = EntityUtils.toString(resEntity);
			}

		}
		catch (Exception e)
		{
			throw new Exception(e.toString());
		}
		finally
		{
			client.getConnectionManager().shutdown();
		}

		if (StringUtility.isValid(result))
		{
			result.trim();
		}
		else
		{
			result = "";
		}
		resp.mstrContent = result;
		return result;
	}
	
	public static String UrlEncode(final String strText)
	{
		try
		{
			return URLEncoder.encode(StringUtility.convertNull(strText), StandardCharsets.UTF_8.toString());
		}
		catch (UnsupportedEncodingException e)
		{
			e.printStackTrace();
		}
		return null;
	}

	/*********************************
	 * Http Client common function
	 **********************************/

	public static class Response
	{
		public int		mnCode		= 0;
		public String	mstrContent	= null;
	}

	/** Http Client Method:Send **/
	public void sendGet(final String strURL, final String strParam, Response resp) throws Exception
	{
		String url = strURL + "?" + strParam;

		URL obj = new URL(url);

		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// optional default is GET
		con.setRequestMethod("GET");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setRequestProperty("Accept-Charset", "ISO-8859-1,utf-8;q=0.7,*;q=0.7");

		resp.mnCode = con.getResponseCode();

		if (HttpURLConnection.HTTP_OK == resp.mnCode)
		{
			// BufferedReader in = new BufferedReader(new
			// InputStreamReader(con.getInputStream(),"ISO-8859-1"));
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));

			String inputLine;
			StringBuffer response = new StringBuffer();

			if (null != in)
			{
				while ((inputLine = in.readLine()) != null)
				{
					response.append(inputLine.trim());
				}
				in.close();
				resp.mstrContent = response.toString();
			}
			return;
		}

		resp.mstrContent = String.format("Code:%d , Error:%s", con.getResponseCode(), con.getResponseMessage());
	}

	/** Http Client Method:Post **/
	public void sendPost(final String strURL, final String strParam, Response resp) throws Exception
	{
		URL obj = new URL(strURL);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();

		// add reuqest header
		con.setRequestMethod("POST");
		con.setRequestProperty("User-Agent", "Mozilla/5.0");
		con.setRequestProperty("Accept-Language", "en-US,en;q=0.5");
		con.setRequestProperty("Accept-Charset", "ISO-8859-1,utf-8;q=0.7,*;q=0.7");

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(strParam);
		wr.flush();
		wr.close();

		resp.mnCode = con.getResponseCode();

		if (HttpURLConnection.HTTP_OK == resp.mnCode)
		{
			// BufferedReader in = new BufferedReader(new
			// InputStreamReader(con.getInputStream(),"ISO-8859-1"));
			BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			if (null != in)
			{
				while ((inputLine = in.readLine()) != null)
				{
					response.append(inputLine.trim());
				}
				in.close();
				resp.mstrContent = response.toString();
			}
			return;
		}

		resp.mstrContent = String.format("Code:%d , Error:%s", con.getResponseCode(), con.getResponseMessage());
	}

	public String UrlEncode(String strTag, String strValue, boolean bFirst) throws UnsupportedEncodingException
	{
		String strResult = "";

		if (StringUtility.isValid(strValue))
		{
			if (bFirst)
			{
				strResult = strTag + "="
						+ java.net.URLEncoder.encode(strValue, java.nio.charset.StandardCharsets.UTF_8.toString());
			}
			else
			{
				strResult = "&" + strTag + "="
						+ java.net.URLEncoder.encode(strValue, java.nio.charset.StandardCharsets.UTF_8.toString());
			}
		}

		return strResult;
	}
}
