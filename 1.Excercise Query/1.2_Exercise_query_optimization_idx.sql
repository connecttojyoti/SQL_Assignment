 CREATE INDEX idx_orders_customer_date ON Orders(customer_id); 
 CREATE INDEX idx_orders_date ON Orders(order_date)
 CREATE INDEX idx_order_details_order_id ON Order_Details(order_id);