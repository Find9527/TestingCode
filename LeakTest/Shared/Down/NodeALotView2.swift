
import SwiftUI

struct NodeALotView2: View {
    
    @Binding var width:CGFloat
    
    var body: some View {
       
        HStack(spacing:0) {
                HStack {
                    Color.gray.frame(width: 400, height: 200)
                }
            
                NodeView2(width:$width)
                    .zIndex(2.0)
                    
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

struct NodeALotView2_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var color:Color = .blue

    static var previews: some View {
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                NodeALotView2(width:$width)
                    
            }
        }
        .frame(minWidth: 200, idealWidth: 600, maxWidth: 1200, minHeight: 600, idealHeight: 600, maxHeight: 6000, alignment: .center)
    }
}
