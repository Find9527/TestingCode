
import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var projectwidth:ProjectWdith
    @EnvironmentObject var anchormodel:AnchorModel
    @EnvironmentObject var opentime:OpenTime
    
    @Binding var width:CGFloat
    @State var ispresent:Bool = false

    var forecolor:Color = .green
    
    var body: some View {
        
        ScrollViewReader { reader in
            Buttontemporary(ispresent:$ispresent, proxy:reader)
            ScrollView(.horizontal) {
                    VStack(alignment: .leading) {
                        GeometryReader { _ in
                            BarALotView(width: $width)
                                .position(x: 500 + (100*width)/2, y: 120)
                            
                            NodeALotView(width:$width, forecolor:forecolor, scrollproxy: reader)
                                .position(x: (800 + 100*width+200)/2, y: 350)
                        }
                    }//-------VStack--------
                    .frame(width:(800+100*width+200), height: 600,alignment: .center)
                    .border(Color.green)
                    .onAppear{
                        self.width = projectwidth.width
                    }
                    .onChange(of: projectwidth.width, perform: { value in
                        self.width = projectwidth.width
                    })
                    
            }
            
        }
        
        
//----------body----------
    }
}








struct ComposeView_Previews:PreviewProvider {
    @State static var width:CGFloat = 100
    static var previews: some View{
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                ComposeView(width:$width)
                    .environmentObject(ModelData())
                    .environmentObject(ModelIndex())
                    .environmentObject(YearNumbers())
                    .environmentObject(GestureClass())
                    .environmentObject(WindowWidth())
                    .environmentObject(AnchorModel())
                    .environmentObject(ProjectWdith())
                    .environmentObject(OpenTime())
                    .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)
            }
        }
    }
}



