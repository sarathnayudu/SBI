create procedure sp_ApproveTimeOff 
(
@PK_EmpTimeOffID uniqueidentifier=null,
@Approved_Status varchar(15)
) with encryption
as
begin
 Update tblEmployeeTimeOff set Approved_Status=@Approved_Status where PK_EmpTimeOffID=@PK_EmpTimeOffID 
end

create procedure sp_GetState with encryption
as
begin
 select * from tblState
end

