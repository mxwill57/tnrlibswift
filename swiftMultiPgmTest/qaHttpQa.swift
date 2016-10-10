//
//
//

/*	QaTnHttp.swift

	QA examples
*/

import Foundation

//
//	class definition
//

public
class
TnHttpQa : NSObject {
	

//
//	properties and instance? variables
//
	var x : 	Int = 0
	
//
//	method definitions
//

	
public
func
exampleOne() -> Bool {
	
	//	let httpDoc = TnHttp.httpObjectFromhttpString( shttpData )
	
	//	let myHttpObj = TnHttpWorking()
	
	let myHttpObj = TnHttpWorking()
	
	//	myHttpObj.prepForPostSession()
	
	myHttpObj.run()
	
	//	myHttpObj.tdLogin()

	x = 1

/*

	if !myHttpObj.run()	{
		exit(0)
	}


	let myBaseXmlObj = TnXml()

	//	let sXml = myObj.getReturnDataAsString()
	







	let sTest = myHttpObj.getReturnDataAsString()
	
	print( sTest )

	//	var xmlDoc = myObj.myEric( sXmlData )
	
	let xmlDoc = myBaseXmlObj.getXmlObjectFromXmlString( myHttpObj.getReturnDataAsString()	)
	
	
	print( xmlDoc.xmlString )								//	prints the XML structure
	
	for child in xmlDoc.root.children {						//	prints each child
		print( child.name )
	}
	
	print(xmlDoc.root["response"]["distance"].stringValue)	//	prints first element of the XML "path"
	
*/



/*
	print(xmlDoc.root["cats"]["cat"].stringValue)	//	prints Tinna (first element)
	
	print(xmlDoc.root["dogs"]["dog"].last?.value)	//	prints Optional("Kika") (last element)
	
	print(xmlDoc.root["dogs"].children[1].stringValue)		//	prints Betty (3rd element)
	
	if let cats = xmlDoc.root["cats"]["cat"].all {			// prints Tinna, Rose, Caesar
		for cat in cats {
			if let name = cat.value {
				print( name )
			}
		}
	}
	
	print(xmlDoc.root["dogs"]["dog"]["breed"].last?.value)
	
	
	for dog in xmlDoc.root["dogs"]["dog"].all! {			// prints Villy, Spot
		if let color = dog.attributes["color"] {
			if color == "white" {
				print(dog.stringValue)
			}
		}
		if let breed = dog.attributes["breed"] {
			if breed == "salesDog" {
				print( dog.stringValue )
			}
		}
		
	}
	
	
	if let cats = xmlDoc.root["cats"]["cat"].allWithValue("Tinna") {		// prints Tinna
		for cat in cats {
			print(cat.stringValue)
		}
	}
	
	// prints Caesar
	if let cats = xmlDoc.root["cats"]["cat"].allWithAttributes(["breed" : "Domestic", "color" : "yellow"]) {
		for cat in cats {
			print(cat.stringValue)
		}
	}
	
	
	print(xmlDoc.root["cats"]["cat"].count)					//	prints 4
	
	
	print(xmlDoc.root["cats"]["cat"].attributes["breed"]!)	//	prints Siberian
	
	
	
	
	
	
	
	
	print(xmlDoc.root["cats"]["cat"].xmlStringCompact)		//	prints <cat breed="Siberian" ...
	
	
	print(xmlDoc["NotExistingElement"].error)				//	prints error info
	
	
	
	
	print ( "==========================================================" )
	print ( "Kudlow's color lookup - approach one" )
	if let cat = xmlDoc.root["cats"]["cat"].allWithValue("Kudlow") {		// prints Tinna
		print( "Kudlow is " + cat[0].attributes["color"]! + "!" )
	}
	
	
	
	print ( "==========================================================" )
	print ( "Kudlow's color lookup - approach two" )
	if let cats = xmlDoc.root["cats"]["cat"].allWithValue("Kudlow") {		// prints Tinna
		for cat in cats {
			print( "Kudlow is " + cat.attributes["color"]! + "!" )
		}
	}
	
	var l2 = "cats"
	var l3 = "cat"
	
	print ( "Attempt to access Kudlow : " + xmlDoc.root["cats"].children[0].stringValue )


*/

	return true

}


	
	//	end of class
}