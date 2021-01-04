package com.example.connection;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicHttpResponse;
import org.apache.http.protocol.HTTP;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.example.nfcbusticketing.LogDataClass;
import com.example.nfcbusticketing.NFCTicket;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;

public class connectionHandler {

	public static List<LogDataClass> logs;
	public ArrayList<String> getData(String url, int operation)
	{
		ArrayList<String> result=new ArrayList<String>();
		try
		{
			/*//Call out service and send details
			HttpClient client;
			//response
			HttpPost postrequest;
//			HttpURLConnection conn=
			client = new DefaultHttpClient();
			postrequest = new HttpPost();
			//String url="http://my-demo.in/NFC_Bus_service/Service1.svc/fetch_balance";
			//service uri
			URI myuri= new URI(url);
			    		
			postrequest.setURI(myuri);
			// conn_Object.emp_id - using hard-coded EMp id for now			
			StringEntity se=new StringEntity(requestXML, HTTP.UTF_8);
			se.setContentType("text/xml");
			postrequest.setHeader("Content-type","application/xml;charset=UTF-8");
			postrequest.setEntity(se);
			    //get response		
			BasicHttpResponse httpResponse =  
				    (BasicHttpResponse) client.execute(postrequest);*/
			//String url="http://my-demo.in/NFC_Bus_service/Service1.svc/Login/"+name+"/"+pwd;
			
			HttpClient httpclient = new DefaultHttpClient();
		    HttpResponse httpResponse = httpclient.execute(new HttpGet(url));
			
			//check response - && httpResponse.getStatusLine().toString().equals(HttpStatus.SC_OK
			if(httpResponse!=null)
			{
	    		String resp="HTTPStatus "+httpResponse.getStatusLine().toString();
	    		HttpEntity entity=httpResponse.getEntity();
	    		char[] respbuffer=new char[(int)entity.getContentLength()];
	    		InputStream is=entity.getContent();
	    		InputStreamReader isreader=new InputStreamReader(is);
	    		isreader.read(respbuffer);
	    		is.close();
	    		String xmlResponse=new String(respbuffer);
	    		
	    		Document respdoc=null;
	    		DocumentBuilderFactory docbuilderfactory=DocumentBuilderFactory.newInstance();
	    		DocumentBuilder docbuilder=docbuilderfactory.newDocumentBuilder();
	    		InputSource isource=new InputSource();
	    		isource.setCharacterStream(new StringReader(xmlResponse));

	    		respdoc=docbuilder.parse(isource);
	    		switch(operation)
	    		{
	    		case 0:
		    		//Get data for Status Tag
		    		NodeList list_balance=respdoc.getElementsByTagName("travel");
	    			//selecting Status
	    			Element eStatus=(Element) list_balance.item(0);
	    			//Getting attributes array 
	    			NodeList childpropertyStatus=eStatus.getChildNodes();
	    			//loop thru list
	    			for(int i=0;i<childpropertyStatus.getLength();i++)
	    			{
	    				Node nChild=childpropertyStatus.item(i);
	    				Node firstRes=nChild.getFirstChild();
	    				String val=firstRes.getNodeValue();
	    				String localName=nChild.getNodeName();  				
	    				if(localName.equalsIgnoreCase("source"))
	    				{
	    					NFCTicket.lstSource.add(val);
	    				}
	    				else
	    				{
	    					NFCTicket.lstDestination.add(val);
	    				}
//	    				result.add(val);
	    			}
	    			break;
	    		case 1:
		    		//Get data for Status Tag
		    		list_balance=respdoc.getElementsByTagName("fetch_balance");
	    			//selecting Status
	    			eStatus=(Element) list_balance.item(0);
	    			//Getting attributes array 
	    			childpropertyStatus=eStatus.getChildNodes();
	    			Node balNode=childpropertyStatus.item(1);
	    			Node bal=balNode.getLastChild();
	    			result.add(bal.getNodeValue());
	    			break;
	    		case 2:
		    		//Get data for Status Tag
		    		list_balance=respdoc.getElementsByTagName("fare_check");
	    			//selecting Status
	    			eStatus=(Element) list_balance.item(0);
	    			//Getting attributes array 
	    			childpropertyStatus=eStatus.getChildNodes();
	    			Node fareNode=childpropertyStatus.item(0);
	    			Node fare=fareNode.getLastChild();
	    			result.add(fare.getNodeValue());
	    			break;	
	    		case 3:
		    		//Get data for Transaction Tag
		    		list_balance=respdoc.getElementsByTagName("transaction");
	    			//selecting transaction
	    			eStatus=(Element) list_balance.item(0);
	    			//Getting attributes array 
	    			childpropertyStatus=eStatus.getChildNodes();
	    			Node tranNode=childpropertyStatus.item(0);
	    			Node tran=tranNode.getLastChild();
	    			result.add(tran.getNodeValue());
	    			break;
	    		case 4:
	    			logs=new ArrayList<LogDataClass>();
		    		//Get data for Transaction Tag
		    		list_balance=respdoc.getElementsByTagName("passenger_log");
		    		if(list_balance.getLength()>0)
		    		{
			    		for(int i=0;i<list_balance.getLength();i++)
			    		{
			    			//selecting transaction
			    			eStatus=(Element) list_balance.item(0);
			    			int len=eStatus.getChildNodes().getLength();
			    			//Divide length by 6
			    			len=len/6;
			    			int k=0;
			    			LogDataClass objLogData=null;
			    			for(int j=0;j<len;j++)
			    			{
				    			objLogData=new LogDataClass();
				    			//Getting attributes array 
				    			childpropertyStatus=eStatus.getChildNodes();
					    			Node idNode=childpropertyStatus.item(k);
					    			Node id=idNode.getLastChild();
					    			objLogData.setPassenger_id(id.getNodeValue());		    				
					    			Node dateNode=childpropertyStatus.item(k+1);
					    			Node date=dateNode.getLastChild();
					    			objLogData.setTxnDate(date.getNodeValue());		    				
					    			Node srcNode=childpropertyStatus.item(k+2);
					    			Node src=srcNode.getLastChild();
					    			objLogData.setTxnSrc(src.getNodeValue());		    				
					    			Node desNode=childpropertyStatus.item(k+3);
					    			Node des=desNode.getLastChild();
					    			objLogData.setTxnDes(des.getNodeValue());		    				
					    			Node txnfareNode=childpropertyStatus.item(k+4);
					    			Node txnfare=txnfareNode.getLastChild();
					    			objLogData.setTxnAmount(txnfare.getNodeValue());		    				
					    			Node txnQtyNode=childpropertyStatus.item(k+5);
					    			Node txnQty=txnQtyNode.getLastChild();
					    			objLogData.setTxnQty(txnQty.getNodeValue());
					    			k=k+6;
					    			logs.add(objLogData);		    			
			    			}
			    		}		    			
		    		}
	    			break;
	    		}
			}				
		}
		catch(Exception ex)
		{
			String msg=ex.getLocalizedMessage();
		}
		return result;
	}

