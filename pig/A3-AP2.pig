Register A3-AP2.jar;
MyRecords = LOAD 'sample.txt' AS (name:chararray,rollno:chararray,emailid:chararray,groupid:int);
GroupedRecords = GROUP MyRecords By groupid;
store GroupedRecords into './groupedRecords' using PigStorage('\t','-schema');
AssignedProjectTool = FOREACH GroupedRecords GENERATE group AS GroupID, AssignRandomUDF() AS ProjectTool;
store AssignedProjectTool into './projectTool' using PigStorage('\t','-schema');
cat ./groupedRecords/.pig_header ./groupedRecords/part-r-00000 
cat ./projectTool/.pig_header ./projectTool/part-r-00000
