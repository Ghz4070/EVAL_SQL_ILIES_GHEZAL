INSERT INTO `eval_sql`.`student` (`id`, `firstname`, `lastname`) 
VALUES ('1', 'Olivier', 'Martin'), ('2', 'Pierre', 'Martin'), ('3', 'Jacques', 'Martin'), 
('4', 'Martin', 'François'), ('5', 'Jennifer', 'Garner');

INSERT INTO `eval_sql`.`year` (`id`, `label`) 
VALUES ('1', '\"First year (Bsc)\"'), ('2', '\"Second year (Bsc Hons)\"'), 
('3', '\"Third year (Msc)\"');

INSERT INTO `eval_sql`.`enroiment` (`year_id`, `student_id`, `from`, `to`) 
VALUES ('1', '1', '2015-01-01 00:00:00', '2015-12-31 00:00:00'), 
('2', '1', '2016-01-01 00:00:00', '2016-12-31 00:00:00'), ('3', '1', '2017-01-01 00:00:00', '2017-12-31 00:00:00'), 
('1', '2', '2015-01-01 00:00:00', '2015-12-31 00:00:00'), ('2', '2', '2016-01-01 00:00:00', '2016-12-31 00:00:00'), 
('3', '2', '2017-01-01 00:00:00', '2017-12-31 00:00:00'), ('2', '3', '2017-01-01 00:00:00', '2017-12-31 00:00:00');

INSERT INTO `eval_sql`.`module` (`id`, `name`, `year_id`) 
VALUES ('1', 'linux', '1'), ('2', 'docker', '1'), ('3', 'symfony', '2'), ('4', '\"asp.net core\"', '2'), 
('5', '\"aspect oriented architecture\"', '3'), ('6', '\"ddd and hexagonal architecture\"', '3');

INSERT INTO `eval_sql`.`assessment` (`student_id`, `module_id`, `attempted`, `passed`, `grade`) 
VALUES ('2', '1', '2024-01-01 00:00:00', '2025-01-01 00:00:00', '3'),('1', '2', '2014-01-01 00:00:00', '2015-01-01 00:00:00', '2'), 
('3', '4', '2016-01-01 00:00:00', '2017-01-01 00:00:00', '1'), ('4', '3', '2012-01-01 00:00:00', '2015-01-01 00:00:00', '3'), 
('5', '6', '2020-01-01 00:00:00', '2021-01-01 00:00:00', '2'),('1', '5', '2017-01-01 00:00:00', '2018-04-01 00:00:00', '1');
