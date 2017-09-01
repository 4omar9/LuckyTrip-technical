//
//  SelectAirpotVC.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit

class SelectAirpotVC: UITableViewController {
	
	public var selectedCountryCode : String?
	public var selectedAirport : ((_ airport: LTAirport) -> ())?
	var airports = [LTAirport]()
	
	// MARK: - VC LifyCycle
    override func viewDidLoad() {
        super.viewDidLoad()
		
		RequestManager.getAirports(countryCode: self.selectedCountryCode!, UserLatitude: LocationManger.userLatitude, UserLongitude: LocationManger.userLongitude, completionHandler: { (array, error) in
			self.airports.removeAll()
			self.airports = array!
			self.tableView.reloadData()
		})

		
		}
	
	
	func dismissViewController() {
		self.dismiss(animated: true, completion: nil)
	}
	

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")
		cell.textLabel?.text = airports[indexPath.row].name!
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		self.selectedAirport!(airports[indexPath.row])
		self.dismissViewController()
	}
	
	// MARK: - Table view delegate
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return UITableViewAutomaticDimension
	}
	
	override  func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
		return 60
	}

	
}
