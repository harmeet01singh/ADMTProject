create table C_User (
    uemail varchar(50) primary key,
    username varchar(50) not null,
    employment varchar(30) not null,	/*Student, Intern, Employed*/
    past_qualification varchar(100) not null,		
    institution varchar(30) not null,
    img_path varchar(50) not null,
    contact_no int not null
)

create table Instructor (
    iemail varchar(50) primary key,
    iname varchar(50) not null,
    degree varchar(30) not null,	/*mba, phd, BE, BTech*/
    social_media varchar(50) not null,
    img_path varchar(50) not null,
    work_exp varchar(100) not null,
    contact_no int not null
)

create table university (
    uid int primary key IDENTITY(1,1),
    uname varchar(50) not null,
    repemail varchar(50) not null,
    repname varchar(100) not null,
    logo varchar(50) not null,
    info varchar(200) not null,
    contact_no int not null
)

create table moderator (
    memail varchar(50) primary key,
    mname varchar(100) not null,
    job_post varchar(50) not null,	/*Senior, Junior, Incharge*/
    img_path varchar(50) not null,
    contact_no int not null
)

create table Courses (
    courseid int primary key IDENTITY(1,1),
    iemail varchar(50) not null,
    uid int not null,
    cname varchar(50) not null,
    category varchar(20) not null,
    overview varchar(200) not null,
    duration int not null,		/*no of weeks*/
    curr_enroll int not null,/*i digit number*/
    ratings FLOAT not null,
)

ALTER TABLE Courses
   ADD CONSTRAINT FK_iemail FOREIGN KEY (iemail)
      REFERENCES Instructor (iemail)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

ALTER TABLE Courses
   ADD CONSTRAINT FK_uid FOREIGN KEY (uid)
      REFERENCES university (uid)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

create table user_material (
    courseid int not null,
    uemail varchar(50) not null,
    notes_link varchar(300),	/*tuple*/
    certificates_path varchar(100),
    grades int,		/*percentage*/
    status varchar(20) not null,	
    primary key(courseid,uemail)
)

ALTER TABLE user_material
   ADD CONSTRAINT FK_courseid FOREIGN KEY (courseid)
      REFERENCES Courses (courseid)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

ALTER TABLE user_material
   ADD CONSTRAINT FK_uemail FOREIGN KEY (uemail)
      REFERENCES C_User (uemail)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

create table forum(
    postid int primary key IDENTITY(1,1),
    memail varchar(50) not null,
    courseid int not null,
    uemail varchar(50) not null,
    pdate_time DATETIME not null,
    content varchar(200) not null,
    pstatus varchar(20) not null	/*resolved, pending, irrelevant*/
)

ALTER TABLE forum
   ADD CONSTRAINT FK_memail_forum FOREIGN KEY (memail)
      REFERENCES moderator (memail)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

ALTER TABLE forum
   ADD CONSTRAINT FK_courseid_forum FOREIGN KEY (courseid)
      REFERENCES Courses (courseid)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;

ALTER TABLE forum
   ADD CONSTRAINT FK_uemail_forum FOREIGN KEY (uemail)
      REFERENCES C_User (uemail)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;


create table course_weeks(
    courseid int not null,
    weeknum int not null,
    assignment_path varchar(100),
    solution_path varchar(100),
    topics varchar(100) not null,
    videos_path varchar(100),
    resources varchar(200)
    primary key(courseid,weeknum)
)

ALTER TABLE course_weeks
   ADD CONSTRAINT FK_courseid_course_weeks FOREIGN KEY (courseid)
      REFERENCES Courses (courseid)
      ON UPDATE CASCADE
      ON DELETE CASCADE
;
