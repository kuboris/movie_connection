SELECT a.a_movie as source,
a.b_movie as target,
f0_,
b.maxed,
c.maxed2,
(f0_/(maxed*maxed)) as weight,
(f0_/(c.maxed2*c.maxed2)) as weight2,
(f0_/(maxed*maxed))*(f0_/(c.maxed2*c.maxed2)) as ranked
FROM [bookrecomedation:CSFD.movieOutput] as a
LEFT JOIN (
SELECT a_movie,sum(f0_) as maxed
FROM [bookrecomedation:CSFD.movieOutput] 
GROUP BY 1
--LIMIT 1000
) as b
ON a.a_movie = b.a_movie
LEFT JOIN (
SELECT b_movie,sum(f0_) as maxed2
FROM [bookrecomedation:CSFD.movieOutput] 
GROUP BY 1
--LIMIT 1000
) as c
ON a.b_movie = c.b_movie
WHERE a.a_movie <> a.b_movie
AND a.a_movie = 241059
--AND f0_ > 1000
ORDER BY 8 desc
--LIMIT 1000
