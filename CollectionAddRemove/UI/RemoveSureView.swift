//
//  RemoveSureView.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

struct RemoveSureView: View {
	@Binding var item: Item?
	@Bindable var collectionManager: CollectionManager
	
	@Environment(\.dismiss) private var dismiss

    var body: some View {
		VStack {
			Text("Are you sure you want to delete this item?")
			
			HStack {
				Button("OK") {
					collectionManager.remove(item!)
					dismiss()
				}
				Button("Cancel") {
					dismiss()
				}
			}
		}
		.padding()
    }
}

#Preview {
	@Previewable @State var item: Item? = Item(title: "Preview", instance: 1)
	@Previewable @State var collectionManager = CollectionManager()
	RemoveSureView(item: $item, collectionManager: collectionManager)
}
