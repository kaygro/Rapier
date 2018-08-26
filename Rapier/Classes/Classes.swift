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

class Leica: Camera{
	func takePhoto() -> UIImage {
		print("Click: Leica")
		return UIImage()
	}
}


class Camera: CameraProtocol{
	//sourcery:Inject
	init(){}
	func takePhoto() -> UIImage {
		print("Click: Phone")
		return UIImage()
	}
	
}

struct Event{}

protocol CarProtocol{}
class Car: CarProtocol{}

protocol PhotographerProtocol {
	func visit(Event: Event)
	func takePictures()->[UIImage]
}

//sourcery:dependencies = [Camera,Vehicle]
class Photographer: PhotographerProtocol{
	func visit(Envent: Event) {
		print("Going by \(vehicle)")
	}
	
	func takePictures() -> [UIImage] {
		return [self.camera.takePhoto()]
	}

// sourcery:inline:auto:Photographer.AutoInject
    let camera: CameraProtocol
    let vehicle: VehicleProtocol
//sourcery:Inject
    init(camera: CameraProtocol, vehicle: VehicleProtocol){
        self.camera = CameraProtocol
        self.vehicle = VehicleProtocol
    }
// sourcery:end
}
