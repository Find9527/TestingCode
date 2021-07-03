

import SwiftUI


struct EdgeLeftView:View {
    @EnvironmentObject var yearnumbers:YearNumbers
    
    @Binding var isEdgeLeft:Bool
    var width:CGFloat=100
        
    var body: some View{
        HStack(spacing:0) {
            LazyHStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue)
                    .frame(width: width, height: 20)
                    .overlay(Text("Left").foregroundColor(.white))
                    .onAppear(){
                        self.isEdgeLeft=true
//                        self.yearnumbers.start -= 80
                    }
                    .onDisappear(){
                        self.isEdgeLeft=false
                    }
            }
        }
        .frame(width: width, height: 200, alignment: .center)
        .border(Color.red,width: 2)
    }
}

struct EdgeRightView:View {
    @EnvironmentObject var yearnumbers:YearNumbers
    
    @Binding var isEdgeRight:Bool
    
    var width:CGFloat=100
    
    var body: some View{
        HStack(spacing:0) {
            LazyHStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.blue)
                    .frame(width: width, height: 20)
                    .overlay(Text("Right").foregroundColor(.white))
                    .onAppear(){
                        self.isEdgeRight=true
//                        self.yearnumbers.start += 80
                    }
                    .onDisappear(){
                        self.isEdgeRight=false
                    }
            }
        }
        .frame(width: width, height: 200, alignment: .center)
        .border(Color.red,width: 2)
    }
}

struct AdditionalView_Previews: PreviewProvider {
    @State static var isEdgeLeft:Bool=false
    @State static var isEdgeRight:Bool=false
    @State static var count:Int = 0
    static var previews: some View {
        Group {
            EdgeLeftView(isEdgeLeft: $isEdgeLeft)
            EdgeRightView(isEdgeRight: $isEdgeRight)
        }
        .environmentObject(YearNumbers())
        
    }
}
