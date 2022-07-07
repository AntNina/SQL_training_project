#CREATE OR REPLACE VIEW countries_info AS
	SELECT c.id as c_id,
		   c.country,
		   tc.c1 AS all_titles,
		   up.c2 AS all_users,
		   cr.c3 AS all_creators
	  FROM countries c
			   LEFT JOIN (SELECT count(title_id) AS c1,
								 country_id
							FROM title_country
						   GROUP BY country_id
						 ) AS tc ON c.id = tc.country_id
			   LEFT JOIN (SELECT count(user_id) AS c2,
								 country_id
							FROM user_profiles
						   GROUP BY country_id
						 ) AS up ON c.id = up.country_id
			   LEFT JOIN (SELECT count(id) AS c3,
								 country_id
							FROM creators
						   GROUP BY country_id
						 ) AS cr ON c.id = cr.country_id
	 ORDER BY
		 c.country;
		 
#CREATE OR REPLACE VIEW titles_and_countries AS
	SELECT t.id AS t_id,
		   t.title,
		   c.id AS c_id,
		   c.country
	  FROM titles t
			   JOIN title_country tc ON t.id = tc.title_id
			   JOIN countries c ON tc.country_id = c.id
	 ORDER BY
		 t.id;
		 
#CREATE OR REPLACE VIEW titles_and_companies AS
	SELECT t.id AS t_id,
		   t.title,
		   c.id AS comp_id,
		   c.company
	  FROM titles t
			   JOIN title_company tc ON t.id = tc.title_id
			   JOIN companies c ON tc.company_id = c.id
	 ORDER BY
		 t.id;
		 
#CREATE OR REPLACE VIEW titles_and_cast AS
	SELECT t.id AS t_id,
		   t.title,
		   r.id AS r_id,
		   r.role,
		   cr.id AS cr_id,
		   concat_ws(' ', cr.first_name, cr.last_name) AS name,
		   ti.release_date
	  FROM creators cr
			   INNER JOIN cast_and_crew cac ON cr.id = cac.creator_id
			   INNER JOIN titles t ON cac.title_id = t.id
			   INNER JOIN roles r ON cac.role_id = r.id
			   INNER JOIN title_info ti ON t.id = ti.title_id
	 ORDER BY
		 t.id;

#CREATE OR REPLACE VIEW titles_and_genres AS
	SELECT t.id AS t_id,
		   t.title,
		   g.id AS g_id,
		   g.genre,
		   g_relevancy(t.id, g.id) AS relevancy
	  FROM titles t
			   LEFT JOIN votes_on_genre vog ON t.id = vog.title_id
			   LEFT JOIN genres g ON vog.genre_id = g.id
	 GROUP BY
		 t.id, g.genre
	 ORDER BY
		 t.id, relevancy DESC;
		 
