//
//  Styles.swift
//  3AMGenius
//
//  Created by Thomas Trompeter on 10/15/26.
//

import SwiftUI


struct FunctionsButtonStyle: ButtonStyle {
    private struct ContentView<Content: View>: View {
        @Environment(\.isEnabled) private var isEnabled
        var view: Content
        var body: some View {
            view
                .bold()
                .padding()
                .frame(width: 150, height: 40)
                .background(.umgreen)
                .foregroundColor(isEnabled ? Color(.white) : Color(.gray))
                .font(.body)
                .dynamicTypeSize(...DynamicTypeSize.large)
                .clipShape(Capsule())
                .opacity(isEnabled ? 1.0 : 0.5)
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ContentView(view: configuration.label)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct RecorderButtonStyle: ButtonStyle {
    private struct ContentView<Content: View>: View {
        @Environment(\.isEnabled) private var isEnabled
        var view: Content
        var body: some View {
            view
                .bold()
                .padding()
                .frame(width: 350, height: 60)
                .background(.umgreen)
                .foregroundColor(isEnabled ? Color(.white) : Color(.gray))
                .font(.body)
                .dynamicTypeSize(...DynamicTypeSize.large)
                .clipShape(Capsule())
                .opacity(isEnabled ? 1.0 : 0.5)
        }
    }
    
    func makeBody(configuration: Configuration) -> some View {
        ContentView(view: configuration.label)
            .scaleEffect(configuration.isPressed ? 1.2 : 1.0)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

//struct RecorderImageTextButtonStyle: ButtonStyle {
//    
//    func makeBody(configuration: Configuration) -> some View {
//        configuration.label
//            .padding()
//            .background(Color.umgreen)
//            .foregroundStyle(.white)
//            .cornerRadius(10)
//            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
//            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
//    }
//}
