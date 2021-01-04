package com.example.nfcbusticketing;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import com.example.connection.connectionHandler;

import android.nfc.NdefMessage;
import android.nfc.NdefRecord;
import android.nfc.NfcAdapter;
import android.nfc.Tag;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.Parcelable;
import android.os.TransactionTooLargeException;
import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.DialogInterface.OnKeyListener;
import android.content.Intent;
import android.graphics.Color;
import android.util.Log;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

public class NFCTicket extends Activity {
	 public static final String TAG = "NfcDemo";    
	 private TextView mTextView,mCustID,mTicketFare,mPostBal;    
	 private NfcAdapter mNfcAdapter;
	 private ImageButton btnProcess, btnViewLog;
	 NdefRecord msg;
	 int respval=0;
	 List<String> balance;	 
	 final String rupee="\u20B9 ";
	 boolean isNFCReadFlag=false; 	//Boolean flag to keep track if NFC ticket was swiped
	 boolean isHandleIntent=false;
	 public static List<String> lstSource,lstDestination;
	 ArrayAdapter<String> sourcedataAdapter, targetdataAdapter;
	 Spinner spTo,spFrom;
	 ArrayList<String> fare;
	 String currSrc="",currDes="",trasnasction_outcome="",viewLog_outcome="";
	 Dialog dg;	 
	 Context context;
	 EditText edtQtyDetails;
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_nfcticket);
		lstSource=new ArrayList<String>();
		context=this;
		lstDestination=new ArrayList<String>();
		mTextView=(TextView)findViewById(R.id.txtBalVal);
		mCustID=(TextView)findViewById(R.id.txtCustIDVal);
		mTicketFare=(TextView)findViewById(R.id.txtTicketVal);
		mPostBal=(TextView)findViewById(R.id.txtPostBalVal);
		btnProcess=(ImageButton)findViewById(R.id.btnProcess);		
		btnProcess.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				//Get passenger id, src, destination and amount
				String passid=mCustID.getText().toString();
				if(!passid.equals("0"))
				{
					final connectionHandler conn=new connectionHandler();
					if(conn.checkNetwork(getApplicationContext()))
					{
						progressdialog dialog=new progressdialog();
						dg=dialog.createDialog(context);
						dg.show();
						new Thread(new Runnable()
						{
							@Override
							public void run() {
								// TODO Auto-generated method stub
								if(sendTransaction(conn))
								{
									trasnasction_outcome="Transaction completed successfully.";
								}
								else
								{
									trasnasction_outcome="Transaction unsuccessful.";
								}								
								Message msg=new Message();
								msg.arg1=3;
								hd.sendMessage(msg);
							}								
						}).start();						
					}
					else
					{
						AlertDialog errdialog=new AlertDialog.Builder(context).create();
						errdialog.setTitle("Network Error");
						errdialog.setMessage("No network coverage.");
						errdialog.show();					
					}					
				}
				else
				{
					AlertDialog errdialog=new AlertDialog.Builder(context).create();
					errdialog.setTitle("Passenger ID Error");
					errdialog.setMessage("Passenger id cannot be 0.");
					errdialog.show();										
				}
			}
		});		
		
		btnViewLog=(ImageButton)findViewById(R.id.btnViewLog);		
		btnViewLog.setOnClickListener(new OnClickListener() {
			
			@Override
			public void onClick(View v) {
				//Get passenger id, src, destination and amount
				String passid=mCustID.getText().toString();
				if(!passid.equals("0"))
				{
					final connectionHandler conn=new connectionHandler();
					if(conn.checkNetwork(getApplicationContext()))
					{
						progressdialog dialog=new progressdialog();
						dg=dialog.createDialog(context);
						dg.show();
						new Thread(new Runnable()
						{
							@Override
							public void run() {
								// TODO Auto-generated method stub
								if(displayLog(conn))
								{
									viewLog_outcome="";
								}
								else
								{
									viewLog_outcome="No Transactions available for this passenger.";
								}								
								Message msg=new Message();
								msg.arg1=4;
								hd.sendMessage(msg);
							}								
						}).start();						
					}
					else
					{
						AlertDialog errdialog=new AlertDialog.Builder(context).create();
						errdialog.setTitle("Network Error");
						errdialog.setMessage("No network coverage.");
						errdialog.show();					
					}					
				}
				else
				{
					AlertDialog errdialog=new AlertDialog.Builder(context).create();
					errdialog.setTitle("Passenger ID Error");
					errdialog.setMessage("Passenger id cannot be 0.");
					errdialog.show();										
				}
			}
		});		

		
		mNfcAdapter = NfcAdapter.getDefaultAdapter(this);
		if (mNfcAdapter == null) {            
			// Stop here, we definitely need NFC            
			Toast.makeText(getApplicationContext(), "This device does not support NFC.", Toast.LENGTH_SHORT).show();
			finish();
			return;        			
		}
		if (!mNfcAdapter.isEnabled()) 
		{            
			AlertDialog dialog=new AlertDialog.Builder(context).create();
			dialog.setMessage("NFC Disabled! Please enable NFC before proceeding.");
			dialog.show();		
		} 
		else 
		{    
			progressdialog dialog=new progressdialog();
			dg=dialog.createDialog(context);
			dg.show();
			final connectionHandler conn=new connectionHandler();
			//Check n/w coverage
			if(conn.checkNetwork(getApplicationContext()))
			{
				//Fetch passenger balance and location details
				//Start new thread to get location details
				new Thread(new Runnable(){
					
					@Override
					public void run() {
						// TODO Auto-generated method stub
							//Getting location details
							String requestXML="<travel><check>1</check></travel>";
							ArrayList<String> result=conn.getData("http://my-demo.in/NFC_Bus_service_New/Service1.svc/Travel/1",0);
							sourcedataAdapter=new ArrayAdapter<String>(getApplicationContext(), R.layout.spinner_item, lstSource);
							targetdataAdapter=new ArrayAdapter<String>(getApplicationContext(), R.layout.spinner_item, lstDestination);
//							respval=1;
							Message msg=new Message();
							msg.arg1=1;
							hd.sendMessage(msg);
					}
				}).start();
			}
			else
			{
				//No n/w
				AlertDialog errdialog=new AlertDialog.Builder(context).create();
				errdialog.setTitle("Network Error");
				errdialog.setMessage("No network coverage.");
				errdialog.show();		
			}
		}
		handleIntent(getIntent());

		//Define spinners
		spTo=(Spinner)findViewById(R.id.spTo);
		spTo.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				// TODO Auto-generated method stub
				try
				{
					//update destination
					currDes=((TextView)arg1).getText().toString();							
				}
				catch(Exception ex)
				{
					System.out.println(ex.getLocalizedMessage());
				}
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		spFrom=(Spinner)findViewById(R.id.spFrom);
		
		spFrom.setOnItemSelectedListener(new OnItemSelectedListener() {

			@Override
			public void onItemSelected(AdapterView<?> arg0, View arg1,
					int arg2, long arg3) {
				// TODO Auto-generated method stub				
				//Selected item index
				try {
					currSrc=((TextView)arg1).getText().toString();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

			@Override
			public void onNothingSelected(AdapterView<?> arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		if(isNFCReadFlag)
		{
	    	//enable journey details 
	    	enableTicketOptions();			
		}
		else
		{
			//Disable journey details layout
//			disableTicketOptions();			
	    	enableTicketOptions();			

		}		
		
		//Calculate fare button 
		Button btnCalculate=(Button)findViewById(R.id.btnCalculate);
		btnCalculate.setOnClickListener(new OnClickListener() {
					
					@Override
					public void onClick(View v) {
						// TODO Auto-generated method stub
						
						
						Spinner spsource=(Spinner)findViewById(R.id.spFrom);
						Spinner spdestination=(Spinner)findViewById(R.id.spTo);
						
						String source=String.valueOf(spsource.getSelectedItem());
						String destination=String.valueOf(spdestination.getSelectedItem());
						
						if(source.equals(destination))
						{
							Toast.makeText(getApplicationContext(), "Wrong selection", Toast.LENGTH_LONG).show();
						}
						else
						{
						
						
							final connectionHandler conn=new connectionHandler();
							if(conn.checkNetwork(getApplicationContext()))
							{
								progressdialog dialog=new progressdialog();
								dg=dialog.createDialog(context);
								dg.show();
								new Thread(new Runnable()
								{
									@Override
									public void run() {
										// TODO Auto-generated method stub
										calculateFare(conn);						
//										respval=2;
										Message msg=new Message();
										msg.arg1=2;
										hd.sendMessage(msg);
									}								
								}).start();						
							}
							else
							{
								AlertDialog errdialog=new AlertDialog.Builder(context).create();
								errdialog.setTitle("Network Error");
								errdialog.setMessage("No network coverage.");
								errdialog.show();					
							}
						}
					}
				});
	}

    private void handleIntent(Intent intent) {
        // TODO: handle Intent
    	String action=intent.getAction();
    	if(NfcAdapter.ACTION_NDEF_DISCOVERED.equals(action))
    	{
    		String type=intent.getType();
    		Object MIME_TEXT_PLAIN = "text/plain";
			if (MIME_TEXT_PLAIN.equals(type)) {
    	            Tag tag = intent.getParcelableExtra(NfcAdapter.EXTRA_TAG);
    	            String[] test= tag.getTechList();
	                Parcelable[] rawMsgs = intent.getParcelableArrayExtra(NfcAdapter.EXTRA_NDEF_MESSAGES);
	                if (rawMsgs != null) {
	                	//update header text
	                	TextView txtHeader=(TextView)findViewById(R.id.txtStatus);
	                	txtHeader.setText("NFC ticket detected.");
	                	//enable NFCRead flag
	                	isNFCReadFlag=true;
	                    NdefMessage[] msgs = new NdefMessage[rawMsgs.length];
	                    for (int i = 0; i < rawMsgs.length; i++) {
	                        msgs[i] = (NdefMessage) rawMsgs[i];
	                    }
	                    NdefMessage ndefmsg=msgs[0];
	                    NdefRecord[] records= ndefmsg.getRecords();
	                    NdefRecord currRecord=records[0];
	                    byte[] payload=currRecord.getPayload();
	                    byte[] id=currRecord.getId();
	                    Log.d("ID", id.toString());
	                    int encoding=payload[0] & 128;
	                    
	                    // Get the Text Encoding
	                    String textEncoding = (encoding == 0) ? "UTF-8" : "UTF-16";
	                    // Get the Language Code
	                    int languageCodeLength = payload[0] & 0063;
	                    try {
							final String custID=new String(payload, languageCodeLength + 1, payload.length - languageCodeLength - 1, textEncoding);
							mCustID.setText(custID);
							final connectionHandler conn=new connectionHandler();
							if(conn.checkNetwork(getApplicationContext()))
							{
								//Display progress dialog only if not already displayed
								if(!dg.isShowing())
								{
									System.out.println("Progress in handler");
									progressdialog dialog=new progressdialog();
									dg=dialog.createDialog(context);
									dg.show();									
								}
								isHandleIntent=true;						
								//Get customer balance
								new Thread(new Runnable() {
									
									@Override
									public void run() {
										// TODO Auto-generated method stub										
										String url="http://my-demo.in/NFC_Bus_service_New/Service1.svc/FetchBalance/"+custID;
										//String requestXML="<fetch_balance><passenger_id>"+custID+"</passenger_id></fetch_balance>";
										balance=conn.getData(url,1);
										Message msg=new Message();
										msg.arg1=0;
										System.out.println("Balance "+balance.get(0));
										//reset flag
										isHandleIntent=false;
										hd.sendMessage(msg);
									}
								}).start();								
							}
						} catch (UnsupportedEncodingException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
	                }
    	           // new NdefReaderTask().execute(tag);
    	        } else {
    	            Log.d(TAG, "Wrong mime type: " + type);
    	        }
    	}
    	
    }
    
	public Handler hd=new Handler()
	{
		public void handleMessage(Message msg)
		{
			//if message is from handleIntent then wait for handleIntent to be true b4 cancelling dialog.
			dg.cancel();
			System.out.println("msg "+msg.arg1);
			//check download response
			switch (msg.arg1)
			{			
			//Download successful
			case 0:			
//				System.out.println("OUTPUT "+rupee+balance.get(0));
				mTextView.setText(rupee+balance.get(0));
				break;
			case 1:
				setlocationAdapter();
				break;
			case 2:
				if(fare.size()==0)
				{
					return;
				}
				//set Fare textfield
				mTicketFare.setText(rupee+fare.get(0));
				//Get double value of fare
				double fareprice=Double.parseDouble(fare.get(0));
				String currBalance=mTextView.getText().toString();
				//remove rupee sign
				currBalance=currBalance.substring(1);
				double balance=0;
				if(!currBalance.isEmpty())
				{					
					//Get double value of current balance
					balance=Double.parseDouble(currBalance);					
				}
				if(balance>fareprice)
				{
					balance=balance-fareprice;		
					String strBal=String.valueOf(balance);
					mPostBal.setText(rupee+strBal);
				}
				else
				{
					mPostBal.setTextColor(Color.RED);
					mPostBal.setText("Insufficient balance");
					mTextView.setTextColor(Color.RED);
					mTextView.setText("Insufficient balance");
				}
				break;
			case 3:
				//Display result message 
				AlertDialog alert=new AlertDialog.Builder(context).create();
				alert.setTitle("Transaction Output");
				alert.setMessage(trasnasction_outcome);
				alert.show();	
				if(trasnasction_outcome.equalsIgnoreCase("Transaction completed successfully."))
				{
					//update balance
					mTextView.setText(mPostBal.getText().toString());					
				}
				//clear other fields
				mTicketFare.setText(rupee+" 0");
				mPostBal.setText(rupee+" 0");
				break;
			case 4:
				Dialog logDialog=new Dialog(context);
				LayoutInflater inflater=(LayoutInflater)getSystemService(context.LAYOUT_INFLATER_SERVICE);
				LinearLayout root=(LinearLayout) inflater.inflate(R.layout.viewlog_dialog, null);
				logDialog.requestWindowFeature(Window.FEATURE_NO_TITLE);
				logDialog.setContentView(root);
				if(viewLog_outcome.isEmpty())
				{
					ListView lstLog=(ListView)root.findViewById(R.id.lstLog);
					logAdapter adapter=new logAdapter(context, connectionHandler.logs);
					lstLog.setAdapter(adapter);					
				}
				else
				{
					TextView txtMessage=(TextView)logDialog.findViewById(R.id.txtMessage);
					txtMessage.setText(viewLog_outcome);					
					txtMessage.setTextColor(Color.RED);
				}
				logDialog.show();				
				break;
			}
		}
	};

	
	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		// Inflate the menu; this adds items to the action bar if it is present.
		getMenuInflater().inflate(R.menu.nfcticket, menu);
		return true;
	}
	
	private void calculateFare(connectionHandler conn)
	{
			String url="http://my-demo.in/NFC_Bus_service_New/Service1.svc/FareCheck/"+currSrc+"/"+currDes;
			//String requestXML="<fare_check><source>"+currSrc+"</source><destination>"+currDes+"</destination></fare_check>";
			fare=conn.getData(url,2);					
			//Get quantity
			edtQtyDetails=(EditText)findViewById(R.id.edtQtyVal);
			String strQty=edtQtyDetails.getText().toString();
			if(strQty.isEmpty() || strQty.equalsIgnoreCase("0")){
				//Display dialog
				AlertDialog dgError=new AlertDialog.Builder(context).create();
				dgError.setTitle("Incorrect quantity");
				dgError.setMessage("Quantity has to be atleast 1.");
				dgError.show();
				//adding by default
				fare.add("0");
			}
			else{
				//calculate fare value
				int final_fare=Integer.parseInt(fare.get(0))*Integer.parseInt(strQty);
				fare.set(0,String.valueOf(final_fare));
			}
	}
	private boolean sendTransaction(connectionHandler conn)
	{
		String amount=mTicketFare.getText().toString();
		//remove rupee sign
		amount=amount.substring(2);
		//String requestXML="	<transaction><passenger_id>"+mCustID.getText().toString()+"</passenger_id><source>"+currSrc+"</source>"
		//		+"<destination>"+currDes+"</destination><fare_amount>"+amount+"</fare_amount><qty>"+edtQtyDetails.getText().toString()+"</qty></transaction>";
		String url="http://my-demo.in/NFC_Bus_service_New/Service1.svc/Transaction/"+mCustID.getText().toString()+"/"+currSrc+"/"+currDes+"/"+amount+"/"+edtQtyDetails.getText();
		ArrayList<String> result=conn.getData(url,3);
		if(result.size()>0 && result.get(0).equals("1"))
		{
			return true;
		}
		return false;
	}
	
	public boolean displayLog(connectionHandler conn)
	{
		//mCustID.getText().toString()
		//String requestXML="<passenger_log><passenger_id>"+mCustID.getText().toString()+"</passenger_id></passenger_log>";
		String url="http://my-demo.in/NFC_Bus_service_New/Service1.svc/PassengerLog/"+mCustID.getText().toString();
		conn.getData(url,4);		
		if(connectionHandler.logs.size()>0)
		{
			return true;
		}
		return false;
	}
	
	private void disableTicketOptions()
	{
		LinearLayout llJourney=(LinearLayout)findViewById(R.id.lTravelDetails);
		//Loop through children and disable them
		for(int i=0;i<llJourney.getChildCount();i++)
		{
			//get child
			llJourney.getChildAt(i).setEnabled(false);
		}
	}
	
	private void enableTicketOptions()
	{
		LinearLayout llJourney=(LinearLayout)findViewById(R.id.lTravelDetails);
		//Loop through children and disable them
		for(int i=0;i<llJourney.getChildCount();i++)
		{
			//get child
			llJourney.getChildAt(i).setEnabled(true);
		}
	}

	private void setlocationAdapter()
	{
		spFrom.setAdapter(sourcedataAdapter);
		spTo.setAdapter(targetdataAdapter);		
	}

}
