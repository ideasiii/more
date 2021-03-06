/**
 * This module is for MORE project.
 */
package more;

import java.io.File;
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

import java.sql.*;


/**
 * @author Jugo #2
 */
public class More {
	public final static int MORE_ERR_SUCCESS = 1;
	public final static int MORE_ERR_FAIL = 0;
	public final static int MORE_ERR_EXCEPTION = -1;
	public final static int MORE_ERR_INVALID_PARAMETER = -2;
	public final static int MORE_ERR_MEMBER_EXIST = -3;

	public class Common {
		final public static String UPLOAD_FILE_PATH = "/uploadfile";
		final public static String DB_PATH_IDEAS = "/data/sqlite/ideas.db";
		final public static String DB_PATH_MORE_MEMBER = "/data/sqlite/more_member.db";
		/*
		final public static String MYSQLDB_URL_MORE_MEMBER = "jdbc:mysql://52.68.108.37:3306/more_member?useUnicode=true&characterEncoding=UTF-8";
		final public static String MYSQLDB_URL_MORE = "jdbc:mysql://52.68.108.37:3306/more?useUnicode=true&characterEncoding=UTF-8";
  //wins IP version */
		final public static String MYSQLDB_URL_MORE_MEMBER = "jdbc:mysql://127.0.0.1:3306/more_member?useUnicode=true&characterEncoding=UTF-8";
		final public static String MYSQLDB_URL_MORE = "jdbc:mysql://127.0.0.1:3306/more?useUnicode=true&characterEncoding=UTF-8";
  //aws IP version 	
		final public static String DB_USER = "more";
		final public static String DB_PASS = "ideas123!";
		
		final public static String MONGO_DB = "10.0.20.30"; // 54.199.198.94 wins

		final public static String PATH_DOWNLOAD_LIB_ANDROID = "/more/sdk/download/libs/android";
		final public static String PATH_DOWNLOAD_LIB_IOS = "/more/sdk/download/libs/ios";
		final public static String PATH_DOWNLOAD_DOC_ANDROID = "/more/sdk/download/doc/android";
		final public static String PATH_DOWNLOAD_DOC_IOS = "/more/sdk/download/doc/ios";

		/** DB Common **/
		final public static String CREATE_DATE = "create_date";

		/**
		 * more_mamber.db table: more_mamber
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
		final public static String MEMBER_LEVEL = "member_level";
		final public static String START_DATE = "start_date";
		final public static String END_DATE = "end_date";

		/**
		 * more.db table: app
		 **/
		final public static String APP_ID = "app_id";
		final public static String APP_NAME = "app_name";
		final public static String APP_CATEGORY = "app_category";
		final public static String APP_ICON = "app_icon";
		final public static String APP_OS = "app_os";
		final public static String USER_ACCOUNT = "user_account";
		final public static String USER_NAME = "user_name";
		final public static String USER_EMAIL = "user_email";
		final public static String USER_PHONE = "user_phone";
		final public static String AGREE_NO = "agree_no";

		/**
		 * more.db table: sdk
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

	final public static ArrayList<String> listAppField = new ArrayList<>(Arrays.asList(Common.APP_ID, Common.APP_NAME,
			Common.APP_CATEGORY, Common.APP_ICON, Common.APP_OS, Common.USER_ACCOUNT,
			Common.USER_NAME, Common.USER_EMAIL, Common.USER_PHONE));

	final public static ArrayList<String> listSdkField = new ArrayList<>(
			Arrays.asList(Common.SDK_ID, Common.SDK_OS, Common.SDK_OWNER, Common.SDK_NAME, Common.SDK_DESC,
					Common.SDK_FILE, Common.SDK_DOC, Common.SDK_ICON, Common.CREATE_DATE));

	public static class mMemberData {
		public int member_id;
		public String member_email;
		public int member_level;
		public int member_state;
		public String start_date;
		public String end_date;
		public String create_date;
		public String update_date;
	}

	public static class MemberData {
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

	public static class SdkData {
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

	public static class AppData {
		public String app_id;
		public String app_name;
		public String app_category;
		public String app_icon;
		public String app_os;
		public String user_account;
		public String user_name;
		public String user_email;
		public String user_phone;
		public String agree_no;
		public String create_date;
		public String update_date;
	}

	public More() {

	}

	/**
	 * MySQL connection
	 **/

