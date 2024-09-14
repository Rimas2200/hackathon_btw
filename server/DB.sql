CREATE TABLE IF NOT EXISTS `user` (
	`user_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`login` varchar(255) NOT NULL UNIQUE,
	`password` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`role` varchar(255) NOT NULL DEFAULT ''student', 'employer', 'educational_institution'',
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE IF NOT EXISTS `employer` (
	`employer_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`company_name` varchar(255) NOT NULL,
	`contact_email` varchar(255) NOT NULL,
	`contact_phone` varchar(255) NOT NULL,
	PRIMARY KEY (`employer_id`)
);

CREATE TABLE IF NOT EXISTS `vacancy` (
	`vacancy_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`employer_id` int NOT NULL,
	`title` varchar(255) NOT NULL,
	`description` text NOT NULL,
	`responsibilities` text NOT NULL,
	`requirements` text NOT NULL,
	`positions_available` int NOT NULL,
	`salary` varchar(50) NOT NULL,
	`address` varchar(255) NOT NULL,
	`employment_type	` varchar(50) NOT NULL,
	`is_active` boolean NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	PRIMARY KEY (`vacancy_id`)
);

CREATE TABLE IF NOT EXISTS `student` (
	`student_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id	` int NOT NULL,
	`surname` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`patronymic` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone	` varchar(20) NOT NULL,
	PRIMARY KEY (`student_id`)
);

CREATE TABLE IF NOT EXISTS `resume` (
	`resume_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`student_id` int NOT NULL,
	`surname` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`patronymic` varchar(255) NOT NULL,
	`class` varchar(50) NOT NULL,
	`direction` varchar(255) NOT NULL,
	`education` text NOT NULL,
	`skills` text NOT NULL,
	`languages` text NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp NOT NULL,
	PRIMARY KEY (`resume_id`)
);

CREATE TABLE IF NOT EXISTS `educational_institution` (
	`institution_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`institution_name` varchar(255) NOT NULL,
	`contact_email` varchar(255) NOT NULL,
	`contact_phone` varchar(20) NOT NULL,
	PRIMARY KEY (`institution_id`)
);


ALTER TABLE `employer` ADD CONSTRAINT `employer_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);
ALTER TABLE `vacancy` ADD CONSTRAINT `vacancy_fk1` FOREIGN KEY (`employer_id`) REFERENCES `employer`(`employer_id`);
ALTER TABLE `student` ADD CONSTRAINT `student_fk1` FOREIGN KEY (`user_id	`) REFERENCES `user`(`user_id`);
ALTER TABLE `resume` ADD CONSTRAINT `resume_fk1` FOREIGN KEY (`student_id`) REFERENCES `student`(`id`);

ALTER TABLE `resume` ADD CONSTRAINT `resume_fk2` FOREIGN KEY (`surname`) REFERENCES `student`(`surname`);

ALTER TABLE `resume` ADD CONSTRAINT `resume_fk3` FOREIGN KEY (`name`) REFERENCES `student`(`name`);

ALTER TABLE `resume` ADD CONSTRAINT `resume_fk4` FOREIGN KEY (`patronymic`) REFERENCES `student`(`patronymic`);
ALTER TABLE `educational_institution` ADD CONSTRAINT `educational_institution_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`user_id`);