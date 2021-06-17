
import SwiftUI

struct TransitionView: View {
    
    @State var tabCount:Int = 1
    @State var width:CGFloat = 100
    
    @State var current:CGFloat = 1
    @State var final:CGFloat = 1

    var body: some View {
        
        let magni = MagnificationGesture()
            .onChanged(){ value in
                current = value
            }
            .onEnded { value in
                if value > 3 {
                    tabCount += 1
                }
                final += current
                current = 1
            }
        
        
        VStack(alignment: .leading) {
                
            if tabCount%2 == 0 {
                ComposeView2(current: $current)
            }
            else{
                Text("SwiftUI by Example is the world's largest collection of SwiftUI examples, tips, and techniques giving you almost 600 pages of hands-on code to help you build apps, solve problems, and understand how SwiftUI really works.")
            }
        }
        .gesture(magni)
        
//----------body----------
    }
}



struct TransitionView_Previews:PreviewProvider {
    static var previews: some View{
        ScrollViewReader { proxy in
            #if os(macOS)
            TransitionView()
                
                .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 600, idealHeight: 600, maxHeight: 600, alignment: .center)
            #else
            TransitionView()
                
            #endif
        }
        
    }
}



