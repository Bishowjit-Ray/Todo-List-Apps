//
//  TodoListApp.swift
//  TodoList
//
//  Created by Bishowjit Ray on 2/10/22.
//

import SwiftUI
/*
 MVVM Architecture

 Model - data point
 View - UI
 ViewModel - manages Models for view
 
 */
@main
struct TodoListApp: App {
  @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
           
        }
    }
}
