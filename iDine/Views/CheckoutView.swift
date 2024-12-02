

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order : Order
    
    //For Payent Options
    let paymentOptions = ["Cash", "Card", "iDine Points"]
    
    @State private var paymentType = "Cash"
    
    //For Card Details
    @State private var iDineIDDetailIsOn = false
    @State private var iDineID = ""
    
    //For Tip Section
    let tipAmounts = [10, 15, 20, 25, 0]
    @State private var tipValue = 15
    
    //For SuccessAlert
    @State private var paymentAlert = false
    
    var totalPrice : String {
        let total = order.total
        let tip = total / 100 * (tipValue)
        return (total + tip).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            //Select Payment Options
            Section{
                Picker("How Do You Want To Pay?", selection: $paymentType) {
                    ForEach(paymentOptions, id: \.self){
                        Text($0)
                    }
                }
                
                //Add iDineID Details
                Toggle("Add iDine ID Details", isOn: $iDineIDDetailIsOn)
                
                if iDineIDDetailIsOn == true {
                    TextField("Enter Your iDine Id", text: $iDineID)
                }
            }
            
            // Add Tip Amount
            Section("Add Tip?"){
                Picker("", selection: $tipValue) {
                    
                    ForEach(tipAmounts, id:\.self){
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            
            //Confirm order Button
            Section("Order Total \(totalPrice)") {
                Button("Confirm Order") {
                    paymentAlert.toggle()
                }
            }
            
        }
        .navigationTitle("Payments")
        .alert("", isPresented: $paymentAlert) {
            // add custom button if you want
        }message: {
            Text("Your Payment of \(totalPrice) is Successfull...Thank You!")
        }
    }
}

#Preview {
    //NavigationStack to get the exact look
    NavigationStack {
        CheckoutView()
            .environmentObject(Order())
    }
}
