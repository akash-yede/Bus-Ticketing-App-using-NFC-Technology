package com.example.nfcbusticketing;

import com.example.connection.connectionHandler;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

public class TestActivity extends Activity{
	
	public void onCreate(Bundle savedInstancestate)
	{
		super.onCreate(savedInstancestate);
		setContentView(R.layout.samplellayout);
	}
	
	public void onClick(View v)
	{
		final connectionHandler conn=new connectionHandler();
		new Thread()
		{
			public void run()
			{
				if(conn.authenticate_User("admin", "admin"))
				{
				}				
				String req="<fetch_balance><passenger_id>2</passenger_id></fetch_balance>";
//				String result=conn.getData("http://my-demo.in/NFC_Bus_service/Service1.svc/fetch_balance",req,1);
//				req="<travel><check>1</check></travel>";
//				result=conn.getData("http://my-demo.in/NFC_Bus_service/Service1.svc/travel",req,0);
//				req="<fare_check><source>Dadar</source><destination>Thane</destination></fare_check>";
//				result=conn.getData("http://my-demo.in/NFC_Bus_service/Service1.svc/fare_check",req,2);
				
			}
		}.start();
	}

}
