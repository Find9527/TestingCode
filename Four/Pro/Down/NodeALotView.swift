
import SwiftUI

struct NodeALotView: View {
    @EnvironmentObject var windowwidth:WindowWidth
    @EnvironmentObject var anchormodel:AnchorModel
    
    @Binding var width:CGFloat
    var forecolor:Color
    var scrollproxy:ScrollViewProxy
    
    var body: some View {
       
        HStack(spacing:0) {
                HStack {
                    Color.gray.frame(width: 400, height: 200)
                }
            
                NodeView(width:$width, forecolor: forecolor, scrollproxy: scrollproxy)
                    .zIndex(2.0)
                    .background(GeometryReader {
                        Color.clear.preference(key: ScrollOffsetKey.self,
                                               value: $0.frame(in: .global).origin.x)
                    })
                    .onPreferenceChange(ScrollOffsetKey.self) { value in
                        var d:CGFloat=0
                        d = windowwidth.windowCenterX-value-100
                        anchormodel.ID = Int((d-d.truncatingRemainder(dividingBy: width))/width)
                    }

                HStack {
                    HStack {
                        Color.yellow.frame(width: 400, height: 200)
                    }
                }
                .zIndex(1.0)
                
        }
        .frame(width: 400 + 100*width+200 + 400, height: 200)
       
        
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var color:Color = .blue

    static var previews: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                NodeALotView(width:$width,forecolor:color, scrollproxy: proxy)
                    .environmentObject(ModelData())
                    .environmentObject(GestureClass())
                    .environmentObject(WindowWidth())
                    .environmentObject(AnchorModel())
                    .environmentObject(YearNumbers())
            }
        }
        .frame(minWidth: 200, idealWidth: 600, maxWidth: 1200, minHeight: 600, idealHeight: 600, maxHeight: 6000, alignment: .center)
    }
}
