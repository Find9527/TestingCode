
import SwiftUI

struct ComposeView2: View {    
    @State var width:CGFloat = 100
    @State var ispresent:Bool = false
    
    @Binding var current:CGFloat
        
    var body: some View {
        let intRandom:Int = Int.random(in: 1..<90)
        
        VStack {
            ScrollViewReader { reader in
                ScrollView(.horizontal) {
                    
                    VStack(alignment: .leading) {
                        GeometryReader { _ in
                            BarALotView2(width: $width)
                                .position(x: 500 + (100*width)/2, y: 120)
                            
                            NodeALotView2(width:$width)
                                .position(x: (800 + 100*width+200)/2, y: 350)
                        }
                        
                    }//-------VStack--------
                    .frame(width:(800+100*width+200), height: 600,alignment: .center)
                    .border(Color.green)
                    .onAppear{
//                        reader.scrollTo(intRandom, anchor:.center)
                    }
                    .onChange(of:current, perform:{ value in
                        reader.scrollTo(intRandom, anchor:.center)
                    })
                        
                }
            }
        }

        
        
//----------body----------
    }
}








struct ComposeView2_Previews:PreviewProvider {
    @State static var width:CGFloat = 100
    @State static var tabCount:Int = 0
    static var previews: some View{
        ScrollView(.horizontal) {
            ScrollViewReader { proxy in
                ComposeView2(current: $width)
                    .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)
            }
        }
    }
}



