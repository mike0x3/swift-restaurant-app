//
//  NewsElement.swift
//  TabNavigationTest
//
//  Created by Uno qualunque on 27/08/21.
//

import Foundation
import SwiftUI

class NewsElement {
    var title: String
    var image: UIImage
    var text: String
    var date: String //format dd/mm/yyyy
    
    init(title: String, image: UIImage, text: String, date: String) {
        self.title = title
        self.image = image
        self.text = text
        self.date = date
    }
}
