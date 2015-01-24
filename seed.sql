use diary;

delete from diaries;
alter table diaries auto_increment = 1;


insert into diaries

select
null,
entry_authored_on,
1,
entry_title,
entry_text,
null,
entry_id,
entry_created_on,
entry_modified_on
from mt.mt_entry
order by entry_authored_on
;


select title,authored_on from diaries limit 10 ;