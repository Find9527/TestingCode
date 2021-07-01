


import SwiftUI

struct ForeachView: View {
    @EnvironmentObject var model:ModelData
    
    var foreachdelegate: HostingController?
    
    var body: some View {
        VStack {
            if model.count == 1 {
                OneView()
                    .onAppear(){
                        foreachdelegate?.isDidAppear()
                    }
            }
            else if model.count == 2 {
                TwoView()
                    .onAppear(){
                        foreachdelegate?.isDidAppear()
                    }
            }
            else if model.count == 3 {
                Text("kong")
                    .onAppear(){
                        foreachdelegate?.isDidAppear()
                    }
            }
        }
    }
}


protocol AppearDeligate {
    func isDidAppear()
}

















struct ForeachView_Previews: PreviewProvider {
    static var width:Int = 100
    static var previews: some View {
        ForeachView()
            .environmentObject(ModelData())
    }
}
