CREATE TABLE IF NOT EXISTS Book(
	p_id VARCHAR(10) NOT NULL,
	p_name VARCHAR(20),
	p_unitPrice  INTEGER,
	p_Author  VARCHAR(50),
	p_description TEXT,
	p_Publisher VARCHAR(20),
	p_category VARCHAR(20),
	p_unitsInStock LONG,
	p_totalPages LONG,
	p_releaseDate VARCHAR(20),
	p_condition VARCHAR(20),
	p_fileName  VARCHAR(20),
	PRIMARY KEY (p_id)
)default CHARSET=utf8;