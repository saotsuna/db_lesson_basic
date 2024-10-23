
Q1
create table departments (
  `department_id` INT unsigned AUTO_INCREMENT PRIMARY KEY,NOT NULL,
  `name` VARCHAR(20) not null,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

Q2
ALTER TABLE people MODIFY department_id text after email ;
-- ←emailがdepartment_id の上に来るよう指定。
ALTER TABLE people MODIFY department_id INT unsigned;

Q3で使用構文一例。
-- UPDATE people SET department_id =  2 WHERE person_id >= 13;
-- UPDATE people SET department_id =  1 WHERE person_id >= 7 and person_id < 10;
-- UPDATE people SET department_id =  3 WHERE person_id = 10;
-- UPDATE reports SET person_id =  12 WHERE report_id = 2;
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
-- レコードの更新や修正時にupdate テーブル　set カラム＝値；を使用。

Q5
SELECT * FROM people WHERE gender = 1 ORDER BY age DESC;
-- 昇順に並び替えて表示。
-- SELECT * FROM people ORDER BY age DESC;　←年齢の降順で並べる。　ASC で昇順になる。何も指定しないとデフォルトは、昇順。
-- SELECT * FROM people WHERE gender = 1;  ←性別絞って習得

Q6
SELECT
  `name`, `email`, `age`
  -- 名前、メール、年齢というカラム名を表示
FROM
  `people`
  -- peopleというテーブルから
WHERE
  `department_id` = 1
  -- 表示するレコード条件
ORDER BY
  `created_at`;
  -- 作成された日時を昇順で並べ替える
Q6回答。
peopleテーブルから名前,メールアドレス,年齢3つのカラムを表示する条件として`department_id` = 1という部署IDを持っている者に指定し作成された日時の昇順に並び替えること。

Q7
SELECT * -- 全てのカラムを表示せよ
FROM people  -- peopleテーブルから
WHERE -- 表示するレコードの条件
age >= 20 and age < 30 AND gender = 2 -- 20代の女性
 or -- もしくは
age >= 40 AND age < 50 and gender = 1; -- 40代の男性

Q8
SELECT * FROM people
where department_id = '1'
ORDER BY age asc;
-- ascで昇順。order byで並び替える。

Q9
SELECT AVG(age)
AS average_age
FROM people
GROUP BY gender = 2
and department_id = '2';
-- ←平均値求める。　group by 集計する際に使用。

Q10
SELECT p.person_id, p.name, p.department_id, r.content
FROM people p
JOIN reports r
USING (person_id);
-- peopleテーブルとreportテーブルそれぞれの情報をまとめて習得

Q11
-- SELECT * FROM people where person_id >= 7;
SELECT p.person_id, p.name, r.content
FROM people p
left outer join reports r
using (person_id)
where content is null ;

-- where content = NULL←NULLという不明の値は比較できない為、＝ではなくisが必要になる。
-- where content = 'NULL'←エラー表示になる。

-- SELECT p.person_id, p.name, r.content
-- FROM people p
-- left outer join reports r
-- using
-- where person_id >= 7 (person_id);←７以上を表すので指定通りに可能ではあるが、これだと付け加えるか変更した際に対応できない。