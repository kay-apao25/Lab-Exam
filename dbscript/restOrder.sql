create table restOrder(
    order_id int primary key,
    Vegetables text,
	Sea_foods text,
	Typeof_rice text,
    Beverages text,
    Dessert text
);

--HOW TO USE:
-- SELECT loadOrder(1);

create or replace function loadOrder(in int, out text, out text, out text, out text, out text) 

	returns setof record as

$$ 
     
	select Vegetables, Sea_foods, Typeof_rice, Beverages, Dessert from restOrder
    
                where order_id = $1;
    

$$
 
language 'sql';

--HOW TO USE:
-- SELECT setOrder(1, 'Pinakbet', 'Sizzling Squid', 'Garlic Rice', 'Iced Tea', 'Mango Float');

create or replace function setOrder(p_order_id int,
	p_Vegetables text, p_Sea_foods text, 
	p_Typeof_rice text, p_Beverages text, p_Dessert text) 
returns text as
$$
declare
  v_order_id int; 
begin
  
  insert into restOrder(order_id, Vegetables, Sea_foods, Typeof_rice, Beverages, Dessert) values
	(p_order_id, p_Vegetables, p_Sea_foods, p_Typeof_rice, p_Beverages, p_Dessert);
  
  return 'OK';
  end;
$$
    language 'plpgsql';
    
	
--HOW TO USE:
-- SELECT displayOrder(1);

create or replace function displayOrder(in int, out text, out text, out text, out text, out text) 

	returns record as

$$ 
     
	select Vegetables, Sea_foods, Typeof_rice, Beverages, Dessert from restOrder
    
                where order_id = $1;
    

$$
 
language 'sql';

--HOW TO USE:
-- SELECT changeOrder(1, 'Chopsuey','Camaroon','Fried Rice','Iced Tea', 'Mango Float');

create or replace function changeOrder(p_order_id int,
	p_Vegetables text, p_Sea_foods text, 
	p_Typeof_rice text, p_Beverages text, p_Dessert text)
returns text as
$$
declare
  v_order_id int; 
begin
  select into v_order_id order_id from restOrder
	where order_id = p_order_id;
  update restOrder
	set Vegetables = p_Vegetables,Sea_foods = p_Sea_foods,Typeof_rice = p_Typeof_rice, Beverages = p_Beverages, Dessert = p_Dessert
          where order_id = p_order_id;
	    
    return 'OK';
  end;
$$
    language 'plpgsql';
