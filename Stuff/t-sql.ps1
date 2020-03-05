
$query = "
CREATE TABLE testtable (
Column_1 INT PRIMARY KEY IDENTITY (1,1),
Column_2 VARCHAR (5),
Column_3 VARCHAR (10) NOT NULL,
);" 

$query = " DROP TABLE testtable;"

Invoke-Sqlcmd -ServerInstance MyServer -Database MyDatabase -Query $query