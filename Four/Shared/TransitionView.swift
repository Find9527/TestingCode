
import SwiftUI

struct TransitionView: View {
    @EnvironmentObject var windowwidth:WindowWidth
    @EnvironmentObject var projectwidth:ProjectWdith
    @EnvironmentObject var yearnumbers:YearNumbers
    @EnvironmentObject var ges:GestureClass
    
    @State var tabCount:Int = 56
    @State var width:CGFloat = 100
    
    @State var current:CGFloat = 1
    @State var final:CGFloat = 1

    var body: some View {
        
        let magnify = MagnificationGesture()
            .onChanged(){ value in
                self.current = value
            }
            .onEnded { value in
                self.final = current * final
                current = 1
                if self.final > 4 {
                    self.tabCount += 1
                }
            }
        
        
        VStack(alignment: .leading) {
                
            if tabCount%2 == 0 {
                ComposeView(width: $width)
                    .onDisappear(){
                        self.final = 1
                    }
            }
            else{
                Text("测试")
                    .onDisappear(){
                        self.final = 1
                        self.width = 100
                        print(width,"width")
                    }
            }
            
        }
        .gesture(magnify)
        .onChange(of: final*current, perform: { value in
            self.width = final * current * 100
        })
        
//----------body----------
    }
}



struct TransitionView_Previews:PreviewProvider {
    static var previews: some View{
        ScrollViewReader { proxy in
            #if os(macOS)
            TransitionView()
                .environmentObject(ModelData())
                .environmentObject(ModelIndex())
                .environmentObject(YearNumbers())
                .environmentObject(GestureClass())
                .environmentObject(WindowWidth())
                .environmentObject(AnchorModel())
                .environmentObject(ProjectWdith())
                .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)
            #else
            TransitionView()
                .environmentObject(ModelData())
                .environmentObject(ModelIndex())
                .environmentObject(YearNumbers())
                .environmentObject(GestureClass())
                .environmentObject(WindowWidth())
                .environmentObject(AnchorModel())
                .environmentObject(ProjectWdith())
            #endif
        }
        
    }
}



