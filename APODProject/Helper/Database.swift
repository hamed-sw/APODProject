//
//  Database.swift
//  APODProject
//
//  Created by Hamed Amiry on 16.09.2021.
//

import UIKit
import SQLite3

class DatabaseFetch  {
    
    
    var db: OpaquePointer?
    // database name
    var path : String = "myDataBaseName.sqlite"
       init() {
           self.db = createDB()
           self.createTable()
       }
       
       func createDB() -> OpaquePointer? {
           let filePath = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathExtension(path)
           
           var db : OpaquePointer? = nil
           
           if sqlite3_open(filePath.path, &db) != SQLITE_OK {
               print("There is error in creating DB")
               return nil
           }else {
               print("Database has been created with path \(path)")
               return db
           }
       }
    

   
    func createTable()  {
        let query = "CREATE TABLE IF NOT EXISTS your_table_name(id INTEGER PRIMARY KEY AUTOINCREMENT,date TEXT, explanation TEXT,mediaType TEXT, url TEXT, list TEXT);"
        var statement : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(self.db, query, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Table creation success")
            }else {
                print("Table creation fail")
            }
        } else {
            print("Prepration fail")
        }
    }
    
    func insert(viewModel:Elements) {
        
            let query = "INSERT INTO your_table_name (id, date, explanation, mediaType, url, list) VALUES (?, ?, ?, ?, ?, ?);"
            
            var statement : OpaquePointer? = nil
            
            
            if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK{

                let date = viewModel.date
                let explanation = viewModel.explanation
                let mediaType = viewModel.mediaType
                let url = viewModel.url
                
                sqlite3_bind_text(statement, 1, (date) , -1 , nil)
                sqlite3_bind_text(statement, 2, (explanation) , -1 , nil)
                sqlite3_bind_text(statement, 3, (mediaType) , -1 , nil)
                sqlite3_bind_text(statement, 4, (url) , -1 , nil)
                

                
                if sqlite3_step(statement) == SQLITE_DONE {
                    print("Data inserted success")
                }else {
                    print("Data is not inserted in table")
                }
            } else {
              print("Query is not as per requirement")
            }
            
        }
        
        
    
    
    
}

