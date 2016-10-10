//
//
//

/*	TnHttp.swift

	Provides
	
		Http-related services

	Interfaces



*/

import Foundation

//
//	class definition
//




public
extension
String
{


public
func
left( iReturnSizeIn: Int) ->String {		//	return the requested leftmost characters
	
	var iReturnSize : Int = iReturnSizeIn	//	copy the requested size to our local variable
	
	if iReturnSize > self.characters.count {
		iReturnSize = self.characters.count	//	restrict right-size bounds, if necessary
	}
	
	if iReturnSize < 0 {					//	ensure size not less than zero
		iReturnSize = 0
	}
	
	//	return the requested leftmost characters
	return String( self.characters.prefix( iReturnSize )	)
}
	



public
func
right( iReturnSizeIn: Int) ->String {		//	return the requested leftmost characters
	
	var iReturnSize : Int = iReturnSizeIn	//	copy the requested size to our local variable
	
	if iReturnSize > self.characters.count {
		iReturnSize = self.characters.count	//	restrict right-size bounds, if necessary
	}
	
	if iReturnSize < 0 {					//	ensure size not less than zero
		iReturnSize = self.characters.count	}
	
	//	return the requested leftmost characters
	return String( self.characters.suffix( iReturnSize )	)
}
	

	
public
func
mid( iOffsetIn: Int, _ iReturnSizeIn : Int) ->String {	//	return the requested leftmost characters
	
	var iReturnSize : Int	= iReturnSizeIn			//	copy the requested size to our local variable
	var iOffset : Int		= iOffsetIn				//	copy the requested size to our local variable
	
	
	if iOffset < 0 {
		iOffset 	= 0								//	restrict right-size bounds, if necessary
		iReturnSize = 0								//	restrict right-size bounds, if necessary
	}

	
	if iOffset > self.characters.count - 1 {
		iOffset 	= 0								//	restrict right-size bounds, if necessary
		iReturnSize = 0								//	restrict right-size bounds, if necessary
	}


	
	if iReturnSize < 0 {							//	ensure size not less than zero
		iReturnSize = 0
	}
	
	
	if iOffsetIn + iReturnSize > self.characters.count {
		iReturnSize = self.characters.count - iOffsetIn		//	restrict right-size bounds, if necessary
	}
	
	
	
	//	stage the right size of the specified substring - we will next harvest left of harvested sub
	let sRight = self.right( self.characters.count - iOffsetIn )
	
	//	return the requested leftmost characters, after the offset has been applied
	return sRight.left( iReturnSize )
}


}	// end of extensions to String









public
class
TnHttpWorking : NSObject {
	
	
//
//	properties and instance? variables
//
	var	urlRequest : 	NSMutableURLRequest?
	
	var urlSession :	NSURLSession?
	
	var dReply :		NSMutableData?
	
	var sUrl : 			String	= "intial value"
	var sProtocol : 	String	= "intial value"
	
	var sBody : 		String	= "intial value"
	
	var sSoapAction : 	String	= "intial value"
	var sSoapHeader : 	String	= "intial value"
	var sSoapBody : 	String	= "intial value"
	var sSoapMsg : 		String	= "intial value"
	
	var sUtl : 			String	= "intial value"
	var iUtl : 			Int 	= 0
	
	var sSessionId :	String	= "intial value"
	
	var sResultCode :	String	= "intial value"

	var sErrorMsg :		String	= "intial value"

	var sUserId :		String	= "intial value"
	
	var sStreamerUrl :	String	= "intial value"
	
	var sToken :		String	= "UDID"

	var sTimestamp :	String	= "intial value"
	
	var sTicker :		String	= "intial value"
	var sTdTicker :		String	= "intial value"
	
//
//	intializers
//

//===================
public
override
init() {
	
	//	super.init()
	//	var i = 1
}

//
// method definitions
//




//======================================================================================================
public
func
tdLogin() {
	
	sUrl = "https://apis.tdameritrade.com/apps/100/LogIn"
	
	urlRequest = NSMutableURLRequest( URL: NSURL( string:sUrl )! )
	
	urlRequest!.HTTPMethod = "POST"
	
	sBody	=	"source=[my-src]&version=1.0&userid=[my-acct]&password=[my-pwd]"
	
	urlRequest!.HTTPBody =	sBody.dataUsingEncoding(NSUTF8StringEncoding)
	
	urlRequest!.setValue( "text/xml; charset=utf-8",	forHTTPHeaderField: "Content-Type" )
	urlRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
	urlRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )
	
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
		//	"/amtd/result"
	//	"/amtd/xml-log-in/session-id"
	//	"/amtd/xml-log-in/accounts/account/account-id"
	//	"//amtd/xml-log-in/accounts/account/company"
	//	"//amtd/xml-log-in/accounts/account/segment"
	
	
	
	
	
	
}

	
	
