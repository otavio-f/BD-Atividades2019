mysqldump AULAS_NOITE_2019 -u root -p > dump-2019-05-02.sql
mysqldump --all-databases -u root -p > dump-all-2019-05-02.sql

mysql -u root -DBACKUP -p < dump-2019-05-02.sql
