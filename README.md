Install the yago dataset in this folder before running the files. Name it as yago_full_clean.tsv.

# Running the pig files
	To run the pig files ensure your pig installation is correct.
	Go into the pig folder and to run any file use the command
	pig -x local filename.pig

# Running the hive queries.
	Go into the hive folder and run the command:
	schematool -dbType derby -initSchema
	This will create a metastore_db folder.
	Now to use hive you can use the beeline interface:
	beeline -u jdbc:hive2://
	or
	run the hive files directly using
	beeline -u jdbc:hive2:// -f filename.hiveql
	Before running any files, run the init.hiveql to create the yago table.

	The queries for part B problem 1 are in A3-BP11.hiveql, and and A3-BP12.hiveql.
	The queries for part B problem 2 are in B1.hql, B2.hql and A3-BP23.hiveql.

	Before running them run A3-BP21.hiveql and A3-BP22.hiveql.
