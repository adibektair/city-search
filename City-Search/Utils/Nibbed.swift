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

protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {
    static var reuseIdentifier: String { "\(self)" }
}

protocol NibProvidable {
    static var nibName: String { get }
    static var nib: UINib { get }
}

extension NibProvidable {
    static var nibName: String {
        return "\(self)"
    }
    
    static var nib: UINib {
        return UINib(nibName: self.nibName, bundle: nil)
    }
    
    static var viewLoaded: UIView {
        return nib.instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
