
CONNECTION = SQLite3::Database.new("railfan.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS trains (id INTEGER PRIMARY KEY, name TEXT NOT NULL, location_id INTEGER NOT NULL, FOREIGN KEY(location_id) REFERENCES locations(id));")
CONNECTION.execute("CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY KEY, name TEXT NOT NULL);")

CONNECTION.results_as_hash = true
