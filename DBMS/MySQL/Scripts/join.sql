USE startersql;
SELECT
  users.name, users.gender, addresses.city, addresses.state, addresses.id AS addresses_id
  FROM users INNER JOIN addresses
  ON users.id = addresses.user_id;
