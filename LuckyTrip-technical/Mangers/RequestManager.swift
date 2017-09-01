//
//  RequestManager.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let BASE_URL = "http://dev.luckytrip.co.uk/api/2.0/"
let COUNTRIES = BASE_URL + "content/countries"
let AIRPORTS = BASE_URL + "search/airports?country_code=%@&latitude=%@&longitude=%@"

class RequestManager: NSObject {
	
	// MARK:- RequestManager interface
	static func getCountries(completionHandler: @escaping (_ array: [LTCountry]? ,_ error: Error?) -> ()) {
		fetchCountries(completionHandler: completionHandler)
	}
	
	static func getAirports(countryCode: String,
	                        UserLatitude: String?,
	                        UserLongitude:String?,
	                        completionHandler: @escaping (_ array: [LTAirport]? ,_ error: Error?) -> ()) {
		fetchAirports(countryCode: countryCode, UserLatitude: UserLatitude, UserLongitude: UserLongitude, completionHandler:completionHandler)
	}
	
	
	// MARK:- Private Calls
	private static func fetchCountries(completionHandler:@escaping (_ array: [LTCountry]? ,_ error: Error?) -> ()) {
		Alamofire.request(COUNTRIES).responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				completionHandler(LTCountry.countriesFromJSONArray(json:json), nil)
			case .failure(let error):
				completionHandler(nil, error)
			}
		}
	}
	
	private static func fetchAirports(countryCode: String,
	                                  UserLatitude: String?,
	                                  UserLongitude:String?,
	                                  completionHandler:@escaping (_ array: [LTAirport]? ,_ error: Error?) -> ()) {
		Alamofire.request(String(format:AIRPORTS,countryCode,UserLatitude!,UserLongitude!)).responseJSON { response in
			switch response.result {
			case .success(let value):
				let json = JSON(value)
				completionHandler(LTAirport.airportsFromJSONArray(json:json), nil)
			case .failure(let error):
				completionHandler(nil, error)
			}
		}
	}
	
	
	
}
