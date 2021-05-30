//
//  LocationViewController.swift
//  uTravel
//
//  Created by Dmitry on 28.05.2021.
//  
//

import UIKit
import GoogleMaps
import GooglePlaces

final class LocationViewController: UIViewController {
	private let output: LocationViewOutput
    private var placesClient: GMSPlacesClient!
//    private let googleMapsContainerView = UIView()
//
//    private let googleMapsView = GMSMapView()
//
//    private let searchResultController = SearchResultsController()
//    private var resultsArray = [String]()
//    private let gmsFetcher = GMSAutocompleteFetcher()
    
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
        placesClient = GMSPlacesClient.shared()
        makeButton()
        
//        gmsFetcher.delegate = self
//        searchResultController.delegate = self
        view.backgroundColor = .white
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
//                                                            target: self,
//                                                            action: #selector(didTapSearchBarButton))
//        googleMapsContainerView.backgroundColor = .gray
//
//        googleMapsContainerView.addSubview(googleMapsView)
//        view.addSubview(googleMapsContainerView)
        
        
        
        
	}
    
    // Present the Autocomplete view controller when the button is pressed.
    // Present the Autocomplete view controller when the button is pressed.
    @objc func autocompleteClicked(_ sender: UIButton) {
      let autocompleteController = GMSAutocompleteViewController()
      autocompleteController.delegate = self

      // Specify the place data types to return.
      let fields: GMSPlaceField = GMSPlaceField(rawValue: UInt(GMSPlaceField.name.rawValue) |
                                                    UInt(GMSPlaceField.placeID.rawValue))
      autocompleteController.placeFields = fields

      // Specify a filter.
      let filter = GMSAutocompleteFilter()
      filter.type = .address
      autocompleteController.autocompleteFilter = filter

      // Display the autocomplete view controller.
      present(autocompleteController, animated: true, completion: nil)
    }

    // Add a button to the view.
    func makeButton() {
      let btnLaunchAc = UIButton(frame: CGRect(x: 5, y: 150, width: 300, height: 35))
      btnLaunchAc.backgroundColor = .blue
      btnLaunchAc.setTitle("Launch autocomplete", for: .normal)
      btnLaunchAc.addTarget(self, action: #selector(autocompleteClicked), for: .touchUpInside)
      self.view.addSubview(btnLaunchAc)
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        googleMapsContainerView.pin.all()
//        googleMapsView.pin.all()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension LocationViewController: GMSAutocompleteViewControllerDelegate {

  // Handle the user's selection.
  func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
    print("Place name: \(place.name)")
    print("Place ID: \(place.placeID)")
    print("Place attributions: \(place.attributions)")
    dismiss(animated: true, completion: nil)
  }

  func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
    // TODO: handle the error.
    print("Error: ", error.localizedDescription)
  }

  // User canceled the operation.
  func wasCancelled(_ viewController: GMSAutocompleteViewController) {
    dismiss(animated: true, completion: nil)
  }

  // Turn the network activity indicator on and off again.
  func didRequestAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
  }

  func didUpdateAutocompletePredictions(_ viewController: GMSAutocompleteViewController) {
    UIApplication.shared.isNetworkActivityIndicatorVisible = false
  }

}
extension LocationViewController: LocationViewInput {
}

//extension LocationViewController: LocateOnTheMap {
//    func locateWithLongitude(_ lon: Double, andLatitude lat: Double, andTitle title: String) {
//        //output.locateWithLongitude(lon, andLatitude: lat, andTitle: title)
//
//        DispatchQueue.main.async { () -> Void in
//
//            let position = CLLocationCoordinate2DMake(lat, lon)
//            let marker = GMSMarker(position: position)
//
//            let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 10)
//            self.googleMapsView.camera = camera
//
//            marker.title = "Address : \(title)"
//            marker.map = self.googleMapsView
//
//        }
//    }
//}

//extension LocationViewController: UISearchBarDelegate, GMSAutocompleteFetcherDelegate {
//    func didAutocomplete(with predictions: [GMSAutocompletePrediction]) {
//        //self.resultsArray.count + 1
//
//        for prediction in predictions {
//
//            if let prediction = prediction as GMSAutocompletePrediction?{
//                self.resultsArray.append(prediction.attributedFullText.string)
//            }
//        }
//        self.searchResultController.reloadDataWithArray(self.resultsArray)
//        //self.searchResultsTable.reloadDataWithArray(self.resultsArray)
//        print(resultsArray)
//    }
//
//    func didFailAutocompleteWithError(_ error: Error) {
//
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
////        let placeClient = GMSPlacesClient()
////
////
////        placeClient.auto(searchText, bounds: nil, filter: nil)  {(results, error: Error?) -> Void in
////           // NSError myerr = Error;
////            print("Error @%",Error.self)
////
////            self.resultsArray.removeAll()
////            if results == nil {
////                return
////            }
////
////            for result in results! {
////                if let result = result as? GMSAutocompletePrediction {
////                    self.resultsArray.append(result.attributedFullText.string)
////                }
////            }
////
////            self.searchResultController.reloadDataWithArray(self.resultsArray)
////
////        }
////
//        self.resultsArray.removeAll()
//        gmsFetcher.sourceTextHasChanged(searchText)
//
//        print(resultsArray)
//    }
//
//
//    @objc
//    func didTapSearchBarButton() {
//        let searchController = UISearchController(searchResultsController: searchResultController)
//        searchController.searchBar.delegate = self
//        self.present(searchController, animated: true, completion: nil)
//    }
//}
