/**
 * This module is for MORE project.
 */
package sdk.ideas;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

import java.io.File;

/**
 * @author Jugo #2
 */
public class More
{
    public final static int MORE_ERR_SUCCESS = 1;
    public final static int MORE_ERR_FAIL = 0;
    public final static int MORE_ERR_EXCEPTION = -1;
    public final static int MORE_ERR_INVALID_PARAMETER = -2;
    public final static int MORE_ERR_MEMBER_EXIST = -3;

    public class Common
    {
	final public static String UPLOAD_FILE_PATH = "/uploadfile";
	final public static String DB_PATH_IDEAS = "/data/sqlite/ideas.db";
	final public static String DB_PATH_MORE_MEMBER = "/data/sqlite/more_member.db";
	final public static String PATH_DOWNLOAD_LIB_ANDROID = "/ideas/sdk/download/libs/android";
	final public static String PATH_DOWNLOAD_LIB_IOS = "/ideas/sdk/download/libs/ios";
	final public static String PATH_DOWNLOAD_DOC_ANDROID = "/ideas/sdk/download/doc/android";
	final public static String PATH_DOWNLOAD_DOC_IOS = "/ideas/sdk/download/doc/ios";

	/** sqlite Common **/
	final public static String CREATE_DATE = "create_date";

	/**
	 * sqlite more_mamber.db table: more_mamber
	 **/
	final public static String MEMBER_ID = "member_id";
	final public static String MEMBER_EMAIL = "member_email";
	final public static String MEMBER_PASSWORD = "member_password";
	final public static String MEMBER_NAME = "member_name";
	final public static String MEMBER_COMPANY = "member_company";
	final public static String MEMBER_PHONE = "member_phone";
	final public static String MEMBER_TOKEN = "member_token";
	final public static String MEMBER_AUTH_STATE = "member_auth_state";
	final public static String MEMBER_GROUP = "member_group";
	final public static String MEMBER_STATE = "member_state";
	final public static String START_DATE = "start_date";
	final public static String END_DATE = "end_date";

	/**
	 * sqlite ideas.db table: app
	 **/
	final public static String APP_ID = "app_id";
	final public static String APP_NAME = "app_name";
	final public static String APP_CATEGORY = "app_category";
	final public static String APP_DESC = "app_description";
	final public static String APP_ICON = "app_icon";
	final public static String APP_OS = "app_os";
	final public static String USER_TOKEN = "user_token";
	final public static String USER_NAME = "user_name";
	final public static String USER_EMAIL = "user_email";
	final public static String USER_PHONE = "user_phone";

	/**
	 * sqlite ideas.db table: sdk
	 **/
	final public static String SDK_ID = "sdk_id";
	final public static String SDK_OS = "sdk_os";
	final public static String SDK_OWNER = "sdk_owner";
	final public static String SDK_NAME = "sdk_name";
	final public static String SDK_DESC = "sdk_desc";
	final public static String SDK_FILE = "sdk_file";
	final public static String SDK_DOC = "sdk_doc";
	final public static String SDK_ICON = "sdk_icon";
	
	final public static String APP_EDIT = "app_edit";
    }

    final public static ArrayList<String> listAppField = new ArrayList<>(Arrays.asList(Common.APP_ID, Common.APP_NAME, Common.APP_CATEGORY, Common.APP_DESC, Common.APP_ICON,
	    Common.APP_OS, Common.USER_TOKEN, Common.USER_NAME, Common.USER_EMAIL, Common.USER_PHONE));

    final public static ArrayList<String> listSdkField = new ArrayList<>(
	    Arrays.asList(Common.SDK_ID, Common.SDK_OS, Common.SDK_OWNER, Common.SDK_NAME, Common.SDK_DESC, Common.SDK_FILE, Common.SDK_DOC, Common.SDK_ICON, Common.CREATE_DATE));

    public static class MemberData
    {
	public int member_id;
	public String member_email;
	public String member_password;
	public String member_name;
	public String member_company;
	public String member_phone;
	public String member_token;
	public int member_auth_state;
	public int member_group;
	public String create_date;
    }

    public static class SdkData
    {
	public String sdk_id;
	public String sdk_os;
	public String sdk_owner;
	public String sdk_name;
	public String sdk_desc;
	public String sdk_file;
	public String sdk_doc;
	public String sdk_icon;
	public String create_date;
    }

