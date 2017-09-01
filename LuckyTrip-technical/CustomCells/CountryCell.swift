//
//  CountryCell.swift
//  LuckyTrip-technical
//
//  Created by Omar Almasri on 8/31/17.
//  Copyright © 2017 Omar. All rights reserved.
//

import UIKit
import Kingfisher

class CountryCell: UITableViewCell {

	@IBOutlet weak var lbl: UILabel!
	@IBOutlet weak var imgView: UIImageView!
	
    override func awakeFromNib() {
        super.awakeFromNib()
	}
	
	func addInfoToCell(label:String, imgURL:String)  {
		self.lbl.text = label
		self.imgView.kf.setImage(with: URL(string: imgURL))
	}

}
