package kr.gudi.web;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Iterator;

import net.sf.json.JSONObject;

public class HttpUtil {

	public static HashMap<String, Object> getUrl(String apiUrl) {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		try {
			URL u = new URL(apiUrl);
			HttpURLConnection conn = (HttpURLConnection) u.openConnection();
			conn.setRequestMethod("POST");
			int resCode = conn.getResponseCode();
			if (resCode == 200) {
				InputStream input = conn.getInputStream();
				InputStreamReader inputReader = new InputStreamReader(input, "utf-8");
				BufferedReader br = new BufferedReader(inputReader);
				String line = "";
				String result = "";
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println(result);
				JSONObject jobject = JSONObject.fromObject(result);
				Iterator<?> iterator = jobject.keys();
				while (iterator.hasNext()) {
					String key = iterator.next().toString();
					String value = jobject.getString(key);
					resultMap.put(key, value);
				}
				input.close();
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
		return resultMap;
	}
}
