USE [master]
GO
/****** Object:  Database [TESTDB]    Script Date: 12/2/2013 2:43:42 AM ******/
CREATE DATABASE [TESTDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TESTDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TESTDB.mdf' , SIZE = 5184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TESTDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TESTDB_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TESTDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TESTDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TESTDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TESTDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TESTDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [TESTDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TESTDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TESTDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TESTDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TESTDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TESTDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TESTDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TESTDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TESTDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TESTDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TESTDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TESTDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TESTDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TESTDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TESTDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TESTDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TESTDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TESTDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TESTDB] SET RECOVERY FULL 
GO
ALTER DATABASE [TESTDB] SET  MULTI_USER 
GO
ALTER DATABASE [TESTDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TESTDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TESTDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TESTDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TESTDB', N'ON'
GO
USE [TESTDB]
GO
/****** Object:  User [ISC567User]    Script Date: 12/2/2013 2:43:42 AM ******/
CREATE USER [ISC567User] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[ISC567User]
GO
/****** Object:  Schema [ISC567User]    Script Date: 12/2/2013 2:43:43 AM ******/
CREATE SCHEMA [ISC567User]
GO
/****** Object:  StoredProcedure [dbo].[addgek2cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[addgek2cs]
(

@exk2Value nvarchar(4000)

)
as
begin
        begin try
                begin transaction

insert into ExK2(exk2Value)
values(@exk2Value)
 

commit transaction
        end try
        
        begin catch
                raiserror('Error adding role', 16, 1)
                rollback transaction
        end catch
        
end


GO
/****** Object:  StoredProcedure [dbo].[addgek3cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[addgek3cs]
(

@exk3Value nvarchar(4000)

)
as
begin
        begin try
                begin transaction

insert into ExK3(exk3Value)
values(@exk3Value)
 

commit transaction
        end try
        
        begin catch
                raiserror('Error adding role', 16, 1)
                rollback transaction
        end catch
        
end


GO
/****** Object:  StoredProcedure [dbo].[addgekcs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[addgekcs]
(

@exk1Value nvarchar(4000)

)
as
begin
        begin try
                begin transaction

insert into ExK1(exk1Value)
values(@exk1Value)
 

commit transaction
        end try
        
        begin catch
                raiserror('Error adding role', 16, 1)
                rollback transaction
        end catch
        
end


GO
/****** Object:  StoredProcedure [dbo].[AssignDodObjective]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROC [dbo].[AssignDodObjective]
	@key2id INT,
	@key1id INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN Assign_DodObjective
			INSERT INTO DodMapsCourseOutcome(key1id,key2id)
			VALUES (@key1id, @key2id) 
		COMMIT TRAN Assign_DodObjective
	END TRY
	BEGIN CATCH
		RAISERROR('An error occured in AssignDodObjective', 16, 1)
		ROLLBACK TRAN Assign_DodObjective
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[AssignSubSkill]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create PROC [dbo].[AssignSubSkill]
	@key3id INT,
	@key1id INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN Assign_SubSkill
			INSERT INTO SubskillMapsCourseOutcome(key1id, key3id)
			VALUES (@key1id, @key3id) 
		COMMIT TRAN Assign_SubSkill
	END TRY
	BEGIN CATCH
		RAISERROR('An error occured in AssignSubSkill', 16, 1)
		ROLLBACK TRAN Assign_SubSkill
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[coeditor]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[coeditor]
(
@exk1 as nvarchar,
@exk1ID as int
)
as
 begin
 
 update ExK1
 set ExK1.exk1Value = @exk1
 where ExK1.exk1ID=@exk1ID
select exk1ID, exk1Value 
from ExK1 

end


GO
/****** Object:  StoredProcedure [dbo].[coursetype]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----exec inserttext 1,1, 1





CREATE proc [dbo].[coursetype]
(
@text nvarchar(50)
)
as
begin

--SELECT crsoutcometext, key1id
--from tempCourseOutcome
--where crsoutcomeShort like @text+'.%'

Select key1id,crsoutcometext
     from key1
     where CourseTitle = @text
end


GO
/****** Object:  StoredProcedure [dbo].[deleteek2cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[deleteek2cs]
(
@exk2ID int
)
as
begin
delete ExK2
where ExK2.exk2ID=@exk2ID
end


GO
/****** Object:  StoredProcedure [dbo].[deleteek3cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[deleteek3cs]
(
@exk3ID int
)
as
begin
delete ExK3
where ExK3.exk3ID=@exk3ID
end


GO
/****** Object:  StoredProcedure [dbo].[deleteekcs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[deleteekcs]
(
@exk1ID int
)
as
begin
delete ExK1
where ExK1.exk1ID=@exk1ID
end


GO
/****** Object:  StoredProcedure [dbo].[editek2cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-----------ek2cs




create proc [dbo].[editek2cs]
(
@exk2ID int,

@exk2Value nvarchar(4000)

)
as 
begin

update ExK2
set ExK2.exk2Value=@exk2Value
where ExK2.exk2ID=@exk2ID

end


GO
/****** Object:  StoredProcedure [dbo].[editek3cs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-----------ek3cs




create proc [dbo].[editek3cs]
(
@exk3ID int,

@exk3Value nvarchar(4000)

)
as 
begin

update ExK3
set ExK3.exk3Value=@exk3Value
where ExK3.exk3ID=@exk3ID

end


GO
/****** Object:  StoredProcedure [dbo].[editekcs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[editekcs]
(
@exk1ID int,

@exk1Value nvarchar(4000)

)
as 
begin

update ExK1
set ExK1.exk1Value=@exk1Value
where ExK1.exk1ID=@exk1ID

end


GO
/****** Object:  StoredProcedure [dbo].[ekc]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


------------04092013-----------
create proc [dbo].[ekc]
as
begin

select exk1ID,exk1Value
from ExK1
end


GO
/****** Object:  StoredProcedure [dbo].[ekd]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[ekd]
as
begin

select exk2ID,exk2Value
from ExK2
end


GO
/****** Object:  StoredProcedure [dbo].[eks]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[eks]
as
begin

select exk3ID,exk3Value
from ExK3
end


GO
/****** Object:  StoredProcedure [dbo].[ExamConfDetails]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------

--- By Sundeep Golla 4/23/2013  

Create proc [dbo].[ExamConfDetails]
	@examid int
as
begin
	select scheduled_exam.examname,examdate,examstarttime,examlocation,
			(examdate - examstarttime) as timeremaining
	from scheduled_exam, Exam
	Where Scheduled_Exam.examid = @examid AND
	Exam.examid = scheduled_exam.examid
end


GO
/****** Object:  StoredProcedure [dbo].[GetAllScheduleExams]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------

--Created By Divya  4/23/2013

CREATE PROC [dbo].[GetAllScheduleExams]
@InstitutionID int
AS
BEGIN	
	--TRANSACTION
	SELECT SE1.scheduledexamid,SE1.examname,SE1.examlocation, SE1.examdate,exam_status.status
	FROM scheduled_exam AS SE1, institutionpeople, exam_status,exam
	WHERE  institutionpeople.institutionid =  @InstitutionID AND
		   institutionpeople.institutionpeopleid = SE1.institutionpeopleid AND
		   exam.examstatusid = exam_status.examstatusid AND
		   exam.examid = SE1.examid
END


GO
/****** Object:  StoredProcedure [dbo].[GetCourseTitle]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-----------------------



CREATE PROC [dbo].[GetCourseTitle]
(
@exk1ID int
)

AS
BEGIN
	
		SELECT DISTINCT CourseTitle
		  FROM key1, ExK1
		  where key1.exk1ID= @exk1ID
		   
		   

END	


GO
/****** Object:  StoredProcedure [dbo].[GetDodarea]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROC [dbo].[GetDodarea]
(
@exk2ID int
)
AS
BEGIN	
		SELECT DISTINCT dodareaid, Dodareatitle
		  FROM key2
		  where key2.exk2ID= @exk2ID
		   
		   
END		


GO
/****** Object:  StoredProcedure [dbo].[getDodCourse]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------- FROM siddartha

CREATE proc [dbo].[getDodCourse]
(
@key1id as int,
@dodareaid as nvarchar(100),
@exK2ID int
)

as
begin
 	select  key2id  , dodobjectivenumvalue,
		1 As checked 
         from key2          
         where  key2.key2id IN 
				 (select DodMapsCourseOutcome.key2id 
				  from DodMapsCourseOutcome
				  where DodMapsCourseOutcome.key2id=key2.key2id   
        			  and DodMapsCourseOutcome.key1id = @key1id)
        			  and dodareaid = @dodareaid
        			  and key2.exk2ID= @exK2ID
    	
    	Union
    

select  key2id  , dodobjectivenumvalue,
		0 As checked 
         from key2          
         where  key2.key2id not IN 
				 (select DodMapsCourseOutcome.key2id 
				  from DodMapsCourseOutcome
				  where DodMapsCourseOutcome.key2id=key2.key2id   
        			  and DodMapsCourseOutcome.key1id = @key1id)
        			  and dodareaid = @dodareaid
        			  and key2.exk2ID= @exK2ID
	   
  	order by checked desc 
  	
  	end


GO
/****** Object:  StoredProcedure [dbo].[GetExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Created by Uday Krishna Yarlagadda
--Altered by Mohammed Ali 05/07/2013
CREATE PROC [dbo].[GetExam]
AS
BEGIN 
--TRANSACTION
SELECT examid, 
      examname,Convert(VARCHAR(10),[examdate],101) AS examdate,
	  Convert(VARCHAR(5),[examstarttime],108) AS examstarttime,
	  examlocation
      FROM scheduled_exam
     ORDER BY examid ASC                  
END



GO
/****** Object:  StoredProcedure [dbo].[GetExamDetails]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[GetExamDetails]
@ExamID int
AS
BEGIN	
	--TRANSACTION
	SELECT exam.examname,
	       exam.exampurpose,
		   exam.duration
      FROM exam
     WHERE examid = @ExamID                    
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamDetailsForItemEditScreen]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetExamDetailsForItemEditScreen]
@ExamID int
AS
BEGIN	
	--TRANSACTION
SELECT examname,etype.description
FROM exam,exam_status,etype
WHERE exam.examstatusid=exam_status.examstatusid
      AND exam.etypeid=etype.etypeid
	  AND examid = @ExamID                    
END

GO
/****** Object:  StoredProcedure [dbo].[GetExamDetailsForItemScreen]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetExamDetailsForItemScreen]
@ExamID int
AS
BEGIN	
	--TRANSACTION
SELECT examname,etype.description,exam_status.status
FROM exam,exam_status,etype
WHERE exam.examstatusid=exam_status.examstatusid
      AND exam.etypeid=etype.etypeid
	  AND examid = @ExamID                    
END

GO
/****** Object:  StoredProcedure [dbo].[GetExamDuration]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GetExamDuration]
@ExamID INT
AS
BEGIN		
		SELECT duration
		  FROM exam
		 WHERE examid = @ExamID
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamInfo]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetExamInfo]
@ExamID int
AS
BEGIN	
	--TRANSACTION
	SELECT exam.examid, 
	       exam.examname
      FROM exam
     WHERE examid = @ExamID                  
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamItem]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamItem]
@examid INT
AS
BEGIN		
		SELECT [examitemid] As Item,
		[examid] As #    
      ,Courseid AS k1
      ,dodareaid AS k2
      ,skillsid AS k3
      ,[questionobjective] As QuestionObjective
      
  FROM [TESTDB].[dbo].[examitem], key1, key2, key3
  Where key1.key1id=examitem.key1id AND
        key2.key2id=examitem.key2id AND
		key3.key3id=examitem.key3id
		
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamItemByExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamItemByExam]
@examid INT
AS
BEGIN		
		SELECT [examitemid] As Item  
      , crsoutcometext + '#' + dodobjectivenumvalue + '#' + SubskillTitle AS QuestionType
      ,[questionobjective] As QuestionObjective
      
  FROM [TESTDB].[dbo].[examitem], key1, key2, key3
  Where key1.key1id=examitem.key1id AND
        key2.key2id=examitem.key2id AND
		key3.key3id=examitem.key3id AND
		examitem.examid = @examid	
END

GO
/****** Object:  StoredProcedure [dbo].[GetExamItemForEdit]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetExamItemForEdit]
@examid INT
AS
BEGIN		
	SELECT [examitemid]
      ,[examid]
      ,[examname]
      ,examitem.[key1id]
      ,examitem.[key2id]
      ,examitem.[key3id]
      ,[questionobjective]
      ,[stem]
      ,[destractor1]
      ,[destractor2]
      ,[destractor3]
      ,[destractor4]
      ,[correctanswer]
  FROM [dbo].[examitem], key1, key2, key3
  Where key1.key1id=examitem.key1id AND
        key2.key2id=examitem.key2id AND
		key3.key3id=examitem.key3id
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetExamList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[GetExamList]
@InstitutionID INT
as
begin		
		SELECT e.examid,
		       i.institutionid,
			   e.examname,
			   exampurpose,      
			   duration
		  FROM exam e,
		       developer a,
		       examproviderstaff m,
		       person p,
		       institution i
		 WHERE e.examid = a.examid
		   AND a.examproviderstaffid = m.examproviderstaffid
		   AND m.personid = p.personid
		   AND p.institutionid = i.institutionid 
		   AND i.institutionid = @InstitutionID
end


GO
/****** Object:  StoredProcedure [dbo].[GetExamListInfo]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetExamListInfo]
@ExamID INT
AS
BEGIN		
		SELECT examname,
		       exampurpose,
			   etypeid,
			   duration
		  FROM exam
		 WHERE examid = @ExamID
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamProviderPeopleByProviderID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GetExamProviderPeopleByProviderID]
		@providerid int
AS
BEGIN
		select providerid,
		       isEPSA,
			   isDeveloper
			   
		from examproviderstaff
		where providerid = @providerid
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamPurpose]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetExamPurpose]
@ExamID INT
AS
BEGIN		
		SELECT exampurpose
		  FROM exam
		 WHERE examid = @ExamID
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamsForRoster]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------



CREATE PROCEDURE [dbo].[GetExamsForRoster]

AS

BEGIN


SELECT examid, examname, examdate
 

FROM scheduled_exam se, roster r
 

WHERE se.scheduledexamid = r.scheduledexamid AND
 

r.status = 'Completed'
 
END


GO
/****** Object:  StoredProcedure [dbo].[GetExamTakersList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------
----Created by Divya - April 23, 2013

CREATE PROCEDURE [dbo].[GetExamTakersList]
@scheduledexamid int
AS
BEGIN
SELECT roster.takerid, (person.firstname + ' ' + person.lastname) AS Name, roster.status, roster.score
FROM roster,taker,person
WHERE scheduledexamid = @scheduledexamid AND
		roster.takerid = taker.takerid AND
		taker.personid = person.personid
END


GO
/****** Object:  StoredProcedure [dbo].[GetFtpLocation]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetFtpLocation]
as
begin

	select ftp_poll_directory
	  from ftp_control

end


GO
/****** Object:  StoredProcedure [dbo].[GetInProgressScheduleExams]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Updated By Divya  4/23/2013

CREATE PROC [dbo].[GetInProgressScheduleExams]
@InstitutionID int
AS
BEGIN	
	--TRANSACTION
	SELECT SE1.scheduledexamid,SE1.examname,SE1.examlocation, SE1.examdate,exam_status.status
	FROM scheduled_exam AS SE1, institutionpeople, exam_status,exam
	WHERE   institutionpeople.institutionid =  @InstitutionID AND
			institutionpeople.institutionpeopleid = SE1.institutionpeopleid AND
			exam.examstatusid = exam_status.examstatusid AND
			exam.examid = SE1.examid AND
			exam_status.status = 'InProgress'                
END


GO
/****** Object:  StoredProcedure [dbo].[GetInstitutionName]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetInstitutionName]
@InstitutionID int
AS
BEGIN
	
		SELECT name
		  FROM institution
		 WHERE institutionid = @InstitutionID

END				


GO
/****** Object:  StoredProcedure [dbo].[GetInstitutionNames]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetInstitutionNames]
AS
BEGIN
	
		SELECT institutionid, 
		       name
		  FROM institution
		  ORDER BY name

END				


GO
/****** Object:  StoredProcedure [dbo].[GetInstitutionPeopleByPersonID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[GetInstitutionPeopleByPersonID]
		@personid int
AS
BEGIN
		select personid,
		       isISA,
			   isProctor,
			   isReports
		from institutionpeople
		where personid = @personid
END


GO
/****** Object:  StoredProcedure [dbo].[GetInstitutionStaffByInstitutionID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetInstitutionStaffByInstitutionID]
     @institutionid int
AS
BEGIN
     select person.personid,
	        person.lastname,
            person.firstname,
            institutionpeople.isISA,
	        institutionpeople.isProctor,
	        institutionpeople.isReports,
			person.institutionid
     from person,
          institutionpeople
     where person.personid = institutionpeople.personid AND
	       person.institutionid = @institutionid
	 ORDER BY person.lastname
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonIDByEmail]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetPersonIDByEmail]
@email as nvarchar(50)
AS
BEGIN
      select personid
	  from person
	  where email = @email
END


GO
/****** Object:  StoredProcedure [dbo].[GetProviderNames]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetProviderNames]
AS
BEGIN
        SELECT providerid,
		       name
		FROM provider
		ORDER BY name
END


GO
/****** Object:  StoredProcedure [dbo].[GetProviderProfileByID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetProviderProfileByID]
@providerid int
AS
BEGIN
         SELECT providerid,
		        isDeveloper,
				isEPSA
			--	,isProctor,
			--	isStaff
			
		 FROM examproviderstaff
		 WHERE providerid = @providerid
END


GO
/****** Object:  StoredProcedure [dbo].[GetRosterList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRosterList]
	@PersonID INT
AS
BEGIN
	SELECT se.examid, examname, r.status, 
		   Convert(VARCHAR(10),[examdate],101) AS examdate, 
		   Convert(VARCHAR(5),[examstarttime],108) AS examstarttime, examlocation, score
FROM Roster r 
	 inner join scheduled_exam se  on r.scheduledexamid = se.scheduledexamid
	 inner join taker t on r.takerid = t.takerid
	 inner join person p on p.personid = t.personid
Where p.personid = @PersonID AND
	  r.status = 'Completed' OR
	  r.status = 'Scheduled'
END


GO
/****** Object:  StoredProcedure [dbo].[GetScheduleExambyID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Created by Mohammed Ali
CREATE PROC [dbo].[GetScheduleExambyID]
@examid AS int
AS
BEGIN 
--TRANSACTION
SELECT examid, 
      examname,Convert(VARCHAR(10),[examdate],101) As ExamDate,
	  Convert(VARCHAR(5),[examstarttime],108) AS Starttime,
	  examlocation
      FROM scheduled_exam
 where examid = @examid                 
END

GRANT EXECUTE ON GetScheduleExambyID TO ISC567User


GO
/****** Object:  StoredProcedure [dbo].[GetScheduleExamInfo]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetScheduleExamInfo]
@InstitutionID int,
@scheduledexamid int
AS
BEGIN	
	--TRANSACTION
	SELECT SE1.scheduledexamid,SE1.examid,SE1.examname,SE1.examlocation, SE1.examdate,exam_status.status, exam.duration,SE1.examstarttime
	FROM scheduled_exam AS SE1, institutionpeople, exam_status,exam
	WHERE  institutionpeople.institutionid =  @InstitutionID AND
		   institutionpeople.institutionpeopleid = SE1.institutionpeopleid AND
		   exam.examstatusid = exam_status.examstatusid AND
		   exam.examid = SE1.examid AND
		   SE1.scheduledexamid = @scheduledexamid
END


GO
/****** Object:  StoredProcedure [dbo].[getSkillCourse]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[getSkillCourse]
(
@key1id as int,
@SkillsID as nvarchar(100),
@exK3ID int

)
as
begin
 	select  key3id  , SubskillTitle,
		1 As checked 
         from key3         
         where  key3.key3id IN 
				 (select  SubskillMapsCourseOutcome.key3id
				  from SubskillMapsCourseOutcome
				  where SubskillMapsCourseOutcome.key3id=key3.key3id   
        			  and SubskillMapsCourseOutcome.key1id = @key1id)
        			  and key3.SkillsID = @SkillsID
        			  and key3.exk3ID = @exK3ID
        			  
   
    	Union
    

select  key3id   , SubskillTitle,
		0 As checked 
         from key3          
         where  key3.key3id not IN 
				 (select SubskillMapsCourseOutcome.key3id
				  from SubskillMapsCourseOutcome
				  where SubskillMapsCourseOutcome.key3id=key3.key3id   
        			  and SubskillMapsCourseOutcome.key1id =@key1id)
        			  and key3.SkillsID = @SkillsID
        			  and key3.exk3ID = @exK3ID
 	   
  	order by checked desc 
  	
  	end


GO
/****** Object:  StoredProcedure [dbo].[GetSkillsname]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[GetSkillsname]
(
@exk3ID int
)
As
Begin
		  SELECT DISTINCT SkillsID, SkillsName
		  FROM key3
		  where key3.exk3ID= @exk3ID
		       
       
End



GO
/****** Object:  StoredProcedure [dbo].[GetSVTable]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[GetSVTable] 
as
begin

        select * 
          from svtable
end


GO
/****** Object:  StoredProcedure [dbo].[GetUserProfile]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[GetUserProfile] 
@username nvarchar(20),
@password nvarchar(20)
AS
BEGIN
         SELECT personid,
		        institutionid,
		        firstname,
				lastname,
				email,
				isTaker,
				isProvider,
				isInstitution,
				isSA
		 FROM person
		 WHERE username = @username AND
		       password = @password
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserProfileByID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------- SPROC April 16, 2013 -----------

------------------- By Greg 4/21/2013 --------------

------------------ Altered By Ali 4/24/2013 ----------

CREATE PROC [dbo].[GetUserProfileByID]
@personid int
AS
BEGIN
         SELECT personid,
		        institutionid,
				username,
				password,
		        firstname,
				lastname,
				address1,
				address2,
				city,
				st,
				zip,
				phonenumber1,
				email,
				isTaker,
				isProvider,
				isInstitution,
				isSA
		 FROM person
		 WHERE personid = @personid
END


GO
/****** Object:  StoredProcedure [dbo].[InsertExamDetails]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[InsertExamDetails]
@Name 				nvarchar(100), 
@ExamPurpose 		nvarchar(512),
@EtypeID 			int, 
@Duration 			decimal
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		INSERT INTO exam
		(
		  examname,
		  exampurpose,
		  etypeid,
		  duration
		)
		VALUES
		(
		  @Name,
		  @ExamPurpose,
		  @EtypeID,
		  @Duration
		)    
		
		COMMIT TRANSACTION
			   
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : All Exam Data Inserted'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[InsertPerson]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------- FROM Matt

CREATE PROCEDURE [dbo].[InsertPerson]
--@personid			int, 
@firstname 		   nvarchar(512),
@lastname			nvarchar(512), 
@address1 			nvarchar(512),
@address2			nvarchar(512),
@city				nvarchar(512),
@st					nvarchar(512),
@zip                nvarchar(512),
@username           nvarchar(512),
@password           nvarchar(512),
@dob                Date,
@phonenumber1		nvarchar(15),
@phonenumber1type    nvarchar(50),
@phonenumber2		nvarchar(15),
@phonenumber2type    nvarchar(50),
@email              nvarchar(200)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		INSERT INTO person
		(
		  --personid,
		  firstname,
		  lastname,
		  address1,
		  address2,
		  city,
		  st,
		  zip,
		  username,
		  password,
		  dob,
		  phonenumber1,
		  phonenumber1type,
		  phonenumber2,
		  phonenumber2type,
		  email

		)
		VALUES
		(
		  --@personid,
		  @firstname,
		  @lastname,
		  @address1,
		  @address2,
		  @city,
		  @st,
		  @zip,
		  @username,
		  @password,
		  @dob,
		  @phonenumber1,
		  @phonenumber1type,
		  @phonenumber2,
		  @phonenumber2type,
		  @email	
		)    
		
		COMMIT TRANSACTION
			   
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : All Exam Data Inserted'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[InsertScheduleExamDetails]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[InsertScheduleExamDetails]
@examid int,
@examname nvarchar(100),
@examdate datetime,
@examstarttime datetime,
@examendtime datetime,
@examlocation nvarchar(100),
@institutionpeopleid int
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		INSERT INTO scheduled_exam
		(
		  examid,
		  examname,
		  examstarttime,
		  examendtime,
		  examdate,
		  examlocation,
		  institutionpeopleid 
		)
		VALUES
		(
		  @examid,
		  @examname,
		  @examstarttime,
		  @examendtime,
		  @examdate,
		  @examlocation,
		  @institutionpeopleid 
		)    
		
		COMMIT TRANSACTION
			   
	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : All Schedule Exam Data Inserted'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[InsertScheduleExamForTaker]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertScheduleExamForTaker]
@PersonID INT,
@examname nvarchar(128),
@status nvarchar(50)
as
begin
   
declare @takerid int
set @takerid = (select taker.takerid
               from taker
               where taker.personid=@PersonID)

declare @scheduleexamid int
set @scheduleexamid=  (select scheduledexamid 
                       from scheduled_exam
                       where scheduled_exam.examname=@examname) 
if (@status='Scheduled') 
		Insert Into roster
		(scheduledexamid,takerid,rosterstatusid,status)
		VALUES
		(@scheduleexamid,@takerid, 1,@status)
end

GRANT EXECUTE ON InsertScheduleExamForTaker TO ISC567User


GO
/****** Object:  StoredProcedure [dbo].[inserttext]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----exec getDodCourse 1,1, 1
-- inserttext repeated
create proc [dbo].[inserttext]
(
@exk1ID int,
@exk2ID int,
@exk3ID int
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN insert_text


insert into etype (description, exk1ID, exk2ID, exk3ID, exk1Value, exk2Value, exk3Value)
 

select Exk1.exk1Value+' '+Exk2.exk2Value+''+Exk3.exk3Value,exk1ID, exk2ID, exk3ID, 
		  Exk1.exk1Value, Exk2.exk2Value, Exk3.exk3Value
from Exk1, Exk2, Exk3
where Exk1.exk1ID= @exk1ID and Exk2.exk2ID= @exk2ID and Exk3.exk3ID=@exk1ID 

COMMIT TRAN insert_text
	END TRY
	BEGIN CATCH
		RAISERROR('Exam Type exists', 16, 1)
		ROLLBACK TRAN insert_text
		END CATCH
end

GRANT EXECUTE ON inserttext TO ISC567User


GO
/****** Object:  StoredProcedure [dbo].[Listek2typeid]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












create proc [dbo].[Listek2typeid]
(
@exk2ID int
)
as
begin

select exk2Value
from ExK2
where ExK2.exk2ID=@exk2ID
end



GO
/****** Object:  StoredProcedure [dbo].[Listek3typeid]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create proc [dbo].[Listek3typeid]
(
@exk3ID int
)
as
begin

select exk3Value
from ExK3
where ExK3.exk3ID=@exk3ID
end



GO
/****** Object:  StoredProcedure [dbo].[Listektypeid]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[Listektypeid]
(
@exk1ID int
)
as
begin

select exk1Value
from ExK1
where ExK1.exk1ID=@exk1ID
end


GO
/****** Object:  StoredProcedure [dbo].[ListKey1]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListKey1]
AS
(
SELECT key1id, crsoutcometext, courseid
FROM key1 
)

GO
/****** Object:  StoredProcedure [dbo].[ListKey2]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListKey2]
@key1id AS INT
AS
(
SELECT k.key2id, k.dodobjectivenumvalue, dodobjectivenum
FROM key2 k
INNER JOIN CrsOutcome_maps_DODobjective a on a.Key2ID = k.key2id
WHERE a.Key1ID = @key1id
)


GO
/****** Object:  StoredProcedure [dbo].[ListKey3]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListKey3]
@key1id AS INT
AS
(
SELECT k.key3id, k.SubskillTitle, SkillsID
FROM key3 k
INNER JOIN CrsOutcome_maps_SubSkill a on a.Key3ID = k.key3id
WHERE a.Key1ID = @key1id
)

GO
/****** Object:  StoredProcedure [dbo].[MapKey1Key2_CrsOutcome_DOD]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------


-- These two sprocs help us understand the relationship of the values between  {Key1 & Key2} and {Key1 & Key3}
-- and also helped us create table CrsOutcome_maps_DODobjective & CrsOutscome_maps_SubSkill
-- ISC 567 -November 20,2013



CREATE PROCEDURE [dbo].[MapKey1Key2_CrsOutcome_DOD]
AS
(
Select  n13.key1id as Key1ID, 
		n.key2id as Key2ID, 
		m.crsoutcomenum as crsoutcomenum,
		m.crsShortOutcome,
		m.crsoutcometext, 
		n.dodobjectivenum, 
		n.dodobjectivenumvalue

From MapKey1Key2 m

full outer join NewMap12 n on n.dodobjectiveNum = m.dodobjectivenum
left outer join MapKey1Key3 m13 on m.crsoutcomenum = m13.crsoutcomenum
left outer join NewMap13 n13 on m.crsoutcomenum = n13.crsoutcomenum 

--Order by  n.key2id
)


GO
/****** Object:  StoredProcedure [dbo].[MapKey1Key3_CrsOutcomeSubSkill]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[MapKey1Key3_CrsOutcomeSubSkill]
As
(
Select  n.key1id as Key1ID, 
		key3.key3id as Key3ID, 
		n.crsoutcomenum as crsoutcomenum, 
		n.crsoutcometext, 
		m.subskilltitle
		
From MapKey1Key3 m

left outer join   NewMap13 n on n.crsoutcomenum = m.crsoutcomenum 
inner join key3 on key3.SubskillTitle = m.subskilltitle 
GROUP BY  n.key1id, key3.key3id, n.crsoutcomenum, n.crsoutcometext, m.subskilltitle
--ORDER BY n.key1id
)

GO
/****** Object:  StoredProcedure [dbo].[ResetIsInstitution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE procedure [dbo].[ResetIsInstitution]
@personid	 	int

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE person
	       SET isInstitution = 0
	     WHERE personid = @personid			   
			   
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Reset IsInstitution'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[ResetPermissions]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create procedure [dbo].[ResetPermissions]
@personid	 int

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE institutionpeople
	       SET institutionid = 0,
			   isISA = 0,
			   isProctor = 0,
			   isReports = 0
	     WHERE personid = @personid			   
			   
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Reset Permissions'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[ScheduleExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create proc [dbo].[ScheduleExam]
@examname nvarchar(100),
@examdate datetime,
@examstarttime datetime,
@examlocation nvarchar(100)
as
begin
update scheduled_exam 
  set examstarttime=@examstarttime,examdate=@examdate,examlocation=@examlocation
  where examname=@examname
  end


GO
/****** Object:  StoredProcedure [dbo].[sp_AddorEditExamProviderStaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************************/

	
CREATE PROCEDURE [dbo].[sp_AddorEditExamProviderStaff]
	@examproviderstaffid [int] ,
	@providerid [int],
	@personid [int],
	@isEPSA [bit],
	@isdeveloper [bit]
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @examproviderstaffid = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertExamProviderStaff

				-- Insert into person table
				INSERT INTO examproviderstaff
				(providerid, personid, isEPSA, isdeveloper)
				
				VALUES
				(@providerid, @personid, @isEPSA, @isdeveloper)
				
			COMMIT TRANSACTION InsertExamProviderStaff

		END TRY

		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertExamProviderStaff'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH

	END
	ELSE

		BEGIN TRY
			BEGIN TRANSACTION UpdateExamProviderStaff

				
				UPDATE dbo.examproviderstaff

				SET
					 providerid = @providerid, 
					 personid = @personid, 
					 isEPSA = @isEPSA, 
					 isdeveloper = @isdeveloper

				WHERE examproviderstaffid = @examproviderstaffid

				

			COMMIT TRANSACTION UpdateExamProviderStaff
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdatePerson'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_AddorUpdateExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddorUpdateExam]
	@examid INT,
	@etypeid INT,
	@providerid INT,
	@examname VARCHAR(50),
	@exampurpose nvarchar(512),
	@duration Decimal
	AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @examid = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION Insertexam

				-- Insert into 
				INSERT INTO dbo.exam(etypeid, providerid, examname,exampurpose,duration, examstatusid)
				     VALUES (@etypeid, @providerid, @examname,@exampurpose,@duration, 1)
			COMMIT TRANSACTION InsertProvider
		END TRY

		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Insertexam'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH

	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION Updateexam

				UPDATE dbo.exam
				SET
					etypeid=@etypeid,
					providerid = @providerid,
					examname=@examname,
					exampurpose=@exampurpose,
					duration= @duration,
					examstatusid = 1
				WHERE examid =  @examid
									
			COMMIT TRANSACTION Updateexam
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Updateexam'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END

GO
/****** Object:  StoredProcedure [dbo].[sp_AddorUpdateProvider]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddorUpdateProvider]
	@providerid INT,
	@name [nvarchar](200),
	@address1 [nvarchar](50),
	@address2 [nvarchar](50),
	@city [nvarchar](20),
	@st [nvarchar](50),
	@zip [nvarchar](20),
	@country [nvarchar](20),
	@weburl [nvarchar](50),
	@isdeleted bit,
    @isaccredited bit,
	@createdate [datetime],
	@createdbywhom [int],
	@modifieddate [datetime],
	@modifiedbywhom [int]
	
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @providerId = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertProvider

				-- Insert into PROVIDER table
				INSERT INTO dbo.provider(
					 name, address1, address2, city, st, zip, country,
					 weburl, createdate, createdbywhom, 
					 modifieddate, modifiedbywhom)


				VALUES
					 (@name, @address1, @address2, @city, @st, @zip, @country, 
					 @weburl,  @createdate, @createdbywhom, 
					 @modifieddate, @modifiedbywhom
					)
			COMMIT TRANSACTION InsertProvider
		END TRY

		

		-- string userName,
		-- userName= (select login from svtable)







		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertProvider'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH

	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdateProvider

				
				UPDATE dbo.provider
				SET
					 name = @name, 
					 address1 = @address1, 
					 address2 = @address2,
					 city = @city, 
					 st = @st, 
					 zip = @zip,
					 country = @country, 
					 weburl = @weburl, 
					 isdeleted = @isdeleted,
					 isaccredited = @isaccredited, 
					 createdate = @createdate, 
					 createdbywhom = @createdbywhom, 
					 modifieddate = @modifieddate,
					 modifiedbywhom = @modifiedbywhom

				WHERE providerID =  @providerId
									

			
			COMMIT TRANSACTION UpdateProdiver
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateProvider'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_AddorUpdateProviderStaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddorUpdateProviderStaff]
	@examProviderStaffId INT,
	@providerid INT,
	@personid INT,
	@isEPSA [bit],
	@isdeveloper [bit]
	
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @examProviderStaffId = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertProvider

				-- Insert into PROVIDER table
				INSERT INTO dbo.examproviderstaff(providerid, personid, isEPSA, isdeveloper)
				     VALUES (@providerid, @personid, @isEPSA, @isdeveloper)
			COMMIT TRANSACTION InsertProvider
		END TRY

		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertProvider'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH

	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdateProvider

				UPDATE dbo.examproviderstaff
				SET
					providerid = @providerid,  
					isEPSA = @isEPSA, 
					isdeveloper = @isdeveloper
				WHERE examproviderstaffid =  @examProviderStaffId
									
			COMMIT TRANSACTION UpdateProdiver
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateProvider'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteItemById]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteItemById]
	 @examitemid INT
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)

	BEGIN TRY
		BEGIN TRANSACTION DeleteExamItem

			-- update examitem table
			DELETE FROM dbo.examitem
			WHERE
				examitemid = @examitemid

		COMMIT TRANSACTION DeleteExamItem
	END TRY
	BEGIN CATCH
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : DeleteExamItem'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePersonById]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_DeletePersonById]
	 @personId INT
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)

	BEGIN TRY
		BEGIN TRANSACTION DeletePerson

			-- update person table
			UPDATE dbo.person
			SET
				isDeleted = 1
			WHERE
				personid = @personId

		COMMIT TRANSACTION DeletePerson
	END TRY
	BEGIN CATCH
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : DeletePerson'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetAllExamsByInstitution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetAllExamsByInstitution]
	@institutionId INT
AS
BEGIN

    SELECT
		 se.scheduledexamid
		,se.examname
		,se.examlocation
		,examdate = CAST(se.examdate AS date)
		,examtime = CONVERT(VARCHAR(8),se.examstarttime,108) + '  to ' + CONVERT(VARCHAR(8),se.examendtime,108)
		,es.[status]
	FROM
		exam e
			INNER JOIN exam_status es ON es.examstatusid = e.examstatusid
			LEFT JOIN scheduled_exam se ON se.examid = e.examid
			LEFT JOIN institutionpeople ip ON ip.institutionpeopleid = se.institutionpeopleid
	WHERE
	    ip.institutionid = @institutionId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetAnswer]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetAnswer]
	 @examitemid INT,
	 @rosterid INT
AS
BEGIN
    SELECT 	examitemid, 
			rosterid,
			answervalue			 
	FROM 
			Answer
	WHERE 
			examitemid = @examitemid
		AND rosterid = @rosterid
END

GRANT EXECUTE ON [sp_GetAnswer] TO ISC567User


GO
/****** Object:  StoredProcedure [dbo].[sp_GetETypeExamInfo]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetETypeExamInfo]	
AS
BEGIN

Select etypeid, description 
From etype

	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetExamItemForEdit]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[sp_GetExamItemForEdit]
@examitemid INT
AS
BEGIN		
	SELECT [examitemid]
      ,[examid]
      ,[examname]
      ,examitem.[key1id]
      ,examitem.[key2id]
      ,examitem.[key3id]
      ,[questionobjective]
      ,[stem]
      ,[destractor1]
      ,[destractor2]
      ,[destractor3]
      ,[destractor4]
      ,[correctanswer]
  FROM [dbo].[examitem], key1, key2, key3
  Where key1.key1id=examitem.key1id AND
        key2.key2id=examitem.key2id AND
		key3.key3id=examitem.key3id AND 
		examitemid = @examitemid
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetExamList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetExamList]
@InstitutionID INT
AS
BEGIN
    SELECT
		e.examid
		,i.institutionid
		,e.examname
		,exampurpose
		,duration
	 FROM
		exam e
		 INNER JOIN developer d ON d.examid = e.examid
		 INNER JOIN examproviderstaff eps ON eps.examproviderstaffid = d.examproviderstaffid
		 INNER JOIN person p ON p.personid = eps.personid
		 INNER JOIN institution i ON i.institutionid = p.institutionid
	  WHERE
		i.institutionid = @InstitutionID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetExamListByInstitutionId]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetExamListByInstitutionId]
@InstitutionID INT
AS
BEGIN
    SELECT
		 e.examid
		,i.institutionid
		,e.examname
		,exampurpose
		,duration
	 FROM
		exam e
		 INNER JOIN developer d ON d.examid = e.examid
		 INNER JOIN examproviderstaff eps ON eps.examproviderstaffid = d.examproviderstaffid
		 INNER JOIN person p ON p.personid = eps.personid
								AND p.isDeleted = 0
		 INNER JOIN institution i ON i.institutionid = p.institutionid
	  WHERE
		i.institutionid = @InstitutionID
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetexamListforEdit]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_GetexamListforEdit]
(
@examid int
)
AS
BEGIN
      SELECT
	   examname,
	   exampurpose,
	   duration,
	   etypeid
	 FROM exam
		where exam.examid=@examid
		END
GO
/****** Object:  StoredProcedure [dbo].[sp_getExamProviderStaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getExamProviderStaff]
	@providerid INT	
AS
BEGIN
	SELECT examproviderstaffid, 
		   person.firstname + ' ' + person.lastname AS personName, 
		   isEPSA, isdeveloper 
	FROM examproviderstaff, person, provider
	WHERE person.personid = examproviderstaff.personid
	AND provider.providerid = examproviderstaff.providerid
	AND provider.providerid = @providerid
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetExamProviderStaffList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****************************************************************************************/

CREATE PROCEDURE [dbo].[sp_GetExamProviderStaffList]
AS
BEGIN
      SELECT
			examproviderstaffid, 
			providerid, 
			personid, 
			isEPSA, 
			isdeveloper
		FROM  ExamProviderStaff

END	


GO
/****** Object:  StoredProcedure [dbo].[sp_getExamProviderStaffName]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getExamProviderStaffName]
	@examProviderStaffId INT	
AS
BEGIN
	SELECT person.firstname + ' ' + person.lastname AS personName, 
		   isEPSA, isdeveloper 
	FROM examproviderstaff, person
	WHERE person.personid = examproviderstaff.personid
	AND examproviderstaffid = @examProviderStaffId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetExamStatus]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetExamStatus]
AS
BEGIN
    SELECT
		 statusName		= es.[status]
		,statusId		= es.examstatusid
	FROM
		exam_status es
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInstitutionExamByStatus]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetInstitutionExamByStatus]
	 @institutionId INT
	,@examStatusId INT
AS
BEGIN
    SELECT
		 se.scheduledexamid
		,se.examname
		,se.examlocation
		,examdate				= CAST(se.examdate AS date)
		,examtime				= CONVERT(VARCHAR(8),se.examstarttime,108) + '  to ' + CONVERT(VARCHAR(8),se.examendtime,108)
		,es.[status]
	FROM
		exam e
			INNER JOIN exam_status es ON es.examstatusid = e.examstatusid
			LEFT JOIN scheduled_exam se ON se.examid = e.examid
			LEFT JOIN institutionpeople ip ON ip.institutionpeopleid = se.institutionpeopleid
	WHERE
	    ip.institutionid = @institutionId
		AND (@examStatusId = -1 OR es.examstatusid = @examStatusId)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetInstitutionList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetInstitutionList]
AS
BEGIN
    SELECT
		 i.institutionid
		,i.[name]
	FROM
		dbo.institution i
	WHERE
		i.isdeleted = 0
	ORDER BY
		i.[name]
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetInstitutionPeopleListById]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetInstitutionPeopleListById]
	@institutionId INT
AS
BEGIN
    DECLARE @InstitutionName NVARCHAR(200)
	-- Get the institutionName first to return it with our main query
	SET @InstitutionName = (SELECT name FROM institution WHERE institutionid = @institutionId)

    SELECT
		p.personid
	   ,p.lastname
	   ,p.firstname
	   ,institutionName		= @InstitutionName
	   ,p.isTaker
	   ,p.isProvider
	   ,isReports			= CASE WHEN ip.isReports IS NULL THEN 'False' ELSE ip.isReports END
	   ,isProctor			= CASE WHEN ip.isProctor IS NULL THEN 'False' ELSE ip.isProctor END
	   ,isISA				= CASE WHEN ip.isISA IS NULL THEN 'False' ELSE ip.isISA END
    FROM
	dbo.Person p
		LEFT JOIN dbo.institutionpeople ip ON ip.personid = p.personid
	WHERE
	    p.institutionid = @institutionId
		AND p.isDeleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getPersonAsExamProviderStaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getPersonAsExamProviderStaff]
	@examproviderstaffid INT	
AS
BEGIN
	SELECT person.personid 
	FROM examproviderstaff, person, provider
	WHERE person.personid = examproviderstaff.personid
	AND provider.providerid = examproviderstaff.providerid
	AND examproviderstaff.examproviderstaffid = @examproviderstaffid
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetPersonList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetPersonList]
AS
BEGIN
      SELECT
		 p.personid
        ,p.lastname
        ,p.firstname
        ,institutionName	= i.name
		,p.isTaker
		,p.isProvider
		,p.isInstitution
		,p.isSA
		,isReports			= CASE WHEN ip.isReports IS NULL THEN 'False' ELSE ip.isReports END
		,isProctor			= CASE WHEN ip.isProctor IS NULL THEN 'False' ELSE ip.isProctor END
		,isISA				= CASE WHEN ip.isISA IS NULL THEN 'False' ELSE ip.isISA END
		,isEPSA				= CASE WHEN eps.isEPSA IS NULL THEN 'False' ELSE eps.isEPSA END
		,isDeveloper		= CASE WHEN eps.isdeveloper IS NULL THEN 'False' ELSE eps.isdeveloper END
      FROM
		dbo.Person p
			LEFT JOIN dbo.institutionpeople ip ON ip.personid = p.personid
			LEFT JOIN dbo.institution i ON i.institutionid = p.institutionid
			LEFT JOIN dbo.examproviderstaff eps ON eps.personid = p.personid
	  WHERE
		p.isDeleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[sp_getPersonsNotAsProviderStaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_getPersonsNotAsProviderStaff]
	@providerid INT	
AS
BEGIN
	SELECT personid,
		   person.firstname + ' ' + person.lastname AS personName
	FROM person 
	WHERE person.personid NOT IN 
		  (SELECT personid FROM examproviderstaff WHERE providerid = @providerid)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetProviderByID]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetProviderByID]
@providerid INT
AS
BEGIN
      SELECT
			providerid,	
			name,
			address1,
			address2,
			city,
			st,
			zip,
			country,
			weburl,
			isdeleted,
			isaccredited,	
			createdate,
			createdbywhom,
			modifieddate,
			modifiedbywhom
		FROM provider
		WHERE providerid = @providerid

END	


GO
/****** Object:  StoredProcedure [dbo].[sp_GetProviderList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_GetProviderList]
AS
BEGIN
      SELECT
			providerid,	
			name,
			address1,
			address2,
			city,
			st,
			zip,
			country,
			weburl,
			isdeleted,
			isaccredited,	
			createdate,
			createdbywhom,
			modifieddate,
			modifiedbywhom
		FROM provider

END	


GO
/****** Object:  StoredProcedure [dbo].[sp_GetProviderListforEdit]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery2.sql|7|0|C:\Users\akash\AppData\Local\Temp\~vs9D92.sql
CREATE PROCEDURE [dbo].[sp_GetProviderListforEdit]
(
@providerid int
)
AS
BEGIN
      SELECT
				
			provider.name,
			address1,
			address2,
			city,
			st,
			zip,
			country,
			weburl
			
		FROM provider
		where provider.providerid=@providerid 
		

END	

GO
/****** Object:  StoredProcedure [dbo].[sp_GetProvidersList]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetProvidersList]
AS
BEGIN
    SELECT
		 p.providerid
		,p.[name]
	FROM
		dbo.provider p
	WHERE
		p.isdeleted = 0	 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetQuestions]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetQuestions]
	 @examid INT
AS
BEGIN
    SELECT 	examitemid, 
			stem, 
			destractor1, 
			destractor2, 
			destractor3, 
			destractor4 
	FROM 
		EXAMITEM
	WHERE 
		examid = @examid
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetRosterByScheduledExamId]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetRosterByScheduledExamId]
	@scheduledExamId INT
AS
BEGIN
	SELECT
		 takerid		= r.takerid
		,Name			= (p.firstname + ' ' + p.lastname)
		,[status]		= r.[status]
		,validated		= CASE r.status
							WHEN 'Completed' THEN 'True'
							ELSE 'False'
						  END
		,score			= ISNULL(r.score,0)
	FROM
		roster r
			INNER JOIN taker t ON t.takerid = r.takerid
			INNER JOIN person p ON p.personid = t.personid
								   AND p.isDeleted = 0
	WHERE
		r.scheduledexamid = @scheduledExamId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetScheduledExamInfoById]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetScheduledExamInfoById]
	 @institutionId INT
	,@scheduledExamId INT
AS
BEGIN

    SELECT
		 se.scheduledexamid
		,se.examname
		,se.examlocation
		,se.examdate
		,examStartTime	= CONVERT(VARCHAR(8),se.examstarttime,108)
		,examEndTime	= CONVERT(VARCHAR(8),se.examendtime,108)
		,examtime		= CONVERT(VARCHAR(8),se.examstarttime,108) + '  to ' + CONVERT(VARCHAR(8),se.examendtime,108)
		,es.[status]
		,e.duration
	FROM
		scheduled_exam se
			INNER JOIN institutionpeople ip ON ip.institutionpeopleid = se.institutionpeopleid
			INNER JOIN exam e ON e.examid = se.examid
			INNER JOIN exam_status es ON es.examstatusid = e.examstatusid
	WHERE
	    ip.institutionid = @institutionId
		AND se.scheduledexamid = @scheduledExamId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetScheduledExamsByInstitution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetScheduledExamsByInstitution]
	@institutionId INT
AS
BEGIN

    SELECT
		 se.scheduledexamid
		,se.examname
		,se.examlocation
		,se.examdate
		,examtime = CONVERT(VARCHAR(8),se.examstarttime,108) + '  to ' + CONVERT(VARCHAR(8),se.examendtime,108)
		,es.[status]
	FROM
		scheduled_exam se
			INNER JOIN institutionpeople ip ON ip.institutionpeopleid = se.institutionpeopleid
			INNER JOIN exam e ON e.examid = se.examid
			INNER JOIN exam_status es ON es.examstatusid = e.examstatusid
	WHERE
	    ip.institutionid = @institutionId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetScheduleExamInfo]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[sp_GetScheduleExamInfo]
	 @institutionId INT
	,@scheduledExamId INT
AS
BEGIN

    SELECT
		 se.scheduledexamid
		,se.examname
		,se.examlocation
		,se.examdate
		,examtime = CONVERT(VARCHAR(8),se.examstarttime,108) + '  to ' + CONVERT(VARCHAR(8),se.examendtime,108)
		,es.[status]
	FROM
		scheduled_exam se
			INNER JOIN institutionpeople ip ON ip.institutionpeopleid = se.institutionpeopleid
			INNER JOIN exam e ON e.examid = se.examid
			INNER JOIN exam_status es ON es.examstatusid = e.examstatusid
	WHERE
	    ip.institutionid = @institutionId
		AND se.scheduledexamid = @scheduledExamId
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserProfileById]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetUserProfileById]
	@personid INT
AS
BEGIN
	SELECT
		 p.personid
		,p.institutionid
		,p.username
		,p.[password]
		,p.firstname
		,p.lastname
		,p.address1
		,p.address2
		,p.city
		,p.st
		,p.zip
		,p.phonenumber1
		,p.phonenumber1type
		,p.phonenumber2
		,p.phonenumber2type
		,CONVERT(VARCHAR(10),p.dob,101) AS dob
		,p.email
		,providerName		= pv.[name]
		,providerId			= pv.providerid
		,isTaker			= CASE WHEN p.isTaker IS NULL THEN 'False' ELSE p.isTaker END
		,isProvider			= CASE WHEN p.isProvider IS NULL THEN 'False' ELSE p.isProvider END
		,isInstitution		= CASE WHEN p.isInstitution IS NULL THEN 'False' ELSE p.isInstitution END
		,isSA				= CASE WHEN p.isSA IS NULL THEN 'False' ELSE p.isSA END
		,isReports			= CASE WHEN ip.isReports IS NULL THEN 'False' ELSE ip.isReports END
		,isProctor			= CASE WHEN ip.isProctor IS NULL THEN 'False' ELSE ip.isProctor END
		,isISA				= CASE WHEN ip.isISA IS NULL THEN 'False' ELSE ip.isISA END
		,isEPSA				= CASE WHEN eps.isEPSA IS NULL THEN 'False' ELSE eps.isEPSA END
		,isDeveloper		= CASE WHEN eps.isdeveloper IS NULL THEN 'False' ELSE eps.isdeveloper END
	FROM
		dbo.person p
			LEFT JOIN dbo.institutionpeople ip ON ip.personid = p.personid
			LEFT JOIN dbo.examproviderstaff eps ON eps.personid = p.personid
			LEFT JOIN dbo.provider pv ON pv.providerid = eps.providerid
	WHERE
		p.personid = @personid
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAllScheduledExams]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpdateAllScheduledExams]
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)

	BEGIN TRY
		BEGIN TRANSACTION UpdateAllScheduledExams			
			UPDATE dbo.exam
			SET examstatusid = 6
			FROM
				dbo.exam e
					INNER JOIN dbo.scheduled_exam se ON se.examid = e.examid
			WHERE
				CONVERT(DATE, se.examdate) < CONVERT(DATE,GETDATE())
				AND CONVERT(TIME, se.examstarttime) < CONVERT(TIME, GETDATE())
				AND e.examstatusid = 2
					
		COMMIT TRANSACTION UpdateAllScheduledExams
	END TRY
	BEGIN CATCH
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateAllScheduledExams'
		ROLLBACK TRANSACTION 
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpsertAnswers]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpsertAnswers]
	 @examitemid INT
	,@rosterid INT
	,@answer NVARCHAR(1)

AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If NOT EXISTS (SELECT Answerid FROM Answer WHERE examitemid = @examitemid AND rosterid = @rosterid) 
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertAnswers

				-- Insert into answers table
				INSERT INTO dbo.Answer(rosterid, examitemid, answervalue, isCorrect, createdate)
				VALUES(@rosterid,@examitemid,@answer, ISNULL((SELECT examitemid FROM EXAMITEM WHERE examitemid = @examitemid AND correctanswer = @answer), 0), getdate())

				-- ***************************************************************************************

			COMMIT TRANSACTION InsertAnswers
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertAnswers'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH
	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdateAnswers

				-- Update Answers
				UPDATE dbo.Answer
				SET
					 answervalue			= @answer
					 ,isCorrect				= ISNULL((SELECT examitemid FROM EXAMITEM WHERE examitemid = @examitemid AND correctanswer = @answer), 0)
					 ,modifieddate			= getdate()
				WHERE
					rosterid				= @rosterid
				AND	examitemid				= @examitemid

			COMMIT TRANSACTION UpdateAnswers
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateAnswers'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpsertExamItem]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpsertExamItem]
	 @examitemid INT
	,@examid INT
	,@key1id INT
	,@key2id INT
	,@key3id INT
	,@questionobjective NVARCHAR(256)
	,@stem NVARCHAR(128)
	,@destractor1 NVARCHAR(128)
	,@destractor2 NVARCHAR(128)
	,@destractor3 NVARCHAR(182)
	,@destractor4 NVARCHAR(128)
	,@correctanswer NVARCHAR(1)
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
	DECLARE @ExamName VARCHAR(100)

	SET @ExamName = (SELECT examname FROM exam WHERE examid = @examid)
	If @examitemid = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertExamItem

				-- Insert into scheduled_exam table
				INSERT INTO dbo.examitem(examid, examname, key1id,key2id,key3id,questionobjective,stem,destractor1,destractor2,destractor3,destractor4,correctanswer)
				VALUES(@examid, @ExamName, @key1id,@key2id,@key3id,@questionobjective,@stem,@destractor1,@destractor2,@destractor3,@destractor4,@correctanswer)

				-- ***************************************************************************************

			COMMIT TRANSACTION InsertExamItem
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertExamItem'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH
	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdateExamItem

				-- Update examitem
				-- TODO: ********************************************

				-- Update examitem
				UPDATE dbo.examitem
				SET
					  examid		= @examid
					 ,examname      = @ExamName
					 ,key1id		= @key1id
					 ,key2id		= @key2id
					 ,key3id		= @key3id
					 ,questionobjective	= @questionobjective
					 ,stem			= @stem
					 ,destractor1   = @destractor1
					 ,destractor2   = @destractor2
					 ,destractor3   = @destractor3
					 ,destractor4   = @destractor4
					 ,correctanswer = @correctanswer
				WHERE
					examitemid = @examitemid

			COMMIT TRANSACTION UpdateExamItem
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateExamItem'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpsertPersonInstitution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpsertPersonInstitution]
	 @personId INT
	,@institutionId INT
	,@providerId INT
	,@firstName NVARCHAR(512)
	,@lastName NVARCHAR(512)
	,@dob DATE
	,@email NVARCHAR(200)
	,@address1 NVARCHAR(512)
	,@address2 NVARCHAR(512)
	,@city NVARCHAR(512)
	,@state NVARCHAR(512)
	,@zip NVARCHAR(512)
	,@phoneNumber1 NVARCHAR(15)
	,@phoneNumber1Type NVARCHAR(50)
	,@phoneNumber2 NVARCHAR(15)
	,@phoneNumber2Type NVARCHAR(50)
	,@userName NVARCHAR(512)
	,@password NVARCHAR(512)
	,@isTaker BIT
	,@isProvider BIT
	,@isInstitution BIT
	,@isSA BIT
	,@isISA BIT
	,@isProctor BIT
	,@isReports BIT
	,@isEPSA BIT
	,@isDeveloper BIT
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @personId = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertPerson

				-- Insert into person table
				INSERT INTO dbo.person(firstname,lastname,dob,email,institutionid,address1,address2,city,st,zip,
									   phonenumber1,phonenumber1type,phonenumber2,phonenumber2type,username,[password],
									   isTaker,isProvider,isInstitution,isSA,isDeleted)
				VALUES(@firstname,@lastname,@dob,@email,@institutionId,@address1,@address2,@city,@state,@zip,
						@phoneNumber1,@phoneNumber1Type,@phoneNumber2,@phoneNumber2Type,@username,@password,
						@isTaker,@isProvider,@isInstitution,@isSA,0)

				SET @personId = SCOPE_IDENTITY()

				-- Insert into institutionpeople
				INSERT INTO dbo.institutionpeople(personid,institutionid,isISA,isProctor,isReports)
				VALUES(@personId,@institutionid,@isISA,@isProctor,@isReports)

				-- Insert into examproviderstaff
				If @isProvider = 1
				BEGIN
					INSERT INTO dbo.examproviderstaff(providerid,personid,isEPSA,isdeveloper)
					VALUES (@providerId,@personId,@isEPSA,@isDeveloper)
				END

			COMMIT TRANSACTION InsertPerson
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertPerson'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH
	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdatePerson

				-- Update examproviderstaff
				-- Assumming that a person can be a examproviderstaff only for a single provider
				If EXISTS (SELECT * FROM dbo.examproviderstaff eps WHERE eps.personid = @personId)
				BEGIN
					If @isProvider = 1 -- if still a provider
					BEGIN
						UPDATE dbo.examproviderstaff
						SET
							 providerid		= @providerId
							,isEPSA			= @isEPSA
							,isdeveloper	= @isDeveloper
						WHERE
							personid = @personId
					END
				END
				ELSE -- Insert if the person is being entered first time as a provider
				BEGIN
					If @isProvider = 1 -- if still a provider
					BEGIN
						INSERT INTO dbo.examproviderstaff(providerid,personid,isEPSA,isdeveloper)
						VALUES (@providerId,@personId,@isEPSA,@isDeveloper)
					END
					ELSE -- if not a provider any more, delete the record
					BEGIN
						DELETE FROM dbo.examproviderstaff
						WHERE personid = @personId
					END
				END

				-- Update institutionpeople
				UPDATE dbo.institutionpeople
				SET
					 institutionid = @institutionId
					,isISA = @isISA
					,isProctor = @isProctor
					,isReports = @isReports
				WHERE personid = (SELECT p.personid
								  FROM dbo.person p
								  WHERE p.personid = @personId
										AND p.institutionid = institutionid)

				-- update person table
				UPDATE dbo.person
				SET
					 firstname = @firstName
					,lastname = @lastName
					,dob = @dob
					,email = @email
					,institutionid = @institutionId
					,address1 = @address1
					,address2 = @address2
					,city = @city
					,st = @state
					,zip = @zip
					,phonenumber1 = @phoneNumber1
					,phonenumber1type = @phoneNumber1Type
					,phonenumber2 = @phoneNumber2
					,phonenumber2type = @phoneNumber2Type
					,username = @userName
					,[password] = @password
					,isTaker = @isTaker
					,isProvider = @isProvider
					,isInstitution = @isInstitution
					,isSA = @isSA
					,isDeleted = 0
				WHERE
					personid = @personId

			COMMIT TRANSACTION UpdatePerson
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdatePerson'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_UpsertScheduledExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_UpsertScheduledExam]
	 @scheduledExamId INT
	,@institutionpeopleid INT
	,@examid INT
	,@examname NVARCHAR(128)
	,@examDate DATETIME
	,@examStartTime DATETIME
	,@examEndTime DATETIME
	,@examlocation NVARCHAR(40)
AS
BEGIN
	DECLARE @ErrorMessage VARCHAR(500)
			
	If @scheduledExamId = -1
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION InsertScheduledExam

				-- Insert into scheduled_exam table
				INSERT INTO dbo.scheduled_exam(institutionpeopleid,examid,examname,examdate,examstarttime,examendtime,
											   examlocation)
				VALUES(@institutionpeopleid,@examid,@examname,@examDate,@examStartTime,@examEndTime,@examlocation)

				-- ***************************************************************************************

			COMMIT TRANSACTION InsertScheduledExam
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : InsertScheduledExam'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH
	END
	ELSE
		BEGIN TRY
			BEGIN TRANSACTION UpdateScheduledExam

				-- Update examproviderstaff
				-- TODO: ********************************************

				-- Update institutionpeople
				UPDATE dbo.scheduled_exam
				SET
					  institutionpeopleid	= @institutionpeopleid
					 ,examid				= @examid
					 ,examname				= @examname
					 ,examdate				= @examDate
					 ,examstarttime			= @examStartTime
					 ,examendtime			= @examEndTime
					 ,examlocation			= @examlocation
				WHERE
					scheduledexamid = @scheduledExamId

			COMMIT TRANSACTION UpdateScheduledExam
		END TRY
		BEGIN CATCH
			SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : UpdateScheduledExam'
			ROLLBACK TRANSACTION
			RAISERROR (@ErrorMessage,16,1)
		END CATCH	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_ValidateUser]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ValidateUser]
	 @username NVARCHAR(20)
	,@password NVARCHAR(20)
	,@IsFound BIT OUTPUT
AS
BEGIN
	IF EXISTS ( SELECT * 
				FROM dbo.person p
				WHERE p.username = @username
					  AND p.[password] = @password
					  AND p.isDeleted = 0)
	BEGIN
		-- The user was found
		SET @IsFound = 1
	END
	ELSE
	BEGIN
		-- The user was not found
		SET @IsFound = 0
	END

END


GO
/****** Object:  StoredProcedure [dbo].[UnAssignDodObjective]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROC [dbo].[UnAssignDodObjective]
	@key2id INT,
	@key1id INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN UnAssign_DodObjective
			DELETE FROM 
				DodMapsCourseOutcome
			WHERE 
					key2id =  @key2id AND 
					key1id = @key1id
		COMMIT TRAN UnAssign_DodObjective
	END TRY
	BEGIN CATCH
		RAISERROR('An error occured in UnAssignDodObjective', 16, 1)
		ROLLBACK TRAN UnAssign_DodObjective
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UnAssignSubSkill]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROC [dbo].[UnAssignSubSkill]
	@key3id INT,
	@key1id INT
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN UnAssign_SubSkill
			DELETE FROM 
				SubskillMapsCourseOutcome
			WHERE 
					key3id =  @key3id AND 
					key1id = @key1id
		COMMIT TRAN UnAssign_SubSkill
	END TRY
	BEGIN CATCH
		RAISERROR('An error occured in UnAssignSubSkill', 16, 1)
		ROLLBACK TRAN UnAssign_SubSkill
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateExamDetails]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[UpdateExamDetails]
@ExamID		 		int, 
@Name 				nvarchar(100), 
@ExamPurpose 		nvarchar(512),
@EtypeID 			int, 
@Duration 			decimal
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE exam
	       SET examname = @Name,
		       exampurpose = @ExamPurpose,
			   etypeid = @EtypeID,
		       duration = @Duration
	     WHERE examid = @ExamID
			   
			   
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : All Exam Data Updated'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateIsInstitution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[UpdateIsInstitution]
@personid	 		int, 
@isInstitution		bit

AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE person
	       SET isInstitution = @isInstitution
	     WHERE personid = @personid			   
			   
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Update IsInstitution'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UpdatePermissions]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------

		   

CREATE procedure [dbo].[UpdatePermissions]
@personid	 		int, 
@institutionid		int,
@isISA				bit,
@isProctor			bit, 
@isReports			bit
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE institutionpeople
	       SET institutionid = @institutionid,
			   isISA = @isISA,
			   isProctor = @isProctor,
			   isReports = @isReports
	     WHERE personid = @personid			   
			   
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : Update Permissions'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UpdatePerson]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdatePerson]
@PersonID INT,
@FirstName NVARCHAR (20),
@LastName  NVARCHAR (20),
@address1 NVARCHAR (50),
@address2 NVARCHAR (50),
@city NVARCHAR (20),
@st NVARCHAR (50),
@zip NVARCHAR (20),
@phonenumber1 NVARCHAR (20),
@username NVARCHAR (20),
@password NVARCHAR (20),
@email NVARCHAR (50)
AS
BEGIN
	BEGIN TRY
		BEGIN TRAN Update_Person
			UPDATE 
				Person
			SET
				FirstName = @FirstName, 
				LastName =@LastName,
				address1 = @address1,
				address2 = @address2,
				city = @city,
				st= @st,
				zip = @zip,
				phonenumber1 = @phonenumber1,
				username = @username,
				password = @password,
				email = @email
			WHERE 
				PersonID = @PersonID
		COMMIT TRAN Update_Person
	END TRY
	BEGIN CATCH
		RAISERROR('An Error occured in [dbo].[UpdatePerson]', 16, 1)
		ROLLBACK TRAN  Update_Person
	END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateScheduledExam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE procedure [dbo].[UpdateScheduledExam]
@scheduledexamid int,
@examid int,
@examname nvarchar(100),
@examdate datetime,
@examstarttime datetime,
@examendtime datetime,
@examlocation nvarchar(100),
@institutionpeopleid int
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION
		
		--TRANSACTION
		UPDATE scheduled_exam
	       SET examid = @examid,
		       examname = @examname,
			   examdate = @examdate,
		       examstarttime = @examstarttime,
			   examendtime=@examendtime,
			   examlocation=@examlocation,
			   institutionpeopleid=@institutionpeopleid
	     WHERE scheduledexamid = @scheduledexamid
	
		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH
		DECLARE @ErrorMessage VARCHAR(500)
		SET @ErrorMessage = ERROR_MESSAGE() + 'Rollback Transaction : All Exam Data Updated'
		ROLLBACK TRANSACTION
		RAISERROR (@ErrorMessage,16,1)
	END CATCH
END



GO
/****** Object:  StoredProcedure [dbo].[ValidateEmail]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[ValidateEmail]
	@email nvarchar(100),

	@IsFound Bit OUTPUT
AS
BEGIN
	IF EXISTS ( SELECT *
				FROM person
				WHERE email = @email
				)
	BEGIN
		SET @IsFound = 1 -- The user was found
	END
	ELSE
	BEGIN
		SET @IsFound = 0 -- The user was not found
	END			 				
	END


GRANT EXECUTE ON [dbo].[GetProviderNames] TO ISC567User


GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------
-- 2.0 		Stored Procedures       --
--------------------------------------


CREATE PROC [dbo].[ValidateUser]
	@username nvarchar(20),
	@password nvarchar(20),
	@IsFound Bit OUTPUT
AS
BEGIN
	IF EXISTS ( SELECT * 
				FROM person
				WHERE username = @username
				AND password = @password)
	BEGIN
		SET @IsFound = 1 -- The user was found
	END
	ELSE
	BEGIN
		SET @IsFound = 0 -- The user was not found
	END			 				

END

GO
/****** Object:  Table [dbo].[Answer]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Answer](
	[Answerid] [int] IDENTITY(1,1) NOT NULL,
	[rosterid] [int] NOT NULL,
	[examitemid] [int] NOT NULL,
	[answervalue] [varchar](10) NOT NULL,
	[isCorrect] [bit] NOT NULL,
	[createdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NULL,
 CONSTRAINT [PK_Answerid] PRIMARY KEY CLUSTERED 
(
	[Answerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[compatible_browsers]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[compatible_browsers](
	[compatiblebrowserid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_COMPATIBLE_BROWSERS] PRIMARY KEY CLUSTERED 
(
	[compatiblebrowserid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CrsOutcome_maps_DODobjective]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CrsOutcome_maps_DODobjective](
	[Key1ID] [int] NULL,
	[Key2ID] [int] NULL,
	[crsoutcomenum] [varchar](1024) NULL,
	[crsShortOutcome] [varchar](1024) NULL,
	[crsoutcometext] [varchar](1024) NULL,
	[dodobjectivenum] [varchar](6) NULL,
	[dodobjectivenumvalue] [varchar](1024) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CrsOutcome_maps_SubSkill]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CrsOutcome_maps_SubSkill](
	[Key1ID] [int] NULL,
	[Key3ID] [int] NOT NULL,
	[crsoutcomenum] [varchar](13) NULL,
	[crsoutcometext] [varchar](1024) NULL,
	[subskilltitle] [varchar](1024) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[developer]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[developer](
	[developerid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[examproviderstaffid] [int] NOT NULL,
 CONSTRAINT [PK_developer] PRIMARY KEY CLUSTERED 
(
	[developerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dodarea]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dodarea](
	[dodareaid] [int] IDENTITY(1,1) NOT NULL,
	[dodskillsetid] [int] NOT NULL,
	[dodareatitle] [nvarchar](50) NULL,
	[seqnum] [int] NULL,
 CONSTRAINT [PK_DODAREA] PRIMARY KEY CLUSTERED 
(
	[dodareaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dodjobs]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dodjobs](
	[dodjobsid] [int] IDENTITY(1,1) NOT NULL,
	[dodareaid] [int] NOT NULL,
	[jobtitle] [varchar](2048) NULL,
	[seqnum] [int] NULL,
 CONSTRAINT [PK_DODJOBS] PRIMARY KEY CLUSTERED 
(
	[dodjobsid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DodMapsCourseOutcome]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DodMapsCourseOutcome](
	[DodCrsOutID] [int] IDENTITY(1,1) NOT NULL,
	[key1id] [int] NULL,
	[key2id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DodCrsOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dodobjective]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[dodobjective](
	[dodobjectivesid] [int] IDENTITY(1,1) NOT NULL,
	[dodareaid] [int] NOT NULL,
	[dodobjectivenum] [varchar](6) NULL,
	[dodtaskksa] [varchar](4) NULL,
	[dodobjectivevalue] [varchar](1024) NULL,
	[seqnum] [int] NULL,
 CONSTRAINT [PK_DODOBJECTIVE] PRIMARY KEY CLUSTERED 
(
	[dodobjectivesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_DODOBJECTIVENUM] UNIQUE NONCLUSTERED 
(
	[dodobjectivenum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[dodskillset]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dodskillset](
	[dodskillsetid] [int] IDENTITY(1,1) NOT NULL,
	[dodskillsetname] [nvarchar](2048) NULL,
	[description] [nvarchar](2048) NULL,
	[seqnum] [int] NULL,
 CONSTRAINT [PK_DODSKILLSET] PRIMARY KEY CLUSTERED 
(
	[dodskillsetid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[etype]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[etype](
	[etypeid] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](100) NULL,
	[exk1ID] [int] NULL,
	[exk2ID] [int] NULL,
	[exk3ID] [int] NULL,
	[exk1Value] [varchar](50) NULL,
	[exk2Value] [varchar](50) NULL,
	[exk3Value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[etypeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [uc_exk1ID_exk2ID_exk3ID] UNIQUE NONCLUSTERED 
(
	[exk1ID] ASC,
	[exk2ID] ASC,
	[exk3ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[exam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam](
	[examid] [int] IDENTITY(1,1) NOT NULL,
	[etypeid] [int] NOT NULL,
	[providerid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[exampurpose] [nvarchar](512) NOT NULL,
	[duration] [decimal](9, 2) NOT NULL,
	[examstatusid] [int] NOT NULL,
 CONSTRAINT [PK_EXAM] PRIMARY KEY CLUSTERED 
(
	[examid] ASC,
	[examname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[exam_status]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_status](
	[examstatusid] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NOT NULL,
 CONSTRAINT [PK_EXAM_STATUS] PRIMARY KEY CLUSTERED 
(
	[examstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[exam_status_history]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[exam_status_history](
	[examhistorystatusid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[oldstatus] [nvarchar](20) NOT NULL,
	[newstatus] [nvarchar](20) NOT NULL,
	[modifieddate] [datetime] NOT NULL,
 CONSTRAINT [PK_EXAM_STATUS_HISTORY] PRIMARY KEY CLUSTERED 
(
	[examhistorystatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examitem]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examitem](
	[examitemid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[key1id] [int] NOT NULL,
	[key2id] [int] NOT NULL,
	[key3id] [int] NOT NULL,
	[questionobjective] [nvarchar](256) NOT NULL,
	[stem] [nvarchar](128) NOT NULL,
	[destractor1] [nvarchar](128) NOT NULL,
	[destractor2] [nvarchar](128) NOT NULL,
	[destractor3] [nvarchar](182) NOT NULL,
	[destractor4] [nvarchar](128) NOT NULL,
	[correctanswer] [nvarchar](1) NOT NULL,
 CONSTRAINT [PK_EXAMITEM] PRIMARY KEY CLUSTERED 
(
	[examitemid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examitem_status]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examitem_status](
	[examitemstatusid] [int] IDENTITY(1,1) NOT NULL,
	[examitemid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NULL,
 CONSTRAINT [PK_EXAMITEMSTATUS] PRIMARY KEY CLUSTERED 
(
	[examitemstatusid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[examproviderstaff]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[examproviderstaff](
	[examproviderstaffid] [int] IDENTITY(1,1) NOT NULL,
	[providerid] [int] NOT NULL,
	[personid] [int] NOT NULL,
	[isEPSA] [bit] NOT NULL,
	[isdeveloper] [bit] NOT NULL,
 CONSTRAINT [PK_examproviderstaff] PRIMARY KEY CLUSTERED 
(
	[examproviderstaffid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExK1]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExK1](
	[exk1ID] [int] IDENTITY(1,1) NOT NULL,
	[exk1Value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[exk1ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExK2]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExK2](
	[exk2ID] [int] IDENTITY(1,1) NOT NULL,
	[exk2Value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[exk2ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExK3]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExK3](
	[exk3ID] [int] IDENTITY(1,1) NOT NULL,
	[exk3Value] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[exk3ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ftp_control]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ftp_control](
	[ftp_poll_directory] [varchar](4000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[institution]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institution](
	[institutionid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](20) NULL,
	[st] [nvarchar](50) NULL,
	[zip] [nvarchar](20) NULL,
	[country] [nvarchar](20) NULL,
	[weburl] [nvarchar](50) NULL,
	[isdeleted] [bit] NULL,
	[isaccredited] [bit] NULL,
	[createdate] [datetime] NULL,
	[createdbywhom] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedbywhom] [int] NULL,
 CONSTRAINT [PK_INSTITUTION] PRIMARY KEY CLUSTERED 
(
	[institutionid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[institutionpeople]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[institutionpeople](
	[institutionpeopleid] [int] IDENTITY(1,1) NOT NULL,
	[personid] [int] NOT NULL,
	[institutionid] [int] NOT NULL,
	[isISA] [bit] NOT NULL,
	[isProctor] [bit] NOT NULL,
	[isReports] [bit] NOT NULL,
 CONSTRAINT [PK_INSTITUTIONPEOPLE] PRIMARY KEY CLUSTERED 
(
	[institutionpeopleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[key1]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[key1](
	[key1id] [int] IDENTITY(1,1) NOT NULL,
	[exk1ID] [int] NULL,
	[exk1Value] [varchar](50) NULL,
	[courseid] [varchar](50) NULL,
	[CourseTitle] [varchar](100) NULL,
	[SequenceNumber] [int] NULL,
	[crsoutcometext] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[key1id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[key2]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[key2](
	[key2id] [int] IDENTITY(1,1) NOT NULL,
	[exk2ID] [int] NULL,
	[exk2Value] [varchar](50) NULL,
	[dodareaid] [varchar](50) NULL,
	[Dodareatitle] [varchar](100) NULL,
	[SequenceNumber] [int] NULL,
	[dodobjectivenumvalue] [varchar](1024) NULL,
PRIMARY KEY CLUSTERED 
(
	[key2id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[key3]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[key3](
	[key3id] [int] IDENTITY(1,1) NOT NULL,
	[exk3ID] [int] NULL,
	[exk3Value] [varchar](50) NULL,
	[SkillsID] [varchar](10) NULL,
	[SkillsName] [varchar](100) NULL,
	[SequenceNumber] [int] NULL,
	[SubskillTitle] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[key3id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MapKey1Key2]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MapKey1Key2](
	[crsoutcomenum] [varchar](1024) NULL,
	[crsShortOutcome] [varchar](1024) NULL,
	[crsoutcometext] [varchar](1024) NULL,
	[dodobjectivenum] [varchar](6) NULL,
	[dodtaskksa] [varchar](4) NULL,
	[dodobjectivevalue] [varchar](1024) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MapKey1Key3]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MapKey1Key3](
	[prgoutcometext] [varchar](1024) NULL,
	[subskilltitle] [varchar](1024) NULL,
	[crsoutcomenum] [varchar](1024) NULL,
	[crsoutcometext] [varchar](1024) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewMap12]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewMap12](
	[key2id] [int] IDENTITY(1,1) NOT NULL,
	[exk2ID] [int] NULL,
	[exk2Value] [varchar](50) NULL,
	[dodareaid] [varchar](50) NULL,
	[Dodareatitle] [varchar](100) NULL,
	[SequenceNumber] [int] NULL,
	[dodobjectivenumvalue] [varchar](1024) NULL,
	[DODobjectiveNum] [varchar](5) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NewMap13]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NewMap13](
	[key1id] [int] IDENTITY(1,1) NOT NULL,
	[exk1ID] [int] NULL,
	[exk1Value] [varchar](50) NULL,
	[courseid] [varchar](50) NULL,
	[CourseTitle] [varchar](100) NULL,
	[SequenceNumber] [int] NULL,
	[crsoutcometext] [varchar](1024) NULL,
	[CrsOutcomeNum] [varchar](12) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[permit]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permit](
	[permitid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[institutionid] [int] NOT NULL,
	[personid] [int] NOT NULL,
	[permitstatusid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NULL,
 CONSTRAINT [PK_permit] PRIMARY KEY CLUSTERED 
(
	[permitid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[permit_status]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permit_status](
	[permitstatusid] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_permit_status] PRIMARY KEY CLUSTERED 
(
	[permitstatusid] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[person]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[person](
	[personid] [int] IDENTITY(1,1) NOT NULL,
	[institutionid] [int] NOT NULL,
	[firstname] [nvarchar](20) NOT NULL,
	[lastname] [nvarchar](20) NOT NULL,
	[address1] [nvarchar](50) NOT NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](20) NOT NULL,
	[st] [nvarchar](50) NOT NULL,
	[zip] [nvarchar](20) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[dob] [date] NOT NULL,
	[phonenumber1] [nvarchar](20) NOT NULL,
	[phonenumber1type] [nvarchar](6) NOT NULL,
	[phonenumber2] [nvarchar](20) NULL,
	[phonenumber2type] [nvarchar](6) NULL,
	[email] [nvarchar](50) NOT NULL,
	[isTaker] [bit] NOT NULL,
	[isProvider] [bit] NOT NULL,
	[isInstitution] [bit] NOT NULL,
	[isSA] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_PERSON] PRIMARY KEY CLUSTERED 
(
	[personid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[provider]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provider](
	[providerid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[address1] [nvarchar](50) NULL,
	[address2] [nvarchar](50) NULL,
	[city] [nvarchar](20) NULL,
	[st] [nvarchar](50) NULL,
	[zip] [nvarchar](20) NULL,
	[country] [nvarchar](20) NULL,
	[weburl] [nvarchar](50) NULL,
	[isdeleted] [bit] NULL,
	[isaccredited] [bit] NULL,
	[createdate] [datetime] NULL,
	[createdbywhom] [int] NULL,
	[modifieddate] [datetime] NULL,
	[modifiedbywhom] [int] NULL,
 CONSTRAINT [PK_PROVIDER] PRIMARY KEY CLUSTERED 
(
	[providerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[roster]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[roster](
	[rosterid] [int] IDENTITY(1,1) NOT NULL,
	[scheduledexamid] [int] NOT NULL,
	[takerid] [int] NOT NULL,
	[rosterstatusid] [int] NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[score] [varchar](25) NULL,
 CONSTRAINT [PK_ROSTER] PRIMARY KEY CLUSTERED 
(
	[rosterid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Roster_exam_status]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roster_exam_status](
	[Rosterexamstatusid] [int] IDENTITY(1,1) NOT NULL,
	[status] [nvarchar](50) NOT NULL,
	[createdate] [datetime] NOT NULL,
	[modifieddate] [datetime] NULL,
 CONSTRAINT [PK_ROSTEREXAMSTATUS] PRIMARY KEY CLUSTERED 
(
	[Rosterexamstatusid] ASC,
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[scheduled_exam]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[scheduled_exam](
	[scheduledexamid] [int] IDENTITY(1,1) NOT NULL,
	[institutionpeopleid] [int] NOT NULL,
	[examid] [int] NOT NULL,
	[examname] [nvarchar](128) NOT NULL,
	[examstarttime] [datetime] NOT NULL,
	[examendtime] [datetime] NOT NULL,
	[examdate] [datetime] NOT NULL,
	[examlocation] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_SCHEDULEDEXAM] PRIMARY KEY CLUSTERED 
(
	[scheduledexamid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubskillMapsCourseOutcome]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubskillMapsCourseOutcome](
	[SubskillCrsOutID] [int] IDENTITY(1,1) NOT NULL,
	[key1id] [int] NULL,
	[key3id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SubskillCrsOutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[svtable]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[svtable](
	[svtableid] [int] IDENTITY(1,1) NOT NULL,
	[personid] [int] NULL,
	[institutionid] [int] NULL,
	[affiliateid] [int] NULL,
	[contactid] [int] NULL,
	[proctorid] [int] NULL,
	[takerid] [int] NULL,
	[scheduledexamid] [int] NULL,
	[selectedpersonid] [int] NULL,
	[isTaker] [bit] NULL,
	[isProvider] [bit] NULL,
	[isInstitution] [bit] NULL,
	[isInstStaff] [bit] NULL,
	[isExProvStaff] [bit] NULL,
	[isDeveloper] [bit] NULL,
	[isRoster] [bit] NULL,
	[isSA] [bit] NULL,
	[providerid] [int] NULL,
 CONSTRAINT [PK_SVTABLE] PRIMARY KEY CLUSTERED 
(
	[svtableid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[taker]    Script Date: 12/2/2013 2:43:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[taker](
	[takerid] [int] IDENTITY(1,1) NOT NULL,
	[personid] [int] NOT NULL,
	[program] [nvarchar](64) NOT NULL,
	[graduationyear] [nvarchar](4) NOT NULL,
 CONSTRAINT [PK_TAKER] PRIMARY KEY CLUSTERED 
(
	[takerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Answer] ADD  DEFAULT ((0)) FOR [isCorrect]
GO
ALTER TABLE [dbo].[exam_status] ADD  CONSTRAINT [ES_CREATEDATE]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[exam_status] ADD  CONSTRAINT [ES_modifieddate]  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[examproviderstaff] ADD  DEFAULT ((0)) FOR [isEPSA]
GO
ALTER TABLE [dbo].[examproviderstaff] ADD  DEFAULT ((0)) FOR [isdeveloper]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_ADDRESS1]  DEFAULT ('') FOR [address1]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_ADDRESS2]  DEFAULT ('') FOR [address2]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_CITY]  DEFAULT ('') FOR [city]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_STATE]  DEFAULT ('') FOR [st]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_ZIP]  DEFAULT ('') FOR [zip]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_COUNTRY]  DEFAULT ('') FOR [country]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_WEBURL]  DEFAULT ('') FOR [weburl]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_ISDELETED]  DEFAULT ((0)) FOR [isdeleted]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_ISACCREDITED]  DEFAULT ((1)) FOR [isaccredited]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_CREATEDATE]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[institution] ADD  CONSTRAINT [DF_CREATEDBYWHOM]  DEFAULT ((0)) FOR [createdbywhom]
GO
ALTER TABLE [dbo].[institutionpeople] ADD  DEFAULT ((0)) FOR [isISA]
GO
ALTER TABLE [dbo].[institutionpeople] ADD  DEFAULT ((0)) FOR [isProctor]
GO
ALTER TABLE [dbo].[institutionpeople] ADD  DEFAULT ((0)) FOR [isReports]
GO
ALTER TABLE [dbo].[key1] ADD  DEFAULT ((1)) FOR [exk1ID]
GO
ALTER TABLE [dbo].[key1] ADD  DEFAULT ('IS2010 Outcome') FOR [exk1Value]
GO
ALTER TABLE [dbo].[key2] ADD  DEFAULT ((1)) FOR [exk2ID]
GO
ALTER TABLE [dbo].[key2] ADD  DEFAULT ('DOD 2011') FOR [exk2Value]
GO
ALTER TABLE [dbo].[key3] ADD  DEFAULT ((2)) FOR [exk3ID]
GO
ALTER TABLE [dbo].[key3] ADD  DEFAULT ('2013 Skill') FOR [exk3Value]
GO
ALTER TABLE [dbo].[permit] ADD  CONSTRAINT [PR_CREATEDATE]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[permit] ADD  CONSTRAINT [PR_modifieddate]  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[person] ADD  DEFAULT ((0)) FOR [isTaker]
GO
ALTER TABLE [dbo].[person] ADD  DEFAULT ((0)) FOR [isProvider]
GO
ALTER TABLE [dbo].[person] ADD  DEFAULT ((0)) FOR [isInstitution]
GO
ALTER TABLE [dbo].[person] ADD  DEFAULT ((0)) FOR [isSA]
GO
ALTER TABLE [dbo].[person] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Roster_exam_status] ADD  CONSTRAINT [RES_CREATEDATE]  DEFAULT (getdate()) FOR [createdate]
GO
ALTER TABLE [dbo].[Roster_exam_status] ADD  CONSTRAINT [SES_modifieddate]  DEFAULT (getdate()) FOR [modifieddate]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_ANSWER_EXAM] FOREIGN KEY([examitemid])
REFERENCES [dbo].[examitem] ([examitemid])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_ANSWER_EXAM]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_ANSWER_ROSTER] FOREIGN KEY([rosterid])
REFERENCES [dbo].[roster] ([rosterid])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_ANSWER_ROSTER]
GO
ALTER TABLE [dbo].[developer]  WITH CHECK ADD  CONSTRAINT [FK_DEVELOPER_EXAM] FOREIGN KEY([examid], [examname])
REFERENCES [dbo].[exam] ([examid], [examname])
GO
ALTER TABLE [dbo].[developer] CHECK CONSTRAINT [FK_DEVELOPER_EXAM]
GO
ALTER TABLE [dbo].[developer]  WITH CHECK ADD  CONSTRAINT [FK_developer_examproviderstaff] FOREIGN KEY([examproviderstaffid])
REFERENCES [dbo].[examproviderstaff] ([examproviderstaffid])
GO
ALTER TABLE [dbo].[developer] CHECK CONSTRAINT [FK_developer_examproviderstaff]
GO
ALTER TABLE [dbo].[dodarea]  WITH CHECK ADD  CONSTRAINT [FK_DODAREA_DODSKILLSET] FOREIGN KEY([dodskillsetid])
REFERENCES [dbo].[dodskillset] ([dodskillsetid])
GO
ALTER TABLE [dbo].[dodarea] CHECK CONSTRAINT [FK_DODAREA_DODSKILLSET]
GO
ALTER TABLE [dbo].[dodjobs]  WITH CHECK ADD  CONSTRAINT [FK_DODJOBS_DODAREA] FOREIGN KEY([dodareaid])
REFERENCES [dbo].[dodarea] ([dodareaid])
GO
ALTER TABLE [dbo].[dodjobs] CHECK CONSTRAINT [FK_DODJOBS_DODAREA]
GO
ALTER TABLE [dbo].[dodobjective]  WITH CHECK ADD  CONSTRAINT [FK_DODOBJECTIVE_DODAREA] FOREIGN KEY([dodareaid])
REFERENCES [dbo].[dodarea] ([dodareaid])
GO
ALTER TABLE [dbo].[dodobjective] CHECK CONSTRAINT [FK_DODOBJECTIVE_DODAREA]
GO
ALTER TABLE [dbo].[etype]  WITH CHECK ADD FOREIGN KEY([exk1ID])
REFERENCES [dbo].[ExK1] ([exk1ID])
GO
ALTER TABLE [dbo].[etype]  WITH CHECK ADD FOREIGN KEY([exk2ID])
REFERENCES [dbo].[ExK2] ([exk2ID])
GO
ALTER TABLE [dbo].[etype]  WITH CHECK ADD FOREIGN KEY([exk3ID])
REFERENCES [dbo].[ExK3] ([exk3ID])
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_EXAM_ETYPE] FOREIGN KEY([etypeid])
REFERENCES [dbo].[etype] ([etypeid])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_EXAM_ETYPE]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_EXAM_EXAMSTATUS] FOREIGN KEY([examstatusid])
REFERENCES [dbo].[exam_status] ([examstatusid])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_EXAM_EXAMSTATUS]
GO
ALTER TABLE [dbo].[exam]  WITH CHECK ADD  CONSTRAINT [FK_EXAM_PROVIDER] FOREIGN KEY([providerid])
REFERENCES [dbo].[provider] ([providerid])
GO
ALTER TABLE [dbo].[exam] CHECK CONSTRAINT [FK_EXAM_PROVIDER]
GO
ALTER TABLE [dbo].[exam_status_history]  WITH CHECK ADD  CONSTRAINT [FK_ESH_EXAM] FOREIGN KEY([examid], [examname])
REFERENCES [dbo].[exam] ([examid], [examname])
GO
ALTER TABLE [dbo].[exam_status_history] CHECK CONSTRAINT [FK_ESH_EXAM]
GO
ALTER TABLE [dbo].[examitem]  WITH CHECK ADD  CONSTRAINT [FK_EI_EXAM] FOREIGN KEY([examid], [examname])
REFERENCES [dbo].[exam] ([examid], [examname])
GO
ALTER TABLE [dbo].[examitem] CHECK CONSTRAINT [FK_EI_EXAM]
GO
ALTER TABLE [dbo].[examitem]  WITH CHECK ADD  CONSTRAINT [FK_EI_KEY1] FOREIGN KEY([key1id])
REFERENCES [dbo].[key1] ([key1id])
GO
ALTER TABLE [dbo].[examitem] CHECK CONSTRAINT [FK_EI_KEY1]
GO
ALTER TABLE [dbo].[examitem]  WITH CHECK ADD  CONSTRAINT [FK_EI_KEY2] FOREIGN KEY([key2id])
REFERENCES [dbo].[key2] ([key2id])
GO
ALTER TABLE [dbo].[examitem] CHECK CONSTRAINT [FK_EI_KEY2]
GO
ALTER TABLE [dbo].[examitem]  WITH CHECK ADD  CONSTRAINT [FK_EI_KEY3] FOREIGN KEY([key3id])
REFERENCES [dbo].[key3] ([key3id])
GO
ALTER TABLE [dbo].[examitem] CHECK CONSTRAINT [FK_EI_KEY3]
GO
ALTER TABLE [dbo].[examitem_status]  WITH CHECK ADD  CONSTRAINT [FK_EIS_EXAMITEM] FOREIGN KEY([examitemid])
REFERENCES [dbo].[examitem] ([examitemid])
GO
ALTER TABLE [dbo].[examitem_status] CHECK CONSTRAINT [FK_EIS_EXAMITEM]
GO
ALTER TABLE [dbo].[examproviderstaff]  WITH CHECK ADD  CONSTRAINT [FK_examproviderstaff_PERSON] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[examproviderstaff] CHECK CONSTRAINT [FK_examproviderstaff_PERSON]
GO
ALTER TABLE [dbo].[examproviderstaff]  WITH CHECK ADD  CONSTRAINT [FK_examproviderstaff_PROVIDER] FOREIGN KEY([providerid])
REFERENCES [dbo].[provider] ([providerid])
GO
ALTER TABLE [dbo].[examproviderstaff] CHECK CONSTRAINT [FK_examproviderstaff_PROVIDER]
GO
ALTER TABLE [dbo].[institutionpeople]  WITH CHECK ADD  CONSTRAINT [FK_IP_INSTITUTION] FOREIGN KEY([institutionid])
REFERENCES [dbo].[institution] ([institutionid])
GO
ALTER TABLE [dbo].[institutionpeople] CHECK CONSTRAINT [FK_IP_INSTITUTION]
GO
ALTER TABLE [dbo].[institutionpeople]  WITH CHECK ADD  CONSTRAINT [FK_IP_PERSON] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[institutionpeople] CHECK CONSTRAINT [FK_IP_PERSON]
GO
ALTER TABLE [dbo].[key1]  WITH CHECK ADD  CONSTRAINT [FK_KEY1_ExK1] FOREIGN KEY([exk1ID])
REFERENCES [dbo].[ExK1] ([exk1ID])
GO
ALTER TABLE [dbo].[key1] CHECK CONSTRAINT [FK_KEY1_ExK1]
GO
ALTER TABLE [dbo].[key2]  WITH CHECK ADD  CONSTRAINT [FK_KEY2_E] FOREIGN KEY([exk2ID])
REFERENCES [dbo].[ExK2] ([exk2ID])
GO
ALTER TABLE [dbo].[key2] CHECK CONSTRAINT [FK_KEY2_E]
GO
ALTER TABLE [dbo].[key3]  WITH CHECK ADD  CONSTRAINT [FK_KEY3_ExK3] FOREIGN KEY([exk3ID])
REFERENCES [dbo].[ExK3] ([exk3ID])
GO
ALTER TABLE [dbo].[key3] CHECK CONSTRAINT [FK_KEY3_ExK3]
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD  CONSTRAINT [FK_permit_exam] FOREIGN KEY([examid], [examname])
REFERENCES [dbo].[exam] ([examid], [examname])
GO
ALTER TABLE [dbo].[permit] CHECK CONSTRAINT [FK_permit_exam]
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD  CONSTRAINT [FK_permit_institution] FOREIGN KEY([institutionid])
REFERENCES [dbo].[institution] ([institutionid])
GO
ALTER TABLE [dbo].[permit] CHECK CONSTRAINT [FK_permit_institution]
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD  CONSTRAINT [FK_permit_permitstatus] FOREIGN KEY([permitstatusid], [status])
REFERENCES [dbo].[permit_status] ([permitstatusid], [status])
GO
ALTER TABLE [dbo].[permit] CHECK CONSTRAINT [FK_permit_permitstatus]
GO
ALTER TABLE [dbo].[permit]  WITH CHECK ADD  CONSTRAINT [FK_permit_person] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[permit] CHECK CONSTRAINT [FK_permit_person]
GO
ALTER TABLE [dbo].[person]  WITH CHECK ADD  CONSTRAINT [FK_PERSON_INSTITUTION] FOREIGN KEY([institutionid])
REFERENCES [dbo].[institution] ([institutionid])
GO
ALTER TABLE [dbo].[person] CHECK CONSTRAINT [FK_PERSON_INSTITUTION]
GO
ALTER TABLE [dbo].[roster]  WITH CHECK ADD  CONSTRAINT [FK_ROSTER_SE] FOREIGN KEY([scheduledexamid])
REFERENCES [dbo].[scheduled_exam] ([scheduledexamid])
GO
ALTER TABLE [dbo].[roster] CHECK CONSTRAINT [FK_ROSTER_SE]
GO
ALTER TABLE [dbo].[roster]  WITH CHECK ADD  CONSTRAINT [FK_ROSTER_TAKER] FOREIGN KEY([takerid])
REFERENCES [dbo].[taker] ([takerid])
GO
ALTER TABLE [dbo].[roster] CHECK CONSTRAINT [FK_ROSTER_TAKER]
GO
ALTER TABLE [dbo].[scheduled_exam]  WITH CHECK ADD  CONSTRAINT [FK_SE_EXAM] FOREIGN KEY([examid], [examname])
REFERENCES [dbo].[exam] ([examid], [examname])
GO
ALTER TABLE [dbo].[scheduled_exam] CHECK CONSTRAINT [FK_SE_EXAM]
GO
ALTER TABLE [dbo].[scheduled_exam]  WITH CHECK ADD  CONSTRAINT [FK_SE_IP] FOREIGN KEY([institutionpeopleid])
REFERENCES [dbo].[institutionpeople] ([institutionpeopleid])
GO
ALTER TABLE [dbo].[scheduled_exam] CHECK CONSTRAINT [FK_SE_IP]
GO
ALTER TABLE [dbo].[svtable]  WITH CHECK ADD  CONSTRAINT [FK_SV_INSTITUTION] FOREIGN KEY([institutionid])
REFERENCES [dbo].[institution] ([institutionid])
GO
ALTER TABLE [dbo].[svtable] CHECK CONSTRAINT [FK_SV_INSTITUTION]
GO
ALTER TABLE [dbo].[svtable]  WITH CHECK ADD  CONSTRAINT [FK_SV_PERSON] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[svtable] CHECK CONSTRAINT [FK_SV_PERSON]
GO
ALTER TABLE [dbo].[svtable]  WITH CHECK ADD  CONSTRAINT [FK_SV_SCHEDULEDEXAM] FOREIGN KEY([scheduledexamid])
REFERENCES [dbo].[scheduled_exam] ([scheduledexamid])
GO
ALTER TABLE [dbo].[svtable] CHECK CONSTRAINT [FK_SV_SCHEDULEDEXAM]
GO
ALTER TABLE [dbo].[svtable]  WITH CHECK ADD  CONSTRAINT [FK_SV_TAKER] FOREIGN KEY([takerid])
REFERENCES [dbo].[taker] ([takerid])
GO
ALTER TABLE [dbo].[svtable] CHECK CONSTRAINT [FK_SV_TAKER]
GO
ALTER TABLE [dbo].[taker]  WITH CHECK ADD  CONSTRAINT [FK_TAKER_PERSON] FOREIGN KEY([personid])
REFERENCES [dbo].[person] ([personid])
GO
ALTER TABLE [dbo].[taker] CHECK CONSTRAINT [FK_TAKER_PERSON]
GO
ALTER TABLE [dbo].[examitem]  WITH CHECK ADD  CONSTRAINT [CK_EI_CORRECTANSWER] CHECK  (([correctanswer]='D' OR [correctanswer]='C' OR [correctanswer]='B' OR [correctanswer]='A'))
GO
ALTER TABLE [dbo].[examitem] CHECK CONSTRAINT [CK_EI_CORRECTANSWER]
GO
USE [master]
GO
ALTER DATABASE [TESTDB] SET  READ_WRITE 
GO
