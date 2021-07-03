
import SwiftUI

struct NodeView: View {
    @EnvironmentObject var amode:ModelData
    @EnvironmentObject var yearnumbers:YearNumbers
    @EnvironmentObject var ges:GestureClass
    @EnvironmentObject var anchormodel:AnchorModel
    
    @State var isEdgeLeft:Bool=false
    @State var isEdgeRight:Bool=false
    
    @Binding var width:CGFloat
    
    var forecolor:Color

    var scrollproxy:ScrollViewProxy
    
    var body: some View {
            
        HStack(spacing:0) {
            
            EdgeLeftView(isEdgeLeft: $isEdgeLeft)
                .onChange(of: isEdgeLeft, perform: { value in
//                    scrollproxy.scrollTo(80, anchor: .bottomLeading)
                })
               
            
            ForEach(0..<100) { item in
                HStack(spacing:0) {
                    GeometryReader { ingeo in
                        RoundedRectangle(cornerRadius: 25.0)
                            .frame(width: 40, height: 20)
                            //.overlay(Text("\(item+yearnumbers.start)").foregroundColor(.white))
                            .overlay(Text("\(item)").foregroundColor(.white))
                            .foregroundColor(Color.red)
                            .position(x: width/2, y: 100)
                            .onChange(of: width, perform: { value in
                                //scrollproxy.scrollTo(anchormodel.ID, anchor: .center)
                            })
                            .onAppear(){
                                amode.addBar(para:&amode.list, geo: ingeo)
                                //scrollproxy.scrollTo(55, anchor: .bottomLeading)
                            }
                            .onDisappear(){
                                amode.list = []
                            }
                    }
                }//----内部HStack-----
                .frame(width:width, height:200)
                .id(item)
                .border(Color.black)
                
                                       
            }//----ForEach-----------
            
            EdgeRightView(isEdgeRight:$isEdgeRight)
                .onChange(of: isEdgeRight, perform: { value in
//                    scrollproxy.scrollTo(19, anchor: .bottomTrailing)
                })
        }//-----black----HStack------
        .frame(width:100*width+200)
        .border(Color.black)
        
    }//---body---
}









struct NodeView_Previews: PreviewProvider {
    @State static var width:CGFloat=100
    static var color:Color = .blue
    static var previews: some View {
        ScrollView(.horizontal) {
            ScrollViewReader{ proxy in
                NodeView(width:$width,forecolor:color, scrollproxy: proxy)
                    .environmentObject(ModelData())
                    .environmentObject(GestureClass())
                    .environmentObject(WindowWidth())
                    .environmentObject(AnchorModel())
                    .environmentObject(YearNumbers())
            }
        }
        .frame(minWidth: 600, idealWidth: 800, maxWidth: .infinity, minHeight: 500, idealHeight: 600, maxHeight: 900, alignment: .center)
        
    }
}
