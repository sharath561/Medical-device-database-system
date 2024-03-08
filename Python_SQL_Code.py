import mysql.connector

# Connect to the MySQL database
try:
    connection = mysql.connector.connect(
        host="localhost", user="root", password="", database="medical_device_startup"
    )
    cursor = connection.cursor()
    if connection.is_connected():
        print("Database Connection is successful")
    else:
        print("Not connected")

    # Execute the SQL query
    query = "SELECT * FROM incoming_inventory_control"
    cursor.execute(query)

    # Fetch all rows from the result set
    rows = cursor.fetchall()

    # Print the data to the screen
    print("Database Report:")
    for row in rows:
        print(row)

    # Write the data to a text file
    with open("database_report.txt", "w") as file:
        file.write("Database Report:\n")
        for row in rows:
            file.write(str(row) + "\n")

    print("Report generated successfully.")

except mysql.connector.Error as error:
    print("Error:", error)

finally:
    # Close the database connection
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Database connection closed.")
