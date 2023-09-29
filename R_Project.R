install.packages('RMySQL')
library(RMySQL)

# Connect to localhost MySQL database 

connect = dbConnect(MySQL(), 
                     user = 'root', 
                     password = '', 
                     dbname = 'hrishikesh',
                     host = 'localhost')

# View all the available tables in the database

dbListTables(connect)

Tdata=dbGetQuery(connect,'select * from financials')
print(Tdata)


# Perform CRUD Operations on the table.

# 1 Create(Insert) a record 
Create_Record = dbSendQuery(connect,"INSERT INTO financials (movie_id,budget,revenue,unit,currency)VALUES(369,600,200,'Millions','INR')")


# 2 Read a Record

Read_Record = "SELECT * from financials WHERE movie_id = 369"
Financials = dbGetQuery(connect,Read_Record)
print(Financials)

# 3 Update a Record

Update_Record = "UPDATE financials SET revenue = 800 WHERE movie_id = 369"
dbSendQuery(connect,Update_Record)

# 4 Delete a record

Delete_Record = "DELETE FROM financials WHERE movie_id = 369"
dbSendQuery(connect,Delete_Record)

# View the table records

view_records = dbGetQuery(connect,"SELECT * FROM Financials")
print(view_records)


#Disconnect the database connection
dbDisconnect(connect)
