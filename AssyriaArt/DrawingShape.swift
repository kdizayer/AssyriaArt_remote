//
//  DrawingShape.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
// Cite: Karin Prater

import Foundation
import SwiftUI

struct DrawingShape: Shape {
    let points: [CGPoint]
    let engine = DrawingEngine()
    func path(in rect: CGRect) -> Path {
        engine.createPath(for: points)
    }
}
