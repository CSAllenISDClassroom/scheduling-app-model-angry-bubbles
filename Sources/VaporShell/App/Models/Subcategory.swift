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
final public class Subcategory : Content{

    public var id : Int
    public var categoryId : Int
    public var name : String
    
    // Initialize course data information
    init(subcategoriesData: SubcategoriesData) throws { 
        self.id = subcategoriesData.id!
        self.categoryId = subcategoriesData.categoryId!
        self.name = try Self.validateName(name: subcategoriesData.name)
    }

    
    private static func validateName(name: String?) throws -> String {
        guard name == "Agriculture, Food & Natural Resources" || name == "Agriculture, Food & Natural Resources,Agriculture, Food & Natural Resources" || name == "Math,Agriculture, Food & Natural Resources" || name == "Band" || name == "Choir" || name == "Orchestra" || name == "Finance" || name == "Marketing" || name == "Finance,Business Management & Administration" || name == "Math,Finance" || name == "Business Management & Administration" || name == "Finance,Business Management & Administration,Marketing" || name == "Journalism" || name == "Specialty Electives" || name == "Theatre" || name == "Fine Arts Theory/History" || name == "Visual Arts" || name == "Theatre,Theatre" || name == "Hospitality & Tourism" || name == "Education & Training" || name == "LOTE" || name == "Health Science,Business Management & Administration" || name == "Health Science" || name == "Health Science,Science" || name == "Science" || name == "LOTE,LOTE" || name == "Arts, Audio/Video Technology & Communication" || name == "English" || name == "Law, Public Safety, Corrections & Security,Science" || name == "Law, Public Safety, Corrections & Security" || name == "Math" || name == "Health & Physical Education" || name == "Athletics,Athletics" || name == "Specialty Electives,Specialty Electives" || name == "Social Studies" || name == "Social Studies,Social Studies Electives" || name == "Architecture & Construction" || name == "Engineering,Information Technology" || name == "Computer Science,Engineering" || name == "Information Technology" || name == "Engineering" else {
            return ""
        }

        guard let subcategoryString = name else {
            throw Abort(.badRequest, reason: "Unable to bang")
        }

        return subcategoryString  
    }
}
