CREATE TABLE IF NOT EXISTS products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  category VARCHAR(60) NOT NULL,
  gender VARCHAR(20) NOT NULL,
  price NUMERIC(10,2) NOT NULL,
  image_url TEXT NOT NULL
);

INSERT INTO products (name, category, gender, price, image_url)
VALUES
  ('Slim Fit Casual Shirt', 'Shirts', 'men', 1299.00, 'https://images.unsplash.com/photo-1603252109303-2751441dd157?q=80&w=1000'),
  ('Regular Fit Denim Jeans', 'Jeans', 'men', 1499.00, 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=1000'),
  ('Floral Summer Dress', 'Dresses', 'women', 1799.00, 'https://images.unsplash.com/photo-1496747611176-843222e1e57c?q=80&w=1000'),
  ('Women Ethnic Kurta Set', 'Ethnic Wear', 'women', 1999.00, 'https://images.unsplash.com/photo-1610030469983-98e550d6193c?q=80&w=1000')
ON CONFLICT DO NOTHING;
