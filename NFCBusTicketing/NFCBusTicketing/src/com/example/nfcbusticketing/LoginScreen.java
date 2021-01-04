package com.example.nfcbusticketing;

import com.example.connection.connectionHandler;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.Window;
import android.view.View.OnClickListener;
import android.widget.Button;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Toast;

public class LoginScreen extends Activity{
	
	Dialog dg;
	int resp;
	Context context;
	
	
	public static SharedPreferences myPreferences;
	SharedPreferences.Editor myEditor;
	
	
	public void onCreate(Bundle savedInstanceState){
		super.onCreate(savedInstanceState);
		setContentView(R.layout.login);
		context=this;
		
		
		myPreferences=getSharedPreferences("CallTracker", Context.MODE_PRIVATE);
		myEditor=myPreferences.edit();
		
		
		Button btnLogin=(Button)findViewById(R.id.btnLogin);
		btnLogin.setTextColor(Color.WHITE);
		btnLogin.setOnClickListener(new OnClickListener()
		{
			@Override
			public void onClick(View arg0) {
				//show progress bar
				// TODO Auto-generated method stub
				isLoginOk();
			}			
		});
	}
	
		
	private void isLoginOk()
	{
		try
		{
			//Get user name and pwd
			EditText edtUName=(EditText)findViewById(R.id.txtuName);
			EditText edtPwd=(EditText)findViewById(R.id.txtPwd);
			final String userName=edtUName.getText().toString();
			final String pwd=edtPwd.getText().toString();

			if(userName.equals("") || pwd.equals(""))
			{
				AlertDialog alert=new AlertDialog.Builder(this).create();
				alert.setTitle("Enter all details");
				alert.setMessage("All fields are mandatory");
				alert.show();
				
			}
			else
			{
				//call method to validate credentials
				final connectionHandler conn=new connectionHandler();

				//First check if n/w is available
				if(conn.checkNetwork(this))
				{					
					//Create new instance of progressDialog
					progressdialog dialog=new progressdialog();
					dg=dialog.createDialog(this);
					dg.show();
					Thread thlocation=new Thread()
					{
						@Override
						public void run()
						{
							
							if(conn.authenticate_User(userName,pwd))
							{
								resp=0;
							}
							else
							{
								resp=1;
							}
							hd.sendEmptyMessage(0);
						}
				
					};
					//start download thread
					thlocation.start();			
					
				}
				else
				{
	    			//display error message to user
	    			Toast.makeText(this, "Sorry no network access.", 10).show();
				}
					
			}
			
		}
		catch(Exception ex)
		{
			String msg=ex.getLocalizedMessage();
			Log.d("EXCEPTION: ", msg);
			
		}
	}

	public Handler hd=new Handler()
	{
		public void handleMessage(Message msg)
		{
			//cancel dialog
//			dg.cancel();
			//check download response
			switch (resp)
			{
			
			//Download successful
			case 0:
				//if user authenticated then proceed
				Intent iHome=new Intent(LoginScreen.this,NFCTicket.class);
				iHome.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
				startActivity(iHome);
				
				break;
			case 1:
				//display msg that user is not valid
				AlertDialog alert=new AlertDialog.Builder(context).create();
				alert.setTitle("Authentication Error");
				alert.setMessage("Sorry authentication failed.");
				alert.show();					
				break;
			}
		}
	};
}
