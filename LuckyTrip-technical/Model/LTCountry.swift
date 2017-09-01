//
//  LTCountry.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit
import SwiftyJSON

struct LTCountry {
	// MARK:- LTCountry define
	
	let id : NSNumber?
	let name : String?
	let countryCode : String?
	let currencyCode : String?
	let countryCodeIso3 : String?
	let UTCTimeZone : String?
	let defaultIataCode : String?
	let enableIndirectFlights : Bool?
	let currencyDisplayUtf8 : String?
	let isEnabled : Bool?
	let currencyFormat : String?
	let airport : LTAirport?
	let thumbnail : LTThumbnail?
	
	// MARK:- LTCountry parsing
	static func countriesFromJSONArray(json: JSON) -> [LTCountry]? {
		var countries = [LTCountry]()
		for (_,subJson) in json["countries"] {
				let name = subJson["name"].string
				let id = subJson["id"].number
				let countryCode = subJson["country_code"].string
				let currencyCode = subJson["currency_code"].string
				let countryCodeIso3 = subJson["country_code_iso3"].string
				let UTCTimeZone = subJson["UTC_time_zone"].string
				let defaultIataCode = subJson["default_iata_code"].string
				let enableIndirectFlights = subJson["enable_indirect_flights"].boolValue
				let currencyDisplayUtf8 = subJson["currency_display_utf_8"].string
				let isEnabled = subJson["is_enabled"].boolValue
				let currencyFormat = subJson["currency_format"].string
				let airport = LTAirport.airportFromJSONData(jsonItem: subJson["airport"])
				let thumbnail = LTThumbnail.thumbnailFromJSONData(jsonItem: subJson["thumbnail"])
			
		countries.append(LTCountry(id: id, name: name, countryCode: countryCode, currencyCode: currencyCode, countryCodeIso3: countryCodeIso3, UTCTimeZone: UTCTimeZone, defaultIataCode: defaultIataCode, enableIndirectFlights: enableIndirectFlights, currencyDisplayUtf8: currencyDisplayUtf8, isEnabled: isEnabled, currencyFormat: currencyFormat, airport: airport, thumbnail: thumbnail))

		}
		return countries
	}
	
	
	
}
