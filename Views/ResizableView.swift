//
//  ResizableView.swift
//  Card
//
//  Created by Ryan Westhoelter on 9/9/24.
//

import SwiftUI

struct ResizableView: ViewModifier {
    @State private var scale: CGFloat = 1.0
    @State private var previousRotation: Angle = .zero
    @State private var previousOffset: CGSize = .zero
    @Binding var transform: Transform
    
    func body (content: Content) -> some View {
        content
            .frame(
                width: transform.size.width,
                height: transform.size.height
            )
            .onAppear {
                previousOffset = transform.offset
            }
            .rotationEffect(transform.rotation)
            .scaleEffect(scale)
            .offset(transform.offset)
            .gesture(dragGesture)
            .gesture(SimultaneousGesture(rotationGesture, scaleGesture))
    }
    
    var dragGesture: some Gesture {
        DragGesture()
            .onChanged { value in
                transform.offset = value.translation + previousOffset
            }
            .onEnded { _ in
                previousOffset = transform.offset
            }
    }
    
    var rotationGesture: some Gesture{
        RotationGesture()
            .onChanged { rotation in
                transform.rotation += rotation - previousRotation
                previousRotation = rotation
            }
            .onEnded { _ in
                previousRotation = .zero
            }
        }
    
    var scaleGesture: some Gesture {
        MagnificationGesture()
            .onChanged { scale in
                self.scale = scale
            }
            .onEnded { scale in
                transform.size.width *= scale
                transform.size.height *= scale
                self.scale = 1.0
            }
    }
}

struct ResizableView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectangle(cornerRadius: 30.0)
            .foregroundColor(Color.blue)
            .resizableView(transform: .constant(Transform()))
    }
}

extension View{
    func resizableView(transform: Binding<Transform>) -> some View {
        modifier(ResizableView(transform: transform))
    }
}
