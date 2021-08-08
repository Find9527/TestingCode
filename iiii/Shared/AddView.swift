

import SwiftUI


struct AddView: View {
    @EnvironmentObject var modelindex:ModelIndex
    @Binding var ispresent:Bool
    @State var Xvalue:Int=0
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        List{
            Section{
                TextField("Index",value:self.$Xvalue,formatter:formatter)
            }
            Section{
                Button("添加"){
                    modelindex.addIndex(item: IndexOfList(id: UUID(), indexint: Xvalue))
                }
                Button("取消"){
                    self.ispresent=false
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    @State static var ispresent:Bool=false
    static var previews: some View {
        AddView(ispresent: self.$ispresent)
            .environmentObject(ModelIndex())
    }
}
