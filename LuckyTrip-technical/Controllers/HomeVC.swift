//
//  HomeVC.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
	
	@IBOutlet weak var countryBtn: UIButton!
	@IBOutlet weak var airportBtn: UIButton!
	
	var selectedCountry : LTCountry?
	var selectedAirport : LTAirport?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.btnUISetup()
	}
	
	func btnUISetup()  {
		countryBtn.layer.cornerRadius = countryBtn.layer.frame.size.width/2
		countryBtn.layer.masksToBounds = true
		airportBtn.layer.cornerRadius = airportBtn.layer.frame.size.width/2
		airportBtn.layer.masksToBounds = true
	}
	
	func setCountryBtnValue(name: String) {
		countryBtn.setTitle(name,for: .normal)
	}
	
	func setAirportBtnValue(name: String) {
		airportBtn.setTitle(name,for: .normal)
	}
	
	func restorAirportBtnStatus() {
		self.setAirportBtnValue(name: "Select Airport")
		self.airportBtn.isEnabled = false
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "selectCountrySegue" {
			
			self.restorAirportBtnStatus()
			let selectCountryVC = segue.destination as! SelectCountryVC
			selectCountryVC.selectedCountry = { (selected: LTCountry ) -> () in
				self.selectedCountry = selected
				self.setCountryBtnValue(name: selected.name!)
				self.airportBtn.isEnabled = true
			}
		}
		else if segue.identifier == "selectAirportSegue" {
			let selectAirpotVC = segue.destination as! SelectAirpotVC
			selectAirpotVC.selectedCountryCode = selectedCountry?.countryCode
			
			selectAirpotVC.selectedAirport = { (selected: LTAirport ) -> () in
				self.selectedAirport = selected
				self.setAirportBtnValue(name: selected.name!)
			}
			
		}
	}
	
	
}
