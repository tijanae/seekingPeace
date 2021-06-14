//
//  BreatheAnimation.swift
//  seekingPeace
//
//  Created by Tia Lendor on 1/29/21.
//  Copyright © 2021 Tia Lendor. All rights reserved.
//
/*
import SwiftUI

private func createColor(_ red: Double, _ green: Double, _ blue: Double) -> Color {
    Color(red: red / 255, green: green / 255, blue: blue / 255)
}

private let gradientStart = createColor(82, 215, 157)
private let gradientEnd = createColor(51, 167, 175)
private let gradient = LinearGradient(gradient: Gradient(colors: [gradientStart, gradientEnd]), startPoint: .top, endPoint: .bottom)
private let maskGradient = LinearGradient(gradient: Gradient(colors: [.black]), startPoint: .top, endPoint: .bottom)

private let maxSize: CGFloat = 200
private let minSize: CGFloat = 40
private let inhaleTime: Double = 3
private let exhaleTime: Double = 4
private let pauseTime: Double = 0.5

private let ghostMaxSize: CGFloat = maxSize * 0.99
private let ghostMinSize: CGFloat = maxSize * 0.94

struct BreatheAnimation: View {
    @State private var size = minSize
    @State private var inhaling = false

    @State private var ghostSize = ghostMaxSize
    @State private var ghostBlur: Double = 0
    @State private var ghostOpacity: Double = 0

    var body: some View {
        ZStack {
            Petals(size: ghostSize, inhaling: inhaling)
//                .blur(radius: CGFloat(ghostBlur))
//                .opacity(ghostOpacity)
                .drawingGroup()

            Petals(size: size, inhaling: inhaling, isMask: true)
            Petals(size: size, inhaling: inhaling)
        }
        .rotationEffect(.degrees(inhaling ? 60 : -30))
        .onTapGesture {
            performAnimations()
        }
    }

    private func performAnimations() {
        withAnimation(.easeInOut(duration: inhaleTime)) {
            inhaling = true
            size = maxSize
        }
        Timer.scheduledTimer(withTimeInterval: inhaleTime + pauseTime, repeats: false) { (_) in

            ghostSize = ghostMaxSize
            ghostBlur = 0
            ghostOpacity = 0.8

            Timer.scheduledTimer(withTimeInterval: exhaleTime * 0.2, repeats: false) { (_) in
                withAnimation(.easeOut(duration: exhaleTime * 0.6)) {
                    ghostOpacity = 0
                    ghostBlur = 10

                }
            }

            withAnimation(.easeInOut(duration: exhaleTime)) {
                inhaling = false
                size = minSize
                ghostSize = ghostMinSize
            }
        }

    }
}

private struct Petals: View {
    let size: CGFloat
    let inhaling: Bool
    var isMask = false

    var body: some View {

        let petalsGradient = isMask ? maskGradient : gradient
        let gradientSize = inhaling ? size * 2 : size
        ZStack {
            ForEach(0..<6) { index in
                gradient
                    .mask(
                Circle()
                    .frame(width: size, height: size)
                    .offset(x: inhaling ? size * 0.5 : 0)
                    .rotationEffect(.degrees(Double(60 * index)))
                    )
                    .blendMode(isMask ? .normal : .screen)
            }

        }
        .frame(width: gradientSize, height: gradientSize)
    }
}

struct BreatheAnimation_Previews: PreviewProvider {
    struct BreathAnimation_Harness: View {

        var body: some View {
            BreatheAnimation()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
//              .backgroundColor(Color(.white: 0.1))
//                .ignoresSafeArea() // not available must upgrade
        }
    }

    static var previews: some View {
        BreathAnimation_Harness()
            .previewDevice("iPhone 11 Pro Max")
            .previewDisplayName("iPhone 11 Pro Max")
    }
}
*/
