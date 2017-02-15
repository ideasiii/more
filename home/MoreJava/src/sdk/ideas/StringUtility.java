package sdk.ideas;

public abstract class StringUtility
{
	public StringUtility()
	{

	}

	public static boolean isValid(String strStr)
	{
		if (null != strStr && 0 < strStr.trim().length())
			return true;
		return false;
	}

	/** convert null string to empty string **/
	public static String convertNull(String strStr)
	{
		String strValue = strStr;
		if (null == strValue)
		{
			strValue = "";
		}
		return strValue;
	}

	/** convert null string to default string **/
	public static String convertNull(String strStr, String strDefault)
	{
		String strValue = strStr;

		if (!isValid(strStr))
		{
			strValue = strDefault;
		}

		return strValue;
	}

	/** Check String is numeric data type **/
	public static boolean isNumeric(String str)
	{
		if(!isValid(str))
			return false;
		return str.matches("[-+]?\\d*\\.?\\d+");  
	}
}
