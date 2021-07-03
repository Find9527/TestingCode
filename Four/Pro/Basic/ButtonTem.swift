
import SwiftUI

struct Buttontemporary: View {
    @EnvironmentObject var amodel:ModelData
    @EnvironmentObject var modelindex:ModelIndex

    @Binding var ispresent:Bool
    
    var proxy:ScrollViewProxy
    
    var body: some View {
        HStack {
            Button("Button"){
                self.ispresent=true
            }
            .sheet(isPresented: $ispresent, content: {
                AddView(ispresent:$ispresent)
            })
            Button("开头77leading"){
                if amodel.list.count>=100{
                    print(amodel.list,
                          "-------",
                          amodel.list[9],
                          "-------",
                          modelindex.list)
                }
            }
        }
    }
}

struct Buttontemporary_Previews: PreviewProvider {
    static var previews: some View {
        Text("")
    }
}
