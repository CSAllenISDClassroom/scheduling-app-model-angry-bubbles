/*
 VaporShell provides a minimal framework for starting Vapor projects.
 Copyright (C) 2021, 2022 CoderMerlin.com
 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.
 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */


import Vapor
import Fluent
import FluentMySQLDriver

/// This class provides the model for an Course
final public class Category : Content{

    public var id : Int
    public var name : String
    
    // Initialize course data information
    init(categoriesData: CategoriesData) throws { 
        self.id = categoriesData.id!
        self.name = try Self.validateName(name: categoriesData.name)
    }

    
    private static func validateName(name: String?) throws -> String {
        guard name == "Business & Industry" || name == "Arts & Humanities" || name == "Specialty Electives" || name == "Public Service" || name == "Core" || name == "STEM" else {
            return ""
        }

        guard let categoryString = name else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return categoryString  
    }
}
