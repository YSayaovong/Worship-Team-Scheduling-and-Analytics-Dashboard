-- Drop the view first because it depends on the table
DROP VIEW IF EXISTS worship_song_summary;

-- Drop the old table if it exists
DROP TABLE IF EXISTS worship_songs_master;

-- Create fresh master table
CREATE TABLE worship_songs_master (
    id SERIAL PRIMARY KEY,
    service_date DATE NOT NULL,
    song_title TEXT NOT NULL,
    theme TEXT
);

-- Create fresh dynamic view
CREATE OR REPLACE VIEW worship_song_summary AS
SELECT
    EXTRACT(YEAR FROM service_date) AS year,
    EXTRACT(MONTH FROM service_date) AS month,
    song_title,
    COUNT(*) AS times_used,
    theme
FROM worship_songs_master
GROUP BY year, month, song_title, theme
ORDER BY year, month, times_used DESC;

INSERT INTO worship_songs_master (service_date, song_title, theme) VALUES
('2025-01-05', 'Hnub No Peb Sawvdaws Tuaj Ua Kev Zoo Siab (#270)', 'God as our Creator'),
('2025-01-05', 'Yexus Coj Kuv Mus Kev Tshav Ntuj (#152)', 'God as our Creator'),
('2025-01-05', 'Cov Ntseeg Yexus Yog Ib Tsevneeg (#154)', 'God as our Creator'),
('2025-01-12', 'Koj Yog Vajtswv (#4)', 'God is Good (He is the good Shepherd)'),
('2025-01-12', 'Tswv Yexus Lub Npe (#145)', 'God is Good (He is the good Shepherd)'),
('2025-01-12', 'Nimno Kuv Los Ntseeg Yexus (#151)', 'God is Good (He is the good Shepherd)'),
('2025-01-19', 'Thaum Vajtswv Tseem Tsis Tau Tsim (#2)', 'God is Love'),
('2025-01-19', 'Yexus Hlub Kuv (#40)', 'God is Love'),
('2025-01-19', 'Tswv Yexus Koj Yog Tus Hlub Kuv', 'God is Love'),
('2025-01-26', 'Zoo Siab Kawg (#112)', 'God is our salvation'),
('2025-01-26', 'Peb Cov Ntseeg Txhua Leej Txhua Tus (#120)', 'God is our salvation'),
('2025-01-26', 'Yexus Yog Lub Chaw Ruaj Khov Kho (#115)', 'God is our salvation'),
('2025-02-02', 'Vajtswv, Vajtswv, Vajtswv (#6)', 'Holiness and Sin'),
('2025-02-02', 'Leejtwg Txhiv Tau Peb Lub Txim (#82)', 'Holiness and Sin'),
('2025-02-02', 'Kuv Muab Kuv Lub Cev (#29)', 'Holiness and Sin'),
('2025-02-09', 'Kuv Nyiam Hais Txog Vajtswv Txojlus (#131)', 'Death was the price'),
('2025-02-09', 'Tswv Yexus Koj Tuag Txhiv Kuv (#240)', 'Death was the price'),
('2025-02-09', 'Kuv Lub Txim Yexus Them Tag (#213)', 'Death was the price'),
('2025-02-16', 'Vajtswv, Ua Koj Tsaug (#283)', 'The beauty of the bride: LOVE'),
('2025-02-16', 'Kuv Niajhnub Pheej Xav Txog (#49)', 'The beauty of the bride: LOVE'),
('2025-02-16', 'Cov Kwvtij Hmoob (#91)', 'The beauty of the bride: LOVE'),
('2025-02-23', 'Haleluyas Qhuas Tswv Yexus (#348)', 'All the Same'),
('2025-02-23', 'Vajtswv Phau Ntawv (#78)', 'All the Same'),
('2025-02-23', 'Thaum Sawvdaws Tseem Ua Neej (#162)', 'All the Same'),
('2025-03-02', 'Thaum Peb Los Ntseeg Tswv Yexus (#60)', '???'),
('2025-03-02', 'Tus Uas Sawm Zoo (#77)', '???'),
('2025-03-02', 'Vajtswv Kuv Txav Los Cuag Koj (#30)', '???'),
('2025-03-16', 'Kuv Txhos Caug Ntua Qhuas Yexus (#42)', 'The tongue is a fire'),
('2025-03-16', 'Cov Uas Tseeg Tswv Yexus Muaj Chaw Nyob (#99)', 'The tongue is a fire'),
('2025-03-16', 'Vajtswv, Thov Koj Tshuaj Xyuas (#32)', 'The tongue is a fire'),
('2025-03-16', 'Tswv Yexus Thov Koj Mloog Kuv Thov (#31)', 'The tongue is a fire'),
('2025-03-23', 'Vajtswv Hu Peb Los Ua Nws Haivneeg (#90)', 'Holiness is demanded by the Lord in the church'),
('2025-03-23', 'Vajtswv Koj Yeej Hlub Peb Kawg (#21)', 'Holiness is demanded by the Lord in the church'),
('2025-03-23', 'Peb Cov Ntseeg Peb Yuav Tsum Tsim Dheev (#185)', 'Holiness is demanded by the Lord in the church'),
('2025-03-23', 'Kuv Muab Siab Npuab Yexus', 'Holiness is demanded by the Lord in the church'),
('2025-03-29', 'Peb Yog Tswv Yexus Ib Pab Tub Rog (#104)', 'Leadership Training Saturday'),
('2025-03-29', 'Peb Koom Ib Lub Siab (#155)', 'Leadership Training Saturday');

SELECT * FROM worship_song_summary;

