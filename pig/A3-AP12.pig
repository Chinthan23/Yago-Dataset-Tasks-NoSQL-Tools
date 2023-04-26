triples= load '../yago_full_clean.tsv' using PigStorage(' ') AS (subject: chararray, predicate: chararray, object: chararray);
hasGiven= FILTER triples BY predicate=='<hasGivenName>';
livesIn= FILTER triples BY predicate=='<livesIn>';
livesInGrouped = Group livesIn BY subject;
livesInGroupedCounts = FILTER ( FOREACH livesInGrouped GENERATE group AS Name, COUNT(livesIn) AS counts )  BY counts>1 ;
joined = JOIN hasGiven BY subject, livesInGroupedCounts BY Name;
givenNames = FOREACH joined GENERATE object;
STORE givenNames INTO './givenNames' USING PigStorage('\t','-schema');
cat ./givenNames/part-r-00000