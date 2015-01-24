use diary;

delete from diaries;

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
limit 10
;


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
limit 10
;