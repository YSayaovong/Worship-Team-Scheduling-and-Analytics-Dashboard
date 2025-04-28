
-- Create Table
CREATE TABLE worship_songs (
    id SERIAL PRIMARY KEY,
    date DATE,
    song_title TEXT,
    theme TEXT
);

-- Sample Inserts (replace with actual data or use ETL to bulk import from CSV/Excel)
-- INSERT INTO worship_songs (date, song_title, theme) VALUES
-- ('2025-01-05', 'Hnub No Peb Sawvdaws Tuaj Ua Kev Zoo Siab (#270)', 'God As Our Creator'),
-- ('2025-01-05', 'Yexus Coj Kuv Mus Kev Tshav Ntuj (#152)', 'God As Our Creator'),
-- (... additional rows ...);

-- Query 1: Most Used Songs
SELECT song_title, COUNT(*) AS usage_count
FROM worship_songs
GROUP BY song_title
ORDER BY usage_count DESC
LIMIT 10;

-- Query 2: Most Common Themes
SELECT theme, COUNT(*) AS theme_count
FROM worship_songs
GROUP BY theme
ORDER BY theme_count DESC;

-- Query 3: Songs Per Sunday
SELECT date, COUNT(*) AS songs_per_day
FROM worship_songs
GROUP BY date
ORDER BY date;

-- Query 4: Songs Repeated Across Multiple Sundays
SELECT song_title, COUNT(*) AS repeats
FROM worship_songs
GROUP BY song_title
HAVING COUNT(*) > 1;

-- Query 5: Theme Distribution Per Month (Optional enhancement)
SELECT TO_CHAR(date, 'Month') AS month, theme, COUNT(*) AS count
FROM worship_songs
GROUP BY month, theme
ORDER BY month, count DESC;

-- Optional: Create a Summary View
CREATE VIEW worship_summary AS
SELECT
    date,
    song_title,
    theme,
    TO_CHAR(date, 'Month') AS month,
    EXTRACT(WEEK FROM date) AS week
FROM worship_songs;
