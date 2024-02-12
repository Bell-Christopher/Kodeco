//
//  RealmMigrator.swift
//  PotionsMaster
//
//  Created by Christopher Bell on 12/02/2024.
//

import RealmSwift

enum RealmMigrator {
    
    static private func migrationBlock(
        migration: Migration,
        oldSchemaVersion: UInt64
    ) {
        if oldSchemaVersion < 1 {
            migration.enumerateObjects(ofType: Ingredient.className()) { _, newObject in
                newObject?["colorOption"] = ColorOptions.green
            }
        }
    }
    
    static var configuration: Realm.Configuration {
        Realm.Configuration(schemaVersion: 1, migrationBlock: migrationBlock)
    }
}
