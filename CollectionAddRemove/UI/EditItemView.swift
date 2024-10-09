//
//  EditItemView.swift
//  CollectionAddRemove
//
//  Created by Eric Kampman on 10/9/24.
//

import SwiftUI

struct EditItemView: View {
	@Binding var collectionManager: CollectionManager
	@Bindable var item: Item
	@State var title = ""
	@State var instance = Int64(0)
	@State var showAlert: Bool = false
	@Environment(\.dismiss) private var dismiss

    var body: some View {
        Form {
			Section(header: Text("Edit Item")) {
				TextField("Title", text: $title)
				TextField("Instance", value: $instance, format: .number)
			}
			HStack {
				Spacer()
				Button("OK") {
					if item.title == title && item.instance == instance {
						print("No change")
						dismiss()
					} else if collectionManager.isDuplicate(title: title, instance: instance) {
						showAlert.toggle()
					} else {
						DispatchQueue.main.async() {
							item.title = title
							item.instance = instance
						}
						dismiss()
					}
				}
				.buttonStyle(BorderedButtonStyle())
				Button("Cancel") {
					dismiss()
				}
				.buttonStyle(BorderedButtonStyle())
				Spacer()
			}
		}
		.padding()
		.onAppear {
			title = item.title
			instance = item.instance
		}
		.alert(isPresented: $showAlert) {
			Alert(title: Text("Duplicate Item"), message: Text("This item already exists in the collection."))
		}
    }
}

#Preview {
	@Previewable @State var item = Item(title: "Item", instance: 1)
	@Previewable @State var collectionManager = CollectionManager()
	EditItemView(collectionManager: $collectionManager, item: item)
}
