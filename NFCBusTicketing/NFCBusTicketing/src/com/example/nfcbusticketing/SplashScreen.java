package com.example.nfcbusticketing;

import com.example.connection.connectionHandler;

import android.animation.Animator;
import android.animation.Animator.AnimatorListener;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.app.Activity;
import android.app.ActionBar.LayoutParams;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.view.Display;
import android.view.Gravity;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationSet;
import android.view.animation.BounceInterpolator;
import android.view.animation.RotateAnimation;
import android.view.animation.ScaleAnimation;
import android.view.animation.TranslateAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;

public class SplashScreen extends Activity {
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		// TODO Auto-generated method stub
		super.onCreate(savedInstanceState);
		Bitmap splashIcon=BitmapFactory.decodeResource(getResources(), R.drawable.ic_splash_phone);
		//Create new image instance
		Bitmap newImage=BitmapFactory.decodeResource(getResources(), R.drawable.ticket);
		//get center point co-ords
		Display currDisplay=getWindowManager().getDefaultDisplay();
		final int width=currDisplay.getWidth();
		final int height=currDisplay.getHeight();
		ScaleAnimation myAnim=new ScaleAnimation(0.1f,1.0f,0.1f,1.0f,width/2,height/2);
		myAnim.setDuration(1200);
		myAnim.setInterpolator(new BounceInterpolator());
		final ImageView myView=new ImageView(this);		
		myView.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
		myView.setImageBitmap(splashIcon);
		final ImageView myView2=new ImageView(this);		
		myView2.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
		myView2.setImageBitmap(newImage);
		myView2.setAlpha(0f);
		FrameLayout frmSplash=new FrameLayout(getApplicationContext());
		frmSplash.addView(myView);
		frmSplash.addView(myView2);
		setContentView(frmSplash);
		myView.startAnimation(myAnim);
		myAnim.setAnimationListener(new AnimationListener() {
			
			@Override
			public void onAnimationStart(Animation animation) {
				// TODO Auto-generated method stub
				String test="";
			}
			
			@Override
			public void onAnimationRepeat(Animation animation) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void onAnimationEnd(Animation animation) {
				// TODO Auto-generated method stub
				//Cross fade
				AnimatorSet set=new AnimatorSet();
				//fade out image 1 and fade in image 2
				ObjectAnimator objFadeOut=ObjectAnimator.ofFloat(myView, "Alpha", 1f,0f);
				objFadeOut.setStartDelay(800);
				objFadeOut.setDuration(1000);
//				objFadeOut.start();
				ObjectAnimator objFadeIn=ObjectAnimator.ofFloat(myView2, "Alpha", 0f,1.0f);
				objFadeIn.setStartDelay(500);
				objFadeIn.setDuration(1000);
				set.play(objFadeOut).with(objFadeIn);
				set.start();
				objFadeIn.addListener(new AnimatorListener() {
					
					@Override
					public void onAnimationStart(Animator animation) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void onAnimationRepeat(Animator animation) {
						// TODO Auto-generated method stub
						
					}
					
					@Override
					public void onAnimationEnd(Animator animation) {
						// TODO Auto-generated method stub
						//Roll the ticket
						RotateAnimation rotate=new RotateAnimation(0.0f, 360.0f,
		                Animation.RELATIVE_TO_SELF, 0.5f, Animation.RELATIVE_TO_SELF,
		                0.5f);
						TranslateAnimation translate=new TranslateAnimation(0, width, 0, 0);
						translate.setStartOffset(200);
						AnimationSet animSet=new AnimationSet(true);
						animSet.setDuration(1500);						
						animSet.addAnimation(rotate);
						animSet.addAnimation(translate);
						myView2.startAnimation(animSet);
						animSet.setAnimationListener(new AnimationListener() {
							
							@Override
							public void onAnimationStart(Animation animation) {
								// TODO Auto-generated method stub
								
							}
							
							@Override
							public void onAnimationRepeat(Animation animation) {
								// TODO Auto-generated method stub
								
							}
							
							@Override
							public void onAnimationEnd(Animation animation) {
								// TODO Auto-generated method stub
								myView2.setVisibility(View.INVISIBLE);
								//Go to next screen
								Intent intent=new Intent(SplashScreen.this,LoginScreen.class);
//								Intent intent=new Intent(SplashScreen.this,NFCTicket.class);
								intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
								startActivity(intent);

								overridePendingTransition(android.R.anim.slide_in_left, android.R.anim.slide_out_right);
							}
						});
					}
					
					@Override
					public void onAnimationCancel(Animator animation) {
						// TODO Auto-generated method stub
						
					}
				});
			}
		});
	}
}
