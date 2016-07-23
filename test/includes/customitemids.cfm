
select newitem from items where inventory>3 and (status =0 or status=3) and supplier not like 'mma%' order by inventory desc