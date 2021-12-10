//
//  ViewController.swift
//  Trolley App
//
//  Created by Kendrick Morales on 10/21/19.
//  Copyright © 2019 Kendrick Morales. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
class ViewController: UIViewController,  CLLocationManagerDelegate {

    var estado = false
    let locationManager = CLLocationManager()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }

        // Do any additional setup after loading the view.
    }
    
    //funcion para poder extraer latitud y longitud
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate
            else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")
    }
 
    
    //botton de las paradas
    @IBAction func trackingButton(_ sender: UIButton) {
        
        // si el estado esta en falso
        if estado != true{
         sender.setTitle("Stop", for: .normal) // cambia el texto del boton
         estado = true // cambiamos el estado a activado
         locationManager.startUpdatingLocation() // activamos el metodo de capturacion de localizacion
        }
        else{ // si el estado esta en cierto
             sender.setTitle("Tracking", for: .normal) // cambiamos el texto del boton
            locationManager.stopUpdatingLocation() // paramos el metodo de capturacion de localizacion
            
            estado = false // se cambia estado de nuevo a falso
        }
    }
    
   
    
    
}

