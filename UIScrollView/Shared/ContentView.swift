import SwiftUI


struct ContentView: View {
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            Group {
                Text("Current position: \(self.scrollOffset)")
                
                HStack(spacing: 30) {
                    Button("0pt") { self.scrollOffset = 0 }
                    
                    Button("100pt") { self.scrollOffset = 100 }
                    
                    Button("800pt") { self.scrollOffset = 800 }
                }
            }.font(.headline)

            ScrollView {
                ForEach(0..<100) { idx in
                    HStack {
                        Text("Row number \(idx)")
                        Spacer()
                    }
                }
            }
            .padding(10)
            .scrollOffset(self.$scrollOffset)
        }
    }
}

struct Content_Previews:PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
