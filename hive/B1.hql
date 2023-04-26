SELECT hasgiven.subject AS Subject, hasgiven.object, livesin.object
FROM (
  SELECT *
  FROM yago_part_buck
  WHERE pred = '<hasGivenName>'
) AS hasgiven
JOIN (
  SELECT *
  FROM yago_part_buck
  WHERE pred = '<livesIn>'
) AS livesin
ON (hasgiven.subject = livesin.subject);