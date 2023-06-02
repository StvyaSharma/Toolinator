import SwiftUI

struct ConversionMainView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        ConversionSelectionView()
    }
}

struct ConversionMainView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionMainView()
    }
}
