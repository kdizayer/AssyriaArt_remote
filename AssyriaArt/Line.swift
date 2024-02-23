//
//  Line.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
//

import Foundation
import SwiftUI

struct Line: Identifiable {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat

    let id = UUID()
}
