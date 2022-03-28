//
//  CityTableViewCell.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import UIKit

class CityTableViewCell: UITableViewCell, NibProvidable, ReusableView {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubtitle: UILabel!
    
    func fillData(_ city: City) {
        lblTitle.text = city.displayTitle
        lblSubtitle.text = city.displaySubtitle
    }
    
}
