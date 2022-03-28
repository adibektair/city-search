//
//  MapVC.swift
//  City-Search
//
//  Created by tair on 28.03.22.
//

import UIKit
import MapKit

class MapVC: UIViewController, MapViewProtocol, Nibbed {

    // MARK: - Injections
    var presenter: MapPresenterProtocol?
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    // MARK: - UI Setting up
    private func setUpUI() {
        guard let coorinates = presenter?.getCoordinates() else {
            return
        }
        let center = CLLocationCoordinate2D(latitude: coorinates.latitude, longitude: coorinates.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        self.mapView.setRegion(region, animated: true)
    }
    
    // MARK: - Actions
    @IBAction func onCloseTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
