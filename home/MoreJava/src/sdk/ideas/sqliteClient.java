package sdk.ideas;

import java.sql.*;
import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;

import org.sqlite.SQLiteConfig;
import org.sqlite.SQLiteDataSource;

public class sqliteClient
{
	public Connection getConnection(final String strDbPath) throws SQLException
	{
		SQLiteConfig config = new SQLiteConfig();
		// config.setReadOnly(true);
		config.setSharedCache(true);
		config.enableRecursiveTriggers(true);

		SQLiteDataSource ds = new SQLiteDataSource(config);
		ds.setUrl("jdbc:sqlite:" + strDbPath);
		ds.getConnection().setAutoCommit(true);

		return ds.getConnection();
	}

	public void createTable(Connection con) throws SQLException
	{
		String sql = "create table test (id integer, name string); ";
		Statement stat = null;
		stat = con.createStatement();
		stat.executeUpdate(sql);
	}

	// 新增
	public void insert(Connection con, String strTableName, HashMap<String, String> mapData) throws SQLException
	{
		if (null == con || null == strTableName || null == mapData || 0 >= mapData.size())
			return;

		final int nDataSize = mapData.size();
		int nCount = 0;
		String strField = "";
		String strValue = "";

		for (Object key : mapData.keySet())
		{
			strField += key;
			strValue += "?";
			++nCount;

			if (nCount < nDataSize)
			{
				strField += ",";
				strValue += ",";
			}
		}

		String sql = "insert into " + strTableName + " (" + strField + ") values(" + strValue + ")";
		PreparedStatement pst = null;
		pst = con.prepareStatement(sql);
		int idx = 1;

		for (Object key : mapData.keySet())
		{
			pst.setString(idx++, mapData.get(key));
		}
		pst.executeUpdate();
		pst.close();
	}

	// 修改
	public void update(Connection con, int id, String name) throws SQLException
	{
		String sql = "update test set name = ? where id = ?";
		PreparedStatement pst = null;
		pst = con.prepareStatement(sql);
		int idx = 1;
		pst.setString(idx++, name);
		pst.setInt(idx++, id);
		pst.executeUpdate();
		pst.close();
	}

	// 刪除
	public void delete(Connection con, int id) throws SQLException
	{
		String sql = "delete from test where id = ?";
		PreparedStatement pst = null;
		pst = con.prepareStatement(sql);
		int idx = 1;
		pst.setInt(idx++, id);
		pst.executeUpdate();
		pst.close();
	}

	public void query(Connection con, final String strSQL, final ArrayList<String> listField,
			ArrayList<HashMap<String, String>> listData) throws SQLException
	{
		if (null == con || null == strSQL || null == listData || null == listField)
			return;

		Statement stat = null;
		ResultSet rs = null;
		stat = con.createStatement();
		rs = stat.executeQuery(strSQL);
		HashMap<String, String> mapData;
		String strField = null;
		while (rs.next())
		{
			mapData = new HashMap<String, String>();
			Iterator<String> it = listField.iterator();
			while (it.hasNext())
			{
				strField = it.next();
				mapData.put(strField, rs.getString(strField));
			}
			listData.add(mapData);
		}
		rs.close();
		stat.close();
	}
}
