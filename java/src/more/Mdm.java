package more;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;



public class Mdm
{
    public final static int MDM_DB_ERR_SUCCESS = 9;
    public final static int MDM_DB_ERR_FAIL = 8;
    public final static int MDM_DB_ERR_EXCEPTION = 7;
    public final static int MDM_DB_ERR_ACCOUNT_EXIST = 6;

    public final static int MDM_JOB_SUCCESS = 1;
    public final static int MDM_JOB_CMMD = 0;
    public final static int MDM_JOB_ERROR = -1;

    public class Common
    {
    	final public static String UPLOAD_FILE_ANDROID_MANAGE_CONTENT_PATH = "/mdm/uploadfile/android/manage/content";
    	final public static String UPLOAD_FILE_ANDROID_MANAGE_APP_PATH = "/mdm/uploadfile/android/manage/app";
    	final public static String UPLOAD_FILE_ANDROID_DEVICE_APP_PATH = "/mdm/uploadfile/android/device/icon"; //Icons for showing device screen & app list
    	final public static String DB_PATH_MDM_USER = "/data/sqlite/mdm_user.db";
    	final public static String DB_PATH_MDM_ANDROID = "/data/sqlite/mdm_android.db";
    	final public static String DB_PATH_LOCATION = "/data/sqlite/location.db";
    	
    	/**sqlite Common**/
    	final public static String USER_ID = "user_id";
    	final public static String GROUP_ID = "group_id";
    	final public static String START_TIME = "start_time";
    	final public static String END_TIME = "end_time";
    	final public static String CREATE_TIME = "create_time";
    	final public static String UPDATE_TIME = "update_time";
    	final public static String FILE_LOCATION = "file_location";
    	final public static String APP_ICON = "app_icon";
    	final public static String APP_ID  = "app_id";
    	final public static String APP_NAME = "app_name";
    	final public static String CONTENT_ID  = "content_id";
    	final public static String MAC_ADDRESS  = "mac_address";
    	final public static String DEVICE_MODEL  = "device_model";
    	final public static String DEVICE_IMG  = "device_img";
    	final public static String JOB_ID  = "job_id";
    	final public static String JOB_SEQ  = "job_seq";
    	final public static String CONTROL_ID  = "control_id";
    	final public static String ACTION  = "action";
    	
    	/**sqlite mdm_user.db 
    	 * table: user_permission**/
    	final public static String USER_EMAIL = "user_email";
    	final public static String PERMISSION = "permission";
    	
    	
    	
    	
    	/**sqlite mdm_android.db 
    	 * table: group_info**/
    	final public static String GROUP_NAME = "group_name";
    	final public static String ACCOUNT = "account";
    	final public static String PASSWORD = "password";
    	final public static String MAXIMUM = "maximum";
    	final public static String CONNECTED = "connected";
    	
    	
    	
    	/**sqlite mdm_android.db 
    	 * table: app_manage**/
    	final public static String CATEGORY = "category";
    	final public static String  EDITION = "edition";
    	final public static String DESCRIPTION = "description";
    	final public static String APK_FILE_NAME  = "apk_file_name";
    	
    	
    	/**sqlite mdm_android.db 
    	 * table: content_manage**/
    	final public static String ALIAS  = "alias";
    	final public static String CONTENT_TYPE  = "content_type";
    	final public static String FILE_NAME  = "file_name";
    	
    	
    	
    	/**sqlite mdm_android.db 
    	 * table: device_info**/
    	final public static String BATTERY_PERCENT  = "battery_percent";
    	final public static String TOTAL_SPACE  = "total_space";
    	final public static String USED_SPACE  = "used_space";

    	

    	/**sqlite mdm_android.db 
    	 * table: action_device**/
    	final public static String INPUT  = "input";
    }
    
    final public static ArrayList<String> listPermissionField = new ArrayList<>(Arrays.asList(Common.USER_EMAIL, Common.USER_ID, Common.PERMISSION, Common.START_TIME, Common.END_TIME, Common.CREATE_TIME, Common.UPDATE_TIME)); 
    
    final public static ArrayList<String> listGroupField = new ArrayList<>(Arrays.asList(Common.USER_ID, Common.GROUP_ID, Common.GROUP_NAME, Common.ACCOUNT,
	    Common.PASSWORD, Common.MAXIMUM, Common.CONNECTED, Common.CREATE_TIME, Common.UPDATE_TIME)); 
    
