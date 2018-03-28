//
//  EventsViewController.swift
//  Clitch
//
//  Created by Said Bachtarysev on 26/03/2018.
//  Copyright © 2018 Clitch. All rights reserved.
//

import UIKit
import GoogleMaps

class EventsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var gradientView: UIView!
    
    
    //MARK: Collectionview
    var streetArray = ["Avenue Louise", "Rue De Bouckere", "Avenue Louise"]
    var kmArray = ["2.5 km", "2.3 km", "2.5 km"]
    var dateArray = ["March 2018", "October 2018", "November 2018"]
    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return streetArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: eventCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! eventCollectionViewCell
        cell.streetLabel.text = streetArray[indexPath.row]
        cell.distanceLabel.text = kmArray[indexPath.row]
        cell.dateLabel.text = dateArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func viewDidLayoutSubviews() {
     
        //Set up gradient view
        let gradient = CAGradientLayer()
        gradient.frame = self.gradientView.bounds
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0.6, 0.9]
        gradientView.layer.addSublayer(gradient)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set up collectionview
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 50.8503, longitude: 4.3517, zoom: 14.0)
        mapView.camera = camera
        
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "style", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }

        
        
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 50.8503, longitude: 4.3517)
        marker.title = "Brussels"
        marker.snippet = "Belgium"
        marker.map = mapView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
