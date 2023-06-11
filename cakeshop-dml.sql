select c.customer_id, c.first_name, c.last_name, count(*) as total_order
from customer c join `order` o on c.customer_id = o.customer_id
group by c.customer_id
order by total_order desc;

select s.staff_id, s.first_name, s.last_name, count(*) as total_order from `order` o join staff s on o.staff_id = s.staff_id
group by staff_id
order by total_order desc;

select m.menu_id, m.menu_name, sum(qty) as most_order from menu m join order_detail od on m.menu_id = od.menu_id
group by m.menu_id
order by most_order desc;

select c.first_name, c.last_name, sum(total_price) as most_spent from customer c join `order` o on c.customer_id = o.customer_id join
order_detail od on o.order_id = od.order_id
group by c.customer_id
order by most_spent desc
limit 5;

select s.staff_id, s.first_name, s.last_name, sum(total_price) as total from staff s join `order` o on s.staff_id = o.staff_id
join order_detail od on o.order_id = od.order_id
group by s.staff_id order by total desc;

select max(price) from menu;
select min(price) from menu;

select gender, count(gender) from customer
group by gender;

select c.customer_id, c.first_name, c.last_name, o.order_id, m.menu_name, sum(qty) as total_buy
from customer c join `order` o on c.customer_id = o.customer_id join order_detail od on o.order_id = od.order_id join menu m on od.menu_id = m.menu_id
group by o.order_id;