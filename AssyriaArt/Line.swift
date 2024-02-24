//
//  Line.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
// Cite: Karin Prater

import Foundation
import SwiftUI

struct Line: Identifiable {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat

    let id = UUID()
}