    final public static ArrayList<String> listAppField = new ArrayList<>(Arrays.asList(Common.APP_ID, Common.GROUP_ID, Common.APP_NAME, Common.CATEGORY,
	    Common.EDITION, Common.DESCRIPTION, Common.APP_ICON, Common.APK_FILE_NAME, Common.FILE_LOCATION, Common.CREATE_TIME, Common.UPDATE_TIME)); 

    final public static ArrayList<String> listContentField = new ArrayList<>(Arrays.asList(Common.CONTENT_ID, Common.GROUP_ID, Common.ALIAS, Common.CONTENT_TYPE, Common.FILE_NAME, Common.FILE_LOCATION, Common.CREATE_TIME, Common.UPDATE_TIME)); 
    
    final public static ArrayList<String> listDeviceField = new ArrayList<>(Arrays.asList(Common.MAC_ADDRESS, Common.DEVICE_MODEL, Common.GROUP_ID, Common.BATTERY_PERCENT,
	    Common.TOTAL_SPACE, Common.USED_SPACE, Common.DEVICE_IMG, Common.CREATE_TIME, Common.UPDATE_TIME)); 
    
    
    public static class PermissionData
    {
	public String user_email;
	public String user_id;
	public String permission;
	public String start_time;
	public String end_time;
	public String create_time;
	public String update_time;
    }

    public static class GroupData
    {
	public String user_id;
	public String group_id;
	public String group_name;
	public String account;
	public String password;
	public String maximum;
	public String connected;
	public String create_time;
	public String update_time;
    }

    public static class AppData
    {
	public String app_id;
	public String group_id;
	public String app_name;
	public String category;
	public String edition;
	public String description;
	public String app_icon;
	public String apk_file_name;
	public String file_location;
	public String create_time;
	public String update_time;
    }

    public static class ContentData
    {
	public String content_id;
	public String group_id;
	public String alias;
	public String content_type;
	public String file_name;
	public String file_location;
	public String create_time;
	public String update_time;
    }

    public static class DeviceData
    {
	public String mac_address;
	public String device_model;
	public String group_id;
	public String battery_percent;
	public String total_space;
	public String used_space;
	public String device_img;
	public String create_time;
	public String update_time;
    }

    public static class ActionDeviceData
    {
	public String job_id;
	public String job_seq;
	public String control_id;
	public String action;
	public String input;
	public String create_time;
    }

    sqliteClient sqlite = null;
    Connection conMdmUser = null;
    Connection conLocation = null;
    Connection conMdmAndroid = null;

    // common DB
    public boolean conDB(HttpServletRequest request)
    {
	sqlite = new sqliteClient();
	boolean bResult = false;
	try
	{
	    conMdmUser = sqlite.getConnection(Common.DB_PATH_MDM_USER);
	    conLocation = sqlite.getConnection(Common.DB_PATH_LOCATION);
	    bResult = true;
	}
	catch (SQLException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    More.webTracker(request, "connect to mdm_user DB failed ", e.toString());
	}
	
	More.webTracker(request, "connect to mdm_user DB success", null);
	return bResult;
    }

    public void closeDB(HttpServletRequest request)
    {
	try
	{
	    conMdmUser.close();
	    conLocation.close();
	    sqlite = null;
	}
	catch (SQLException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    More.webTracker(request, "close mdm_user DB failed ", e.toString());
	}
	
	More.webTracker(request, "close mdm_user DB success", null);
    }

    // for android db
    public boolean conTypeDB(HttpServletRequest request, int nType)
    {
	sqlite = new sqliteClient();
	boolean bResult = false;
	try
	{
	    switch (nType)
	    {
	    case 0:
		conMdmAndroid = sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);
		break;
	    }
	    bResult = true;
	}
	catch (SQLException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    More.webTracker(request, "connect to mdm_android DB failed ", e.toString());
	}
	
