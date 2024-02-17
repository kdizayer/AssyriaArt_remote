//
//  DrawingView.swift
//  AssyriaArt
//
//  Created by Kayla Dizayer on 2/17/24.
//

import Foundation
import SwiftUI

struct DrawingView: View {
    let backgroundImageName: String
    @State private var lines = [Line]()
    @State private var deletedLines = [Line]()
    
    @State private var selectedColor: Color = .black
    @State private var selectedLineWidth: CGFloat = 1
    @State private var inputImage: UIImage?
    
    let engine = DrawingEngine()
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                ColorPicker("line color", selection: $selectedColor)
                    .labelsHidden()
                Slider(value: $selectedLineWidth, in: 1...20) {
                    Text("linewidth")
                }.frame(maxWidth: 100)
                Text(String(format: "%.0f", selectedLineWidth))
                
                Spacer()
                
                Button {
                    let last = lines.removeLast()
                    deletedLines.append(last)
                } label: {
                    Image(systemName: "arrow.uturn.backward.circle")
                        .imageScale(.large)
                }.disabled(lines.count == 0)
                
                Button {
                    let last = deletedLines.removeLast()
                    
                    lines.append(last)
                } label: {
                    Image(systemName: "arrow.uturn.forward.circle")
                        .imageScale(.large)
                }.disabled(deletedLines.count == 0)

                Button(action: {
                   showConfirmation = true
                }) {
                    Text("Delete")
                }.foregroundColor(.red)
                    .confirmationDialog(Text("Are you sure you want to delete everything?"), isPresented: $showConfirmation) {
                        
                        Button("Delete", role: .destructive) {
                            lines = [Line]()
                            deletedLines = [Line]()
                        }
                    }
                
            
                Button("Save") {
                        guard let drawingImage = renderDrawingAsImage() else { return }
                        let imageSaver = ImageSaver()
                        imageSaver.successHandler = {
                            print("Image successfully saved.")
                        }
                        imageSaver.errorHandler = { error in
                            print("Error saving image: \(error.localizedDescription)")
                        }
                        imageSaver.writeToPhotoAlbum(image: drawingImage)
                    }
                

            }.padding()
            
            
            ZStack {
                
                Color.white
                Image(backgroundImageName)
                            .resizable()
                            .frame(width: 900, height: 700)
                            .edgesIgnoringSafeArea(.all)
                ForEach(lines){ line in
                    DrawingShape(points: line.points)
                        .stroke(line.color, style: StrokeStyle(lineWidth: line.lineWidth, lineCap: .round, lineJoin: .round))
                }
                
            }
            
            
        .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
            let newPoint = value.location
            if value.translation.width + value.translation.height == 0 {
                //TODO: use selected color and linewidth
                lines.append(Line(points: [newPoint], color: selectedColor, lineWidth: selectedLineWidth))
            } else {
                let index = lines.count - 1
                lines[index].points.append(newPoint)
            }
            
        }).onEnded({ value in
            if let last = lines.last?.points, last.isEmpty {
                lines.removeLast()
            }
        })
        
        )
            
        }
    }
    func renderDrawingAsImage() -> UIImage? {
        let size = CGSize(width: 900, height: 700) // Adjust the size as needed
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            // Render the drawing
            if let backgroundImage = UIImage(named: backgroundImageName) {
                        backgroundImage.draw(in: CGRect(x: 0, y: 0, width: size.width, height: size.height))
                    }
            for line in lines {
                        // Convert SwiftUI Color to UIColor
                        let uiColor = UIColor(line.color)
                        uiColor.setStroke() // Now you can call setStroke on UIColor
                        
                        let path = UIBezierPath()
                        path.lineWidth = line.lineWidth
                        guard let firstPoint = line.points.first else { continue }
                        path.move(to: firstPoint)
                        for point in line.points.dropFirst() {
                            path.addLine(to: point)
                        }
                        path.stroke()
            }
        }
    }
}


