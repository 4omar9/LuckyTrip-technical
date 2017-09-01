//
//  LTAirport.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit
import SwiftyJSON

struct LTAirport {
	// MARK:- LTAirport define

	let id : NSNumber?
	let parentID : NSNumber?
	let name : String?
	let latitude : String?
	let longitude : String?
	let countryCode : String?
	let iataCode : String?
	let enableIndirectFlights : Bool?
	let isoRegion : String?
	let municipality : String?
	let gpsCode : String?
	let localCode : String?
	let type : String?
	let isEnabled : Bool?
	let isCollection : Bool?
	let countriesRepeatCap : String?
	let destinationsRepeatCap : String?
	let skyscannerReferralCode : String?
	let thumbnail : LTThumbnail?

	// MARK:- LTAirport Parsing
	static func airportFromJSONData(jsonItem: JSON) -> LTAirport? {
			let id = jsonItem["id"].number
			let parentID = jsonItem["parent_id"].number
			let name = jsonItem["name"].string
			let latitude = jsonItem["latitude"].string
			let longitude = jsonItem["longitude"].string
			let countryCode = jsonItem["country_code"].string
			let iataCode = jsonItem["iata_code"].string
			let enableIndirectFlights = jsonItem["enable_indirect_flights"].boolValue
			let isoRegion = jsonItem["iso_region"].string
			let municipality = jsonItem["municipality"].string
			let gpsCode = jsonItem["gps_code"].string
			let localCode = jsonItem["local_code"].string
			let isEnabled = jsonItem["is_enabled"].boolValue
			let isCollection = jsonItem["is_collection"].boolValue
			let countriesRepeatCap = jsonItem["countries_repeat_cap"].string
			let destinationsRepeatCap = jsonItem["destinations_repeat_cap"].string
			let skyscannerReferralCode = jsonItem["skyscanner_referral_code"].string
			let type = jsonItem["type"].string
			let thumbnail = LTThumbnail.thumbnailFromJSONData(jsonItem: jsonItem["thumbnail"])

		return LTAirport(id: id, parentID: parentID, name: name, latitude: latitude, longitude: longitude, countryCode: countryCode, iataCode: iataCode, enableIndirectFlights: enableIndirectFlights, isoRegion: isoRegion, municipality: municipality, gpsCode: gpsCode, localCode: localCode, type: type, isEnabled: isEnabled, isCollection: isCollection, countriesRepeatCap: countriesRepeatCap, destinationsRepeatCap: destinationsRepeatCap, skyscannerReferralCode: skyscannerReferralCode,thumbnail:thumbnail)
		}


	static func airportsFromJSONArray(json: JSON) -> [LTAirport]? {
		var airports = [LTAirport]()
		for (_,subJson) in json["airports"] {
			airports.append(LTAirport.airportFromJSONData(jsonItem: subJson)!)
		}
		return airports
	}
	
	
	
	}


	
