//
//  LocationViewController.swift
//  uTravel
//
//  Created by Dmitry on 28.05.2021.
//  
//

import UIKit
import PinLayout
import MapKit


protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark, drop: Bool)
}


final class LocationViewController: UIViewController {
	private let output: LocationViewOutput
    
    static var textlocation = ""
    
    let searchTable = LocationSearchTable()
    
    private let locationManager = CLLocationManager()
    
    private let mapView = MKMapView()
    
    var selectedPin:MKPlacemark? = nil
    
    var selectedLocation = String()
    
    init(output: LocationViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchBarButton))
        view.backgroundColor = .white
        setupLocationManager()
        mapView.delegate = self
        mapView.showsUserLocation = true
        
        if LocationViewController.textlocation != "Добавить город" {
            let request = MKLocalSearch.Request()
            request.naturalLanguageQuery = LocationViewController.textlocation
            let search = MKLocalSearch(request: request)
            search.start(completionHandler: { (response, error) in
                if response == nil
                {
                    print("error search")
                }
                else
                {
                    self.dropPinZoomIn(placemark: (response?.mapItems[0].placemark)!, drop: false)
                }
            })
        }
        
        view.addSubview(mapView)
	}

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mapView.pin
            .all(view.pin.safeArea)
    }
    
    @objc
    func didTapSearchBarButton() {
        let searchController = UISearchController(searchResultsController: searchTable)
        searchController.searchResultsUpdater = searchTable
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for places"
        searchTable.mapView = mapView
        searchTable.handleMapSearchDelegate = self
        present(searchController, animated: true, completion: nil)
    }
}

extension LocationViewController: LocationViewInput {
}

extension LocationViewController: MKMapViewDelegate {
    
}

extension LocationViewController: UISearchBarDelegate {
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

extension LocationViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
           if status == .authorizedWhenInUse {
               locationManager.requestLocation()
           }
       }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.first {
            let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            mapView.setRegion(region, animated: false)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
             print("error:: \(error.localizedDescription)")
        }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
}


extension LocationViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark, drop: Bool){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        selectedLocation = placemark.name ?? ""
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
                annotation.subtitle = "\(city) \(state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
        if drop {
            AddTravelViewController.textLocation = selectedLocation
            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
}
