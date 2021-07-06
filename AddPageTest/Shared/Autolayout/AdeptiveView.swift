//
//  AdeptiveView.swift
//  AddPageTest
//
//  Created by Orange on 2021/7/4.
//

import SwiftUI



struct AdaptiveView<Content: View>: View {
    @State private var availableWidth: CGFloat = 0
    var threshold: CGFloat
    var content: Content

    public init(
        threshold: CGFloat,
        @ViewBuilder content: () -> Content
        ) {
        self.threshold = threshold
        self.content = content()
    }

    var body: some View {
        ZStack {
            Color.clear
                .frame(height: 1)
                .readSize { size in
                  availableWidth = size.width
            }

            if availableWidth > threshold {
                HStack {
                    content
                }
            } else {
                VStack {
                    content
                }
            }
        }
    }
}

extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
            Color.clear
              .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

private struct SizePreferenceKey: PreferenceKey {
  static var defaultValue: CGSize = .zero
  static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

