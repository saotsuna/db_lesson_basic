Q1
create table departments (
  `department_id` INT unsigned AUTO_INCREMENT PRIMARY KEY,NOT NULL,
  `name` VARCHAR(20) not null,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q3で使用構文。
UPDATE reports SET person_id =  1 WHERE person_id >= 7;

-- UPDATE reports SET person_id =  1 WHERE person_id = 8;

UPDATE reports SET person_id =  3 WHERE person_id = 12;


Q3-1
insert into departments (department_id, name)
   values
     (1, '営業'),
     (2, '開発'),
     (3, '経理'),
     (4, '人事'),
     (5, '情報システム');

Q3-2
insert into people (name, email, age, gender)
   values
    ('伊地知', 'jshshakak@gimail.com', 17, 2),
    ('山田', 'jddhkkkui@gimail.com', 17, 2),
    ('後藤', 'gotoqk@gmail.com', 16, 2),
    ('喜多', 'kita@gimail.com', 16, 2),
    ('加藤', 'kato@gmail.com', 18, 2),
    ('斎藤', 'sai@gmail.com', 19, 2),
    ('遠藤', 'end@gmail.com', 19, 2),
    ('伊藤', 'ito@gmail.com', 21, 2),
    ('安藤', 'and@gmail.com', 23, 2),
    ('近藤', 'kon@gmail.com', 28, 2);

Q3-3
insert into reports (person_id, content)
values
(11, '下北沢でバンド練習をした。'),
(12, 'スタジオを借りて練習した。'),
(13, 'カラオケで歌を歌った。'),
(14, '横浜アリーナでライブをした。'),
(15, '武道館で初のワンマンライブをした。'),
(16, '家でのんびりと休日を過ごした。'),
(17, '毎朝ギターの練習をしている。'),
(18, '好きなアーティストのアルバムを購入した。'),
(19, 'エンジニアになる為の勉強をした。'),
(20, '彼女と誕生日祝いに旅行計画してる。');

Q4
UPDATE people SET department_id = '2' where person_id 2;


SELECT * FROM people ORDER BY age DESC;　←年齢の降順で並べる。　ASC で昇順になる。何も指定しないとデフォルトは、昇順。

SELECT * FROM people WHERE gender = 1;  ←性別絞って習得

Q5
SELECT * FROM people WHERE gender = 1 ORDER BY age DESC; ←whereと併用可能。

Q6
SELECT
  `name`, `email`, `age`　名前、メール、年齢というカラム名。
FROM
  `people`　peopleというテーブル名。
WHERE
  `department_id` = 1　何処かを指定。
ORDER BY
  `created_at`;　　作成された時間を昇順で並べる。

Q6回答。
peopleテーブル名の中のname,email,age3つのカラムを`department_id` = 1の部署IDを持っている者のみに指定して作成された時間の昇順に並び替えてレコード表示すること。

Q7
SELECT * FROM people WHERE age >= 20 and age <= 30 AND gender = 2 and age >= 40 AND age <= 50 and gender = 1;
SELECT * FROM people WHERE age >= 40 AND age <= 50 and gender = 1; ←and カラム名を使用することで、追加で指定可能。

Q8
SELECT * FROM people where department_id = '1' ORDER BY age asc;

Q9
SELECT AVG(age) AS average_age FROM people GROUP BY gender = 2 and department_id = '2'; ←平均値求める。

Q10
SELECT p.person_id, p.name, p.department_id, r.content FROM people p JOIN reports r USING (person_id);

Q11
SELECT * FROM people where person_id >= 7;