//
//  LTThumbnail.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit

import SwiftyJSON

struct LTThumbnail {
	// MARK:- LTThumbnail define

	let imageType : String
	let imageUrl : String

	// MARK:- LTThumbnail parsing
	static func thumbnailFromJSONData(jsonItem: JSON) -> LTThumbnail? {
			guard let imageType = jsonItem["image_type"].string,
			let imageUrl = jsonItem["image_url"].string
		
			else {
				return nil
			}
			
			return LTThumbnail(imageType: imageType, imageUrl: imageUrl)
		}
		
	}
	
