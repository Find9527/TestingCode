//
//  ContentView.swift
//  Shared
//
//  Created by Orange on 2021/7/20.
//

import SwiftUI

/*
struct ContentView: View {
    @State var orientation = UIDevice.current.orientation

       let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
           .makeConnectable()
           .autoconnect()

       var body: some View {
           Group {
               if orientation.isLandscape {
                   Text("LANDSCAPE")
               } else {
                   Text("PORTRAIT")
               }
           }.onReceive(orientationChanged) { _ in
               self.orientation = UIDevice.current.orientation
           }
       }
}
 */


final class OrientationInfo: ObservableObject {
    enum Orientation {
        case portrait
        case landscape
    }
    
    @Published var orientation: Orientation
    
    private var _observer: NSObjectProtocol?
    
    init() {
        // fairly arbitrary starting value for 'flat' orientations
        if UIDevice.current.orientation.isLandscape {
            self.orientation = .landscape
        }
        else {
            self.orientation = .portrait
        }
        
        // unowned self because we unregister before self becomes invalid
        _observer = NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: nil) { [unowned self] note in
            guard let device = note.object as? UIDevice else {
                return
            }
            if device.orientation.isPortrait {
                self.orientation = .portrait
            }
            else if device.orientation.isLandscape {
                self.orientation = .landscape
            }
        }
    }
    
    deinit {
        if let observer = _observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
}

struct ContentView: View {
//    @EnvironmentObject var orientationInfo: OrientationInfo
    @StateObject var orientationInfo = OrientationInfo()
    
    var body: some View {
        Text("Orientation is '\(orientationInfo.orientation == .portrait ? "portrait" : "landscape")'")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(OrientationInfo())
    }
}
