//
//  SelectCountryVC.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit

class SelectCountryVC: UITableViewController {
	var countries = [LTCountry]()
	public var selectedCountry : ((_ country: LTCountry) -> ())?
	// MARK: - VC LifyCycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		RequestManager.getCountries { (array, error) in
			self.countries.removeAll()
			self.countries =  array!
			self.tableView.reloadData()
		}
		
	}
	
	func dismissViewController() {
		self.dismiss(animated: true, completion: nil)
	}
	
	// MARK: - Table view data source
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return countries.count
	}
	
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell:CountryCell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as! CountryCell
		
		cell.addInfoToCell(label: countries[indexPath.row].name!,
		                   imgURL:(countries[indexPath.row].thumbnail?.imageUrl)!)
		
		return cell
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedCountry!(countries[indexPath.row])
		self.dismissViewController()
	}
	
	// MARK: - Table view delegate
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	override  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 85
	}
	
	
}
