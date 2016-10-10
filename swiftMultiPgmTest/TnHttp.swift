//
//
//

/*	TnHttp.swift

	Provides
	
		Http-related services

	Interfaces


class YourController: UIViewController, DelegateProtocol {

var remote = RemoteCenter()

override func viewDidLoad() {
remote.delegate = self
remote.post()
}

func didReceiveAMessage(message: String?) {
println("I got \(message)")
}






*/

import Foundation

//
//	class definition
//


protocol
DataReceiver {
	func dataReceived(data: NSData)
}

public
class
TnHttp : NSObject, DataReceiver {
	
	
//
//	properties and instance? variables
//
	var delegate:DataReceiver?
	
	
	var bStatus :		Bool?
	
	var nsusSession :	NSURLSession?
	var	nsusConf :		NSURLSessionConfiguration?
	
	var sUrl : 			String	= "default"
	var nsuUrl : 		NSURL?
	
	var	urlRequest : 	NSMutableURLRequest?
	
	var	dBody :			NSData?
	
	var dData :			NSMutableData?
	
	
	//	sUrl = "https://www.zipcodeapi.com/rest/xLpTICmHMkVaaAL3oJcX0fYO37N21bbyXBrFeNn08jbiTXlhGyfGOeuSliUmu5Vr/distance.xml/27320/37205/mile"

	//	"/amtd/result"
	//	"/amtd/xml-log-in/session-id"
	//	"/amtd/xml-log-in/accounts/account/account-id"
	
	//	sBody	=	"source=[my-src]&version=1.0"
	
	//	sBody	+=	"&userid=[my-acct]&password=[my-pwd]"
	

	
	
	
//
//	intializers
//

//===================
public
override
init() {

	//	"https://www.zipcodeapi.com/rest/" +
	//	"lzRwl1IfNuA2nDa5VPxE1zgog3tCS3edD5JY7seUWOXks7qoWX2XwimNlQqdTErx" +	//	 this is the API key
	//	"/distance.xml/27320/37205/mile"
	
	//	http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php

	super.init()
	
	/*
	
	bStatus = true
	
	//	let sUrl = "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php"
	
	sUrl = "http://httpbin.org/get"
	
	setupSessionFromStringUrl ( sUrl )
	
	prepForGetSession()
	
	*/}

//
// method definitions
//

	
	

//======================================================================================================
public
func
	run( ) -> Bool {
	
	
	
	bStatus = false
	
	print( "hello!" )
	
	sUrl = "http://www.kaleidosblog.com/tutorial/nsurlsession_tutorial.php"
	
	let sMyUrl = "http://httpbin.org/get"
	
	
	
	var mySession :		NSURLSession?
	
	var	myConf :		NSURLSessionConfiguration?
	
	var myUrl : 		NSURL?
	
	var	myRequest : 	NSMutableURLRequest?
	
	var	myBody :		NSData?
	
	var myData :		NSMutableData?
	
	var i :				Int?
	
	
	
	//
	myRequest = NSMutableURLRequest( URL: NSURL( string: "http://httpbin.org/get" )! )
	
	myRequest!.HTTPMethod = "GET"
	
	//	myBody = "ecws-post-data"
	//	myRequest!.HTTPBody =	myBody.dataUsingEncoding(NSUTF8StringEncoding)
	
	myRequest!.setValue( "text/xml; charset=utf-8",		forHTTPHeaderField: "Content-Type" )
	myRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
	myRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )
	
	
	//===
	let myTask =
		NSURLSession.sharedSession().dataTaskWithRequest( myRequest! ) {
			
			data, response, error in
			
			if error != nil {
				print("error=\(error)")
				return
			}
			
			self.delegate?.dataReceived( data! )
	}
	//===
	
	myTask.resume()
	
	i = 7
	
	return true
}

func
dataReceived( data: NSData ) {
	print("dataReceived : \(NSString(data: data, encoding: NSUTF8StringEncoding) )"	)
}

	




	
	/*
	
	
	// Build the completion block and send the request
	NSURLSession.sharedSession().dataTaskWithRequest (	urlRequest!,
	//	completion logic
	completionHandler: {
	
	(data, response, error) in
	
	print( "Finished" )
	if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
	// Success
	print( "Response: \(responseDetails)" )
	}
	else {
	// Failure
	print( "Error: \(error)" )
	}
	
	}
	).resume()
	
	
	*/
	















	
	
