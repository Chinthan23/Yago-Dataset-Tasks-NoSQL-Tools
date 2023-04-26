triples= load '../yago_full_clean.tsv' using PigStorage(' ') AS (subject: chararray, predicate: chararray, object: chararray);
predicates= FOREACH triples GENERATE predicate;
predicates_grouped= GROUP predicates BY predicate;
predicate_counts = FOREACH predicates_grouped GENERATE group as predicate, COUNT(predicates) AS count;
predicate_counts_desc= ORDER predicate_counts BY count DESC;
top_three_predicates = LIMIT predicate_counts_desc 3;
store top_three_predicates INTO './top_three' USING PigStorage('\t','-schema');
cat ./top_three/part-r-00000