	More.webTracker(request, "connect to mdm_android DB success", null);
	return bResult;
    }

    public void closeTypeDB(HttpServletRequest request, int nType)
    {
	try
	{
	    switch (nType)
	    {
	    case 0:
		conMdmAndroid.close();
		break;
	    }
	    sqlite = null;
	}
	catch (SQLException e)
	{
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	    More.webTracker(request, "close mdm_android DB failed ", e.toString());
	}

	    More.webTracker(request, "close mdm_android DB success", null);
    }

    
    public int queryPermission(HttpServletRequest request, String strEmail, ArrayList<PermissionData> listPermission)
    {
	int nCount = 0;
	String strSQL = "select * from user_permission where user_email='" + strEmail + "' order by create_time ;";
	ArrayList<HashMap<String, String> > listData = new ArrayList<HashMap<String, String> >();
	
	try
	{
	    // sqlite = new sqliteClient();
	    // Connection con = sqlite.getConnection(Common.DB_PATH_MDM_USER);
	    sqlite.query(conMdmUser, strSQL, listPermissionField, listData);
	    // con.close();
	    // sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String> > it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		PermissionData permissionData = null;
		while (it.hasNext())
		{
		    permissionData = new PermissionData();
		    mapItem = it.next();
		    permissionData.user_email = mapItem.get(Common.USER_EMAIL);
		    permissionData.user_id = mapItem.get(Common.USER_ID);
		    permissionData.permission = mapItem.get(Common.PERMISSION);
		    permissionData.start_time = mapItem.get(Common.START_TIME);
		    permissionData.end_time = mapItem.get(Common.END_TIME);
		    permissionData.create_time = mapItem.get(Common.CREATE_TIME);
		    permissionData.update_time = mapItem.get(Common.UPDATE_TIME);
		    listPermission.add(permissionData);
		    permissionData = null;
		}
		nCount = listPermission.size();
	    }
	}
	catch (SQLException e)
	{
	    Logs.showError(e.toString());
	    e.printStackTrace();
	    More.webTracker(request, "queryPermission failed: ", e.toString());
	}

	More.webTracker(request, "queryPermission success: ", strSQL);
	return nCount;
    }

    public int queryGroup(HttpServletRequest request, String strUserId, ArrayList<GroupData> listGroup)
    {
	int nCount = 0;
	String strSQL = "select * from group_info where user_id='" + strUserId + "' order by create_time ;";
	ArrayList<HashMap<String, String> > listData = new ArrayList<HashMap<String, String> >();
	    
	try
	{
	    // sqliteClient sqlite = new sqliteClient();
	    // Connection con =
	    // sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);
	    sqlite.query(conMdmAndroid, strSQL, listGroupField, listData);
	    // con.close();
	    // sqlite = null;

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String> > it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		GroupData groupData = null;
		while (it.hasNext())
		{
		    groupData = new GroupData();
		    mapItem = it.next();
		    groupData.user_id = mapItem.get(Common.USER_ID);
		    groupData.group_id = mapItem.get(Common.GROUP_ID);
		    groupData.group_name = mapItem.get(Common.GROUP_NAME);
		    groupData.account = mapItem.get(Common.ACCOUNT);
		    groupData.password = mapItem.get(Common.PASSWORD);
		    groupData.maximum = mapItem.get(Common.MAXIMUM);
		    groupData.connected = mapItem.get(Common.CONNECTED);
		    groupData.create_time = mapItem.get(Common.CREATE_TIME);
		    groupData.update_time = mapItem.get(Common.UPDATE_TIME);
		    listGroup.add(groupData);
		    groupData = null;
		}
		nCount = listGroup.size();
	    }
	}
	catch (SQLException e)
	{
	    Logs.showError(e.toString());
	    e.printStackTrace();
	    More.webTracker(request, "queryGroup failed: ", e.toString());
	}

	More.webTracker(request, "queryGroup success: ", strSQL);
	return nCount;
    }
    
    

    public int insertGroup(HttpServletRequest request, final String strName, final String strAccount, final String strPassword, final String strMaximum, final String strUserId)
    {
	String strSQL = "insert into group_info(group_name, account, password, maximum, user_id) values(?,?,?,?,?) ;";
	try
	{
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strName);
	    pst.setString(idx++, strAccount);
	    pst.setString(idx++, strPassword);
	    pst.setString(idx++, strMaximum);
	    pst.setString(idx++, strUserId);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    More.webTracker(request, "insertGroup failed: ", e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	More.webTracker(request, "insertGroup success: ", strSQL);
	return MDM_DB_ERR_SUCCESS;
    }

    public int updatepGroupEdit(HttpServletRequest request, final String strGroupId, final String strAccount, final String strPassword, final String strMaximum)
    {
	String strSQL = "update group_info set account =? , password =? , maximum =?, update_time = datetime('now','localtime')  where group_id ='" + strGroupId + "';";
	try
	{
	    Logs.showError(strSQL);
	    Logs.showError(strAccount);
	    Logs.showError(strPassword);
	    Logs.showError(strMaximum);
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strAccount);
	    pst.setString(idx++, strPassword);
	    pst.setInt(idx++, Integer.valueOf(strMaximum));
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    More.webTracker(request, "updatepGroupEdit failed: ", e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	More.webTracker(request, "updatepGroupEdit success: ", strSQL);
	return MDM_DB_ERR_SUCCESS;
    }

    public int deleteGroup(HttpServletRequest request, final String strGroupId)
    {
	String strSQL;
	try
	{
	    strSQL = "delete from group_info where group_id = ?";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.executeUpdate();
	    pst.close();

	    strSQL = "delete from device_info where group_id = ?";
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.executeUpdate();
	    pst.close();

	    
	    
	    strSQL = "delete from app_manage where group_id = ?";
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.executeUpdate();
	    pst.close();

	    strSQL = "delete from content_manage where group_id = ?";
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    More.webTracker(request, "deleteGroup failed: ", e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	More.webTracker(request, "deleteGroup success: ", strSQL);
	return MDM_DB_ERR_SUCCESS;

    }

    public int insertAppManage(HttpServletRequest request, final String strGroupId, final String strAppName, final String strCategory, final String strEdition, final String strDescription,
	    final String strAppIcon, final String strAPKFileName, final String strFileLocation)
    {
	String strSQL = "insert into app_manage(group_id, app_name, category, edition, description, app_icon, apk_file_name, file_location) values(?,?,?,?,?,?,?,?) ;";
	try
	{
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.setString(idx++, strAppName);
	    pst.setString(idx++, strCategory);
	    pst.setString(idx++, strEdition);
	    pst.setString(idx++, strDescription);
	    pst.setString(idx++, strAppIcon);
	    pst.setString(idx++, strAPKFileName);
	    pst.setString(idx++, strFileLocation);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    More.webTracker(request, "insertAppManage failed: ", e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	More.webTracker(request, "insertAppManage success: ", strSQL);
	return MDM_DB_ERR_SUCCESS;
    }

    public int queryApp(String strGroupId, ArrayList<AppData> listApp)
    {
	int nCount = 0;

	try
	{
	    String strSQL = "select * from app_manage where group_id='" + strGroupId + "' order by create_time ;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(conMdmAndroid, strSQL, listAppField, listData);

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
		    appData.group_id = mapItem.get(Common.GROUP_ID);
		    appData.app_name = mapItem.get(Common.APP_NAME);
		    appData.category = mapItem.get(Common.CATEGORY);
		    appData.edition = mapItem.get(Common.EDITION);
		    appData.description = mapItem.get(Common.DESCRIPTION);
		    appData.app_icon = mapItem.get(Common.APP_ICON);
		    appData.apk_file_name = mapItem.get(Common.APK_FILE_NAME);
		    appData.file_location = mapItem.get(Common.FILE_LOCATION);
		    appData.create_time = mapItem.get(Common.CREATE_TIME);
		    appData.update_time = mapItem.get(Common.UPDATE_TIME);
		    listApp.add(appData);
		    appData = null;
		}
		nCount = listApp.size();
	    }
	}
	catch (SQLException e)
	{
	    Logs.showError(e.toString());
	    e.printStackTrace();
	}

	return nCount;
    }

    public int deleteApp(final String strGroupId, final String strAPKFileName)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);

	    // Query File Path
	    String strSQL = "select app_icon, file_location from app_manage where group_id = '" + strGroupId + "' and apk_file_name = '" + strAPKFileName + "'";
	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    String strAppIcon = null;
	    String strAPKfile = null;
	    if (rs.next())
	    {
		strAppIcon = rs.getString("app_icon");
		strAPKfile = rs.getString("file_location");
	    }
	    rs.close();
	    stat.close();

	    // Delete DB data
	    strSQL = "delete from app_manage where group_id = ? and apk_file_name = ?";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.setString(idx++, strAPKFileName);
	    pst.executeUpdate();
	    pst.close();
	    Logs.showError(strSQL + " " + strGroupId + " " + strAPKFileName);

	    // Delete local file
	    if (null != strAppIcon)
	    {
		File fileIcon = new File("/data/opt/tomcat/webapps/mdm" + strAppIcon);
		if (null != fileIcon)
		{
		    String absolutePath = fileIcon.getAbsolutePath();
		    String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

		    if (fileIcon.delete())
		    {
			System.out.println(fileIcon.getName() + " is deleted!");
		    }
		    else
		    {
			System.out.println(fileIcon.getName() + "delete operation is failed.");
		    }

		    File folderPath = new File(filePath);

		    if (folderPath.isDirectory())
		    {
			if (folderPath.list().length <= 0)
			{

			    System.out.println("Directory is empty!");
			    folderPath.delete();
			}
		    }

		}
	    }

	    if (null != strAPKfile)
	    {
		File fileAPK = new File("/data/opt/tomcat/webapps/mdm" + strAPKfile);
		if (null != fileAPK)
		{
		    String absolutePath = fileAPK.getAbsolutePath();
		    String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

		    if (fileAPK.delete())
		    {
			System.out.println(fileAPK.getName() + " is deleted!");
		    }
		    else
		    {
			System.out.println(fileAPK.getName() + "delete operation is failed.");
		    }

		    File folderPath = new File(filePath);

		    if (folderPath.isDirectory())
		    {
			if (folderPath.list().length <= 0)
			{

			    System.out.println("Directory is empty!");
			    folderPath.delete();
			}
		    }

		}
	    }

	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	return MDM_DB_ERR_SUCCESS;

    }

    public int insertContentManage(final String strGroupId, final String strAlias, final String strContentType, final String strFileName, final String strFileLocation)
    {
	try
	{
	    String strSQL = "insert into content_manage(group_id, alias, content_type, file_name, file_location) values(?,?,?,?,?) ;";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.setString(idx++, strAlias);
	    pst.setString(idx++, strContentType);
	    pst.setString(idx++, strFileName);
	    pst.setString(idx++, strFileLocation);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}

	return MDM_DB_ERR_SUCCESS;
    }

    public int queryContent(String strGroupId, ArrayList<ContentData> listContent)
    {
	int nCount = 0;

	try
	{
	    String strSQL = "select * from content_manage where group_id='" + strGroupId + "' order by create_time ;";
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(conMdmAndroid, strSQL, listContentField, listData);

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		ContentData contentData = null;
		while (it.hasNext())
		{
		    contentData = new ContentData();
		    mapItem = it.next();
		    contentData.content_id = mapItem.get(Common.CONTENT_ID);
		    contentData.group_id = mapItem.get(Common.GROUP_ID);
		    contentData.alias = mapItem.get(Common.ALIAS);
		    contentData.content_type = mapItem.get(Common.CONTENT_TYPE);
		    contentData.file_name = mapItem.get(Common.FILE_NAME);
		    contentData.file_location = mapItem.get(Common.FILE_LOCATION);
		    contentData.create_time = mapItem.get(Common.CREATE_TIME);
		    contentData.update_time = mapItem.get(Common.UPDATE_TIME);
		    listContent.add(contentData);
		    contentData = null;
		}
		nCount = listContent.size();
	    }
	}
	catch (SQLException e)
	{
	    Logs.showError(e.toString());
	    e.printStackTrace();
	}

	return nCount;
    }

    public int deleteContent(final String strGroupId, final String strFileName)
    {
	try
	{
	    sqliteClient sqlite = new sqliteClient();
	    Connection con = sqlite.getConnection(Common.DB_PATH_MDM_ANDROID);

	    // Query File Path
	    String strSQL = "select file_location from content_manage where group_id = '" + strGroupId + "' and file_name = '" + strFileName + "'";
	    Statement stat = null;
	    ResultSet rs = null;
	    stat = con.createStatement();
	    rs = stat.executeQuery(strSQL);
	    String strContentFile = null;
	    if (rs.next())
	    {
		strContentFile = rs.getString("file_location");
	    }
	    rs.close();
	    stat.close();

	    // Delete DB data
	    strSQL = "delete from content_manage where group_id = ? and file_name = ?";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strGroupId);
	    pst.setString(idx++, strFileName);
	    pst.executeUpdate();
	    pst.close();
	    Logs.showError(strSQL + " " + strGroupId + " " + strFileName);

	    // Delete local file
	    if (null != strContentFile)
	    {
		File fileContent = new File("/data/opt/tomcat/webapps/mdm" + strContentFile);
		if (null != fileContent)
		{

		    String absolutePath = fileContent.getAbsolutePath();
		    String filePath = absolutePath.substring(0, absolutePath.lastIndexOf(File.separator));

		    if (fileContent.delete())
		    {
			System.out.println(fileContent.getName() + " is deleted!");
		    }
		    else
		    {
			System.out.println(fileContent.getName() + "delete operation is failed.");
		    }

		    File folderPath = new File(filePath);

		    if (folderPath.isDirectory())
		    {

			if (folderPath.list().length <= 0)
			{

			    System.out.println("Directory is empty!");
			    folderPath.delete();
			}
		    }
		}
	    }
	    
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}
	return MDM_DB_ERR_SUCCESS;

    }

    public int queryDevice(String strGroupId, ArrayList<DeviceData> listDevice)
    {
	int nCount = 0;

	try
	{
	    String strSQL = "select * from device_info where group_id='" + strGroupId + "' order by create_time ;";
	    System.out.println(strSQL);
	    ArrayList<HashMap<String, String>> listData = new ArrayList<HashMap<String, String>>();
	    sqlite.query(conMdmAndroid, strSQL, listDeviceField, listData);

	    if (0 < listData.size())
	    {
		Iterator<HashMap<String, String>> it = null;
		HashMap<String, String> mapItem;
		it = listData.iterator();
		DeviceData deviceData = null;
		while (it.hasNext())
		{
		    deviceData = new DeviceData();
		    mapItem = it.next();

		    deviceData.mac_address = mapItem.get(Common.MAC_ADDRESS);
		    deviceData.device_model = mapItem.get(Common.DEVICE_MODEL);
		    deviceData.group_id = mapItem.get(Common.GROUP_ID);
		    deviceData.battery_percent = mapItem.get(Common.BATTERY_PERCENT);
		    deviceData.total_space = mapItem.get(Common.TOTAL_SPACE);
		    deviceData.used_space = mapItem.get(Common.USED_SPACE);
		    deviceData.device_img = mapItem.get(Common.DEVICE_IMG);
		    deviceData.create_time = mapItem.get(Common.CREATE_TIME);
		    deviceData.update_time = mapItem.get(Common.UPDATE_TIME);
		    listDevice.add(deviceData);
		    System.out.println(deviceData.mac_address);
		    deviceData = null;
		}
		nCount = listDevice.size();
	    }
	}
	catch (SQLException e)
	{
	    Logs.showError(e.toString());
	    e.printStackTrace();
	}

	return nCount;
    }

    public int insertControllerJob(final String strControlId, final String strJobSeq, final String strCmmdFrom, final String strMacAddress)
    {
	try
	{
	    String strSQL = "insert into job(control_id, job_seq, cmmd_from, mac_address) values(?,?,?,?) ;";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strControlId);
	    pst.setString(idx++, strJobSeq);
	    pst.setString(idx++, strCmmdFrom);
	    pst.setString(idx++, strMacAddress);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}

	return MDM_DB_ERR_SUCCESS;
    }

    public int insertActionDevice(final String strJobSeq, final String strControlId, final String strAction, final String strInput)
    {
	try
	{
	    String strSQL = "insert into action_device(job_seq, control_id, action, input) values(?,?,?,?) ;";
	    PreparedStatement pst = null;
	    pst = conMdmAndroid.prepareStatement(strSQL);
	    int idx = 1;
	    pst.setString(idx++, strJobSeq);
	    pst.setString(idx++, strControlId);
	    pst.setString(idx++, strAction);
	    pst.setString(idx++, strInput);
	    pst.executeUpdate();
	    pst.close();
	}
	catch (Exception e)
	{
	    Logs.showError(e.toString());
	    return MDM_DB_ERR_EXCEPTION;
	}

	return MDM_DB_ERR_SUCCESS;
    }

    public static String[] chars = new String[] { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
	    "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W",
	    "X", "Y", "Z" };

    public static String generateShortUuid()
    {
	StringBuffer shortBuffer = new StringBuffer();
	String uuid = UUID.randomUUID().toString().replace("-", "");
	for (int i = 0; i < 8; i++)
	{
	    String str = uuid.substring(i * 4, i * 4 + 4);
	    int x = Integer.parseInt(str, 16);
	    shortBuffer.append(chars[x % 0x3E]);
	}
	return shortBuffer.toString();
    }

}