	public int mQueryMember(HttpServletRequest request, final String strEmail, mMemberData memData) {
		int nCount = 0;
		String strSQL = "select * from member where member_email = '" + strEmail + "';";
		Connection con = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//Logs.showTrace("#################before con");
			//con = DriverManager.getConnection("jdbc:mysql://175.98.119.121:3306/more_member?useUnicode=true&characterEncoding=UTF-8", "more", "ideas123!");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE_MEMBER,Common.DB_USER,Common.DB_PASS);
		//	Logs.showTrace("#################after con");
			
			if (con.isValid(3))
			{
			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			while (rs.next()) {
				++nCount;
				memData.member_id = rs.getInt("member_id");
				memData.member_email = rs.getString("member_email");
				memData.member_level = rs.getInt("member_level");
				memData.member_state = rs.getInt("member_state");
				memData.start_date = rs.getString("start_date");
				memData.end_date = rs.getString("end_date");
				memData.create_date = rs.getString("create_date");
				memData.update_date = rs.getString("update_date");

			}
			rs.close();
			stat.close();
			con.close();
			} else {
				Logs.showTrace("Connection failed");
			}
			

		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			More.webTracker(request, "queryMember failed: ", e.toString());
			Logs.showTrace("queryMember failed: "+ e.toString());
		} finally {

			try {
				if (stat != null)
					stat.close();
			} catch (SQLException se) {
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		More.webTracker(request, "queryMember success: ", strSQL);
		Logs.showTrace("queryMember success: "+ strSQL);
		return nCount;

	}

	public int mMemberAdd(HttpServletRequest request, final int nMemberId, final String strEmail, final String strAgreement) {
		if (!StringUtility.isValid(strEmail)) {
			return MORE_ERR_INVALID_PARAMETER;
		}

		String sql = "insert into member(member_id,member_email) values ( ?,?)";
		Connection con = null;
		
		try {
			mMemberData memData = new mMemberData();
			int nCount = mQueryMember(request, strEmail, memData);
			if (0 < nCount)
				return MORE_ERR_MEMBER_EXIST;

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE_MEMBER,Common.DB_USER,Common.DB_PASS);

			PreparedStatement pst = null;
			pst = con.prepareStatement(sql);
			int idx = 1;
			pst.setInt(idx++, nMemberId);
			pst.setString(idx++, strEmail);
			pst.executeUpdate();
			pst.close();
			con.close();

		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			Logs.showTrace("memberAdd failed: "+ e.toString());
			More.webTracker(request, "memberAdd failed: ", e.toString());
			return MORE_ERR_EXCEPTION;
			
		} finally {

			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		String strSignupData = "ACCOUNT: " + strEmail + " MEMBER ID: " + nMemberId + " AGREEMENT: " + strAgreement;
		
		More.webTracker(request, "memberAdd success: ", sql);
		More.webTracker(request, "memberAdd success: ", strSignupData);
		Logs.showTrace("memberAdd success: "+ sql);
		return MORE_ERR_SUCCESS;
	}
	
	public int mQuerySdk(HttpServletRequest request, ArrayList<SdkData> listSdk) {
		int nCount = 0;
		String strSQL = "select * from sdk order by create_date;";
		Connection con = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE,Common.DB_USER,Common.DB_PASS);

			if (con.isValid(3))
			{
			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			
				SdkData sdkData = null;
				while (rs.next()) {
					++nCount;
					sdkData = new SdkData();
					sdkData.sdk_id = rs.getString("sdk_id");
					sdkData.sdk_os = rs.getString("sdk_os");
					sdkData.sdk_owner = rs.getString("sdk_owner");
					sdkData.sdk_name = rs.getString("sdk_name");
					sdkData.sdk_desc = rs.getString("sdk_desc");
					sdkData.sdk_file = rs.getString("sdk_file");
					sdkData.sdk_doc = rs.getString("sdk_doc");
					sdkData.sdk_icon = rs.getString("sdk_icon");
					sdkData.create_date = rs.getString("create_date");
					listSdk.add(sdkData);
					sdkData = null;
				}
				nCount = listSdk.size();
			
			rs.close();
			stat.close();
			con.close();
			} else {
				Logs.showTrace("Connection failed");
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "querySdk failed: ", e.toString());
			Logs.showTrace("querySdk failed: "+ e.toString());
		} finally {

			try {
				if (stat != null)
					stat.close();
			} catch (SQLException se) {
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		More.webTracker(request, "querySdk success: ", strSQL);
		Logs.showTrace("querySdk success: "+ strSQL);
		return nCount;
	}
	
	public int mQueryApp(HttpServletRequest request, ArrayList<AppData> listApp, String strUserAccount) {
		int nCount = 0;
		String strSQL = "select * from app where user_account = '" + strUserAccount + "' order by create_date;";
		Connection con = null;
		Statement stat = null;
		ResultSet rs = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE,Common.DB_USER,Common.DB_PASS);

			if (con.isValid(3))
			{
			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			
			AppData appData = null;
				while (rs.next()) {
					++nCount;
					appData = new AppData();
					appData.app_id = rs.getString("app_id");
					appData.app_name = rs.getString("app_name");
					appData.app_category = rs.getString("app_category");
					appData.app_icon = rs.getString("app_icon");
					appData.app_os = rs.getString("app_os");
					appData.user_account = rs.getString("user_account");
					appData.user_name = rs.getString("user_name");
					appData.user_email = rs.getString("user_email");
					appData.user_phone = rs.getString("user_phone");
					appData.create_date = rs.getString("create_date");
					appData.update_date = rs.getString("update_date");
					listApp.add(appData);
					appData = null;
				}
				nCount = listApp.size();

				rs.close();
				stat.close();
				con.close();
				} else {
					Logs.showTrace("Connection failed");
				}
				
			} catch (SQLException se) {
				se.printStackTrace();
				Logs.showTrace("JDBC failed: "+ se.toString());
				
			} catch (Exception e) {

				e.printStackTrace();
				More.webTracker(request, "queryApp failed: ", e.toString());
				Logs.showTrace("queryApp failed: "+ e.toString());
			} finally {

				try {
					if (stat != null)
						stat.close();
				} catch (SQLException se) {
				}
				try {
					if (con != null)
						con.close();
				} catch (SQLException se) {
					se.printStackTrace();
				}
			}
			More.webTracker(request, "queryApp success: ", strSQL);
			Logs.showTrace("queryApp success: "+ strSQL);
			return nCount;
		}
	