//======================================================================================================
public
func
	otherCalls() {
	
	sUrl = "https://apis.tdameritrade.com/apps/100/LogIn"
	sUrl = "https://ws.cdyne.com/creditcardverify/luhnchecker.asmx?wsdl"
	
	urlRequest = NSMutableURLRequest( URL: NSURL( string:sUrl )! )
	
	urlRequest!.HTTPMethod = "POST"
	
	//	sBody	=	"source=[my-src]&version=1.0&userid=[my-acct]&password=[my-pwd]
	sBody	=	"internal https test"
	
	urlRequest!.HTTPBody =	sBody.dataUsingEncoding(NSUTF8StringEncoding)
	
	urlRequest!.setValue( "text/xml; charset=utf-8",	forHTTPHeaderField: "Content-Type" )
	urlRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
	urlRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )
	
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
	//	"/amtd/result"
	//	"/amtd/xml-log-in/session-id"
	//	"/amtd/xml-log-in/accounts/account/account-id"
	//	"//amtd/xml-log-in/accounts/account/company"
	//	"//amtd/xml-log-in/accounts/account/segment"
	
	
	
	
	
	
}
	
	
	



//======================================================================================================
public
func
run() {
		
	//	urlRequest = NSMutableURLRequest( URL: NSURL( string:sIn)! )

	sUrl = "https://www.zipcodeapi.com/rest/xLpTICmHMkVaaAL3oJcX0fYO37N21bbyXBrFeNn08jbiTXlhGyfGOeuSliUmu5Vr/distance.xml/27320/37205/mile"
	
	sUrl = "http://httpbin.org/get"
	
	sUrl = "https://alist.safety.tn.gov/ipad/WhoAmI"
	
	sUrl = "https://alist-qa.safety.tn.gov/SVC/iPadKiosk"
	
	urlRequest = NSMutableURLRequest( URL: NSURL( string:sUrl )! )

	urlRequest!.HTTPMethod = "POST"

	if ( sUrl.left( 8 ) == "https://" ) {
		sProtocol = "https"
	}
	else {
		sProtocol = "http"
	}
	
	
	sSoapAction = sProtocol + "://alist.safety.tn.gov/ipad/WhoAmI"
	
	
	sSoapHeader = 	"xmlns:soapenv=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:ipad=\"" +
					sProtocol +
					"://alist.safety.tn.gov/ipad\">"
	

	sToken = "74A1FDD6-6B4E-4230-BBB7-33AA400A1DAB"

	sSoapBody = "<ipad:WhoAmI>" + "<ipad:pstrUDID>" + sToken + "</ipad:pstrUDID>" + "</ipad:WhoAmI>"



	sSoapMsg =		"<soapenv:Envelope "	+ sSoapHeader	+ "<soapenv:Header/>" +
					"<soapenv:Body>" 		+ sSoapBody		+ "</soapenv:Body>" +
					"</soapenv:Envelope>"
	
	let sMsgLen = String ( sSoapMsg.characters.count )
	
	//	urlRequest!.HTTPBody =	sBody.dataUsingEncoding(NSUTF8StringEncoding)
	urlRequest!.HTTPBody =	sSoapMsg.dataUsingEncoding(NSUTF8StringEncoding)
	
	urlRequest!.setValue( "text/xml; charset=utf-8",	forHTTPHeaderField: "Content-Type" )
	urlRequest!.setValue( sMsgLen,						forHTTPHeaderField: "Content-Length" )
	urlRequest!.setValue( sSoapAction, 					forHTTPHeaderField: "SOAPAction" )
	
//	urlRequest!.setValue( "Mozilla/5.0", 				forHTTPHeaderField: "User-Agent" )
//	urlRequest!.setValue( "en-US,en;q=0.5",				forHTTPHeaderField: "Accept-Language" )
	
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

	statusReport()

	//	"/amtd/result"
	//	"/amtd/xml-log-in/session-id"
	//	"/amtd/xml-log-in/accounts/account/account-id"
}


//===========================
public
func
statusReport() -> String {
	
	print ( "statusReport" )
	
	return "Hello!"
}



	
	

//	end of class
}
