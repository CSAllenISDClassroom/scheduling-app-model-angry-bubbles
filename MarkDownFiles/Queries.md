#Example Queries

##Classes at Allen High Schoo
###This is the list of all the classes offered by Allen High School (including STEAM) for students that can be used in the search bar. This shows the Short description only, most likely the one that users will see the most
SELECT DISTINCT shortDescription FROM CourseSectionsView;

##Boolean Values
###This is a filter that uses the boolean values (isAP, isIB, isOnLevel, etc) to list all classes in a certain section. If there is a 1 (or true) value in the spot, it selects the short descriptions of those only to show in the table.
| Boolean Value | Query |
| ------------- | ----- |
| isAP          | SELECT DISTINCT shortDescription, isAP FROM CourseSectionsView WHERE isApplication LIKE "1";| 
| isIB          | SELECT DISTINCT shortDescription, isIB FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isDualCredit  | SELECT DISTINCT shortDescription, isDualCredit FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isOnLevel     | SELECT DISTINCT shortDescription, isOnLevel FROM CourseSectionsView WHERE isApplication LIKE "1";|
| isApplication |  SELECT DISTINCT shortDescription, isApplication FROM CourseSectionsView WHERE isApplication LIKE "1";|

##Search Bar
###if a user wants to type something to search a class, these quereies are used for the name from the short and long description (ex: english)
SELECT description, shortDescription FROM CourseSectionsView WHERE description LIKE "%English%";
SELECT description, longDescription FROM CourseSectionsView WHERE description LIKE "%English%";

##Credits
###credits for each course offered by allen high school and steam (not sure what credits high or low means but here are all of the possibilities)
SELECT shortDescription, creditsLow, creditsHigh FROM CourseSectionsView WHERE creditsLow LIKE "0.5";
SELECT shortDescription, creditsLow, creditsHigh FROM CourseSectionsView WHERE creditsHigh LIKE "0.5";
SELECT shortDescription, creditsLow, creditsHigh FROM CourseSectionsView WHERE creditsLow LIKE "1.0";
SELECT shortDescription, creditsLow, creditsHigh FROM CourseSectionsView WHERE creditsHigh LIKE "1.0";

##Class Location and Period
###list of classes with their period and location (steam or ahs) (this one shows duplicates for courses and periods but I dont know how to group by 2 columns yet)
SELECT cs.shortDescription, csv.period, cs.locationName FROM CourseSectionsView cs JOIN Ready_CourseSections csv ON cs.shortDescription = csv.shortDescription LIMIT 20;
