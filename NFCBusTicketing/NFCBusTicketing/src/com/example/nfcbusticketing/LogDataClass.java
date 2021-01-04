package com.example.nfcbusticketing;

public class LogDataClass {
	
	private String passenger_id, txnDate, txnSrc, txnDes, txnAmount, txnQty;

	public String getTxnDate() {
		return txnDate;
	}

	public void setTxnDate(String value) {
		txnDate = value;
	}

	public String getTxnSrc() {
		return txnSrc;
	}

	public void setTxnSrc(String value) {
		txnSrc = value;
	}

	public String getTxnDes() {
		return txnDes;
	}

	public void setTxnDes(String value) {
		txnDes = value;
	}

	public String getTxnAmount() {
		return txnAmount;
	}

	public void setTxnAmount(String value) {
		txnAmount = value;
	}

	public String getPassenger_id() {
		return passenger_id;
	}

	public void setPassenger_id(String passenger_id) {
		this.passenger_id = passenger_id;
	}

	public String getTxnQty() {
		return txnQty;
	}

	public void setTxnQty(String txnQty) {
		this.txnQty = txnQty;
	}

}
