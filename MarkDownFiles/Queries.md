This file is for Queries for certian needs of the database

##This is the list of all the classes offered by allen high school for students that can be used in the search bar

SELECT DISTINCT shortDescription FROM CourseSectionsView;


##This is a filter that uses the boolean values (isAP, isIB, isOnLevel, etc) to list all classes in a certain section

| Boolean Value | Query |
| ------------- | ----- |
| isAP          | SELECT DISTINCT shortDescription, isAP FROM CourseSectionsView WHERE isApplication LIKE "1";| 
| isIB          | SELECT DISTINCT shortDescription, isIB FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isDualCredit  | SELECT DISTINCT shortDescription, isDualCredit FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isOnLevel     | SELECT DISTINCT shortDescription, isOnLevel FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isApplication |  SELECT DISTINCT shortDescription, isApplication FROM CourseSectionsView WHERE isApplication LIKE "1";|

##if a user wants to type something to search a class, these quereies are used for the name from the short and llong description

##if a user wants to search by campus they can also use a checkbox in our website to have this query added to the rest of their searches

##To display the amount of

##credits
