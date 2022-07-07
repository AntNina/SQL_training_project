USE netflix_course_project;

DROP PROCEDURE IF EXISTS filmography;
DELIMITER //
CREATE PROCEDURE filmography(IN for_person_id INT)
BEGIN

	SELECT name, title, role, release_date
	  FROM titles_and_cast
	 WHERE cr_id = for_person_id
	 ORDER BY role, release_date DESC;
END//

DELIMITER ;

CALL filmography(3);