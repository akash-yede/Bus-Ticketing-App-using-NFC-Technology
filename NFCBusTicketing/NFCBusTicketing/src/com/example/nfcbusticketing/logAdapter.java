package com.example.nfcbusticketing;

import java.util.List;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.TextView;

public class logAdapter extends BaseAdapter{

	Context mContext;
	List<LogDataClass> mLogs;
	LayoutInflater inflater;
	public logAdapter(Context context, List<LogDataClass> logs)
	{
		this.mContext=context;
		this.mLogs=logs;
		this.inflater=(LayoutInflater)mContext.getSystemService(mContext.LAYOUT_INFLATER_SERVICE);
	}
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return mLogs.size();
	}

	@Override
	public Object getItem(int position) {
		// TODO Auto-generated method stub
		return mLogs.get(position);
	}

	@Override
	public long getItemId(int position) {
		// TODO Auto-generated method stub
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent) {
		// TODO Auto-generated method stub
		View v=convertView;
		if(v==null)
		{
			v=inflater.inflate(R.layout.log_item, null);
			TextView txtTxnDate=(TextView)v.findViewById(R.id.txtTxnDate);
			TextView txtTxnSource=(TextView)v.findViewById(R.id.txtTxnSrc);
			TextView txtTxnDes=(TextView)v.findViewById(R.id.txtTxnDes);
			TextView txtTxnAmnt=(TextView)v.findViewById(R.id.txtTxnAmnt);
			//set values
			txtTxnDate.setText("Transaction Date: "+mLogs.get(position).getTxnDate().substring(0,10));
			txtTxnSource.setText("Source: "+mLogs.get(position).getTxnSrc());
			txtTxnDes.setText("Destination: "+mLogs.get(position).getTxnDes());
			txtTxnAmnt.setText("Amount: \u20B9 "+mLogs.get(position).getTxnAmount());
		}
		return v;
	}

}
