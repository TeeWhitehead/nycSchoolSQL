# NYC Student SATs
# All of the columns of the table
SELECT *
FROM nyc_schools;

# How many schools in each buorough?
SELECT borough, COUNT(school_name) AS num_schools
FROM nyc_schools
GROUP BY borough
ORDER BY num_schools DESC;

# Do we have scores for every school?
SELECT COUNT(school_name) AS schools, 
		COUNT(average_math) AS math, 
        COUNT(average_reading) AS reading, 
        COUNT(average_writing) AS writing
FROM nyc_schools;

# Average SAT score for each borough (Staten Island has only 9 schools)
SELECT borough, 
		ROUND(SUM(average_math + average_reading + average_writing) / COUNT(*)) AS avg_sat
FROM nyc_schools
GROUP BY borough
ORDER BY avg_sat DESC;

# Top 10 Schools based on average SAT
SELECT school_name, 
		SUM(average_math + average_reading + average_writing) AS avg_sat
FROM nyc_schools
GROUP BY school_name
ORDER BY avg_sat DESC
LIMIT 10;

