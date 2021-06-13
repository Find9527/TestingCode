//
//  ContentView.swift
//  Shared
//
//  Created by Orange on 2021/6/12.
//
import SwiftUI
import UIKit


struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geometry in
                RefreshableScrollView(size: geometry.size, refresh: self.refresh) {
                    Text("Placeholder text")
                }
            }
        }
        NavigationLink(destination: Text("Destination")) {
            Text("Click me")
        }
    }
    
    func refresh() {
        print("refreshing")
    }
}

// RefreshableScrollView.swift
import SwiftUI
import UIKit

struct RefreshableScrollView<Content: View>: UIViewRepresentable {
    var width: CGFloat
    var height: CGFloat
    var refresh: () -> Void
    var refreshViewController: UIHostingController<Content>
    
    init(size: CGSize, refresh: @escaping () -> Void, @ViewBuilder content: () -> Content) {
        self.width = size.width
        self.height = size.height
        self.refresh = refresh
        self.refreshViewController = UIHostingController(rootView: content())
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.refreshControl = UIRefreshControl()
        scrollView.refreshControl?.addTarget(
            context.coordinator,
            action: #selector(Coordinator.handleRefreshControl(sender:)),
            for: .valueChanged
        )
        refreshViewController.view.frame = CGRect(x: 0, y: 0, width: self.width, height: self.height)
        scrollView.addSubview(self.refreshViewController.view)
        return scrollView
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject {
        var refreshScrollView: RefreshableScrollView
        
        init(_ refreshScrollView: RefreshableScrollView) {
            self.refreshScrollView = refreshScrollView
        }
        
        @objc func handleRefreshControl(sender: UIRefreshControl) {
            self.refreshScrollView.refresh()
            sender.endRefreshing()
        }
    }
}
