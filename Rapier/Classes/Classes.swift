//
//  Classes.swift
//  DependencyTest
//
//  Created by Kay Großblotekamp on 18.08.18.
//  Copyright © 2018 self. All rights reserved.
//

import Foundation
import UIKit



protocol CameraProtocol{
	func takePhoto() -> UIImage
}

//sourcery:dependencies
class Phone: Camera{
	func takePhoto() -> UIImage {
		print("Click: Phone")
		return UIImage()
	}


// sourcery:inline:auto:Phone.AutoInject
//sourcery:Inject
    init(){
    }
// sourcery:end
}


struct Event{}

protocol CarProtocol{}

//sourcery:dependencies
class Car: CarProtocol{
// sourcery:inline:auto:Car.AutoInject
//sourcery:Inject
    init(){
    }
// sourcery:end
}

protocol PhotographerProtocol {
	func visit(Event: Event)
	func takePictures()->[UIImage]
}

//sourcery:dependencies = [CameraProtocol,CarProtocol]
class Photographer: PhotographerProtocol{
	func visit(Envent: Event) {
		print("Going by \(vehicle)")
	}
	
	func takePictures() -> [UIImage] {
		return [self.camera.takePhoto()]
	}


// sourcery:inline:auto:Photographer.AutoInject
    let camera: CameraProtocol
    let car: CarProtocol
//sourcery:Inject
    init(camera: CameraProtocol, car: CarProtocol){
        self.camera = camera
        self.car = car
    }
// sourcery:end
}
