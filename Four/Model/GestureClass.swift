
import SwiftUI

class GestureClass: ObservableObject {
    private var minZoom:CGFloat=0.8
    private var maxZoom:CGFloat=6.0
    
    @Published var zoomLevel:CGFloat=1
    @Published var current:CGFloat=1
    
    
    var magnify: some Gesture {
        MagnificationGesture()
        .onChanged({ value in
            self.current = value
        })
        .onEnded({ value in
            self.zoomLevel = self.setZoom(value)
            self.current = 1
        })
    }
       
    func setZoom(_ gesturevalue:CGFloat) -> CGFloat {
        return max(min(self.zoomLevel*gesturevalue, self.maxZoom), self.minZoom)
    }
    
    func gesResult() -> CGFloat {
        return self.setZoom(self.current)
    }
}







struct GestureModelView: View {
    @EnvironmentObject var ges:GestureClass
    var body: some View {
        let myges = ges.magnify
        
        HStack {
            Rectangle()
                .foregroundColor(.blue)
                .frame(width:200*ges.gesResult(), height:200)
                .gesture(myges)
        }
    }
}

struct GestureModelView_Previews: PreviewProvider {
    static var previews: some View {
        GestureModelView()
            .environmentObject(GestureClass())
            .frame(minWidth: 700, idealWidth: 740, maxWidth: 2000, minHeight: 600, idealHeight: 650, maxHeight: 700, alignment: .center)
    }
}
