This file is for Queries for certian needs of the database

//This is the list of all the classes offered by allen high school for students that can be used in the search bar
SELECT DISTINCT shortDescription FROM CourseSectionsView;

//This is a filter that uses the boolean values (isAP, isIB, isOnLevel, etc) to list all classes in a certain section

//if a user wants to type something to search a class, these quereies are used for the name from the short and llong description

//if a user wants to search by campus they can also use a checkbox in our website to have this query added to the rest of their searches

//credits
