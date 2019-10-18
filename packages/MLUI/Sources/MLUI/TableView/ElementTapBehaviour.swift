//
//  ElementTapBehaviour.swift
//  
//
//  Created by Jose Luis Sagredo on 17/10/2019.
//

import Foundation
import UIKit

///Enumeration for tap behaviour
public enum ElementTapBehaviour {
    ///Define the keep selection
    case keepSelection
    ///Define deselect
    case deselect(_: Bool)
}
