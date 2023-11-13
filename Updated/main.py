import logging, os, random, sqlite3, json
from datetime import datetime
import funkcijos

softVer = '2.0.0'
dbVer = '1.0.0'
# Get the AppData directory
appdata_dir = os.environ['APPDATA']
funkcijos.create_folder(f"{appdata_dir}\\MazasisVampyras\\log")

app_m_data = os.path.join(appdata_dir, 'MazasisVampyras')

# Construct the path to the log file in the AppData directory
log_file_path = f"{appdata_dir}\\MazasisVampyras\\log\\{datetime.now().strftime('%Y-%m-%d')}.txt"

# Set up logging configuration
logging.basicConfig(
    filename=log_file_path,
    level=logging.INFO,
    format="[%(asctime)s] (Mažasis Vampyras) [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S"
)

logging.info("Application was started successfully")

db = sqlite3.connect(app_m_data + "\\data.sqlite")
dbc = db.cursor()

dbc.execute('''
        CREATE TABLE IF NOT EXISTS license (
            license_type TEXT,
            license_key TEXT,
            license_expiration_date TEXT
        );
        CREATE TABLE IF NOT EXISTS settings (
            setting_id INTEGER PRIMARY KEY AUTOINCREMENT,
            setting_name TEXT,
            setting_value TEXT
        );
        CREATE TABLE IF NOT EXISTS users (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            money INTEGER DEFAULT 0,
            upgrades INTEGER DEFAULT 0
        );
    ''')
db.commit()

# Check if 'DbVersion' exists in settings
dbc.execute("SELECT setting_value FROM settings WHERE setting_name = 'DbVersion';")
db_version_row = dbc.fetchone()

if db_version_row is None:
    # 'DbVersion' not found, insert the value
    logging.warn("Programa buvo pirma karta paleista, nustatymai įrašomi...")
    dbc.execute("INSERT INTO settings (setting_name, setting_value) VALUES ('DbVersion', ?);", (dbVer,))
elif db_version_row != dbVer:
    logging.warn(f"Duomenų bazė buvo atnaujinta, pakeičiama versija iš {db_version_row} į {dbVer}")
    dbc.execute("UPDATE settings SET setting_value = ? WHERE setting_name = 'DbVersion';", (dbVer,))


# Check if 'SoftwareVersion' exists in settings
dbc.execute("SELECT setting_value FROM settings WHERE setting_name = 'SoftwareVersion';")
software_version_row = dbc.fetchone()

if software_version_row is None:
    # 'SoftwareVersion' not found, insert the value
    logging.warn("Programa buvo pirma karta paleista, nustatymai įrašomi...")
    dbc.execute("INSERT INTO settings (setting_name, setting_value) VALUES ('SoftwareVersion', ?);", (softVer,))
elif software_version_row != softVer:
    logging.warn(f"Programa buvo atnaujinta, pakeičiama duomenų bazės versija iš {software_version_row} į {softVer}")
    dbc.execute("UPDATE settings SET setting_value = ? WHERE setting_name = 'SoftwareVersion';", (softVer,))

# Commit the changes
db.commit()

# ! Check For License Code 