    public static class AppData
    {
	public String app_id;
	public String app_name;
	public String app_category;
	public String app_description;
	public String app_icon;
	public String app_os;
	public String user_token;
	public String user_name;
	public String user_email;
	public String user_phone;
	public String create_date;
    }

    public More()
    {

    }

    public int queryMemberAccountList(HttpServletRequest request, ArrayList<String> listEmailAccount)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);
	    String strSQL = "select member_email from more_member;";

	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    while (rs.next())
	    {
		++nCount;
		listEmailAccount.add(rs.getString("member_email"));
	    }
	    rs.close();
	    stat.close();
	    con.close();
	    sqlite = null;
	    More.webTracker(request, "queryMemberAccountList success: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryMemberAccountList failed: ", e.toString());
	}

	return nCount;
    }

    public int queryMember(HttpServletRequest request, final String strEmail, MemberData memData)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);
	    String strSQL = "select * from more_member where member_email = '" + strEmail + "';";

	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    while (rs.next())
	    {
		++nCount;
		memData.member_id = rs.getInt("member_id");
		memData.member_email = rs.getString("member_email");
		memData.member_password = rs.getString("member_password");
		memData.member_name = rs.getString("member_name");
		memData.member_company = rs.getString("member_company");
		memData.member_phone = rs.getString("member_phone");
		memData.member_token = rs.getString("member_token");
		memData.member_auth_state = rs.getInt("member_auth_state");
		memData.member_group = rs.getInt("member_group");
		memData.create_date = rs.getString("create_date");

	    }
	    rs.close();
	    stat.close();
	    con.close();
	    sqlite = null;
	    More.webTracker(request, "queryMember failed: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryMember failed: ", e.toString());
	}

	return nCount;
    }

    public int memberAdd(HttpServletRequest request, final String strEmail, final String strPassword, final String strName, final String strCompany, final String strPhone,
	    final String strToken)
    {
	if (!StringUtility.isValid(strEmail) || !StringUtility.isValid(strPassword))
	{
	    return MORE_ERR_INVALID_PARAMETER;
	}

	try
	{
	    MemberData memData = new MemberData();
	    int nCount = queryMember(request, strEmail, memData);
	    if (0 < nCount)
		return MORE_ERR_MEMBER_EXIST;

	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);

	    String sql = "insert into more_member(member_email,member_password,member_name,member_company,member_phone,member_token) values ( ?,?,?,?,?,?)";

	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;
	    pst.setString(idx++, strEmail);
	    pst.setString(idx++, strPassword);
	    pst.setString(idx++, strName);
	    pst.setString(idx++, strCompany);
	    pst.setString(idx++, strPhone);
	    pst.setString(idx++, strToken);
	    pst.executeUpdate();
	    pst.close();
	    con.close();
	    sqlite = null;

	    More.webTracker(request, "memberAdd success: ", sql);

	}
	catch (Exception e)
	{

	    More.webTracker(request, "memberAdd failed: ", e.toString());
	    return MORE_ERR_EXCEPTION;
	}

	return MORE_ERR_SUCCESS;
    }

    public synchronized String generateToken(String msg, boolean timeChange)
    {
	long current = System.currentTimeMillis();
	try
	{
	    MessageDigest md = MessageDigest.getInstance("MD5");
	    md.update(msg.getBytes());
	    if (timeChange)
	    {
		byte now[] = (new Long(current)).toString().getBytes();
		md.update(now);
	    }
	    return toHex(md.digest());
	}
	catch (NoSuchAlgorithmException e)
	{

	}

	return String.valueOf(current);
    }

    private String toHex(byte buffer[])
    {
	StringBuffer sb = new StringBuffer(buffer.length * 2);
	for (int i = 0; i < buffer.length; i++)
	{
	    sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));
	    sb.append(Character.forDigit(buffer[i] & 15, 16));
	}

	return sb.toString();
    }

    public int querySdk(HttpServletRequest request, ArrayList<SdkData> listSdk)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);
	    String strSQL = "select * from sdk order by create_date;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(con, strSQL, listSdkField, listData);
	    con.close();
	    sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		SdkData sdkData = null;
		while (it.hasNext())
		{
		    sdkData = new SdkData();
		    mapItem = it.next();
		    sdkData.sdk_id = mapItem.get(Common.SDK_ID);
		    sdkData.sdk_os = mapItem.get(Common.SDK_OS);
		    sdkData.sdk_owner = mapItem.get(Common.SDK_OWNER);
		    sdkData.sdk_name = mapItem.get(Common.SDK_NAME);
		    sdkData.sdk_desc = mapItem.getOrDefault(Common.SDK_DESC, "No Description");
		    sdkData.sdk_file = mapItem.get(Common.SDK_FILE);
		    sdkData.sdk_doc = mapItem.getOrDefault(Common.SDK_DOC, "");
		    sdkData.sdk_icon = mapItem.get(Common.SDK_ICON);
		    sdkData.create_date = mapItem.get(Common.CREATE_DATE);
		    listSdk.add(sdkData);
		    sdkData = null;
		}
		nCount = listSdk.size();
	    }
	    More.webTracker(request, "querySdk success: ", strSQL);

	}
	catch (SQLException e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "querySdk failed: ", e.toString());
	}

	return nCount;
    }

    public void SendingEmail(HttpServletRequest request, String Email, String Body)
    {
	try
	{
	    String host = "smtp.gmail.com";
	    String from = "louis.ju.tw@gmail.com"; // Your mail id
	    String pass = "Immortal-666"; // Your Password
	    Properties props = System.getProperties();
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "465");
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.ssl.trust", host);
	    String[] to = { Email }; // To Email address
	    Session session = Session.getDefaultInstance(props, null);
	    MimeMessage message = new MimeMessage(session);
	    message.setFrom(new InternetAddress(from));
	    InternetAddress[] toAddress = new InternetAddress[to.length];
	    // To get the array of addresses
	    for (int i = 0; i < to.length; i++)
	    { // changed from a while loop
		toAddress[i] = new InternetAddress(to[i]);
	    }
	    System.out.println(Message.RecipientType.TO);
	    for (int j = 0; j < toAddress.length; j++)
	    { // changed from a while
	      // loop
		message.addRecipient(Message.RecipientType.TO, toAddress[j]);
	    }
	    message.setSubject("Email from MORE");

	    message.setContent(Body, "text/html");
	    Transport transport = session.getTransport("smtp");
	    transport.connect(host, from, pass);
	    transport.sendMessage(message, message.getAllRecipients());
	    transport.close();
	    More.webTracker(request, "MORE SendingEmail success: " + Email, null);
	}
	catch (Exception e)
	{
	    System.out.println("MORE Send Mail Exception:" + e.toString());
	    More.webTracker(request, "MORE SendingEmail failed: ", e.toString());
	}
    }

    public int queryApp(HttpServletRequest request, ArrayList<AppData> listApp, String strUserToken)
    {
	int nCount = 0;

	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);
	    String strSQL = "select * from app where user_token = '" + strUserToken + "' order by create_date;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(con, strSQL, listAppField, listData);
	    con.close();
	    sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		AppData appData = null;
		while (it.hasNext())
		{
		    appData = new AppData();
		    mapItem = it.next();
		    appData.app_id = mapItem.get(Common.APP_ID);
		    appData.app_name = mapItem.get(Common.APP_NAME);
		    appData.app_category = mapItem.get(Common.APP_CATEGORY);
		    appData.app_description = mapItem.get(Common.APP_DESC);
		    appData.app_icon = mapItem.get(Common.APP_ICON);
		    appData.app_os = mapItem.get(Common.APP_OS);
		    appData.user_token = mapItem.get(Common.USER_TOKEN);
		    appData.user_name = mapItem.get(Common.USER_NAME);
		    appData.user_email = mapItem.get(Common.USER_EMAIL);
		    appData.user_phone = mapItem.get(Common.USER_PHONE);
		    appData.create_date = mapItem.get(Common.CREATE_DATE);
		    listApp.add(appData);
		    appData = null;
		}
		nCount = listApp.size();
	    }
	    More.webTracker(request, "queryApp success: ", strSQL);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "queryApp failed: ", e.toString());
	}
	return nCount;
    }

    public void deleteApp(HttpServletRequest request, final String strAppId)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    // Query APP Icon File Path
	    String strSQL = "select app_icon from app where app_id = '" + strAppId + "'";
	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    String strAppIcon = null;
	    if (rs.next())
	    {
		strAppIcon = rs.getString("app_icon");
	    }
	    rs.close();
	    stat.close();

	    // Delete DB data
	    strSQL = "delete from app where app_id = ?";
	    PreparedStatement pst = null;
	    pst = con.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();
	    con.close();
	    sqlite = null;

	    // Delete local file
	    if (null != strAppIcon)
	    {
		File file = new File("/data/opt/tomcat/webapp/more" + strAppIcon);
		if (null != file)
		{

		    String absolutePath = file.getAbsolutePath();
		    String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

		    if (file.delete())
		    {
			System.out.println(file.getName() + " is deleted!");
			More.webTracker(request, file.getName() + "deleteApp success: ", strSQL);
		    }
		    else
		    {
			System.out.println("Delete operation is failed.");
			More.webTracker(request, "[Delete operation is failed.] deleteApp failed: ", strSQL);
		    }

		    File folderPath = new File(filePath);

		    if (folderPath.isDirectory())
		    {

			if (folderPath.list().length <= 0)
			{

			    System.out.println("Directory is empty!");
			    More.webTracker(request, "[Directory is empty!] deleteApp failed: ", strSQL);
			    folderPath.delete();
			}
		    }
		}
	    }

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "deleteApp failed: ", e.toString());
	}
    }

    public void updateApp(HttpServletRequest request, final String strAppId, final String strAppIcon, final String strAppName, final String strAppOs, final String strAppCategory,
	    final String strAppDesc)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    String sql = null;
	    if (null == strAppIcon)
	    {
		sql = "update app set app_name = ? , app_os = ? , app_category = ? , app_description = ? where app_id = ?";
	    }
	    else
	    {
		sql = "update app set app_icon = ?, app_name = ? , app_os = ? , app_category = ? , app_description = ? where app_id = ?";
	    }

	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;

	    if (null != strAppIcon)
	    {
		pst.setString(idx++, strAppIcon);
	    }
	    pst.setString(idx++, strAppName);
	    pst.setString(idx++, strAppOs);
	    pst.setString(idx++, strAppCategory);
	    pst.setString(idx++, strAppDesc);
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();

	    con.close();
	    sqlite = null;
	    More.webTracker(request, "updateApp success: ", sql);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "updateApp failed: ", e.toString());
	}
    }

    public void updateUser(HttpServletRequest request, final String strAppId, final String strUserName, final String strUserPhone, final String strUserEmail)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

	    String sql = "update app set user_name = ? , user_phone = ? , user_email = ? where app_id = ?";
	    PreparedStatement pst = null;
	    pst = con.prepareStatement(sql);
	    int idx = 1;
	    pst.setString(idx++, strUserName);
	    pst.setString(idx++, strUserPhone);
	    pst.setString(idx++, strUserEmail);
	    pst.setString(idx++, strAppId);
	    pst.executeUpdate();
	    pst.close();

	    con.close();
	    sqlite = null;
	    More.webTracker(request, "updateUser success: ", sql);

	}
	catch (Exception e)
	{

	    e.printStackTrace();
	    More.webTracker(request, "updateUser failed: ", e.toString());
	}
    }

    static public String getClientIP(HttpServletRequest request)
    {
	String ip = request.getHeader("X-Forwarded-For");
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("WL-Proxy-Client-IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("HTTP_CLIENT_IP");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	}
	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
	{
	    ip = request.getRemoteAddr();
	}
	return ip;
    }

    static public String getDateTime()
    {
	SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date current = new Date();
	return sdFormat.format(current);
    }

    @SuppressWarnings("deprecation")
    static public int insert(String strIP, int nPort, final String strDB, final String strCollection, final HashMap<String, String> mapData)
    {
	int nResult = 0;

	if (null == mapData || 0 >= mapData.size())
	    return -1;

	try
	{
	    MongoClient mongo = new MongoClient(strIP, nPort);
	    // get database
	    // if database doesn't exists, mongodb will create it for you
	    DB db = mongo.getDB(strDB);

	    // get collection
	    // if collection doesn't exists, mongodb will create it for you
	    DBCollection collection = db.getCollection(strCollection);

	    /**** Insert ****/
	    // create a document to store key and value

	    BasicDBObject document = new BasicDBObject();

	    for (Object key : mapData.keySet())
	    {
		document.append((String) key, mapData.get(key));
	    }
	    collection.insert(document);
	    if (null != mongo)
		mongo.close();

	}
	catch (Exception e)
	{
	    nResult = -1;
	    System.out.println("Mongo Exception: " + e.toString());
	}
	return nResult;
    }

    static public void webTracker(HttpServletRequest request, String strAction, String strEvent)
    {
	HashMap<String, String> mapData = new HashMap<String, String>();
	mapData.put("client", getClientIP(request));
	mapData.put("host", request.getRequestURL().toString());
	mapData.put("create_date", getDateTime());
	mapData.put("action", strAction);
	mapData.put("event", strEvent);
	insert("127.0.0.1", 27017, "website", "more", mapData);
	mapData.clear();
    }

    //MD5 Hash
    String hex_chr = "0123456789abcdef";
    private String rhex(int num)
    {
        String str = "";
        for(int j = 0; j <= 3; j++)
            str = str + hex_chr.charAt((num >> (j * 8 + 4)) & 0x0F) + hex_chr.charAt((num >> (j * 8)) & 0x0F);
        return str;
    }

    public int[] str2blks_MD5(String str)
    {
        int nblk = ((str.length() + 8) >> 6) + 1;
        int[] blks = new int[nblk * 16];
        int i = 0;
        for(i = 0; i < nblk * 16; i++) {
            blks[i] = 0;
        }
        for(i = 0; i < str.length(); i++) {
            blks[i >> 2] |= str.charAt(i) << ((i % 4) * 8);
        }
        blks[i >> 2] |= 0x80 << ((i % 4) * 8);
        blks[nblk * 16 - 2] = str.length()*8;

        return blks;
    }

    private int add(int x, int y)
    {
        return ((x&0x7FFFFFFF) + (y&0x7FFFFFFF)) ^ (x&0x80000000) ^ (y&0x80000000);
    }
    
    private int rol(int num, int cnt)
    {
        return (num << cnt) | (num >>> (32 - cnt));
    }

    
    private int cmn(int q, int a, int b, int x, int s, int t)
    {
        return add(rol(add(add(a, q), add(x, t)), s), b);
    }
    private int ff(int a, int b, int c, int d, int x, int s, int t)
    {
        return cmn((b & c) | ((~b) & d), a, b, x, s, t);
    }
    private int gg(int a, int b, int c, int d, int x, int s, int t)
    {
        return cmn((b & d) | (c & (~d)), a, b, x, s, t);
    }
    private int hh(int a, int b, int c, int d, int x, int s, int t)
    {
        return cmn(b ^ c ^ d, a, b, x, s, t);
    }
    private int ii(int a, int b, int c, int d, int x, int s, int t)
    {
        return cmn(c ^ (b | (~d)), a, b, x, s, t);
    }
    
    public String calcMD5(String str)
    {
        int[] x = str2blks_MD5(str);
        int a = 0x67452301;
        int b = 0xEFCDAB89;
        int c = 0x98BADCFE;
        int d = 0x10325476;

        for(int i = 0; i < x.length; i += 16)
        {
            int olda = a;
            int oldb = b;
            int oldc = c;
            int oldd = d;

            a = ff(a, b, c, d, x[i+ 0], 7 , 0xD76AA478);
            d = ff(d, a, b, c, x[i+ 1], 12, 0xE8C7B756);
            c = ff(c, d, a, b, x[i+ 2], 17, 0x242070DB);
            b = ff(b, c, d, a, x[i+ 3], 22, 0xC1BDCEEE);
            a = ff(a, b, c, d, x[i+ 4], 7 , 0xF57C0FAF);
            d = ff(d, a, b, c, x[i+ 5], 12, 0x4787C62A);
            c = ff(c, d, a, b, x[i+ 6], 17, 0xA8304613);
            b = ff(b, c, d, a, x[i+ 7], 22, 0xFD469501);
            a = ff(a, b, c, d, x[i+ 8], 7 , 0x698098D8);
            d = ff(d, a, b, c, x[i+ 9], 12, 0x8B44F7AF);
            c = ff(c, d, a, b, x[i+10], 17, 0xFFFF5BB1);
            b = ff(b, c, d, a, x[i+11], 22, 0x895CD7BE);
            a = ff(a, b, c, d, x[i+12], 7 , 0x6B901122);
            d = ff(d, a, b, c, x[i+13], 12, 0xFD987193);
            c = ff(c, d, a, b, x[i+14], 17, 0xA679438E);
            b = ff(b, c, d, a, x[i+15], 22, 0x49B40821);

            a = gg(a, b, c, d, x[i+ 1], 5 , 0xF61E2562);
            d = gg(d, a, b, c, x[i+ 6], 9 , 0xC040B340);
            c = gg(c, d, a, b, x[i+11], 14, 0x265E5A51);
            b = gg(b, c, d, a, x[i+ 0], 20, 0xE9B6C7AA);
            a = gg(a, b, c, d, x[i+ 5], 5 , 0xD62F105D);
            d = gg(d, a, b, c, x[i+10], 9 , 0x02441453);
            c = gg(c, d, a, b, x[i+15], 14, 0xD8A1E681);
            b = gg(b, c, d, a, x[i+ 4], 20, 0xE7D3FBC8);
            a = gg(a, b, c, d, x[i+ 9], 5 , 0x21E1CDE6);
            d = gg(d, a, b, c, x[i+14], 9 , 0xC33707D6);
            c = gg(c, d, a, b, x[i+ 3], 14, 0xF4D50D87);
            b = gg(b, c, d, a, x[i+ 8], 20, 0x455A14ED);
            a = gg(a, b, c, d, x[i+13], 5 , 0xA9E3E905);
            d = gg(d, a, b, c, x[i+ 2], 9 , 0xFCEFA3F8);
            c = gg(c, d, a, b, x[i+ 7], 14, 0x676F02D9);
            b = gg(b, c, d, a, x[i+12], 20, 0x8D2A4C8A);

            a = hh(a, b, c, d, x[i+ 5], 4 , 0xFFFA3942);
            d = hh(d, a, b, c, x[i+ 8], 11, 0x8771F681);
            c = hh(c, d, a, b, x[i+11], 16, 0x6D9D6122);
            b = hh(b, c, d, a, x[i+14], 23, 0xFDE5380C);
            a = hh(a, b, c, d, x[i+ 1], 4 , 0xA4BEEA44);
            d = hh(d, a, b, c, x[i+ 4], 11, 0x4BDECFA9);
            c = hh(c, d, a, b, x[i+ 7], 16, 0xF6BB4B60);
            b = hh(b, c, d, a, x[i+10], 23, 0xBEBFBC70);
            a = hh(a, b, c, d, x[i+13], 4 , 0x289B7EC6);
            d = hh(d, a, b, c, x[i+ 0], 11, 0xEAA127FA);
            c = hh(c, d, a, b, x[i+ 3], 16, 0xD4EF3085);
            b = hh(b, c, d, a, x[i+ 6], 23, 0x04881D05);
            a = hh(a, b, c, d, x[i+ 9], 4 , 0xD9D4D039);
            d = hh(d, a, b, c, x[i+12], 11, 0xE6DB99E5);
            c = hh(c, d, a, b, x[i+15], 16, 0x1FA27CF8);
            b = hh(b, c, d, a, x[i+ 2], 23, 0xC4AC5665);

            a = ii(a, b, c, d, x[i+ 0], 6 , 0xF4292244);
            d = ii(d, a, b, c, x[i+ 7], 10, 0x432AFF97);
            c = ii(c, d, a, b, x[i+14], 15, 0xAB9423A7);
            b = ii(b, c, d, a, x[i+ 5], 21, 0xFC93A039);
            a = ii(a, b, c, d, x[i+12], 6 , 0x655B59C3);
            d = ii(d, a, b, c, x[i+ 3], 10, 0x8F0CCC92);
            c = ii(c, d, a, b, x[i+10], 15, 0xFFEFF47D);
            b = ii(b, c, d, a, x[i+ 1], 21, 0x85845DD1);
            a = ii(a, b, c, d, x[i+ 8], 6 , 0x6FA87E4F);
            d = ii(d, a, b, c, x[i+15], 10, 0xFE2CE6E0);
            c = ii(c, d, a, b, x[i+ 6], 15, 0xA3014314);
            b = ii(b, c, d, a, x[i+13], 21, 0x4E0811A1);
            a = ii(a, b, c, d, x[i+ 4], 6 , 0xF7537E82);
            d = ii(d, a, b, c, x[i+11], 10, 0xBD3AF235);
            c = ii(c, d, a, b, x[i+ 2], 15, 0x2AD7D2BB);
            b = ii(b, c, d, a, x[i+ 9], 21, 0xEB86D391);

            a = add(a, olda);
            b = add(b, oldb);
            c = add(c, oldc);
            d = add(d, oldd);
        }
        return rhex(a) + rhex(b) + rhex(c) + rhex(d);
    }
    
    
}
