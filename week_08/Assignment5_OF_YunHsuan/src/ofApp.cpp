#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
	
	ofSetWindowShape(width, height);
	
	ofSetBackgroundAuto(false);//disable automatic background redraw
	
	//sound-----------------------------------------------------
	ofSetVerticalSync(true);
	ofSetCircleResolution(80);
	ofBackground(54, 54, 54);
	
	// 0 output channels,
	// 2 input channels
	// 44100 samples per second
	// 256 samples per buffer
	// 4 num buffers (latency)
	
	soundStream.listDevices();
	
	//if you want to set a different device id
	//soundStream.setDeviceID(0); //bear in mind the device id corresponds to all audio devices, including  input-only and output-only devices.
	
	int bufferSize = 256;
	
	
	left.assign(bufferSize, 0.0);
	right.assign(bufferSize, 0.0);
	volHistory.assign(600, 0.0);
	
	bufferCounter	= 0;
	drawCounter		= 0;
	smoothedVol     = 0.0;
	scaledVol		= 0.0;
	
	soundStream.setup(this, 0, 2, 44100, bufferSize, 4);
	
}

//--------------------------------------------------------------
void ofApp::update(){
	//sound-----------------------------------------------------
	
	//lets scale the vol up to a 0-1 range
	scaledVol = ofMap(smoothedVol, 0.0, 0.17, 0.0, 1.0, true);
	
	//lets record the volume into an array
	volHistory.push_back( scaledVol );
	
	//if we are bigger the the size we want to record - lets drop the oldest value
	if( volHistory.size() >= 600 ){
		volHistory.erase(volHistory.begin(), volHistory.begin()+1);
	}

}

//--------------------------------------------------------------
void ofApp::draw(){
	
	
	
	if (ofGetMousePressed(OF_MOUSE_BUTTON_LEFT)) {
		ofBackground(ofRandom(256),ofRandom(256),ofRandom(256));
	}
	//sound-----------------------------------------------------
	
	
	// draw the average volume:
	ofPushStyle();
	ofPushMatrix();
	ofTranslate(0, 0, 0);
	
	ofSetColor(ofRandom(256),ofRandom(256),ofRandom(256));
	//ofSetColor(ofRandom(256));
	ofFill();
	
	
	
	//lets draw the volume history as a graph
	
	//draw the waves
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 100);
		
		ofVertex(i, 100 - volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 100);
	}
	ofEndShape(false);

	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 100);
		
		ofVertex(i, 100 + volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 100);
	}
	ofEndShape(false);
	
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 200);
		
		ofVertex(i, 200 - volHistory[i] * 200);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 200);
	}
	ofEndShape(false);

	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 200);
		
		ofVertex(i, 200 + volHistory[i] * 200);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 200);
	}
	ofEndShape(false);

	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 300);
		
		ofVertex(i, 300 - volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 300);
	}
	ofEndShape(false);
	
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 400);
		
		ofVertex(i, 400 - volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 400);
	}
	ofEndShape(false);
	
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 500);
		
		ofVertex(i, 500 - volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 500);
	}
	ofEndShape(false);
	
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 500);
		
		ofVertex(i, 500 + volHistory[i] * 50);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 500);
	}
	ofEndShape(false);
	
	ofBeginShape();
	for (unsigned int i = 0; i < volHistory.size(); i++){
		if( i == 0 ) ofVertex(i, 600);
		
		ofVertex(i, 600 - volHistory[i] * 100);
		
		if( i == volHistory.size() -1 ) ofVertex(i, 600);
	}
	ofEndShape(false);
	
	
	ofSetColor(0);
	ofFill();
	ofCircle(ofRandom(0.0,600.0), ofRandom(0.0,600.0), scaledVol * 10.0f);
	
	ofLine(ofRandom(0.0,600.0), scaledVol * 600.0f, ofRandom(0.0,600.0), scaledVol * 600.0f);
	
	ofPopMatrix();
	ofPopStyle();
	
}

//--------------------------------------------------------------
void ofApp::audioIn(float * input, int bufferSize, int nChannels){
	
	float curVol = 0.0;
	
	// samples are "interleaved"
	int numCounted = 0;
	
	//lets go through each sample and calculate the root mean square which is a rough way to calculate volume
	for (int i = 0; i < bufferSize; i++){
		left[i]		= input[i*2]*0.5;
		right[i]	= input[i*2+1]*0.5;
		
		curVol += left[i] * left[i];
		curVol += right[i] * right[i];
		numCounted+=2;
	}
	
	//this is how we get the mean of rms :)
	curVol /= (float)numCounted;
	
	// this is how we get the root of rms :)
	curVol = sqrt( curVol );
	
	smoothedVol *= 0.93;
	smoothedVol += 0.07 * curVol;
	
	bufferCounter++;
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
	if( key == 's' ){
		soundStream.start();
	}
	
	if( key == 'e' ){
		soundStream.stop();
	}
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
