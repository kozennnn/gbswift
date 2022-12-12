//
//  ContentView.swift
//  GBSwift
//
//  Created by Mathis HOUIS on 12/12/2022.
//

import SwiftUI
import UniformTypeIdentifiers

struct RomSelectionView: View {
    
    @State private var fileImporter: Bool = false
    
    var body: some View {
        VStack {
            Image(systemName: "gamecontroller")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Please select a ROM")
            Button() {
                fileImporter = true
            } label: {
                Text("Select ROM file...")
            }
        }
        .padding(32)
        .fileImporter(isPresented: $fileImporter, allowedContentTypes: [UTType(filenameExtension: "gb")!, UTType(filenameExtension: "GB")!]) { (res) in
            do {
                var romFile: URL = try res.get()
            } catch {
                print("An error happened while trying to load the ROM file.")
                print(error.localizedDescription)
            }
        }
    }
}

struct RomSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        RomSelectionView()
    }
}
