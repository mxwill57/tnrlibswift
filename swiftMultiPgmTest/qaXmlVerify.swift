//
//
//

/*	QaTnXml.swift

	QA examples
*/

import Foundation



//
//	class definition
//

public
class
QaTnXml : NSObject {
	

//
//	properties and instance? variables
//
	
	
//
//	method definitions
//

	
public
func
	exampleOne() {
	
	var sXmlData = String()
	
	sXmlData +=		"<?xml version=\"1.0\" encoding=\"utf-8\"?>"
	sXmlData +=		"<animals>"
	sXmlData +=			"<cats>"
	sXmlData +=				"<cat breed=\"dsh\"         color=\"blackish\">Kudlow</cat>"
	sXmlData +=			"</cats>"
	sXmlData +=			"<dogs>"
	sXmlData +=				"<dog breed=\"bobo\"        color=\"black\">Sid</dog>"
	sXmlData +=				"<dog breed=\"salesDog\"    color=\"brown\">JB</dog>"
	sXmlData +=			"</dogs>"
	sXmlData +=		"</animals>"
	
	
	//	let xmlDoc = TnXml.xmlObjectFromXmlString( sXmlData )
	
	let myObj = TnXml()
	
	//	var xmlDoc = myObj.myEric( sXmlData )
	
	let xmlDoc = myObj.getXmlObjectFromXmlString( sXmlData )

	
	print( xmlDoc.xmlString )						//	prints the same XML structure as original
	
	for child in xmlDoc.root.children {				//	prints cats, dogs
		print( child.name )
	}
	
	print(xmlDoc.root["cats"]["cat"].value)			//	prints Optional("Tinna") (first element)
	
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
	
	//	var l2 = "cats"
	//	var l3 = "cat"
	
	print ( "Attempt to access Kudlow : " + xmlDoc.root["cats"].children[0].stringValue )
}


/*


func
parserDidStartDocument(parser: NSXMLParser) {
	items = []
}


func
parser(parser: NSXMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String]) {
	
	if elementName == "item" {
		itemPrice = attributeDict["price"]
		itemName = ""
	}
}


func
parser(parser: NSXMLParser, foundCharacters string: String) {
	
	itemName?.appendContentsOf(string)
}


func
parser(parser: NSXMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
	
	if elementName == "item" {
		items.append(Item(name: itemName!, price: itemPrice!))
		itemName = nil
		itemPrice = nil
	}
}

*/
	
	//	end of class
}