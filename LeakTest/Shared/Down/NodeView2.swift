
import SwiftUI

struct NodeView2: View {
   
    
    @State var isEdgeLeft:Bool=false
    @State var isEdgeRight:Bool=false
    
    @Binding var width:CGFloat
        
    var body: some View {
            
        HStack(spacing:0) {
                        
            EdgeLeftView(isEdgeLeft: $isEdgeLeft)
            ForEach(0..<100) { item in
                HStack(spacing:0) {
                    GeometryReader { ingeo in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 40, height: 20)
                            .overlay(Text("\(item)").foregroundColor(.white))
                            .foregroundColor(Color.green)
                            .position(x: width/2, y: 100)
                         
                    }
                }//----内部HStack-----
                .frame(width:width, height:200)
                .id(item)
                .border(Color.black)                                       
            }//----ForEach-----------
            EdgeRightView(isEdgeRight: $isEdgeRight)
            
            
        }//-----black----HStack------
        .frame(width:100*width+200)
        .border(Color.black)
        
    }//---body---
}









struct NodeView2_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var previews: some View {
        ScrollView(.horizontal) {
            ScrollViewReader{ proxy in
                NodeView2(width:$width)
                    
            }
        }
        .frame(minWidth: 600, idealWidth: 800, maxWidth: .infinity, minHeight: 500, idealHeight: 600, maxHeight: 900, alignment: .center)
        
    }
}
