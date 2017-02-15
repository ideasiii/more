/**
 * @author Louis Ju
 * @date 2015-07-30
 * @description common log module
 */

package sdk.ideas;

import java.lang.Throwable;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public abstract class Logs
{
	private static final int mnEnable = Type.VALID;
	private static final int mnTraceLevel = Type.TRACE_LEVEL_SIMPLE;
	private static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	private static class LogInfo
	{
		String strFile = "";
		String strClassPath = "";
		String strClassName = "";
		String strMethod = "";
		int nLine = Type.INVALID;
	}

	private static LogInfo logInfo = new LogInfo();

	@SuppressWarnings("unused")
	public static void showTrace(String msg)
	{
		if (Type.INVALID == mnEnable)
		{
			System.out.println("Logs is Invalid");
			return;
		}

		if (msg.length() > 0)
		{
			Throwable throwable = new Throwable();
			logInfo.strFile = throwable.getStackTrace()[1].getFileName();
			logInfo.strClassPath = throwable.getStackTrace()[1].getClassName();
			logInfo.strClassName = extractSimpleClassName(logInfo.strClassPath);
			logInfo.strMethod = throwable.getStackTrace()[1].getMethodName();
			logInfo.nLine = throwable.getStackTrace()[1].getLineNumber();
			throwable = null;
			String strLog = null;
			switch (mnTraceLevel)
			{
			case Type.TRACE_LEVEL_SIMPLE:
				strLog = "[TRACE] " + msg;
				break;
			case Type.TRACE_LEVEL_NORMAL:
				strLog = "[TRACE] " + " class: " + logInfo.strClassPath + " line: " + logInfo.nLine + " Msg: " + msg;
				break;
			case Type.TRACE_LEVEL_DETAIL:
				strLog = "[TRACE] " + "file: " + logInfo.strFile + " class: " + logInfo.strClassPath + " method: "
						+ logInfo.strMethod + " line: " + logInfo.nLine + " Msg: " + msg;
				break;
			default:
				return;
			}

			System.out.println(getNow() + " " + logInfo.strClassName + ":" + strLog);
		}
	}

	public static void showError(String msg)
	{
		if (msg.length() > 0)
		{
			Throwable throwable = new Throwable();
			logInfo.strFile = throwable.getStackTrace()[1].getFileName();
			logInfo.strClassPath = throwable.getStackTrace()[1].getClassName();
			logInfo.strClassName = extractSimpleClassName(logInfo.strClassPath);
			logInfo.strMethod = throwable.getStackTrace()[1].getMethodName();
			logInfo.nLine = throwable.getStackTrace()[1].getLineNumber();
			throwable = null;
			String strLog = null;

			strLog = "[TRACE] " + "file: " + logInfo.strFile + " class: " + logInfo.strClassPath + " method: "
					+ logInfo.strMethod + " line: " + logInfo.nLine + " Msg: " + msg;

			System.out.println(getNow() + " " + logInfo.strClassName + ":" + strLog);
		}
	}

	public static String extractSimpleClassName(String fullClassName)
	{
		if ((null == fullClassName) || ("".equals(fullClassName)))
		{
			return "";
		}
		int lastDot = fullClassName.lastIndexOf('.');
		if (0 > lastDot)
			return fullClassName;
		return fullClassName.substring(++lastDot);
	}

	public static String getNow()
	{
		return dateFormat.format(new Date());
	}
}
