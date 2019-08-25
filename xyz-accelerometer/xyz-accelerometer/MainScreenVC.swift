//
//  ViewController.swift
//  xyz-accelerometer
//
//  Created by Sau on 8/25/19.
//  Copyright © 2019 Sau. All rights reserved.
//

import UIKit
import CoreMotion


class MainScreenVC: UIViewController {

    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateValues)
        
        
    }

    func updateValues(data: CMAccelerometerData?, error: Error?) {
        guard let acceleroData = data else {return}
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: acceleroData.acceleration.x)!
        let y = formatter.string(for: acceleroData.acceleration.y)!
        let z = formatter.string(for: acceleroData.acceleration.z)!
        
        xLbl.text = "X: \(x)"
        yLbl.text = "Y: \(y)"
        zLbl.text = "Z: \(z)"
        
        
        
    }

}

