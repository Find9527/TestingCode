


import SwiftUI

struct OneView: View {
    @EnvironmentObject var model:ModelData
    var body: some View {
        HStack(spacing:0) {
            ForEach(0..<20) { item in
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: model.width, height: 40, alignment: .center)
                    .overlay(Text("\(item)").foregroundColor(.white))
                    .foregroundColor(.blue)
            }
        }
        .frame(height: 200)
        .border(Color.black)
    }
}

struct OneView_Previews: PreviewProvider {
    static var previews: some View {
        OneView()
            .environmentObject(ModelData())
    }
}