	//Method to check network state
	public boolean checkNetwork(Context context)
	{
		try
		{
			ConnectivityManager connectivityManager  = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE); 
		    NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo(); 
		    return activeNetworkInfo != null; 
		}
		catch(Exception ex)
		{
			String msg=ex.getLocalizedMessage();
			System.out.println(msg);
			return false;
		}
	}
	
	public boolean authenticate_User(String name,String pwd)
	{
		try
		{
			String url="http://my-demo.in/NFC_Bus_service_New/Service1.svc/Login/"+name+"/"+pwd;
			
			HttpClient httpclient = new DefaultHttpClient();
		    HttpResponse httpResponse = httpclient.execute(new HttpGet(url));
		   
    		//check response
    		if(httpResponse!=null)
    		{
    			StatusLine status=httpResponse.getStatusLine();
    			int statusCode=status.getStatusCode();
    			//proceed only if response code is 200
    			if(statusCode==HttpStatus.SC_OK)
    			{
            		HttpEntity entity=httpResponse.getEntity();
            		char[] respbuffer=new char[(int)entity.getContentLength()];
            		InputStream is=entity.getContent();
            		InputStreamReader isreader=new InputStreamReader(is);
            		isreader.read(respbuffer);
            		is.close();
            		String xmlResponse=new String(respbuffer);
            		System.out.println(xmlResponse);
            		Document respdoc=null;
            		DocumentBuilderFactory docbuilderfactory=DocumentBuilderFactory.newInstance();
            		DocumentBuilder docbuilder=docbuilderfactory.newDocumentBuilder();
            		InputSource isource=new InputSource();
            		isource.setCharacterStream(new StringReader(xmlResponse));
            		respdoc=docbuilder.parse(isource);
            		//Get data for login_validation Tag
            		
            		
            		NodeList list=respdoc.getElementsByTagName("login_validation");
            		//Get data for emp id tag
            		NodeList lstEmpId=respdoc.getElementsByTagName("user_id");
            		//
            		//Check if NodeList has any values
            		if(list.getLength()<1)
            		{
            			//if no values then return false
            			return false;
            		}
            		else
            		{
            			//selecting ith response
            			Element e=(Element) list.item(0);
            			//Getting attributes array of ith image
            			NodeList childpropertylist=e.getChildNodes();
            			//
            			String val="";
    					//resarray[i]=new result_object();
            			for(int j=0;j<childpropertylist.getLength();j++)
            			{
            				//Element echild=(Element)childpropertylist.item(j);
            				Node n=childpropertylist.item(j);
            				//Node n=echild.getFirstChild();
            				String test=n.getNodeName();
            				val=n.getNodeValue();
            			}            			
            			if(val.equals("false"))
            			{
            				return false;
            			}
            			else
            			{
            				return true;
            			}
            		}    				
    			}
    			else
    			{
    				//Display error message to the user
            		String resp=status.toString();             		
    			}
    		}			
		}
		catch(Exception ex)
		{
			String msg=ex.getLocalizedMessage();
			return false;
		}
		return false;
	}

	
}