//======================================================================================================
public
func
setUrlFromString( sIn:String) {
	
	sUrl = sIn
	
	nsuUrl = NSURL( string:sUrl )!
}


	
//======================================================================================================
public
func
setupDefaultSession() -> Bool {

	nsusConf =		NSURLSessionConfiguration.defaultSessionConfiguration()
	nsusSession =	NSURLSession(configuration: nsusConf! )

	//	urlSession = NSURLSession.sharedSession()
	
	urlRequest = NSMutableURLRequest( URL: nsuUrl! )

	prepForPostSession()
	
	urlRequest!.setValue( "text/xml; charset=utf-8",	forHTTPHeaderField: "Content-Type" )
	urlRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
	urlRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )

	bStatus = true

	return bStatus!
}
	
	

//======================================================================================================
public
func
setupSessionFromStringUrl( sIn:String) {
		
	setUrlFromString( sIn )

	setupDefaultSession()
}


	
//======================================================================================================
public
func
prepForPostSession() {
	
	urlRequest!.HTTPMethod = "POST"
}
	
	
	
//======================================================================================================
public
func
prepForGetSession() {
	
	urlRequest!.HTTPMethod = "GET"
}
	
	



	
	
	//	================================================================================================
	

func
oldCode() -> Bool {

	//	urlRequest = NSMutableURLRequest( URL: NSURL( string:sMyUrl )! )
	
	urlRequest!.HTTPMethod = "GET"
		
	NSURLSession.sharedSession().dataTaskWithURL( NSURL(string: "http://httpbin.org/get" )!,
	                                              
		completionHandler: {
		
			(data, response, error) in
			//=======
				print( "Finished" )
				if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
					// Success
					print( "Response: \(responseDetails)" )
				}
				else {
					// Failure
					print( "Error: \(error)" )
				}
			//=======
		}
	).resume()

	
	let x = 1
	if x == 1 {
		return true
	}
	
//	================================================================================================


/*
	var	sBody:String
	sBody = "ecws-post-data"
	urlRequest!.HTTPBody =	sBody.dataUsingEncoding(NSUTF8StringEncoding)
	
	
	
	urlRequest!.setValue( "text/xml; charset=utf-8",	forHTTPHeaderField: "Content-Type" )
	urlRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
	urlRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )
*/


	NSURLSession.sharedSession().dataTaskWithURL( NSURL(string: "http://httpbin.org/get" )!,

		completionHandler: {
			
			(data, response, error) in
			
			print( "Finished" )
			if let data = data, responseDetails = NSString(data: data, encoding: NSUTF8StringEncoding) {
				// Success
				print( "Response: \(responseDetails)" )
			}
			else {
				// Failure
				print( "Error: \(error)" )
			}
			
		}
	).resume()


	
	/*

	// Build the completion block and send the request
	//	urlSession!.dataTaskWithRequest (	urlRequest!,
														
	//	completionHandler: {
	
	//	let task = nsusSession!.dataTaskWithRequest( urlRequest! ) {
	
	//	let myReq = NSURLRequest( URL: NSURL(string: "http://httpbin.org/get" )!  )
	
	//	myReq.HTTPMethod = "GET"
	
	
	let url = NSURL(string: "http://httpbin.org/get" )
	let request: NSURLRequest = NSURLRequest(URL: url!)
	
	
	
	
	
	let task = NSURLSession.sharedSession().dataTaskWithRequest( request ) {

		data, response, error in
		
		guard error == nil else {
			print("error calling URL")
			print(error)
			return
		}
		
		guard let responseData = data else {
			print("Error: no data in reply")
			return
		}
		
		print( "Inside completion handler" )
		print( "Response: \(NSString( data : data!, encoding: NSUTF8StringEncoding ) )" 	)
		
		self.dData!.appendData( responseData )
		
	}


	task.resume()
		
		//	var x = 5
		//	var y = 7
		//	x = y
		//	y = x
	
		//	if let self.dData = data {
		//		self.dReturnData = data
		//		self.bStatus = true
		//	}
		//	else {
		//		print( "Error: \(error)" )		//	add acceptable error handling here
		//	}

		
		//	==============================================================
*/
	
	return bStatus!

	//	Note : to convert data to a String : s = NSString(data: data, encoding: NSUTF8StringEncoding)
}



	

	
//======================================================================================================
public
func
setBodyFromString( sIn : String ) {
	
	urlRequest!.HTTPBody =	sIn.dataUsingEncoding(NSUTF8StringEncoding)
}
	

	
//======================================================================================================
public
func
getReturnDataAsString() -> String {
	
	let sData : String?
	
	sData = NSString(data: dData!, encoding: NSUTF8StringEncoding) as String?
	
	return sData!
}
	
	
//======================================================================================================
public
func
getReturnDataAsNSData() -> NSData {
	
	return dData!
}
	






	
//===========================
public
func
statusReport() -> String {
	
	print ( "statusReport" )
	
	return "status is not yet available"
}

	
	
	

//	end of class
}
