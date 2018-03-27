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
    
    //MARK: Collectionview
    var streetArray = [String]()
    var eventImages = [UIImage]()
    var kmArray = [String]()
    var dateArray = [String]()

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return streetArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: eventCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as! eventCollectionViewCell
        
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set up collectionview
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 50.8503, longitude: 4.3517, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
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

        
        //mapView.addSubview(mapview)
        view = mapView
        
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