	public int mInsertApp(HttpServletRequest request, final String strAppId, final String strAppName,
			final String strAppCategory, final String strAppIcon, final String strAppOs, final String strUserAccount,
			final String strUserName, final String strUserEmail, final String strUserPhone, final String agree_no) {
		
		String strSQL = "insert into app(app_id, app_name, app_category, app_icon, app_os, user_account, user_name, user_email, user_phone, agree_no) values(?,?,?,?,?,?,?,?,?,?) ;";
		Connection con = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE,Common.DB_USER,Common.DB_PASS);

			if (con.isValid(3))
			{
			PreparedStatement pst = null;
			pst = con.prepareStatement(strSQL);
			int idx = 1;
			pst.setString(idx++, strAppId);
			pst.setString(idx++, strAppName);
			pst.setString(idx++, strAppCategory);
			pst.setString(idx++, strAppIcon);
			pst.setString(idx++, strAppOs);
			pst.setString(idx++, strUserAccount);
			pst.setString(idx++, strUserName);
			pst.setString(idx++, strUserEmail);
			pst.setString(idx++, strUserPhone);
			pst.setString(idx++, agree_no);
			pst.executeUpdate();
			pst.close();
			con.close();
			
			} else {
				Logs.showTrace("Connection failed");
			}
		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			Logs.showTrace("insertApp failed: "+ e.toString());
			More.webTracker(request, "insertApp failed: ", e.toString());
			return MORE_ERR_EXCEPTION;
			
		} finally {

			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}

		More.webTracker(request, "insertApp success: ", strSQL);
		Logs.showTrace("insertApp success: "+ strSQL);
		return MORE_ERR_SUCCESS;
	}
	
	public void mDeleteApp(HttpServletRequest request, final String strAppId) {
		Connection con = null;
		Statement stat = null;
		ResultSet rs = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE,Common.DB_USER,Common.DB_PASS);

			if (con.isValid(3))
			{
			
			// Query APP Icon File Path
			String strSQL = "select app_icon from app where app_id = '" + strAppId + "'";
			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			String strAppIcon = null;
			if (rs.next()) {
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

			// Delete local file
			if (null != strAppIcon) {
				File file = new File("/data/opt/tomcat/webapps/more" + strAppIcon);
				System.out.println("##########/data/opt/tomcat/webapps/more" + strAppIcon);
				if (null != file) {

					String absolutePath = file.getAbsolutePath();
					String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

					if (file.delete()) {
						System.out.println(file.getName() + " is deleted!");
						More.webTracker(request, file.getName() + "deleteApp success: ", strSQL);
					} else {
						System.out.println("Delete operation is failed.");
						More.webTracker(request, "[Delete operation is failed.] deleteApp failed: ", strSQL);
					}

					File folderPath = new File(filePath);

					if (folderPath.isDirectory()) {

						if (folderPath.list().length <= 0) {

							System.out.println("Directory is empty!");
							More.webTracker(request, "[Directory is empty!] deleteApp failed: ", strSQL);
							folderPath.delete();
						}
					}
				}
			}

			} else {
				Logs.showTrace("Connection failed");
			}
		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "deleteApp failed: ", e.toString());
			Logs.showTrace("deleteApp failed: "+ e.toString());
		} finally {

			try {
				if (stat != null)
					stat.close();
			} catch (SQLException se) {
			}
			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
	
	public void mUpdateApp(HttpServletRequest request,final String strEmail, final String strAppId, final String strAppIcon,
			final String strAppName, final String strAppOs, final String strAppCategory, final String strUserName,
			final String strUserEmail, final String strUserPhone) {
		String sql = null;
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(Common.MYSQLDB_URL_MORE,Common.DB_USER,Common.DB_PASS);

			if (con.isValid(3))
			{
			if (null == strAppIcon) {
				sql = "update app set app_name = ? , app_os = ? , app_category = ? , user_name = ? , user_email = ? , user_phone = ? where app_id = ?";
			} else {
				sql = "update app set app_icon = ? , app_name = ? , app_os = ? , app_category = ? , user_name = ? , user_email = ? , user_phone = ? where app_id = ?";
			}

			PreparedStatement pst = null;
			pst = con.prepareStatement(sql);
			int idx = 1;

			if (null != strAppIcon) {
				pst.setString(idx++, strAppIcon);
			}
			pst.setString(idx++, strAppName);
			pst.setString(idx++, strAppOs);
			pst.setString(idx++, strAppCategory);
			pst.setString(idx++, strUserName);
			pst.setString(idx++, strUserEmail);
			pst.setString(idx++, strUserPhone);
			pst.setString(idx++, strAppId);
			pst.executeUpdate();
			pst.close();
			con.close();
			} else {
				Logs.showTrace("Connection failed");
			}
			
			String strData = "ICON: " + strAppIcon + " NAME: " + strAppName + " OS: "  + strAppOs + " CATE: "  + strAppCategory + " ORGAN: "  + strUserName + " SUPPORT: "  + strUserEmail + " PHONE: "  
				+ strUserPhone + " APP ID: "  + strAppId + " EDITOR: " + strEmail;

			More.webTracker(request, "updateApp", sql);
			More.webTracker(request, "updateApp success: ", strData);
			
		} catch (SQLException se) {
			se.printStackTrace();
			Logs.showTrace("JDBC failed: "+ se.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
			Logs.showTrace("updateApp failed: "+ e.toString());
			More.webTracker(request, "updateApp failed: ", e.toString());
			
		} finally {

			try {
				if (con != null)
					con.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
	}
	

	/**
	 * MySQL connection for backstage management
	 **/
	
	
	
	
	
	
	
	
	
	
	/**
	 * sqlite connection
	 **/

	public int queryMemberAccountList(HttpServletRequest request, ArrayList<String> listEmailAccount) {
		int nCount = 0;
		String strSQL = "select member_email from more_member;";
		Statement stat = null;
		ResultSet rs = null;
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);

			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			while (rs.next()) {
				++nCount;
				listEmailAccount.add(rs.getString("member_email"));
			}
			rs.close();
			stat.close();
			con.close();
			sqlite = null;

		} catch (SQLException e) {

			e.printStackTrace();
			More.webTracker(request, "queryMemberAccountList failed: ", e.toString());
		}
		More.webTracker(request, "queryMemberAccountList success: ", strSQL);
		return nCount;
	}

	public int queryMember(HttpServletRequest request, final String strEmail, MemberData memData) {
		int nCount = 0;
		String strSQL = "select * from more_member where member_email = '" + strEmail + "';";
		Statement stat = null;
		ResultSet rs = null;
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);

			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			while (rs.next()) {
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

		} catch (SQLException e) {

			e.printStackTrace();
			More.webTracker(request, "queryMember failed: ", e.toString());
		}
		More.webTracker(request, "queryMember success: ", strSQL);
		return nCount;
	}

	public int memberAdd(HttpServletRequest request, final String strEmail, final String strPassword,
			final String strName, final String strCompany, final String strPhone, final String strToken) {
		if (!StringUtility.isValid(strEmail) || !StringUtility.isValid(strPassword)) {
			return MORE_ERR_INVALID_PARAMETER;
		}

		String sql = "insert into more_member(member_email,member_password,member_name,member_company,member_phone,member_token) values ( ?,?,?,?,?,?)";
		try {
			MemberData memData = new MemberData();
			int nCount = queryMember(request, strEmail, memData);
			if (0 < nCount)
				return MORE_ERR_MEMBER_EXIST;

			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_MORE_MEMBER);

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

		} catch (Exception e) {

			More.webTracker(request, "memberAdd failed: ", e.toString());
			return MORE_ERR_EXCEPTION;
		}

		More.webTracker(request, "memberAdd success: ", sql);
		return MORE_ERR_SUCCESS;
	}

	public int querySdk(HttpServletRequest request, ArrayList<SdkData> listSdk) {
		int nCount = 0;
		String strSQL = "select * from sdk order by create_date;";
		ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

			sqlite.query(con, strSQL, listSdkField, listData);
			con.close();
			sqlite = null;

			if (0 < listData.size()) {
				Iterator<HashMap<String, String>> it = null;
				HashMap<String, String> mapItem;
				it = listData.iterator();
				SdkData sdkData = null;
				while (it.hasNext()) {
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

		} catch (SQLException e) {

			e.printStackTrace();
			More.webTracker(request, "querySdk failed: ", e.toString());
		}
		More.webTracker(request, "querySdk success: ", strSQL);
		return nCount;
	}

	public int queryApp(HttpServletRequest request, ArrayList<AppData> listApp, String strUserAccount) {
		int nCount = 0;
		String strSQL = "select * from app where user_account = '" + strUserAccount + "' order by create_date;";
		ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

			sqlite.query(con, strSQL, listAppField, listData);
			con.close();
			sqlite = null;

			if (0 < listData.size()) {
				Iterator<HashMap<String, String>> it = null;
				HashMap<String, String> mapItem;
				it = listData.iterator();
				AppData appData = null;
				while (it.hasNext()) {
					appData = new AppData();
					mapItem = it.next();
					appData.app_id = mapItem.get(Common.APP_ID);
					appData.app_name = mapItem.get(Common.APP_NAME);
					appData.app_category = mapItem.get(Common.APP_CATEGORY);
					appData.app_icon = mapItem.get(Common.APP_ICON);
					appData.app_os = mapItem.get(Common.APP_OS);
					appData.user_account = mapItem.get(Common.USER_ACCOUNT);
					appData.user_name = mapItem.get(Common.USER_NAME);
					appData.user_email = mapItem.get(Common.USER_EMAIL);
					appData.user_phone = mapItem.get(Common.USER_PHONE);
					appData.create_date = mapItem.get(Common.CREATE_DATE);
					listApp.add(appData);
					appData = null;
				}
				nCount = listApp.size();
			}

		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "queryApp failed: ", e.toString());
		}
		More.webTracker(request, "queryApp success: ", strSQL);
		return nCount;
	}

	public int insertApp(HttpServletRequest request, final String strAppId, final String strAppName,
			final String strAppCategory, final String strAppIcon, final String strAppOs, final String strUserAccount,
			final String strUserName, final String strUserEmail, final String strUserPhone) {
		String strSQL = "insert into app(app_id, app_name, app_category, app_icon, app_os, user_account, user_name, user_email, user_phone) values(?,?,?,?,?,?,?,?,?) ;";
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

			PreparedStatement pst = null;
			pst = con.prepareStatement(strSQL);
			int idx = 1;
			pst.setString(idx++, strAppId);
			pst.setString(idx++, strAppName);
			pst.setString(idx++, strAppCategory);
			pst.setString(idx++, strAppIcon);
			pst.setString(idx++, strAppOs);
			pst.setString(idx++, strUserAccount);
			pst.setString(idx++, strUserName);
			pst.setString(idx++, strUserEmail);
			pst.setString(idx++, strUserPhone);
			pst.executeUpdate();
			pst.close();
		} catch (Exception e) {
			Logs.showError(e.toString());
			More.webTracker(request, "insertApp failed: ", e.toString());
			return MORE_ERR_EXCEPTION;
		}
		More.webTracker(request, "insertApp success: ", strSQL);
		return MORE_ERR_SUCCESS;
	}

	public void deleteApp(HttpServletRequest request, final String strAppId) {
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

			// Query APP Icon File Path
			String strSQL = "select app_icon from app where app_id = '" + strAppId + "'";
			Statement stat = null;
			ResultSet rs = null;
			stat = con.createStatement();
			rs = stat.executeQuery(strSQL);
			String strAppIcon = null;
			if (rs.next()) {
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
			if (null != strAppIcon) {
				File file = new File("/data/opt/tomcat/webapps/more" + strAppIcon);
				System.out.println("##########/data/opt/tomcat/webapps/more" + strAppIcon);
				if (null != file) {

					String absolutePath = file.getAbsolutePath();
					String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

					if (file.delete()) {
						System.out.println(file.getName() + " is deleted!");
						More.webTracker(request, file.getName() + "deleteApp success: ", strSQL);
					} else {
						System.out.println("Delete operation is failed.");
						More.webTracker(request, "[Delete operation is failed.] deleteApp failed: ", strSQL);
					}

					File folderPath = new File(filePath);

					if (folderPath.isDirectory()) {

						if (folderPath.list().length <= 0) {

							System.out.println("Directory is empty!");
							More.webTracker(request, "[Directory is empty!] deleteApp failed: ", strSQL);
							folderPath.delete();
						}
					}
				}
			}

		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "deleteApp failed: ", e.toString());
		}
	}

	public void updateApp(HttpServletRequest request, final String strAppId, final String strAppIcon,
			final String strAppName, final String strAppOs, final String strAppCategory, final String strUserName,
			final String strUserEmail, final String strUserPhone) {
		try {
			sqliteClient sqlite = new sqliteClient();
			Connection con = sqlite.getConnection(Common.DB_PATH_IDEAS);

			String sql = null;
			if (null == strAppIcon) {
				sql = "update app set app_name = ? , app_os = ? , app_category = ? , user_name = ? , user_email = ? , user_phone = ? where app_id = ?";
			} else {
				sql = "update app set app_icon = ? , app_name = ? , app_os = ? , app_category = ? , user_name = ? , user_email = ? , user_phone = ? where app_id = ?";
			}

			PreparedStatement pst = null;
			pst = con.prepareStatement(sql);
			int idx = 1;

			if (null != strAppIcon) {
				pst.setString(idx++, strAppIcon);
			}
			pst.setString(idx++, strAppName);
			pst.setString(idx++, strAppOs);
			pst.setString(idx++, strAppCategory);
			pst.setString(idx++, strUserName);
			pst.setString(idx++, strUserEmail);
			pst.setString(idx++, strUserPhone);
			pst.setString(idx++, strAppId);
			pst.executeUpdate();
			pst.close();

			con.close();
			sqlite = null;

			String strData = strAppIcon + strAppName + strAppOs + strAppCategory + strUserName + strUserEmail
					+ strUserPhone + strAppId;

			More.webTracker(request, "updateApp success: ", sql);
			More.webTracker(request, "updateApp success: ", strData);
		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "updateApp failed: ", e.toString());
		}
	}

	public void updateUser(HttpServletRequest request, final String strAppId, final String strUserName,
			final String strUserPhone, final String strUserEmail) {
		try {
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

		} catch (Exception e) {

			e.printStackTrace();
			More.webTracker(request, "updateUser failed: ", e.toString());
		}
	}

	/**
	 * general utility
	 **/

	public void SendingEmail(HttpServletRequest request, String Email, String Body) {
		try {
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
			for (int i = 0; i < to.length; i++) { // changed from a while loop
				toAddress[i] = new InternetAddress(to[i]);
			}
			System.out.println(Message.RecipientType.TO);
			for (int j = 0; j < toAddress.length; j++) { // changed from a while
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

		} catch (Exception e) {
			System.out.println("MORE Send Mail Exception:" + e.toString());
			More.webTracker(request, "MORE SendingEmail failed: ", e.toString());
		}
	}

	public synchronized String generateToken(String msg, boolean timeChange) {
		long current = System.currentTimeMillis();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(msg.getBytes());
			if (timeChange) {
				byte now[] = (new Long(current)).toString().getBytes();
				md.update(now);
			}
			return toHex(md.digest());
		} catch (NoSuchAlgorithmException e) {

		}

		return String.valueOf(current);
	}

	private String toHex(byte buffer[]) {
		StringBuffer sb = new StringBuffer(buffer.length * 2);
		for (int i = 0; i < buffer.length; i++) {
			sb.append(Character.forDigit((buffer[i] & 240) >> 4, 16));
			sb.append(Character.forDigit(buffer[i] & 15, 16));
		}

		return sb.toString();
	}

	static public String getClientIP(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	static public String getDateTime() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date current = new Date();
		return sdFormat.format(current);
	}

	/**
	 * mongo web tracker
	 **/

	@SuppressWarnings("deprecation")
	static public int insert(String strIP, int nPort, final String strDB, final String strCollection,
			final HashMap<String, String> mapData) {
		int nResult = 0;

		if (null == mapData || 0 >= mapData.size())
			return -1;

		try {
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

			for (Object key : mapData.keySet()) {
				document.append((String) key, mapData.get(key));
			}
			collection.insert(document);
			if (null != mongo)
				mongo.close();

		} catch (Exception e) {
			nResult = -1;
			System.out.println("Mongo Exception: " + e.toString());
		}
		return nResult;
	}

	static public void webTracker(HttpServletRequest request, String strAction, String strEvent) {
		HashMap<String, String> mapData = new HashMap<String, String>();
		mapData.put("client", getClientIP(request));
		mapData.put("host", request.getRequestURL().toString());
		mapData.put("create_date", getDateTime());
		mapData.put("action", strAction);
		if (null == strEvent)
			strEvent = request.getRequestURI();
		mapData.put("event", strEvent);
		insert(Common.MONGO_DB, 27017, "website", "more", mapData);
		mapData.clear();
	}

	/**
	 * MD5 Hash
	 **/
	String hex_chr = "0123456789abcdef";

	private String rhex(int num) {
		String str = "";
		for (int j = 0; j <= 3; j++)
			str = str + hex_chr.charAt((num >> (j * 8 + 4)) & 0x0F) + hex_chr.charAt((num >> (j * 8)) & 0x0F);
		return str;
	}

	public int[] str2blks_MD5(String str) {
		int nblk = ((str.length() + 8) >> 6) + 1;
		int[] blks = new int[nblk * 16];
		int i = 0;
		for (i = 0; i < nblk * 16; i++) {
			blks[i] = 0;
		}
		for (i = 0; i < str.length(); i++) {
			blks[i >> 2] |= str.charAt(i) << ((i % 4) * 8);
		}
		blks[i >> 2] |= 0x80 << ((i % 4) * 8);
		blks[nblk * 16 - 2] = str.length() * 8;

		return blks;
	}

	private int add(int x, int y) {
		return ((x & 0x7FFFFFFF) + (y & 0x7FFFFFFF)) ^ (x & 0x80000000) ^ (y & 0x80000000);
	}

	private int rol(int num, int cnt) {
		return (num << cnt) | (num >>> (32 - cnt));
	}

	private int cmn(int q, int a, int b, int x, int s, int t) {
		return add(rol(add(add(a, q), add(x, t)), s), b);
	}

	private int ff(int a, int b, int c, int d, int x, int s, int t) {
		return cmn((b & c) | ((~b) & d), a, b, x, s, t);
	}

	private int gg(int a, int b, int c, int d, int x, int s, int t) {
		return cmn((b & d) | (c & (~d)), a, b, x, s, t);
	}

	private int hh(int a, int b, int c, int d, int x, int s, int t) {
		return cmn(b ^ c ^ d, a, b, x, s, t);
	}

	private int ii(int a, int b, int c, int d, int x, int s, int t) {
		return cmn(c ^ (b | (~d)), a, b, x, s, t);
	}

	public String calcMD5(String str) {
		int[] x = str2blks_MD5(str);
		int a = 0x67452301;
		int b = 0xEFCDAB89;
		int c = 0x98BADCFE;
		int d = 0x10325476;

		for (int i = 0; i < x.length; i += 16) {
			int olda = a;
			int oldb = b;
			int oldc = c;
			int oldd = d;

			a = ff(a, b, c, d, x[i + 0], 7, 0xD76AA478);
			d = ff(d, a, b, c, x[i + 1], 12, 0xE8C7B756);
			c = ff(c, d, a, b, x[i + 2], 17, 0x242070DB);
			b = ff(b, c, d, a, x[i + 3], 22, 0xC1BDCEEE);
			a = ff(a, b, c, d, x[i + 4], 7, 0xF57C0FAF);
			d = ff(d, a, b, c, x[i + 5], 12, 0x4787C62A);
			c = ff(c, d, a, b, x[i + 6], 17, 0xA8304613);
			b = ff(b, c, d, a, x[i + 7], 22, 0xFD469501);
			a = ff(a, b, c, d, x[i + 8], 7, 0x698098D8);
			d = ff(d, a, b, c, x[i + 9], 12, 0x8B44F7AF);
			c = ff(c, d, a, b, x[i + 10], 17, 0xFFFF5BB1);
			b = ff(b, c, d, a, x[i + 11], 22, 0x895CD7BE);
			a = ff(a, b, c, d, x[i + 12], 7, 0x6B901122);
			d = ff(d, a, b, c, x[i + 13], 12, 0xFD987193);
			c = ff(c, d, a, b, x[i + 14], 17, 0xA679438E);
			b = ff(b, c, d, a, x[i + 15], 22, 0x49B40821);

			a = gg(a, b, c, d, x[i + 1], 5, 0xF61E2562);
			d = gg(d, a, b, c, x[i + 6], 9, 0xC040B340);
			c = gg(c, d, a, b, x[i + 11], 14, 0x265E5A51);
			b = gg(b, c, d, a, x[i + 0], 20, 0xE9B6C7AA);
			a = gg(a, b, c, d, x[i + 5], 5, 0xD62F105D);
			d = gg(d, a, b, c, x[i + 10], 9, 0x02441453);
			c = gg(c, d, a, b, x[i + 15], 14, 0xD8A1E681);
			b = gg(b, c, d, a, x[i + 4], 20, 0xE7D3FBC8);
			a = gg(a, b, c, d, x[i + 9], 5, 0x21E1CDE6);
			d = gg(d, a, b, c, x[i + 14], 9, 0xC33707D6);
			c = gg(c, d, a, b, x[i + 3], 14, 0xF4D50D87);
			b = gg(b, c, d, a, x[i + 8], 20, 0x455A14ED);
			a = gg(a, b, c, d, x[i + 13], 5, 0xA9E3E905);
			d = gg(d, a, b, c, x[i + 2], 9, 0xFCEFA3F8);
			c = gg(c, d, a, b, x[i + 7], 14, 0x676F02D9);
			b = gg(b, c, d, a, x[i + 12], 20, 0x8D2A4C8A);

			a = hh(a, b, c, d, x[i + 5], 4, 0xFFFA3942);
			d = hh(d, a, b, c, x[i + 8], 11, 0x8771F681);
			c = hh(c, d, a, b, x[i + 11], 16, 0x6D9D6122);
			b = hh(b, c, d, a, x[i + 14], 23, 0xFDE5380C);
			a = hh(a, b, c, d, x[i + 1], 4, 0xA4BEEA44);
			d = hh(d, a, b, c, x[i + 4], 11, 0x4BDECFA9);
			c = hh(c, d, a, b, x[i + 7], 16, 0xF6BB4B60);
			b = hh(b, c, d, a, x[i + 10], 23, 0xBEBFBC70);
			a = hh(a, b, c, d, x[i + 13], 4, 0x289B7EC6);
			d = hh(d, a, b, c, x[i + 0], 11, 0xEAA127FA);
			c = hh(c, d, a, b, x[i + 3], 16, 0xD4EF3085);
			b = hh(b, c, d, a, x[i + 6], 23, 0x04881D05);
			a = hh(a, b, c, d, x[i + 9], 4, 0xD9D4D039);
			d = hh(d, a, b, c, x[i + 12], 11, 0xE6DB99E5);
			c = hh(c, d, a, b, x[i + 15], 16, 0x1FA27CF8);
			b = hh(b, c, d, a, x[i + 2], 23, 0xC4AC5665);

			a = ii(a, b, c, d, x[i + 0], 6, 0xF4292244);
			d = ii(d, a, b, c, x[i + 7], 10, 0x432AFF97);
			c = ii(c, d, a, b, x[i + 14], 15, 0xAB9423A7);
			b = ii(b, c, d, a, x[i + 5], 21, 0xFC93A039);
			a = ii(a, b, c, d, x[i + 12], 6, 0x655B59C3);
			d = ii(d, a, b, c, x[i + 3], 10, 0x8F0CCC92);
			c = ii(c, d, a, b, x[i + 10], 15, 0xFFEFF47D);
			b = ii(b, c, d, a, x[i + 1], 21, 0x85845DD1);
			a = ii(a, b, c, d, x[i + 8], 6, 0x6FA87E4F);
			d = ii(d, a, b, c, x[i + 15], 10, 0xFE2CE6E0);
			c = ii(c, d, a, b, x[i + 6], 15, 0xA3014314);
			b = ii(b, c, d, a, x[i + 13], 21, 0x4E0811A1);
			a = ii(a, b, c, d, x[i + 4], 6, 0xF7537E82);
			d = ii(d, a, b, c, x[i + 11], 10, 0xBD3AF235);
			c = ii(c, d, a, b, x[i + 2], 15, 0x2AD7D2BB);
			b = ii(b, c, d, a, x[i + 9], 21, 0xEB86D391);

			a = add(a, olda);
			b = add(b, oldb);
			c = add(c, oldc);
			d = add(d, oldd);
		}
		return rhex(a) + rhex(b) + rhex(c) + rhex(d);
	}

}
