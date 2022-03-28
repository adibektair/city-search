//
//  Nibbed.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import UIKit

protocol Nibbed {
    static func instantiate() -> Self
}
extension Nibbed where Self: UIViewController {
    static func instantiate() -> Self {
        let name = String(describing: self)
        return self.init(nibName: name, bundle: nil)
    }
}
