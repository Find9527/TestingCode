
import SwiftUI

struct ContentView: View {

    var body: some View {
            TransitionView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(minWidth: 800, idealWidth: 800, maxWidth: 2000, minHeight: 700, idealHeight: 700, maxHeight: 700, alignment: .center)
    }
}
