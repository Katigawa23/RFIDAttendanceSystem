--Create DATABASE rfid_atms_db for creation of new db

--USE rfid_atms_db
--CREATE TABLE user_records(
--	id INT IDENTITY (1,1) PRIMARY KEY,
--	user_id VARCHAR(255),
--	first_name VARCHAR(100),
--	middle_name VARCHAR(100),
--	last_name VARCHAR(100),
--	date_created DATETIME DEFAULT GETDATE()
--)

--USE rfid_atms_db
--SELECT * FROM sys.tables;

--USE rfid_atms_db
--GO

--CREATE PROCEDURE SaveRecords
--	@user_id VARCHAR(255),
--	@first_name VARCHAR(100),
--	@middle_name VARCHAR(100),
--	@last_name VARCHAR(100)
--	AS
--	BEGIN
--		SET NOCOUNT ON;
--		INSERT INTO user_records(user_id, first_name, middle_name, last_name, date_created)
--		VALUES(@user_id, @first_name, @middle_name, @last_name, GETDATE());
--	END;

--GO

--USE rfid_atms_db
--EXEC SaveRecords '0001', 'Kerby', 'Torralba', 'Morte'

--USE rfid_atms_db
--GO
--CREATE PROCEDURE GetAllRecords
--AS
--	BEGIN
--	SELECT * FROM user_records
--	END;
--GO

--USE rfid_atms_db
--EXEC GetAllRecords;

--USE rfid_atms_db
--EXEC SaveRecords '0002', 'Kerbs', 'Bryan', 'Morte' 

--DELETE FROM user_records WHERE id = 6
--EXEC GetAllRecords;

--USE rfid_atms_db
--GO
--CREATE PROCEDURE RemoveRecord
--	@id INT
--AS
--	BEGIN
--	DELETE FROM user_records WHERE id = @id;
--	EXEC GetAllRecords;
--	END;
--GO

--	EXEC RemoveRecord 2


USE rfid_atms_db
GO
	CREATE PROCEDURE UpdateRecords
		@id INT,
		@user_id VARCHAR(100),
		@first_name VARCHAR(100),
		@middle_name VARCHAR(100),
		@last_name VARCHAR(100)
	AS
	BEGIN
		UPDATE user_records 
			SET 
			user_id = @user_id,
			first_name = @first_name,
			middle_name = @middle_name,
			last_name = @last_name
		WHERE id = @id;
		EXEC GetAllRecords;
	END;
GO


USE rfid_atms_db
EXEC GetAllRecords;
EXEC UpdateRecords 1, '0002', 'Naruto', 'Uzumaki', 'Shippuden'