<%@ page contentType="text/html; charset=utf-8" language="java" session="false"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Arrays"%>

<%!
	final public static String UPLOAD_FILE_PATH = "/uploadfile";
	final public static String DB_PATH_IDEAS = "/data/sqlite/ideas.db";
	final public static String DB_PATH_MORE_MEMBER = "/data/sqlite/more_member.db";
	final public static String PATH_DOWNLOAD_LIB_ANDROID = "/ideas/sdk/download/libs/android";
	final public static String PATH_DOWNLOAD_LIB_IOS = "/ideas/sdk/download/libs/ios";
	final public static String PATH_DOWNLOAD_DOC_ANDROID = "/ideas/sdk/download/doc/android";
	final public static String PATH_DOWNLOAD_DOC_IOS = "/ideas/sdk/download/doc/ios";
	
	/**sqlite Common**/
	final public static String CREATE_DATE = "create_date";
	
	/**sqlite more_mamber.db 
	 * table: more_mamber **/
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
	
	
	/**sqlite ideas.db 
	 * table: app **/
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

	/**sqlite ideas.db 
	 * table: sdk **/
	final public static String SDK_ID = "sdk_id";
	final public static String SDK_OS = "sdk_os";
	final public static String SDK_OWNER = "sdk_owner";
	final public static String SDK_NAME = "sdk_name";
	final public static String SDK_DESC = "sdk_desc";
	final public static String SDK_FILE = "sdk_file";
	final public static String SDK_DOC = "sdk_doc";

	final public static ArrayList<String> listAppField = new ArrayList<>(Arrays.asList(APP_ID, APP_NAME, APP_CATEGORY,
			APP_DESC, APP_ICON, APP_OS, USER_TOKEN, USER_NAME, USER_EMAIL, USER_PHONE));

	final public static ArrayList<String> listSdkField = new ArrayList<>(
			Arrays.asList(SDK_ID, SDK_OS, SDK_OWNER, SDK_NAME, SDK_DESC, SDK_FILE, SDK_DOC, CREATE_DATE));

	final public static String APP_EDIT = "app_edit";

	
	/** Device Type **/
	final public static String ANDROID = "Android";
	final public static String IOS = "IOS";
	final public static String APPLIANCE = "家電";
	final public static String TOY = "玩具";
	final public static String IOT = "物聯網";

	final public static ArrayList<String> listDeviceType = new ArrayList<String>(
			Arrays.asList(ANDROID, IOS, APPLIANCE, TOY, IOT));


%>