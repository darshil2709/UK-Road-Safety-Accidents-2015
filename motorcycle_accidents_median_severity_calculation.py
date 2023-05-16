import pymysql

# Connect to the database
myConnection = pymysql.connect(
    host="localhost",
    user="root",
    password="root",
    db="accidents"
)

# Create a cursor object
cur = myConnection.cursor()

# Select the distinct vehicle types that contain "torcycle" from the vehicle_types table
cur.execute(
    "SELECT DISTINCT vehicle_type FROM vehicle_types WHERE vehicle_type LIKE '%torcycle%';"
)
cycle_list = cur.fetchall()

# Define the SQL queries
select_query = '''
SELECT vt.vehicle_type, a.accident_severity
FROM accident a
JOIN vehicles v ON a.accident_index = v.accident_index
JOIN vehicle_types vt ON v.vehicle_type = vt.vehicle_code
WHERE vt.vehicle_type = %s
ORDER BY a.accident_severity;
'''
insert_query = '''
INSERT INTO accidents_median (vehicle_type, median_severity) VALUES (%s, %s);
'''

# Loop through the cycle_list and calculate the median severity for each vehicle type
for cycle in cycle_list:
    # Execute the select query with the current cycle type
    cur.execute(select_query, cycle)
    accidents = cur.fetchall()

    # Calculate the median severity
    n = len(accidents)
    median_severity = (accidents[(n - 1) // 2][1] + accidents[n // 2][1]) / 2

    print("Finding median severity for", cycle)

    # Insert the median severity into the accidents_median table
    cur.execute(insert_query, (cycle[0], median_severity))

# Commit the changes and close the connection
myConnection.commit()
myConnection.close()
