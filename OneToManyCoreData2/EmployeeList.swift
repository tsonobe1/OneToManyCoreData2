//
//  EmployeeList.swift
//  OneToManyCoreData2
//
//  Created by 薗部拓人 on 2022/05/21.
//

import SwiftUI

struct EmployeeList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var department: Department
    
    var body: some View {
        VStack{
            Button("Add employee") {
                addEmployee()
            }
            List{
                ForEach(department.employee){ employee in
                    HStack{
                    Text(employee.name!)
                        Button("Edit") {
                            editEmployee(employee: employee)
                        }
                }
                }
                .onDelete(perform: deleteItems)
            }
        }
    }
    func addEmployee(){
        let newEmployee = Employee(context: viewContext)
        newEmployee.id = UUID()
        newEmployee.name = "test employee"
        newEmployee.employeeToDepartment = department
        
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving Depart value \(error.localizedDescription)")
        }
    }
    func editEmployee(employee: Employee){
        employee.name = "update employee"
        do{
            try viewContext.save()
        }
        catch{
            print("Error saving Depart value \(error.localizedDescription)")
        }
    }
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { department.employee[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
}

struct EmployeeList_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeList(department: Department())
    }
}
