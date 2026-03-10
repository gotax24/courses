insert into persons (first_name, last_name, birthday)
values (
        'Yaldriani',
        'De Bracho',
        '2000/04/18'
       );

update persons set email = 'yaldriani@gmail.com' where id = '7226c01a-f28d-4532-9a1a-0c0c03869e32' ;
update persons set email = 'ernestobracho@cevaz.com' where id = '7226c01a-f28d-4532-9a1a-0c0c03869e32' ;

insert into persons (first_name, last_name, birthday, email)
values (
        'Ernesto',
        'Bracho',
        '1999/09/30',
        'ernestobracho@gmail.com'
       ), (
           'Rosanna',
           'Ragno',
           '1959/07/28',
           'rosannaragno@gmail.com'
);

insert into jobs (persons_id, job_name)
values (
        'da7d75f9-c8f0-468d-8dfc-ec7f12a0d949',
        'Asistente de proyecto | Analista SGC'
       );

select * from persons;
select * from jobs;