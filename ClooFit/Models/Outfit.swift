//
//  Outfit.swift
//  ClooFit
//
//  Created by Claudio Sottile on 04/07/24.
//

import Foundation
import SwiftUI

struct Outfit {
    var upper: article
    var lower: article
    
    init(upper: article, lower: article) {
        self.upper = upper
        self.lower = lower
    }
}
