//
//  File.swift
//  
//
//  Created by Jose Luis Sagredo on 15/10/2019.
//

import Foundation
import UIKit

public extension UIImageView {
    func imageURL(_ url: URL, placeholder: UIImage? = nil, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        self.contentMode = mode
        self.image = placeholder
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if (error != nil) {
                print(error.debugDescription)
                return
            }
            
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
}
