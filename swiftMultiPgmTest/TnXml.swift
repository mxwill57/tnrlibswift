//
//
//

/*	TnXml.swift

	Provides
	
		XML-related services

	Interfaces

		public func nsdataFromXmlString(sIn: String) -> NSData

		public func xmlObjectFromXmlString(sIn: String) -> swiftMultiPgmTest.AEXMLDocument

		public func myIntReturn(sIn: String) -> Int

		public func emptyXMLObject() -> swiftMultiPgmTest.AEXMLDocument

*/

import Foundation

//
//	class definition
//


public
class
TnXml : NSObject {
	
	
//
//	properties and instance? variables
//
	var xdocMain:AEXMLDocument?
	
	var sUtl: String?	= "intial value"
	var iUtl: Int 		 = 0
	
	
//
//	intializers
//

public
override
init() {
	
	super.init()
	xdocMain = self.returnEmptyXMLObject()
}

//
//	method definitions
//

public
func
nsdataFromXmlString( sIn:String) -> NSData {
	
	return sIn.dataUsingEncoding(NSUTF8StringEncoding)!
}

	
public
func
getXmlObjectFromXmlString( sIn:String) -> AEXMLDocument {
		
	// 1) declares optional doc var, 2) trys optional doc creation, last) returns it unwrapped
	
	var xmlDoc:AEXMLDocument?
	
	do {	xmlDoc = try? AEXMLDocument( xmlData: nsdataFromXmlString( sIn )	)	}
		
	return xmlDoc!
}

	
public
func
returnEmptyXMLObject() -> AEXMLDocument {
	
	var sXmlData = String()
	
	sXmlData +=		"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
	sXmlData +=		"<emptyObject>"
	sXmlData +=		"</emptyObject>"
	
	return getXmlObjectFromXmlString( sXmlData )
}


public
func
loadDocFromXmlString( sIn:String)  {
	
	// 1) declares optional doc var, 2) trys optional doc creation, last) returns it unwrapped

	xdocMain = nil
	do {	xdocMain = try? AEXMLDocument( xmlData: nsdataFromXmlString( sIn )	)	}
	
	//	load all matrix parameters here (search and speed aids )
	
}

	
public
func
	myIntReturn( sIn:String) -> Int {
	
	return 7
}
	
	

	
	

//	end of class
}
