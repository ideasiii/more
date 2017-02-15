package sdk.ideas;

import java.util.ArrayList;
import java.util.HashMap;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;

public class Mongo
{

	static public class Filter
	{
		public String strField;
		public HashMap<String, String> mapFilter;

		public Filter()
		{
			mapFilter = new HashMap<String, String>();
		}

		@Override
		protected void finalize() throws Throwable
		{
			mapFilter.clear();
			mapFilter = null;
			strField = null;
			super.finalize();
		}
	}

	MongoClient mongo = null;

	public Mongo()
	{

	}

	public MongoClient Connect(String strIP, int nPort)
	{
		if (null != mongo)
			mongo.close();
		mongo = new MongoClient(strIP, nPort);
		return mongo;
	}

	@Override
	protected void finalize() throws Throwable
	{
		close();
		super.finalize();
	}

	public void close()
	{
		if (null != mongo)
		{
			mongo.close();
			mongo = null;
		}
	}

	/**
	 * 
	 * @param strDB
	 * @param strCollection
	 * @param listFilter
	 * @param listResult
	 * @return
	 * @example Mongo mongo = new Mongo(); mongo.Connect("localhost", 27017);
	 *          ArrayList<String> listResult = new ArrayList<String>();
	 *          ArrayList<Filter> listFilter = new ArrayList<Filter>();
	 * 
	 *          Filter f1 = new Filter(); f1.strField = "ID";
	 *          f1.mapFilter.put("$regex", strAPPID); listFilter.add(f1);
	 * 
	 *          if (null != strStartDate || null != strEndDate) { Filter f2 =
	 *          new Filter(); f2.strField = "create_date"; if (null !=
	 *          strStartDate) { f2.mapFilter.put("$gte", strStartDate + "
	 *          00:00:00"); }
	 * 
	 *          if (null != strEndDate) { f2.mapFilter.put("$lte", strEndDate +
	 *          " 23:59:59"); } listFilter.add(f2); }
	 * 
	 *          int nCount = mongo.query("access", "mobile", listFilter,
	 *          listResult);
	 */
	@SuppressWarnings("deprecation")
	public int query(final String strDB, final String strCollection, final ArrayList<Filter> listFilter,
			ArrayList<String> listResult)
	{
		if (null == mongo)
			return -1;
		DB db = mongo.getDB(strDB);
		if (null != db)
		{
			DBCollection collection = db.getCollection(strCollection);
			if (null != collection)
			{

				DBCursor cursor = null;
				if (null != listFilter && 0 < listFilter.size())
				{
					Filter filter = null;
					String strField = null;
					BasicDBObject filterQuery = new BasicDBObject();
					for (int i = 0; i < listFilter.size(); ++i)
					{
						filter = listFilter.get(i);
						BasicDBObject subFilter = new BasicDBObject();

						for (Object key : filter.mapFilter.keySet())
						{
							strField = (String) key;
							subFilter.append(strField, filter.mapFilter.get(key));
							if (strField.trim().equals("$regex"))
							{
								subFilter.append("$options", "i");
							}
						}
						filterQuery.put(filter.strField, subFilter);
					}

					cursor = collection.find(filterQuery);
					System.out.println(filterQuery.toString());
				} else
				{
					cursor = collection.find();
				}

				while (cursor.hasNext())
				{
					listResult.add(cursor.next().toString());
				}
			}
		}

		return listResult.size();
	}

	@SuppressWarnings("deprecation")
	public int insert(final String strDB, final String strCollection, final HashMap<String, String> mapData)
	{
		int nResult = 0;

		if (null == mapData || 0 >= mapData.size())
			return -1;

		try
		{
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

		} catch (Exception e)
		{
			nResult = -1;
			System.out.println("Mongo Exception: " + e.toString());
		}
		return nResult;
	}

}
