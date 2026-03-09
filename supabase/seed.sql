begin;

delete from public.product_images;
delete from public.products;
delete from public.subcategories;
delete from public.categories;

insert into public.categories (name, slug, sort_order)
values ('Meat', 'meat', 0);

insert into public.categories (name, slug, sort_order)
values ('Deli', 'deli', 2);

insert into public.categories (name, slug, sort_order)
values ('Pies', 'pies', 1);

insert into public.categories (name, slug, sort_order)
values ('Cheese', 'cheese', 3);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'meat'),
  'Chicken, Duck & Game',
  'meat-chicken-duck-game',
  0
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'deli'),
  'Store Cupboard',
  'deli-store-cupboard',
  0
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'meat'),
  'Pork',
  'meat-pork',
  1
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'meat'),
  'Lamb',
  'meat-lamb',
  2
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'meat'),
  'Beef',
  'meat-beef',
  3
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'deli'),
  'None',
  'deli-none',
  1
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'pies'),
  'Beef / Pork Pies',
  'pies-beef-pork-pies',
  0
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'deli'),
  'Cooked Meats',
  'deli-cooked-meats',
  2
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'cheese'),
  'Guest Cheeses',
  'cheese-guest-cheeses',
  0
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'deli'),
  'Patisserie',
  'deli-patisserie',
  3
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'pies'),
  'Special Pies',
  'pies-special-pies',
  1
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'cheese'),
  'Everyday Cheeses',
  'cheese-everyday-cheeses',
  1
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'cheese'),
  'None',
  'cheese-none',
  2
);

insert into public.subcategories (category_id, name, slug, sort_order)
values (
  (select id from public.categories where slug = 'pies'),
  'Meat & Potato Pie',
  'pies-meat-potato-pie',
  2
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd33',
  '4 Quail',
  '4-quail',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  14,
  'by_weight',
  null,
  null,
  'Small game birds known for their delicate and flavorful meat.',
  '<p>Small game birds known for their delicate and flavorful meat.</p>',
  'Small game birds known for their delicate and flavorful meat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cb7fa2923ec66dd9265ff6_64a98abf3ad9b2d8948556c8_Quail4.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:43.000Z',
  '2023-08-15T20:04:33.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12d',
  'Apple Sauce',
  'apple-sauce',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Smooth and slightly tart, the perfect accompaniment to roast pork or pancakes.',
  '<p id="">Smooth and slightly tart, the perfect accompaniment to roast pork or pancakes.</p><p>‍</p>',
  'Smooth and slightly tart, the perfect accompaniment to roast pork or pancakes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec56c811fd71a8b1a28d_0701-Luxury-Bramley-Apple-Sauce.png',
  4,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:01.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c128',
  'Autumn Fruit Chutney',
  'autumn-fruit-chutney',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A seasonal blend of fruits, capturing the heart of autumn in a jar.',
  null,
  'A seasonal blend of fruits, capturing the heart of autumn in a jar.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc047702fea82689f90efb_0503-Autumn-Fruit-Chutney-300x300.png',
  5,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:23:01.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c010',
  'Bacon Ribs',
  'bacon-ribs',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  7,
  'by_weight',
  null,
  null,
  'Bacon Ribs: Smoky, meaty, and tender - ideal for a slow roast or stew.',
  '<p>Bacon Ribs: Smoky, meaty, and tender - ideal for a slow roast or stew.</p>',
  'Bacon Ribs: Smoky, meaty, and tender - ideal for a slow roast or stew.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cb7fa293daf9d341703111_64ca9e32e5febf3b34b238a4_bacon%252520ribs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:43.000Z',
  '2023-08-15T16:08:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf6a',
  'Barnsley Chops',
  'barnsley-chops-856b0',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  17,
  'by_weight',
  null,
  null,
  'Thick and juicy lamb chops, typically cut from the loin, including the bone.',
  '<p>Thick and juicy lamb chops, typically cut from the loin, including the bone.</p>',
  'Thick and juicy lamb chops, typically cut from the loin, including the bone.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5ee316f6748607208_barnsley%2520chops.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:43.000Z',
  '2023-08-02T22:55:43.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf48',
  'Bavette Steak',
  'bavette-steak-c2870',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  12,
  'by_weight',
  null,
  null,
  'A flavorful and thinly sliced steak from the flank area, often marinated and cooked quickly over high heat.',
  '<p>A flavorful and thinly sliced steak from the flank area, often marinated and cooked quickly over high heat.</p>',
  'A flavorful and thinly sliced steak from the flank area, often marinated and cooked quickly over high heat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc52f1fc7debc86bfba_Bavette-Steak-1024x486.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:43.000Z',
  '2023-08-15T19:56:46.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd34',
  'Beef Burgers',
  'beef-burgers-d8392',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  9,
  'by_weight',
  null,
  null,
  'Beef Burgers: Juicy, tender, and ready for the grill.',
  '<p>Beef Burgers: Juicy, tender, and ready for the grill.</p>',
  'Beef Burgers: Juicy, tender, and ready for the grill.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3771dc019f2cbcc442_Grass-Fed-Organic-Burgers.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-08-15T22:22:22.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf01',
  'Beef Dripping (Packets)',
  'beef-dripping-packets-72360',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-none'),
  5,
  'by_weight',
  null,
  null,
  'Packaged beef dripping, a traditional fat full of beefy flavour to enhance your roasts.',
  '<p>Packaged beef dripping, a traditional fat full of beefy flavour to enhance your roasts.</p>',
  'Packaged beef dripping, a traditional fat full of beefy flavour to enhance your roasts.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3bd5afbe69824e8ec7_dripping.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:44.000Z',
  '2023-08-15T22:33:47.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c011',
  'Beef Pie - Large',
  'beef-pie-large',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  12.5,
  'by_count',
  'Large',
  null,
  'A substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.',
  '<p id="">A substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.</p><p id="">‍</p>',
  'A substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc86d35995512c6d8979df_Untitled%20(35).png',
  14,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-10-12T12:45:44.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be7f',
  'Beef Pie - Medium',
  'beef-pie-medium',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  7,
  'by_count',
  'Medium',
  null,
  'A medium sized pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.',
  '<p id="">A medium sized pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.</p><p id="">‍</p>',
  'A medium sized pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc865c2e66522862eca5fa_Untitled%20(33).png',
  13,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-08-18T15:27:04.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c044',
  'Beef Pie - Small',
  'beef-pie-small',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  2.3,
  'by_count',
  'Small',
  null,
  'A individual pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.',
  '<p id="">A individual pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.</p>',
  'A individual pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc85ca0cfc1c9b6d4fa64c_Untitled%20(31).png',
  12,
  false,
  false,
  '2025-06-07T10:25:52.000Z',
  '2023-08-02T22:55:44.000Z',
  '2025-06-07T10:25:52.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf8c',
  'Beef Pie - XL',
  'beef-pie-xl',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  50,
  'by_count',
  'X-Large',
  null,
  'A very substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.',
  '<p id="">A very substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.</p><p id="">‍</p><p id="">‍</p>',
  'A very substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8758ed009bfff2b85da8_Untitled%20(37).png',
  15,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-10-12T12:44:35.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfac',
  'Beef Sausages',
  'beef-sausages-08ab4',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  7,
  'by_weight',
  null,
  null,
  'Premium beef sausages, flavourful and rich - perfect for grilling and BBQs.',
  '<p>Premium beef sausages, flavourful and rich - perfect for grilling and BBQs.</p>',
  'Premium beef sausages, flavourful and rich - perfect for grilling and BBQs.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30d80b9bf1fb7ffc67_healthy-halal-meat-online-beef-sausages-delivery.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-08-15T11:47:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2a',
  'Beef Short Ribs',
  'beef-short-ribs-4515c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  9,
  'by_weight',
  null,
  null,
  'Meaty and flavorful ribs from the lower portion of the rib cage, best when slow-cooked or braised.',
  '<p>Meaty and flavorful ribs from the lower portion of the rib cage, best when slow-cooked or braised.</p>',
  'Meaty and flavorful ribs from the lower portion of the rib cage, best when slow-cooked or braised.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cab5e7a08e5e83883eaf99_64a56d6465cdb3718a085e9c_raw-beef-short-ribs-bone-dark-surface.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:44.000Z',
  '2023-08-02T22:55:44.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfad',
  'Beef Skirt',
  'beef-skirt-0cea8',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  11,
  'by_weight',
  null,
  null,
  'A long and flat cut of beef from the plate area, often used in Mexican and Tex-Mex dishes like fajitas.',
  '<p>A long and flat cut of beef from the plate area, often used in Mexican and Tex-Mex dishes like fajitas.</p>',
  'A long and flat cut of beef from the plate area, often used in Mexican and Tex-Mex dishes like fajitas.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc70e545201084edc09_Beef%2520Skirt.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:45.000Z',
  '2023-08-02T22:55:45.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c023',
  'Belly Pork',
  'belly-pork-666b7',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Pork cut from the belly of the pig, known for its fatty and flavorful meat',
  '<p>Pork cut from the belly of the pig, known for its fatty and flavorful meat</p>',
  'Pork cut from the belly of the pig, known for its fatty and flavorful meat',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024b11a3d5015792204f_pork-belly-bone-in.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:45.000Z',
  '2023-08-02T22:55:45.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be99',
  'Black Pepper & Garlic Sausage (Irish)',
  'black-pepper-garlic-sausage-irish-6df82',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Irish-inspired sausage, spiced with black pepper and garlic for a unique, robust flavour.',
  '<p>Irish-inspired sausage, spiced with black pepper and garlic for a unique, robust flavour.</p>',
  'Irish-inspired sausage, spiced with black pepper and garlic for a unique, robust flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3056f7b732d1078cfe_CFTNTGBP_Raw.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-16T18:33:14.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfae',
  'Black Pudding',
  'black-pudding-54fd5',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  10,
  'by_weight',
  null,
  null,
  'Black pudding, a rich and savoury staple of a traditional full English breakfast.',
  '<p>Black pudding, a rich and savoury staple of a traditional full English breakfast.</p>',
  'Black pudding, a rich and savoury staple of a traditional full English breakfast.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8168a926ddaf9de81fff_9bd1f83e-ece5-424a-99b5-9d8a57510c36.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:45.000Z',
  '2023-08-16T16:50:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd35',
  'Blacksticks Blue',
  'blacksticks-blue-38ff9',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  22,
  'by_weight',
  null,
  null,
  'Blacksticks Blue, a visually striking cheese with a creamy texture and delicate blue flavour.',
  '<p>Blacksticks Blue, a visually striking cheese with a creamy texture and delicate blue flavour.</p>',
  'Blacksticks Blue, a visually striking cheese with a creamy texture and delicate blue flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4110577e8841e3ea16_BLACKSTICKS-TOP-1200x1203.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:45.000Z',
  '2023-08-15T16:40:13.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfaf',
  'Boiled Ham',
  'boiled-ham-7be8c',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  17,
  'by_weight',
  null,
  null,
  'Boiled ham, succulent and tender, a simple delicacy ready to be enjoyed.',
  '<p>Boiled ham, succulent and tender, a simple delicacy ready to be enjoyed.</p>',
  'Boiled ham, succulent and tender, a simple delicacy ready to be enjoyed.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcff25ae53ac5bd1eabe44_Nigels-Cooked-Ham-with-breadcrumbs.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-16T16:54:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd61',
  'Braising Steak',
  'braising-steak-0ccaa',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  11,
  'by_weight',
  null,
  null,
  'A versatile cut of beef, usually from tougher muscles, requiring slow cooking or braising to achieve tenderness.',
  '<p>A versatile cut of beef, usually from tougher muscles, requiring slow cooking or braising to achieve tenderness.</p>',
  'A versatile cut of beef, usually from tougher muscles, requiring slow cooking or braising to achieve tenderness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc54cbf454723efa377_84298-52594-braising-steak.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-02T22:55:46.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfcb',
  'Breast Of Lamb',
  'breast-of-lamb-64973',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  7,
  'by_weight',
  null,
  null,
  'A flavorful and fatty cut of lamb taken from the breast area, often slow-cooked or braised.',
  '<p>A flavorful and fatty cut of lamb taken from the breast area, often slow-cooked or braised.</p>',
  'A flavorful and fatty cut of lamb taken from the breast area, often slow-cooked or braised.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5ebf988cbabd54e8f_free-range-breast-of-lamb-98-p.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-02T22:55:46.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd76',
  'Breast On Bone',
  'breast-on-bone-b5525',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  6,
  'by_weight',
  null,
  null,
  'Chicken breast with the bone intact.',
  '<p>Chicken breast with the bone intact.</p>',
  'Chicken breast with the bone intact.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb81e87e14cc5a8f99_chicken-breast-on-bone_shutterstock_1656042634-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-02T22:55:46.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be9a',
  'Brie Wedges',
  'brie-wedges-5514a',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  3,
  'by_count',
  null,
  null,
  'Creamy Brie wedges, exuding a mild and buttery flavour, a perfect addition to any cheese board.',
  '<p>Creamy Brie wedges, exuding a mild and buttery flavour, a perfect addition to any cheese board.</p>',
  'Creamy Brie wedges, exuding a mild and buttery flavour, a perfect addition to any cheese board.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e41d12c92ca978c7b13_briecheesewedge_jdzi.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:46.000Z',
  '2023-08-15T16:38:43.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf02',
  'Brisket Joint',
  'brisket-joint-a1450',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  9,
  'by_weight',
  null,
  null,
  'A cut of beef from the breast or lower chest, known for its rich flavor and tenderness when slow-cooked.',
  '<p>A cut of beef from the breast or lower chest, known for its rich flavor and tenderness when slow-cooked.</p>',
  'A cut of beef from the breast or lower chest, known for its rich flavor and tenderness when slow-cooked.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd8866eeab31cf481146d_4cdd9db2-e42b-42ea-addb-24058d88ece2.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:47.000Z',
  '2023-08-16T14:09:16.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2c',
  'Brock Blue',
  'brock-blue-89750',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  26,
  'by_weight',
  null,
  null,
  'Brock Blue, a robust and creamy blue cheese that''s a delight for the palate.',
  '<p>Brock Blue, a robust and creamy blue cheese that�s a delight for the palate.</p>',
  'Brock Blue, a robust and creamy blue cheese that''s a delight for the palate.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e48ab528577efcfb575_brock%2520blue.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:47.000Z',
  '2023-08-15T16:39:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11b',
  'Brown Baps',
  'brown-baps',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  null,
  'by_count',
  null,
  null,
  'Wholegrain goodness packed into soft rolls, offering a healthy twist to your favourite sandwiches.',
  '<p> Wholegrain goodness packed into soft rolls, offering a healthy twist to your favourite sandwiches.</p>',
  'Wholegrain goodness packed into soft rolls, offering a healthy twist to your favourite sandwiches.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1e675cea4f20e60c8aa_brown-soft-roll-4-pack.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:37:11.000Z',
  '2023-08-15T20:37:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2b',
  'Capon',
  'capon-8d9e7',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  10,
  'by_weight',
  null,
  null,
  'A neutered male chicken that is raised for meat',
  '<p>A neutered male chicken that is raised for meat</p>',
  'A neutered male chicken that is raised for meat',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc23106e4e32339bf0_capon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:47.000Z',
  '2023-08-02T22:55:47.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12b',
  'Caramelised Onion Chutney',
  'caramelised-onion-chutney',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Sweet, sticky, and savoury, this chutney turns any meal into a gourmet treat.',
  null,
  'Sweet, sticky, and savoury, this chutney turns any meal into a gourmet treat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc044d61b4f572fece1a7f_0522-Caramilised-Onion-Chutney-300x300.png',
  6,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:02.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfb0',
  'Cheddar Cheese',
  'cheddar-cheese-6aff6',
  (select id from public.categories where slug = 'cheese'),
  null,
  3,
  'by_weight',
  null,
  null,
  'Classic British Cheese, tangy and full of flavour',
  '<p>Classic British Cheese, tangy and full of flavour</p>',
  'Classic British Cheese, tangy and full of flavour',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cadef39ff94cbabaf5840b_64c930fda73080d5c4ad9b0e_Somerset-Cheddar_1280x800.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:47.000Z',
  '2023-08-15T16:39:36.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf6b',
  'Cheese & Onion',
  'cheese-onion',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  2.8,
  'by_count',
  'Medium',
  null,
  'A perfect mix of creamy cheese and sweet onions in our handmade pastry.',
  '<p>A perfect mix of creamy cheese and sweet onions in our handmade pastry.</p>',
  'A perfect mix of creamy cheese and sweet onions in our handmade pastry.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc83341b62dc3a96e30081_Untitled%20(22).png',
  4,
  false,
  false,
  '2025-06-07T10:29:49.000Z',
  '2023-08-02T22:55:47.000Z',
  '2025-06-07T10:29:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c138',
  'Cheese Wafer Biscuits',
  'cheese-wafer-biscuits',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Crispy and light, these wafers are the ideal partner for your cheeseboard.',
  '<p id="">Crispy and light, these wafers are the ideal partner for your cheeseboard.</p><p>‍</p>',
  'Crispy and light, these wafers are the ideal partner for your cheeseboard.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc05d392f0edeec2cd0f3b_Untitled%20(18).png',
  3,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:02.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c110',
  'Cherry Cake',
  'cherry-cake',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  2,
  'by_count',
  null,
  null,
  'Luscious cherries embedded in a soft, golden sponge, offering a delightful fruity touch.',
  '<p>Luscious cherries embedded in a soft, golden sponge, offering a delightful fruity touch.</p>',
  'Luscious cherries embedded in a soft, golden sponge, offering a delightful fruity touch.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdd76e9a91b6706556357_Cherry-Cake-1200-4.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:18:20.000Z',
  '2023-08-15T20:18:20.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c045',
  'Chicken Drumsticks',
  'chicken-drumsticks-8dc66',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  6,
  'by_weight',
  null,
  null,
  'Meaty portion of chicken legs',
  '<p>Meaty portion of chicken legs</p>',
  'Meaty portion of chicken legs',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab9f4bb3aa034658f60_chickendrumsticks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:47.000Z',
  '2023-08-02T22:55:47.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c046',
  'Chicken Fillets',
  'chicken-fillets-b9438',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  9,
  'by_weight',
  null,
  null,
  'Boneless cuts of chicken breast',
  '<p>Boneless cuts of chicken breast</p>',
  'Boneless cuts of chicken breast',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab953a8cd97b6edac20_chickenfillets.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-02T22:55:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf6c',
  'Chicken, Ham and Leek',
  'chicken-ham-and-leek',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  2.8,
  'by_count',
  'Medium',
  null,
  'Delicious pie, packed with tender chicke, our own ham and fresh local mushrooms in a handmade crust.',
  '<p id="">Delicious pie, packed with tender chicken, leeks and our own ham in a handmade crust.</p>',
  'Delicious pie, packed with tender chicke, our own ham and fresh local mushrooms in a handmade crust.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc84b1e636d414d59e5c35_Untitled%20(28).png',
  4,
  false,
  false,
  '2025-06-07T11:10:29.000Z',
  '2023-08-02T22:55:48.000Z',
  '2025-06-07T11:10:29.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c08f',
  'Chicken Leg',
  'chicken-leg-d44ac',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  6,
  'by_weight',
  null,
  null,
  'Leg portion of a chicken, including the thigh and drumstick',
  '<p>Leg portion of a chicken, including the thigh and drumstick</p>',
  'Leg portion of a chicken, including the thigh and drumstick',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98aba0fdcdb0cb2cfd2d8_chicklegs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:48.000Z',
  '2023-08-02T22:55:48.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfb1',
  'Chicken Liver',
  'chicken-liver-31b59',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  6,
  'by_weight',
  null,
  null,
  'Chicken liver, rich in flavour and nutrients, perfect for your homemade p''t''.',
  '<p>Chicken liver, rich in flavour and nutrients, perfect for your homemade p�t�.</p>',
  'Chicken liver, rich in flavour and nutrients, perfect for your homemade p''t''.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e381f23feb607f8d4db_Chicken-Liver.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:48.000Z',
  '2023-08-02T22:55:48.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf6d',
  'Chicken & Mushroom',
  'chicken-mushroom',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  2.8,
  'by_count',
  'Medium',
  null,
  'Delicious pie, packed with tender chicken and fresh mushrooms in our famous handmade pastry.',
  '<p>Delicious pie, packed with tender chicken and fresh mushrooms in our famous handmade pastry.</p>',
  'Delicious pie, packed with tender chicken and fresh mushrooms in our famous handmade pastry.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc84b1e636d414d59e5c35_Untitled%20(28).png',
  3,
  false,
  false,
  '2025-06-07T11:10:06.000Z',
  '2023-08-02T22:55:49.000Z',
  '2025-06-07T11:10:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfb2',
  'Chicken Supremes',
  'chicken-supremes-bd5a5',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  12,
  'by_weight',
  null,
  null,
  'Boneless chicken breast with the wingtip attached.',
  '<p>Boneless chicken breast with the wingtip attached.</p>',
  'Boneless chicken breast with the wingtip attached.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab948fbf45c6d2a2b6b_Chicken-Supreme1-1024x768.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-02T22:55:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf8d',
  'Chicken Thighs',
  'chicken-thighs-ce449',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  8,
  'by_weight',
  null,
  null,
  'The meaty portion of chicken legs without the drumstick.',
  '<p>The meaty portion of chicken legs without the drumstick.</p>',
  'The meaty portion of chicken legs without the drumstick.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab902bee661d59ac2d9_chickthighs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-02T22:55:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfb3',
  'Chicken Wings',
  'chicken-wings-80d46',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  5,
  'by_weight',
  null,
  null,
  'The wing portions of a chicken.',
  '<p>The wing portions of a chicken.</p>',
  'The wing portions of a chicken.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb7dba1d1588eb8804_chickwings.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-02T22:55:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c127',
  'Chilli Jam',
  'chilli-jam',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A spicy and sweet symphony, perfect to heat up your toast or to complement cheeses.',
  null,
  'A spicy and sweet symphony, perfect to heat up your toast or to complement cheeses.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0507eaa6ce6a0edd6c6d_0121-Chiili-Jam-600x600.png',
  7,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:23:02.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bd94',
  'Chippolatas',
  'chippolatas-a9871',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Classic Chippolatas, small in size but big on flavour - the perfect breakfast sausage.',
  '<p>Classic Chippolatas, small in size but big on flavour - the perfect breakfast sausage.</p>',
  'Classic Chippolatas, small in size but big on flavour - the perfect breakfast sausage.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3010577e8841e3ce89_GF_Sausage_GlutenFree_web-1.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-15T22:21:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10e',
  'Chocolate Eclair',
  'chocolate-eclair',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  2,
  'other',
  null,
  null,
  'Soft choux pastry filled with rich chocolate cream, draped in a glossy chocolate glaze',
  '<p id="">Soft choux pastry filled with rich chocolate cream, draped in a glossy chocolate glaze</p>',
  'Soft choux pastry filled with rich chocolate cream, draped in a glossy chocolate glaze',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdcea36aac837fc4d8007_DSC_5256-e1488034184153.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:15:40.000Z',
  '2023-08-15T20:15:40.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c113',
  'Christmas Cake',
  'christmas-cake',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  3,
  'other',
  null,
  null,
  'A festive blend of rich fruits, spices, and a hint of brandy, wrapped in a layer of marzipan and icing.',
  '<p>A festive blend of rich fruits, spices, and a hint of brandy, wrapped in a layer of marzipan and icing.</p>',
  'A festive blend of rich fruits, spices, and a hint of brandy, wrapped in a layer of marzipan and icing.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdecece04d5883061be65_easy-retro-Christmas-cake-1.jpg',
  null,
  false,
  true,
  null,
  '2023-08-15T20:23:55.000Z',
  '2023-08-15T22:36:44.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfb4',
  'Cooked Chicken',
  'cooked-chicken-f1616',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  5,
  'by_count',
  null,
  null,
  'Cooked chicken, seasoned and roasted to perfection, ready to make your meals easier.',
  '<p>Cooked chicken, seasoned and roasted to perfection, ready to make your meals easier.</p>',
  'Cooked chicken, seasoned and roasted to perfection, ready to make your meals easier.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3c0a3558ea4f3a6ae7_cooked%2520chicken.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-15T22:31:48.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2d',
  'Cooked Chicken Portions',
  'cooked-chicken-portions-c64c1',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  1,
  'by_count',
  null,
  null,
  'Cooked chicken portions, the ultimate convenience for quick and tasty meals.',
  '<p>Cooked chicken portions, the ultimate convenience for quick and tasty meals.</p>',
  'Cooked chicken portions, the ultimate convenience for quick and tasty meals.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3c9d803250aa5459eb_cooked%2520chicken%2520portions.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:49.000Z',
  '2023-08-15T22:31:40.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c024',
  'Cornish YARG',
  'cornish-yarg-e5002',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  24,
  'by_weight',
  null,
  null,
  'Cornish YARG, wrapped in nettle leaves, boasting a creamy, underlined tang.',
  '<p>Cornish YARG, wrapped in nettle leaves, boasting a creamy, underlined tang.</p>',
  'Cornish YARG, wrapped in nettle leaves, boasting a creamy, underlined tang.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e476ed61b5208134964_cornish-yarg-cheese.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:50.000Z',
  '2023-08-15T16:39:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c135',
  'Cranberry Sauce',
  'cranberry-sauce',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Sweet and tart, an essential for roast turkey or as a spread.',
  '<p id="">Sweet and tart, an essential for roast turkey or as a spread.</p><p>‍</p>',
  'Sweet and tart, an essential for roast turkey or as a spread.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc029aba1a8a181e2b204c_0707-Cranberry-Sauce-300x300.png',
  8,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2e',
  'Cropwell Bishop Blue Stilton',
  'cropwell-bishop-blue-stilton-8dfde',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  19,
  'by_weight',
  null,
  null,
  'Cropwell Bishop Blue Stilton, an iconic British cheese, known for its rich, tangy flavours and velvety texture.',
  '<p>Cropwell Bishop Blue Stilton, an iconic British cheese, known for its rich, tangy flavours and velvety texture.</p>',
  'Cropwell Bishop Blue Stilton, an iconic British cheese, known for its rich, tangy flavours and velvety texture.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e41bfcdbee3b4341242_cropwell_bishop_b_3_sj6hlbxkhrwsplmk.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:50.000Z',
  '2023-08-15T16:28:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfdd',
  'Cumberland Sausages',
  'cumberland-sausages-a181c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Traditional Cumberland sausages, with a hearty, spiced flavour profile, perfect for a hearty meal.',
  '<p>Traditional Cumberland sausages, with a hearty, spiced flavour profile, perfect for a hearty meal.</p>',
  'Traditional Cumberland sausages, with a hearty, spiced flavour profile, perfect for a hearty meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e309fd9c2bbc367cf9f_cumberland-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:50.000Z',
  '2023-08-15T11:46:38.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11c',
  'Derbyshire Oatcakes',
  'derbyshire-oatcakes',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  1,
  'by_count',
  null,
  null,
  'Thin, soft oatcakes, traditional to Derbyshire, perfect when warmed and topped with sweet or savoury fillings.',
  '<p>Thin, soft oatcakes, traditional to Derbyshire, perfect when warmed and topped with sweet or savoury fillings.</p>',
  'Thin, soft oatcakes, traditional to Derbyshire, perfect when warmed and topped with sweet or savoury fillings.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe22ac811fd71a8a4c9fd_Derbyshire-Oatcake.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:38:23.000Z',
  '2023-08-15T20:42:13.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfde',
  'Diced Leg Lamb',
  'diced-leg-lamb-2cf23',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  18,
  'by_weight',
  null,
  null,
  'Lamb leg meat cut into small, uniform cubes, suitable for various cooking methods like stews and curries.',
  '<p>Lamb leg meat cut into small, uniform cubes, suitable for various cooking methods like stews and curries.</p>',
  'Lamb leg meat cut into small, uniform cubes, suitable for various cooking methods like stews and curries.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5de6e86b98d934e4b_diced%2520leglamb.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:50.000Z',
  '2023-08-02T22:55:50.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c047',
  'Diced Pork',
  'diced-pork-12d3e',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Pork meat cut into small, cube-shaped pieces.',
  '<p>Pork meat cut into small, cube-shaped pieces.</p>',
  'Pork meat cut into small, cube-shaped pieces.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024b64c6b63672985a9d_diced%2520pork.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:51.000Z',
  '2023-08-02T22:55:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfdf',
  'Diced Shoulder',
  'diced-shoulder-09129',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  17,
  'by_weight',
  null,
  null,
  'Lamb shoulder meat cut into small, uniform cubes, ideal for slow cooking or braising.',
  '<p>Lamb shoulder meat cut into small, uniform cubes, ideal for slow cooking or braising.</p>',
  'Lamb shoulder meat cut into small, uniform cubes, ideal for slow cooking or braising.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5f926d08bddaecbb8_Diced-Lamb-Shoulder-1.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:50.000Z',
  '2023-08-02T22:55:50.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c025',
  'Diced Venison',
  'diced-venison-98887',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  7,
  'by_weight',
  null,
  null,
  'Venison meat cut into small cubes',
  '<p>Venison meat cut into small cubes</p>',
  'Venison meat cut into small cubes',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abf28069a8bf0ae484b_diced%2520venison.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:51.000Z',
  '2023-08-02T22:55:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c133',
  'Dijon Mustard',
  'dijon-mustard',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Spicy and creamy, a classic touch of French flair for your dishes.',
  '<p id="">Spicy and creamy, a classic touch of French flair for your dishes.</p><p>‍</p>',
  'Spicy and creamy, a classic touch of French flair for your dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc02ad76cd459eff598559_1004-Dijon-Mustard-300x300.png',
  9,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be82',
  'Dragon Sausage',
  'dragon-sausage-8d4cd',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Dragon Sausage: Daringly spicy and tantalizingly tasty - not for the faint-hearted.',
  '<p>Dragon Sausage: Daringly spicy and tantalizingly tasty - not for the faint-hearted.</p>',
  'Dragon Sausage: Daringly spicy and tantalizingly tasty - not for the faint-hearted.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32f0ae4a0c26128cfd_WELSH-DRAGON-min.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:51.000Z',
  '2023-08-15T11:46:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be9b',
  'Dry Cured Middle Bacon',
  'dry-cured-middle-bacon-09c70',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Dry Cured Middle Bacon: Cured by hand for maximum flavour and perfect crispiness.',
  '<p>Dry Cured Middle Bacon: Cured by hand for maximum flavour and perfect crispiness.</p>',
  'Dry Cured Middle Bacon: Cured by hand for maximum flavour and perfect crispiness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e33c347e260a5745c7d_SmokedMiddleBacon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:51.000Z',
  '2023-08-15T16:08:47.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfcc',
  'Duck Breast',
  'duck-breast-9b36d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  26,
  'by_weight',
  null,
  null,
  'The breast portion of a duck',
  '<p>The breast portion of a duck</p>',
  'The breast portion of a duck',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abcd558b9f04015ebc0_duck%2520breast.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:51.000Z',
  '2023-08-02T22:55:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bfe0',
  'Duck Legs',
  'duck-legs-984a8',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  14,
  'by_weight',
  null,
  null,
  'The leg portions of a duck.',
  '<p>The leg portions of a duck.</p>',
  'The leg portions of a duck.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abd410ff20685682cec_duck-leg.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:52.000Z',
  '2023-08-02T22:55:52.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c131',
  'English Smooth Mustard',
  'english-smooth-mustard',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Piquant and smooth, this mustard is a versatile addition to meals and marinades.',
  '<p id="">Piquant and smooth, this mustard is a versatile addition to meals and marinades.</p><p>‍</p>',
  'Piquant and smooth, this mustard is a versatile addition to meals and marinades.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbebfc4179764099d7caf7_1001-English-Mustard.png',
  10,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c112',
  'Farmhouse Cake',
  'farmhouse-cake',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  null,
  'other',
  null,
  null,
  'Hearty and wholesome, this cake is packed with dried fruits and spices, reminiscent of rustic home baking.',
  '<p>Hearty and wholesome, this cake is packed with dried fruits and spices, reminiscent of rustic home baking.</p>',
  'Hearty and wholesome, this cake is packed with dried fruits and spices, reminiscent of rustic home baking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbde8e6e26164c7811dc40_garden_2614.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:22:44.000Z',
  '2023-08-15T20:22:44.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be9c',
  'Farmhouse Cheshire',
  'farmhouse-cheshire-b1914',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  13,
  'by_weight',
  null,
  null,
  'Farmhouse Cheshire, a traditional British cheese known for its crumbly texture and clean, zesty flavour.',
  '<p>Farmhouse Cheshire, a traditional British cheese known for its crumbly texture and clean, zesty flavour.</p>',
  'Farmhouse Cheshire, a traditional British cheese known for its crumbly texture and clean, zesty flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd8567750b16680e26a44_9261b79f-cb5a-49f7-ab15-7037cac1ed63.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:52.000Z',
  '2023-08-16T14:08:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11f',
  'Fat Ball Cage',
  'fat-ball-cage',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A durable cage designed to securely hold nutritious fat balls, providing essential energy for wild birds.',
  null,
  'A durable cage designed to securely hold nutritious fat balls, providing essential energy for wild birds.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed797a3bd16fe7624547_harrisons-fat-ball-feeder-cage-standard_1st_3396_large.jpg',
  300,
  false,
  true,
  null,
  '2023-08-15T21:04:29.000Z',
  '2023-08-16T07:25:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39be83',
  'Feta',
  'feta-3bfa5',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  3,
  'by_count',
  null,
  null,
  'Feta, a Greek classic, with a tangy flavour and crumbly texture, perfect for salads.',
  '<p>Feta, a Greek classic, with a tangy flavour and crumbly texture, perfect for salads.</p>',
  'Feta, a Greek classic, with a tangy flavour and crumbly texture, perfect for salads.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd865f8ff97f0d634ff18_cadedede-942d-4e67-ba6d-9e6b994bb94f.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:52.000Z',
  '2023-08-16T14:08:50.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39bf2f',
  'Fillet Of Lamb',
  'fillet-of-lamb-ec2d3',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  14,
  'by_weight',
  null,
  null,
  'The most tender cut of lamb, taken from the loin, often cooked quickly and served as medallions.',
  '<p>The most tender cut of lamb, taken from the loin, often cooked quickly and served as medallions.</p>',
  'The most tender cut of lamb, taken from the loin, often cooked quickly and served as medallions.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd9941a23fce4fe7e75a3_Fillet-of-Lamb-e1500912823181.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:52.000Z',
  '2023-08-15T20:01:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09b',
  'Fillet Steak',
  'fillet-steak-4c23f',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  49,
  'by_weight',
  null,
  null,
  'A premium and tender cut of beef from the tenderloin, highly prized for its tenderness and served as a whole steak or in medallions.',
  '<p>A premium and tender cut of beef from the tenderloin, highly prized for its tenderness and served as a whole steak or in medallions.</p>',
  'A premium and tender cut of beef from the tenderloin, highly prized for its tenderness and served as a whole steak or in medallions.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd83c38e01a13572c1cac_800x800-owt-fillet-steak.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:52.000Z',
  '2023-08-15T19:55:42.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c122',
  'Free Range Large Eggs',
  'free-range-large-eggs',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Nurtured hens deliver these large, flavourful eggs; perfect for your culinary adventures.',
  null,
  'Nurtured hens deliver these large, flavourful eggs; perfect for your culinary adventures.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed368a6ae341f10028aa_download.jpg',
  1,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:23:04.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c090',
  'Fresh Ducks',
  'fresh-ducks-3af82',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  10,
  'by_weight',
  null,
  null,
  'Whole, fresh Duck',
  '<p>Whole, fresh Duck</p>',
  'Whole, fresh Duck',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc93be72508a39d98f_whole-duck.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-02T22:55:53.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09c',
  'Fresh Turkeys',
  'fresh-turkeys-438f3',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  13,
  'by_weight',
  null,
  null,
  'Whole, fresh Turkey',
  '<p>Whole, fresh Turkey</p>',
  'Whole, fresh Turkey',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465927d_Turkey_raw%25402x.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-02T22:55:53.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c091',
  'Frying Steak',
  'frying-steak-792b3',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  11,
  'by_weight',
  null,
  null,
  'A versatile and affordable cut of beef, suitable for quick cooking methods such as frying or stir-frying.',
  '<p>A versatile and affordable cut of beef, suitable for quick cooking methods such as frying or stir-frying.</p>',
  'A versatile and affordable cut of beef, suitable for quick cooking methods such as frying or stir-frying.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc6fe52d431ff9de683_FRYING%2520STEAK.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-02T22:55:53.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ad',
  'Gammon Joints',
  'gammon-joints-5972c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Our gammon joints: prime cuts of pork, cured to perfection.',
  '<p>Our gammon joints: prime cuts of pork, cured to perfection.</p>',
  'Our gammon joints: prime cuts of pork, cured to perfection.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e33a2f970245b88313a_green-gammon-main-image.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-15T22:23:14.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a8',
  'Gammon Steaks',
  'gammon-steaks-bac4d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Tasty gammon steaks, ready to be grilled or fried for a quick, satisfying meal.',
  '<p>Tasty gammon steaks, ready to be grilled or fried for a quick, satisfying meal.</p>',
  'Tasty gammon steaks, ready to be grilled or fried for a quick, satisfying meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34a2f970245b8831e8_gammonsteaks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-15T22:23:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a2',
  'Garstang Crumbly Lancashire',
  'garstang-crumbly-lancashire-102ca',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  12,
  'by_weight',
  null,
  null,
  'Garstang Crumbly Lancashire, a tangy, crumbly cheese, delicious on a fresh slice of bread.',
  '<p>Garstang Crumbly Lancashire, a tangy, crumbly cheese, delicious on a fresh slice of bread.</p>',
  'Garstang Crumbly Lancashire, a tangy, crumbly cheese, delicious on a fresh slice of bread.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49b3d3c4c2fc7742d0_Garstang-Lancashire-1.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-15T16:39:16.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c121',
  'Gazeebo Feeder',
  'gazeebo-feeder',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Elegant and functional, this feeder adds a touch of charm to your garden while feeding the birds.',
  null,
  'Elegant and functional, this feeder adds a touch of charm to your garden while feeding the birds.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed4ca987bd31084b9844_images.jpg',
  102,
  false,
  true,
  null,
  '2023-08-15T21:04:30.000Z',
  '2023-08-16T07:22:17.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b6',
  'Goats Cheese',
  'goats-cheese-13d65',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-none'),
  15,
  'by_weight',
  null,
  null,
  'Our Goats Cheese, tangy and creamy, with a flavour that''s as unique as it is versatile.',
  '<p>Our Goats Cheese, tangy and creamy, with a flavour that''s as unique as it is versatile.</p>',
  'Our Goats Cheese, tangy and creamy, with a flavour that''s as unique as it is versatile.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4268851c5137e6494d_goats%2520cheese.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:53.000Z',
  '2023-08-02T22:55:53.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0cd',
  'Goose',
  'goose-4f7c0',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  20,
  'by_weight',
  null,
  null,
  'A large waterfowl bird known for its rich and succulent meat',
  '<p>A large waterfowl bird known for its rich and succulent meat</p>',
  'A large waterfowl bird known for its rich and succulent meat',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465933c_goose-web-square-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:54.000Z',
  '2023-08-02T22:55:54.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c139',
  'Gordon Rhodes Apple, Apricot & Bay Leaf Stuffing',
  'gordon-rhodes-apple-apricot-bay-leaf-stuffing',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A gourmet blend of fruits and herbs, elevating any roast meal.',
  '<p id="">A gourmet blend of fruits and herbs, elevating any roast meal.</p><p>‍</p>',
  'A gourmet blend of fruits and herbs, elevating any roast meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0612c6f09e585d19e3ec_Untitled%20(19).png',
  20,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:04.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c118',
  'Granary Loaf',
  'granary-loaf',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  null,
  'by_count',
  null,
  null,
  'A delightful mix of whole grains and seeds in a dense, nutritious loaf, perfect for a hearty sandwich.',
  '<p>A delightful mix of whole grains and seeds in a dense, nutritious loaf, perfect for a hearty sandwich.</p>',
  'A delightful mix of whole grains and seeds in a dense, nutritious loaf, perfect for a hearty sandwich.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1047eda85d52730cf7a_JBP_3534.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:33:26.000Z',
  '2023-08-15T20:33:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c094',
  'Grandma Singletons',
  'grandma-singletons-832f1',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  13,
  'by_weight',
  null,
  null,
  'Grandma Singletons, a strong and tasty Lancashire cheese, for those who enjoy a powerful flavour.',
  '<p>Grandma Singletons, a strong and tasty Lancashire cheese, for those who enjoy a powerful flavour.</p>',
  'Grandma Singletons, a strong and tasty Lancashire cheese, for those who enjoy a powerful flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49ef7e59466e8582af_grandma%2520singletons.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:54.000Z',
  '2023-08-15T16:38:20.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a4',
  'Guest Cheese',
  'guest-cheese-fe1fb',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-none'),
  17,
  'by_weight',
  null,
  null,
  'Our Guest Cheese, always a delightful surprise selected for its distinctive flavour and texture.',
  '<p>Our Guest Cheese, always a delightful surprise selected for its distinctive flavour and texture.</p>',
  'Our Guest Cheese, always a delightful surprise selected for its distinctive flavour and texture.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e42d5afbe69824e9542_guest%2520Cheese.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:54.000Z',
  '2023-08-02T22:55:54.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d0',
  'Guineafowl',
  'guineafowl-855c5',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  8,
  'by_weight',
  null,
  null,
  'Asmall poultry bird known for its flavorful meat',
  '<p>Asmall poultry bird known for its flavorful meat</p>',
  'Asmall poultry bird known for its flavorful meat',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe3ad9b2d8948554d1_guinea-fowl.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:54.000Z',
  '2023-08-15T20:03:46.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ae',
  'Haggis',
  'haggis',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  5,
  'by_count',
  'Small',
  null,
  'Small haggis, the perfect introduction to this traditional Scottish delicacy.',
  '<p>Small haggis, the perfect introduction to this traditional Scottish delicacy.</p>',
  'Small haggis, the perfect introduction to this traditional Scottish delicacy.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64f1e1cb1ff97c258a99758b_macsween_traditional_haggis_various_sizes_.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:54.000Z',
  '2023-09-01T13:06:24.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09d',
  'Haggis',
  'haggis-2bf43',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-none'),
  9,
  'by_weight',
  'Large',
  null,
  'Large Haggis, a Scottish favourite filled with spiced meat and oats, perfect for Burns Night.',
  '<p>Large Haggis, a Scottish favourite filled with spiced meat and oats, perfect for Burns Night.</p>',
  'Large Haggis, a Scottish favourite filled with spiced meat and oats, perfect for Burns Night.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3e0a3558ea4f3a6c2c_largehaggis.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:54.000Z',
  '2023-08-15T22:31:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ab',
  'Ham End',
  'ham-end-6654d',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  1,
  'by_count',
  null,
  null,
  'Ham end, a flavoursome cut with plenty of meat, ideal for making a tasty soup or stew.',
  '<p>Ham end, a flavoursome cut with plenty of meat, ideal for making a tasty soup or stew.</p>',
  'Ham end, a flavoursome cut with plenty of meat, ideal for making a tasty soup or stew.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3dca9d080769c0ce28_hamends.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:54.000Z',
  '2023-08-15T22:31:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c7',
  'Ham Ends',
  'ham-ends',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-none'),
  6,
  'by_weight',
  null,
  null,
  'Our ham ends, offering all the flavour of our prime ham, ideal for flavourful budget meals.',
  '<p>Our ham ends, offering all the flavour of our prime ham, ideal for flavourful budget meals.</p>',
  'Our ham ends, offering all the flavour of our prime ham, ideal for flavourful budget meals.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3dca9d080769c0ce28_hamends.webp',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:54.000Z',
  '2023-08-15T22:26:27.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a3',
  'Ham Shanks',
  'ham-shanks-d5994',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  3,
  'by_count',
  null,
  null,
  'Ham Shanks: lean, flavourful, and perfect for slow cooking until fall-off-the-bone tender.',
  '<p>Ham Shanks: lean, flavourful, and perfect for slow cooking until fall-off-the-bone tender.</p>',
  'Ham Shanks: lean, flavourful, and perfect for slow cooking until fall-off-the-bone tender.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34fcfced990f11860f_hamshanks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-15T22:28:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ce',
  'Ham with Cloves',
  'ham-with-cloves-8ee16',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  25,
  'by_weight',
  null,
  null,
  'Ham with cloves, aromatic and beautifully glazed, a timeless favourite.',
  '<p>Ham with cloves, aromatic and beautifully glazed, a timeless favourite.</p>',
  'Ham with cloves, aromatic and beautifully glazed, a timeless favourite.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e40ef7e59466e857453_hamcloves.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-15T22:30:17.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d6',
  'Homecured Streaky Bacon',
  'homecured-streaky-bacon-be812',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Our Homecured Streaky Bacon: rich in flavour and beautifully marbled.',
  '<p>Our Homecured Streaky Bacon: rich in flavour and beautifully marbled.</p>',
  'Our Homecured Streaky Bacon: rich in flavour and beautifully marbled.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34b9f49da96129b6aa_drycuredstreaky.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-15T16:08:36.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ac',
  'Honey Goats Cheese',
  'honey-goats-cheese-191fb',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  19,
  'by_weight',
  null,
  null,
  'Honey Goats Cheese, a delightful blend of sweet and tangy notes, a true gourmet treat.',
  '<p>Honey Goats Cheese, a delightful blend of sweet and tangy notes, a true gourmet treat.</p>',
  'Honey Goats Cheese, a delightful blend of sweet and tangy notes, a true gourmet treat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e469d803250aa5467db_honey%2520goats%2520cheese.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-15T16:38:27.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12e',
  'Horseradish',
  'horseradish',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Pungent and spicy, this condiment adds a kick to roasts and sandwiches alike.',
  '<p id="">Pungent and spicy, this condiment adds a kick to roasts and sandwiches alike.</p><p>‍</p>',
  'Pungent and spicy, this condiment adds a kick to roasts and sandwiches alike.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc02f23bd839a6f797314e_0703-Creamed-Horseradish-300x300.png',
  11,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c8',
  'Kebabs',
  'kebabs-31e23',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  15,
  'by_weight',
  null,
  null,
  'Our Kebabs: marinated, skewered, and ready to cook for an easy, flavourful meal.',
  '<p>Our Kebabs: marinated, skewered, and ready to cook for an easy, flavourful meal.</p>',
  'Our Kebabs: marinated, skewered, and ready to cook for an easy, flavourful meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3734050af259978f19_kebabs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-15T22:25:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c1',
  'Lamb Chump Chops',
  'lamb-chump-chops-c6209',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  15,
  'by_weight',
  null,
  null,
  'Tender and flavorful lamb chops taken from the chump end, suitable for grilling or pan-searing.',
  '<p>Tender and flavorful lamb chops taken from the chump end, suitable for grilling or pan-searing.</p>',
  'Tender and flavorful lamb chops taken from the chump end, suitable for grilling or pan-searing.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff56388b8af3be2990f_Lamb-Chump-Chops-22501.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0bc',
  'Lamb Cutlets',
  'lamb-cutlets-d6379',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  16,
  'by_weight',
  null,
  null,
  'Individual portions of lamb meat cut from the ribs, tender and commonly grilled or pan-fried.',
  '<p>Individual portions of lamb meat cut from the ribs, tender and commonly grilled or pan-fried.</p>',
  'Individual portions of lamb meat cut from the ribs, tender and commonly grilled or pan-fried.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff687ae1507100a4858_Lamb_Cutlets_37.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:55.000Z',
  '2023-08-02T22:55:55.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c0',
  'Lamb Koftas',
  'lamb-koftas-b7ae4',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  15,
  'by_weight',
  null,
  null,
  'Lamb Koftas: Aromatic, seasoned, and perfect for a Mediterranean-inspired meal.',
  '<p>Lamb Koftas: Aromatic, seasoned, and perfect for a Mediterranean-inspired meal.</p>',
  'Lamb Koftas: Aromatic, seasoned, and perfect for a Mediterranean-inspired meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e37ee91134f3eb55411_free-range-lamb-koftas-22-p.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-15T22:25:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0af',
  'Lamb Neck Rings',
  'lamb-neck-rings-72025',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  7,
  'by_weight',
  null,
  null,
  'Circular cuts of lamb neck, often used in slow-cooked dishes or stews.',
  '<p>Circular cuts of lamb neck, often used in slow-cooked dishes or stews.</p>',
  'Circular cuts of lamb neck, often used in slow-cooked dishes or stews.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff6588bd3b2257cfbe5_Lamb%252BNeck%252BRings.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c099',
  'Lamb Steaks',
  'lamb-steaks-7e168',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  19,
  'by_weight',
  null,
  null,
  'Thick slices of lamb meat, suitable for grilling, pan-searing, or broiling.',
  '<p>Thick slices of lamb meat, suitable for grilling, pan-searing, or broiling.</p>',
  'Thick slices of lamb meat, suitable for grilling, pan-searing, or broiling.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd914ca66b00cd2cb28a8_Lamb-Chump-Steak.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-15T19:59:18.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0cf',
  'Lambs Heart',
  'lambs-heart-e5dd8',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  7,
  'by_weight',
  null,
  null,
  'Lamb''s heart, a lean and tender organ meat, ready to broaden your culinary horizons.',
  '<p>Lamb''s heart, a lean and tender organ meat, ready to broaden your culinary horizons.</p>',
  'Lamb''s heart, a lean and tender organ meat, ready to broaden your culinary horizons.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3893dcec3c3932e779_lamb-heart.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b0',
  'Lambs Kidney',
  'lambs-kidney-e94fa',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  2,
  'by_count',
  null,
  null,
  'Lamb''s kidneys, delicately flavoured and smooth, ideal for classic British dishes.',
  '<p>Lamb''s kidneys, delicately flavoured and smooth, ideal for classic British dishes.</p>',
  'Lamb''s kidneys, delicately flavoured and smooth, ideal for classic British dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3834050af259978f70_lamb-kidney.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c092',
  'Lambs Liver',
  'lambs-liver-023a8',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  9,
  'by_weight',
  null,
  null,
  'Lamb''s liver, tender and rich, a wholesome ingredient for a hearty meal.',
  '<p>Lamb''s liver, tender and rich, a wholesome ingredient for a hearty meal.</p>',
  'Lamb''s liver, tender and rich, a wholesome ingredient for a hearty meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e38a2f970245b88381f_lambs%2520liver-474x474.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b7',
  'Lancashire Cheese',
  'lancashire-chees-36807',
  (select id from public.categories where slug = 'cheese'),
  null,
  3,
  'by_weight',
  null,
  null,
  'A crumbly tangy local cheese',
  '<p>A crumbly tangy local cheese</p>',
  'A crumbly tangy local cheese',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cadefc22309a8c9ba7291f_64c930ac6bf793372221b121_Lancashire_cheese.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:55:57.000Z',
  '2023-08-15T16:38:58.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b1',
  'Lardons',
  'lardons-12d7c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Lardons: Small, but packed with flavour - a delicious addition to many recipes.',
  '<p>Lardons: Small, but packed with flavour - a delicious addition to many recipes.</p>',
  'Lardons: Small, but packed with flavour - a delicious addition to many recipes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e350d06a05074d89d94_lardons.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-15T22:27:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d7',
  'Large Chicken',
  'large-chicken-54955',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  9,
  'by_weight',
  null,
  null,
  'A complete, uncut large chicken.(1.7-2kg / 3.75-4.4lb)',
  '<p>A complete, uncut large chicken.(1.7-2kg / 3.75-4.4lb)</p>',
  'A complete, uncut large chicken.(1.7-2kg / 3.75-4.4lb)',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abd48fbf45c6d2a2e47_whole-chicken-in-tin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:56.000Z',
  '2023-08-02T22:55:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0cb',
  'Lean Shin Beef',
  'lean-shin-beef-7106e',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  10,
  'by_weight',
  null,
  null,
  'A lean and flavorful cut from the lower leg, commonly used for slow cooking, stews, and soups.',
  '<p>A lean and flavorful cut from the lower leg, commonly used for slow cooking, stews, and soups.</p>',
  'A lean and flavorful cut from the lower leg, commonly used for slow cooking, stews, and soups.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc84cbf454723efa5b1_Beef-shin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T22:55:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c9',
  'Leg Joint',
  'leg-joint-df70b',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Large cut of pork from the leg of the pig, often used for roasting or slow cooking.',
  '<p>Large cut of pork from the leg of the pig, often used for roasting or slow cooking.</p>',
  'Large cut of pork from the leg of the pig, often used for roasting or slow cooking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c3036f38e45cc1719_porklegbin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T22:55:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c095',
  'Leg Of Lamb',
  'leg-of-lamb-bf57f',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  15,
  'by_weight',
  null,
  null,
  'A large and classic cut of lamb from the hind leg, often roasted whole or carved into smaller portions.',
  '<p>A large and classic cut of lamb from the hind leg, often roasted whole or carved into smaller portions.</p>',
  'A large and classic cut of lamb from the hind leg, often roasted whole or carved into smaller portions.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff606707cb5ceb48975_legof%2520lamb.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T22:55:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10d',
  'Lemon Bun',
  'lemon-bun',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  2,
  'other',
  null,
  null,
  'Zesty lemon-infused bun, topped with a light sugar glaze, offering a refreshing burst with every bite.',
  '<p id="">Zesty lemon-infused bun, topped with a light sugar glaze, offering a refreshing burst with every bite.</p>',
  'Zesty lemon-infused bun, topped with a light sugar glaze, offering a refreshing burst with every bite.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdcaa1386946f9c332a1b_lemonbun_800x.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:14:42.000Z',
  '2023-08-15T20:14:42.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c126',
  'Lemon Cheese',
  'lemon-cheese',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A creamy, zesty delight that tantalisingly marries citrus and dairy.',
  null,
  'A creamy, zesty delight that tantalisingly marries citrus and dairy.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc018dc6f09e585d1420b2_0206-Lemon-Cheese-300x300.png',
  12,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:23:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10f',
  'Lemon Crumble Cake',
  'lemon-crumble-cake',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  3,
  'other',
  null,
  null,
  'Moist lemon-infused cake complemented by a crunchy crumble topping for a perfect tangy-sweet harmony.',
  '<p>Moist lemon-infused cake complemented by a crunchy crumble topping for a perfect tangy-sweet harmony.</p>',
  'Moist lemon-infused cake complemented by a crunchy crumble topping for a perfect tangy-sweet harmony.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdd2fc42ae7062191039f_lemon-crumb-cake-2.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:16:49.000Z',
  '2023-08-15T20:16:49.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c124',
  'Lemon Curd',
  'lemon-curd',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Tangy and rich, this classic spread is a burst of citrus sunshine in every spoon.',
  null,
  'Tangy and rich, this classic spread is a burst of citrus sunshine in every spoon.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc01afc9fd321241c584fc_0201-Lemon-Curd.png',
  13,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:23:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b2',
  'Loin Lamb Chops',
  'loin-lamb-chops-a3b5d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  17,
  'by_weight',
  null,
  null,
  'Tender and succulent lamb chops taken from the loin area, suitable for grilling or pan-frying.',
  '<p>Tender and succulent lamb chops taken from the loin area, suitable for grilling or pan-frying.</p>',
  'Tender and succulent lamb chops taken from the loin area, suitable for grilling or pan-frying.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc803cafbf93965fa14830_0001468_loin-lamb-chops_882.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-16T07:52:29.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a1',
  'Loin Steaks',
  'loin-steaks-1a0ce',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  11,
  'by_weight',
  null,
  null,
  'Thick slices of pork meat taken from the loin, known for its tenderness and juiciness.',
  '<p>Thick slices of pork meat taken from the loin, known for its tenderness and juiciness.</p>',
  'Thick slices of pork meat taken from the loin, known for its tenderness and juiciness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024d7c7fc8bae49026c3_porkloinsteaks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T22:55:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c093',
  'Lye Cross',
  'lye-cross-a5d52',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  11,
  'by_weight',
  null,
  null,
  'Lye Cross, a farmstead cheese celebrated for its creamy, full-bodied flavour.',
  '<p>Lye Cross, a farmstead cheese celebrated for its creamy, full-bodied flavour.</p>',
  'Lye Cross, a farmstead cheese celebrated for its creamy, full-bodied flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e44317d87b753d111b9_lyre%2520cross.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:58.000Z',
  '2023-08-15T16:36:13.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c2',
  'Marinated Ribs',
  'marinated-ribs-3c273',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  7,
  'by_weight',
  null,
  null,
  'Pork ribs soaked in a marinade for added flavor before cooking.',
  '<p>Pork ribs soaked in a marinade for added flavor before cooking.</p>',
  'Pork ribs soaked in a marinade for added flavor before cooking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024cbdf3454cb7a5ab0c_Marinated-Pork-Ribs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T22:55:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0bd',
  'Marinated Steak',
  'marinated-steak-bdb0f',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  10,
  'by_weight',
  null,
  null,
  'Pork steak soaked in a marinade for added flavor before cooking.',
  '<p>Pork steak soaked in a marinade for added flavor before cooking.</p>',
  'Pork steak soaked in a marinade for added flavor before cooking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024d7c7fc8bae49027e2_marinated%2520pork%2520steaks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:57.000Z',
  '2023-08-02T23:34:15.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d8',
  'Marinated Thighs',
  'marinated-thighs-7cd67',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  9,
  'by_weight',
  null,
  null,
  'Chicken thighs marinated in a delicious coating.',
  '<p>Chicken thighs marinated in a delicious coating.</p>',
  'Chicken thighs marinated in a delicious coating.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abbca450f6d9ba6d8c8_bbqchickenthighs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:58.000Z',
  '2023-08-02T22:55:58.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0bb',
  'Marinated Wings',
  'marinated-wings-a6162',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  6,
  'by_weight',
  null,
  null,
  'Chicken wings marinated in a delicious sauce.',
  '<p>Chicken wings marinated in a delicious sauce.</p>',
  'Chicken wings marinated in a delicious sauce.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb8fea82aa6a186da4_Marinated-Chicken-Wings.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:59.000Z',
  '2023-08-02T22:55:59.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c125',
  'Marmalade',
  'marmalade',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Traditional, citrus-rich spread, filled with zest and sunshine, ideal for morning toast.',
  null,
  'Traditional, citrus-rich spread, filled with zest and sunshine, ideal for morning toast.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0939ba1a8a181e33da88_0301-Medium-Cut-Marmalade-300x300.png',
  14,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:24:43.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d3',
  'Mature Cheddar (Colliers)',
  'mature-cheddar-colliers-7bf45',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  12,
  'by_weight',
  null,
  null,
  'Colliers Mature Cheddar, with a depth of flavour and a distinctive crunch, sure to satisfy any cheese lover.',
  '<p>Colliers Mature Cheddar, with a depth of flavour and a distinctive crunch, sure to satisfy any cheese lover.</p>',
  'Colliers Mature Cheddar, with a depth of flavour and a distinctive crunch, sure to satisfy any cheese lover.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4310577e8841e3ec82_Colliersmature.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:59.000Z',
  '2023-08-15T16:26:35.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c3',
  'Meat & Potato',
  'meat-potato',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-meat-potato-pie'),
  2.5,
  'by_count',
  'Medium',
  null,
  'Our Favourite Pie! Hearty, handmade, with our own beef, lamb and local cheshire potatos in a delicious gravy, encased in handmade buttery pastry.',
  '<p>Our Favourite Pie! Hearty, handmade, with our own beef, lamb and local cheshire potatos in a delicious gravy, encased in handmade buttery pastry.</p>',
  'Our Favourite Pie! Hearty, handmade, with our own beef, lamb and local cheshire potatos in a delicious gravy, encased in handmade buttery pastry.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc844b5d6c06f472f7e354_Untitled%20(27).png',
  1,
  false,
  false,
  '2024-04-25T07:31:45.000Z',
  '2023-08-02T22:55:59.000Z',
  '2024-04-25T07:31:30.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d9',
  'Medium Chickens',
  'medium-chickens-512fc',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  5,
  'by_weight',
  null,
  null,
  'A complete, uncut medium-sized chicken.(1.3-1.7kg / 2.87-3.75lb)',
  '<p>A complete, uncut medium-sized chicken.(1.3-1.7kg / 2.87-3.75lb)</p>',
  'A complete, uncut medium-sized chicken.(1.3-1.7kg / 2.87-3.75lb)',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc5ffd73e8690494b3_mediumchicken.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:59.000Z',
  '2023-08-02T22:55:59.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b8',
  'Middle Neck',
  'middle-neck-42c09',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  9,
  'by_weight',
  null,
  null,
  'A flavorful cut of lamb from the neck, often used for slow cooking or stewing.',
  '<p>A flavorful cut of lamb from the neck, often used for slow cooking or stewing.</p>',
  'A flavorful cut of lamb from the neck, often used for slow cooking or stewing.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff620a1350f440938e6_free-range-lamb-middle-neck-116-p.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:59.000Z',
  '2023-08-02T22:55:59.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d4',
  'Mild Cheddar',
  'mild-cheddar-04e6b',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  11,
  'by_weight',
  null,
  null,
  'Mild Cheddar, versatile and creamy, an essential for your everyday culinary needs.',
  '<p>Mild Cheddar, versatile and creamy, an essential for your everyday culinary needs.</p>',
  'Mild Cheddar, versatile and creamy, an essential for your everyday culinary needs.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4310577e8841e3ecdc_MILD%252BCHEDDAR%252B1KG%252B4.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:55:59.000Z',
  '2023-08-15T16:26:22.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c096',
  'Mild Lancashire (Leigh Toaster)',
  'mild-lancashire-leigh-toaster-ad0b8',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  14,
  'by_weight',
  null,
  null,
  'Mild Lancashire (Leigh Toaster), perfect for melting, with a gentle, buttery taste.',
  '<p>Mild Lancashire (Leigh Toaster), perfect for melting, with a gentle, buttery taste.</p>',
  'Mild Lancashire (Leigh Toaster), perfect for melting, with a gentle, buttery taste.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba71e027a9bf8c14a4f79_Lancashire%20Kirkhamsresized.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-15T16:26:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c119',
  'Milk Roll',
  'milk-roll',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  5,
  'other',
  null,
  null,
  'Soft and slightly sweet, enriched with milk for a tender crumb, this roll is ideal for breakfast or teatime.',
  '<p>Soft and slightly sweet, enriched with milk for a tender crumb, this roll is ideal for breakfast or teatime.</p>',
  'Soft and slightly sweet, enriched with milk for a tender crumb, this roll is ideal for breakfast or teatime.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1679d36729bcfa1e038_Milk-roll-400g.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:35:03.000Z',
  '2023-08-15T20:35:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0cc',
  'Minced Beef',
  'minced-beef-8e8b4',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  10,
  'by_weight',
  null,
  null,
  'Ground beef that can be used in a wide range of dishes such as burgers, meatballs, and sauces.',
  '<p>Ground beef that can be used in a wide range of dishes such as burgers, meatballs, and sauces.</p>',
  'Ground beef that can be used in a wide range of dishes such as burgers, meatballs, and sauces.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc80e545201084edc62_Lean-Beef-Mince-1-a.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T22:56:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a5',
  'Minced Lamb',
  'minced-lamb-9d9c7',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  11,
  'by_weight',
  null,
  null,
  'Ground lamb meat that can be used in various dishes such as kebabs, meatballs, and curries.',
  '<p>Ground lamb meat that can be used in various dishes such as kebabs, meatballs, and curries.</p>',
  'Ground lamb meat that can be used in various dishes such as kebabs, meatballs, and curries.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff7d1f5786c16c14ec1_Lamb-Mince-3-a.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T22:56:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c097',
  'Minced Pork',
  'minced-pork-3f2d0',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  7,
  'by_weight',
  null,
  null,
  'Pork meat that has been finely ground or chopped',
  '<p>Pork meat that has been finely ground or chopped</p>',
  'Pork meat that has been finely ground or chopped',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c3036f38e45cc165b_minced%2520pork.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T22:56:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c130',
  'Mint Jelly',
  'mint-jelly',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A sweet and herbal gelée, the ideal complement to a variety of meats.',
  '<p id="">A sweet and herbal gelée, the ideal complement to a variety of meats.</p><p>‍</p>',
  'A sweet and herbal gelée, the ideal complement to a variety of meats.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc01f0f86eef77c95e8b0d_0901-Mint-Jelly.png',
  15,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12f',
  'Mint Sauce',
  'mint-sauce',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Refreshing and aromatic, this sauce is a lamb''s best friend.',
  '<p id="">Refreshing and aromatic, this sauce is a lamb''s best friend.</p><p>‍</p>',
  'Refreshing and aromatic, this sauce is a lamb''s best friend.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc04183f5cd9386b4d3ae5_Untitled%20(17).png',
  16,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0da',
  'Minty Lamb Ribs',
  'minty-lamb-ribs-c5dc4',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  7,
  'by_weight',
  null,
  null,
  'Lamb ribs seasoned with mint, ideal for grilling or slow cooking for tender and flavorful results.',
  '<p>Lamb ribs seasoned with mint, ideal for grilling or slow cooking for tender and flavorful results.</p>',
  'Lamb ribs seasoned with mint, ideal for grilling or slow cooking for tender and flavorful results.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff780fe0135f9f77dca_Minted%252BLamb%252BRibs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T22:56:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ca',
  'Minty Lamb Steaks',
  'minty-lamb-steaks-4265e',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  20,
  'by_weight',
  null,
  null,
  'Lamb steaks seasoned with mint, suitable for grilling, pan-searing, or broiling.',
  '<p>Lamb steaks seasoned with mint, suitable for grilling, pan-searing, or broiling.</p>',
  'Lamb steaks seasoned with mint, suitable for grilling, pan-searing, or broiling.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff8d1f5786c16c14f18_minted-lamb-leg-steaks.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:56:00.000Z',
  '2023-08-15T19:57:04.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10b',
  'Montagnolo',
  'montagnolo',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  3,
  'other',
  null,
  null,
  'Montagnolo Affine is a surface-ripened, triple cream cheese with a soft, velvety natural rind. Voted the world’s best cheese 2 years in a row we dare you to take the plunge and see what all the fuss is about!',
  '<p>Montagnolo Affine is a surface-ripened, triple cream cheese with a soft, velvety natural rind. &nbsp;Voted the world’s best cheese 2 years in a row we dare you to take the plunge and see what all the fuss is about!</p><p>‍</p>',
  'Montagnolo Affine is a surface-ripened, triple cream cheese with a soft, velvety natural rind. Voted the world’s best cheese 2 years in a row we dare you to take the plunge and see what all the fuss is about!',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba7c4fe41775e65f5a289_21-Montagnolo-shutterstock_614859215.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T16:30:04.000Z',
  '2023-08-15T16:58:50.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0be',
  'Mrs Rhodes Tasty Lancashire',
  'mrs-rhodes-tasty-lancashire-d9c22',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  13,
  'by_weight',
  null,
  null,
  'Mrs Rhodes Tasty Lancashire, with a creamy texture and robust flavour that lives up to its name.',
  '<p>Mrs Rhodes Tasty Lancashire, with a creamy texture and robust flavour that lives up to its name.</p>',
  'Mrs Rhodes Tasty Lancashire, with a creamy texture and robust flavour that lives up to its name.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba900df2cf6ea9d84a608_lancashire-large-product-page-resized-touched_1200x.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-15T16:34:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11e',
  'Mums Eggs',
  'mums-eggs',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Freshly laid, farm-fresh eggs from our doting hens; a taste of home in every sunny yolk.',
  null,
  'Freshly laid, farm-fresh eggs from our doting hens; a taste of home in every sunny yolk.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed1cbcb06643add77c06_brown-eggs-how-long-do-farm-fresh-eggs-last-storing-farm-fresh-eggs-scaled.jpg',
  2,
  false,
  true,
  null,
  '2023-08-15T21:04:29.000Z',
  '2023-08-15T23:24:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d1',
  'Ox Cheeks',
  'ox-cheeks-52cc6',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  8,
  'by_weight',
  null,
  null,
  'Tender and flavorful meat derived from the cheeks of an ox, commonly used in slow-cooked dishes or braising.',
  '<p>Tender and flavorful meat derived from the cheeks of an ox, commonly used in slow-cooked dishes or braising.</p>',
  'Tender and flavorful meat derived from the cheeks of an ox, commonly used in slow-cooked dishes or braising.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc597672a80b195438f_Oxcheeks.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T22:56:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a6',
  'Ox Heart',
  'ox-heart-1deeb',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  6,
  'by_weight',
  null,
  null,
  'Ox heart, a unique cut with a robust flavour profile, waiting to be discovered.',
  '<p>Ox heart, a unique cut with a robust flavour profile, waiting to be discovered.</p>',
  'Ox heart, a unique cut with a robust flavour profile, waiting to be discovered.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39317d87b753d0fdf7_oxheart.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:00.000Z',
  '2023-08-02T23:22:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b3',
  'Ox Kidney',
  'ox-kidney-56853',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  5,
  'by_weight',
  null,
  null,
  'Ox kidney, bold and distinctive, a must-have ingredient for a traditional steak and kidney pie.',
  '<p>Ox kidney, bold and distinctive, a must-have ingredient for a traditional steak and kidney pie.</p>',
  'Ox kidney, bold and distinctive, a must-have ingredient for a traditional steak and kidney pie.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39fcfced990f118a21_oxkidney.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:01.000Z',
  '2023-08-02T22:56:01.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b9',
  'Ox Liver',
  'ox-liver-43dca',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  4,
  'by_weight',
  null,
  null,
  'Ox liver, packed with essential nutrients and ready to enrich your dishes.',
  '<p>Ox liver, packed with essential nutrients and ready to enrich your dishes.</p>',
  'Ox liver, packed with essential nutrients and ready to enrich your dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39ca9d080769c0c53a_oxliver.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:01.000Z',
  '2023-08-02T22:56:01.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09e',
  'Ox Tail',
  'ox-tail-568b6',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  7,
  'by_weight',
  null,
  null,
  'Ox tail, rich in collagen, perfect for slow cooking into a luscious, flavourful stew.',
  '<p>Ox tail, rich in collagen, perfect for slow cooking into a luscious, flavourful stew.</p>',
  'Ox tail, rich in collagen, perfect for slow cooking into a luscious, flavourful stew.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd7fba7d18185d351075c_oxtail.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:02.000Z',
  '2023-08-15T19:54:45.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09a',
  'Ox Tongue',
  'ox-tongue-210df',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-none'),
  21,
  'by_weight',
  null,
  null,
  'Ox tongue, a cut of meat that offers a tender and subtle flavour when cooked properly.',
  '<p>Ox tongue, a cut of meat that offers a tender and subtle flavour when cooked properly.</p>',
  'Ox tongue, a cut of meat that offers a tender and subtle flavour when cooked properly.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfb207e68e8f614f8200e_2659.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:01.000Z',
  '2023-08-15T22:24:34.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a7',
  'Pancetta',
  'pancetta-c0880',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  16,
  'by_weight',
  null,
  null,
  'Italian-style Pancetta: cured, spiced, and perfect for adding a touch of gourmet to your dishes.',
  '<p>Italian-style Pancetta: cured, spiced, and perfect for adding a touch of gourmet to your dishes.</p>',
  'Italian-style Pancetta: cured, spiced, and perfect for adding a touch of gourmet to your dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3671dc019f2cbcc100_pancetta.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:02.000Z',
  '2023-08-15T22:34:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c111',
  'Parkin',
  'parkin',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  2,
  'other',
  null,
  null,
  'A traditional northern treat, this sticky ginger cake is made with oatmeal and treacle, warming and rich in flavour.',
  '<p>A traditional northern treat, this sticky ginger cake is made with oatmeal and treacle, warming and rich in flavour.</p>',
  'A traditional northern treat, this sticky ginger cake is made with oatmeal and treacle, warming and rich in flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbddd97eda85d5272d1fcc_7d094e3168b1ae2524bd380a7dbbe744.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:19:40.000Z',
  '2023-08-15T20:19:40.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c4',
  'Parmigiano Reggiano',
  'parmigiano-reggiano-a2867',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  24,
  'by_count',
  null,
  null,
  'Parmigiano Reggiano, the King of Cheeses, with a granular texture and rich, nutty taste.',
  '<p>Parmigiano Reggiano, the King of Cheeses, with a granular texture and rich, nutty taste.</p>',
  'Parmigiano Reggiano, the King of Cheeses, with a granular texture and rich, nutty taste.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e480a3558ea4f3a77dd_parmiggiano.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:01.000Z',
  '2023-08-15T16:35:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0bf',
  'Pate',
  'pate-a35db',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  4,
  'by_count',
  null,
  null,
  'Our large pate, rich and indulgent, perfect for spreading on crusty bread.',
  '<p>Our large pate, rich and indulgent, perfect for spreading on crusty bread.</p>',
  'Our large pate, rich and indulgent, perfect for spreading on crusty bread.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f628dcb533fe22665_pate.jpeg',
  null,
  true,
  false,
  null,
  '2023-08-02T22:56:01.000Z',
  '2023-08-16T16:55:22.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c123',
  'Paxo Sage & Onion Stuffing',
  'paxo-sage-onion-stuffing',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A classic blend of sage and onion, capturing the essence of traditional roast accompaniments.',
  null,
  'A classic blend of sage and onion, capturing the essence of traditional roast accompaniments.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0129ba1a8a181e2993ab_homemade-paxo-cranny.jpg',
  20,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:30.000Z',
  '2023-08-15T23:25:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c147',
  'Peanut & Sunflower Feeder',
  'peanut-sunflower-feeder',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Designed with care, this feeder provides a delectable duo of peanuts and sunflower seeds, guaranteeing happy tweets in your backyard.',
  '<p id="">Designed with care, this feeder provides a delectable duo of peanuts and sunflower seeds, guaranteeing happy tweets in your backyard.</p><p>‍</p>',
  'Designed with care, this feeder provides a delectable duo of peanuts and sunflower seeds, guaranteeing happy tweets in your backyard.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe8dc523fa99082a5d7c1_7511001_-_peanut_-_20cm_-_cut_out.jpg',
  101,
  false,
  true,
  null,
  '2023-08-15T21:04:34.000Z',
  '2023-08-16T07:22:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e6',
  'Philadelphia',
  'philadelphia-1356d',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-none'),
  3,
  'by_count',
  null,
  null,
  'Philadelphia, a versatile cream cheese known for its creamy and mild taste.',
  '<p>Philadelphia, a versatile cream cheese known for its creamy and mild taste.</p>',
  'Philadelphia, a versatile cream cheese known for its creamy and mild taste.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49673dcc1e5d26d9d6_philadelphia.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:56:04.000Z',
  '2023-08-03T00:24:44.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12c',
  'Picalilli',
  'picalilli',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A vibrant medley of vegetables in a tangy mustard sauce; a British classic.',
  '<p id="">A vibrant medley of vegetables in a tangy mustard sauce; a British classic.</p><p>‍</p>',
  'A vibrant medley of vegetables in a tangy mustard sauce; a British classic.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec68ce04d5883073a88a_0605-Chunky-Picalilli-300x300.png',
  17,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c137',
  'Pickled Onions',
  'pickled-onions',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Crisp onions with a sharp tang, an essential for ploughman''s lunch or as a snack.',
  '<p id="">Crisp onions with a sharp tang, an essential for ploughman''s lunch or as a snack.</p><p>‍</p>',
  'Crisp onions with a sharp tang, an essential for ploughman''s lunch or as a snack.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc024fb9981b77ee63c1ea_1113-Pickled-Onions-in-Malt-Vinegar-300x300.png',
  18,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c09f',
  'Pickled Ox Tongue',
  'pickled-ox-tongue-a0320',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  8,
  'by_weight',
  null,
  null,
  'Pickled ox tongue, a delicacy packed with tangy, complex flavours.',
  '<p>Pickled ox tongue, a delicacy packed with tangy, complex flavours.</p>',
  'Pickled ox tongue, a delicacy packed with tangy, complex flavours.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39ca9d080769c0c57a_Pickled-Beef-Tongue-19.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:02.000Z',
  '2023-08-15T22:24:39.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c134',
  'Pickled Shallots',
  'pickled-shallots',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Crunchy shallots in a tangy brine, a perfect snack or sandwich topper.',
  '<p id="">Crunchy shallots in a tangy brine, a perfect snack or sandwich topper.</p><p>‍</p>',
  'Crunchy shallots in a tangy brine, a perfect snack or sandwich topper.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbeb9a7eda85d5273d896d_1102-Pickled-Shallots.png',
  19,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0db',
  'Pigeon Breasts',
  'pigeon-breasts-d2889',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  14,
  'by_weight',
  null,
  null,
  'Breast portions of pidgeons, known for their tender and flavourful meat.',
  '<p>Breast portions of pidgeons, known for their tender and flavourful meat.</p>',
  'Breast portions of pidgeons, known for their tender and flavourful meat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe5ffd73e86904987d_pigeonbreast.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:56:02.000Z',
  '2023-08-15T20:04:17.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a9',
  'Pigs Heart',
  'pigs-heart-11b2a',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  4,
  'by_weight',
  null,
  null,
  'Pig''s heart, a versatile offal meat offering a rich, meaty taste.',
  '<p>Pig''s heart, a versatile offal meat offering a rich, meaty taste.</p>',
  'Pig''s heart, a versatile offal meat offering a rich, meaty taste.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3ac03337dc4d2e7add_pigs%2520heart.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:02.000Z',
  '2023-08-02T22:56:02.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b4',
  'Pigs Kidney',
  'pigs-kidney-a72b5',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  5,
  'by_weight',
  null,
  null,
  'Pig''s kidney, with a distinct taste, waiting to star in your next pie or casserole.',
  '<p>Pig''s kidney, with a distinct taste, waiting to star in your next pie or casserole.</p>',
  'Pig''s kidney, with a distinct taste, waiting to star in your next pie or casserole.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3b6ab438ad3dbba0f9_pigs%2520kidney.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-02T22:56:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c098',
  'Pigs Liver',
  'pigs-liver-2ab9d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  4,
  'by_weight',
  null,
  null,
  'Pig''s liver, an old-fashioned favourite that delivers a deeply satisfying flavour.',
  '<p>Pig''s liver, an old-fashioned favourite that delivers a deeply satisfying flavour.</p>',
  'Pig''s liver, an old-fashioned favourite that delivers a deeply satisfying flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3bc03337dc4d2e7b36_PorkLiver.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-02T22:56:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d5',
  'Pigs Trotters',
  'pigs-trotters-88a75',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  1,
  'by_count',
  null,
  null,
  'Pig''s trotters, gelatinous and rich, an adventurous ingredient for those who appreciate the whole animal.',
  '<p>Pig''s trotters, gelatinous and rich, an adventurous ingredient for those who appreciate the whole animal.</p>',
  'Pig''s trotters, gelatinous and rich, an adventurous ingredient for those who appreciate the whole animal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3b3178de565c303d30_m1717_1_Pig%2520Trotters.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-02T22:56:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c114',
  'Pikelets',
  'pikelets',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  null,
  'by_count',
  null,
  null,
  'Thin, light crumpets, perfect for toasting and slathering with butter or your favourite jam.',
  '<p>Thin, light crumpets, perfect for toasting and slathering with butter or your favourite jam.</p>',
  'Thin, light crumpets, perfect for toasting and slathering with butter or your favourite jam.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdf20ca66b00cd2d31e99_pikelets.png',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:25:14.000Z',
  '2023-08-15T20:25:14.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0b5',
  'Plain Pork Sausages',
  'plain-pork-sausages-d9b63',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Our Plain Pork Sausages: simple, delicious, and versatile - a comfort food staple.',
  '<p>Our Plain Pork Sausages: simple, delicious, and versatile - a comfort food staple.</p>',
  'Our Plain Pork Sausages: simple, delicious, and versatile - a comfort food staple.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30942d1d68cd23c3a0_newplainsausage.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-15T11:46:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0dc',
  'Plain Ribs',
  'plain-ribs-23877',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  7,
  'by_weight',
  null,
  null,
  'Pork ribs without any added marinade or seasoning.',
  '<p>Pork ribs without any added marinade or seasoning.</p>',
  'Pork ribs without any added marinade or seasoning.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024cc11009bfb1d39d66_plain%2520pork%2520ribs.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-02T22:56:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0d2',
  'Pork And Apple Burgers',
  'pork-and-apple-burgers-cee38',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Pork and Apple Burgers: A delightful combination of savoury and sweet flavours.',
  '<p>Pork and Apple Burgers: A delightful combination of savoury and sweet flavours.</p>',
  'Pork and Apple Burgers: A delightful combination of savoury and sweet flavours.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e38fcfced990f118942_SP104-Pork-Apple-Burgers-Raw1-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:03.000Z',
  '2023-08-15T22:22:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c5',
  'Pork & Apple Sausages',
  'pork-apple-sausages-c981c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Pork & Apple Sausages: a tantalising sweet and savoury duo that''s always a winner.',
  '<p>Pork &amp; Apple Sausages: a tantalising sweet and savoury duo that''s always a winner.</p>',
  'Pork & Apple Sausages: a tantalising sweet and savoury duo that''s always a winner.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3118f6497d1ff5b39a_Pork_Pork-Apple_Sausages_IMG_0293.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-15T11:45:58.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ba',
  'Pork & Chive Sausages',
  'pork-chive-sausages-3a837',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Pork & Chive Sausages, offering a fresh, herbaceous twist to your classic pork sausage.',
  '<p>Pork &amp; Chive Sausages, offering a fresh, herbaceous twist to your classic pork sausage.</p>',
  'Pork & Chive Sausages, offering a fresh, herbaceous twist to your classic pork sausage.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30ee91134f3eb54fe1_porkchive.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-15T11:45:35.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0aa',
  'Pork Chops',
  'pork-chops-aaac4',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Thick slices of pork meat taken from the loin or rib section.',
  '<p>Thick slices of pork meat taken from the loin or rib section.</p>',
  'Thick slices of pork meat taken from the loin or rib section.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd9d186a027d63b978950_Pork-Loin-Chops-e1567018681949.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-15T20:03:37.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0c6',
  'Pork Dripping (Pots)',
  'pork-dripping-pots-2c834',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  1,
  'by_count',
  null,
  null,
  'Potted pork dripping, the secret ingredient for making the crispiest, most flavourful roast potatoes.',
  '<p>Potted pork dripping, the secret ingredient for making the crispiest, most flavourful roast potatoes.</p>',
  'Potted pork dripping, the secret ingredient for making the crispiest, most flavourful roast potatoes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3e87618c89554065dd_porkdrippingpots.jpeg',
  2,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-15T23:24:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0a0',
  'Pork Fillet',
  'pork-fillet-775d1',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  11,
  'by_weight',
  null,
  null,
  'Tender and lean cut of pork from the muscle that runs along the backbone.',
  '<p>Tender and lean cut of pork from the muscle that runs along the backbone.</p>',
  'Tender and lean cut of pork from the muscle that runs along the backbone.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c4a57286e7b47ed5f_Pork-Fillet-Loin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-02T22:56:04.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0df',
  'Pork & Leek Sausages',
  'pork-leek-sausages-39241',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Pork & Leek Sausages, a delicious combo of savoury pork and subtly sweet leek.',
  '<p>Pork &amp; Leek Sausages, a delicious combo of savoury pork and subtly sweet leek.</p>',
  'Pork & Leek Sausages, a delicious combo of savoury pork and subtly sweet leek.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e31b9f49da96129b284_pork_and_leek_sausages_1.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-15T11:45:23.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e4',
  'Pork Pie - Large',
  'pork-pie-large',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  12.5,
  'by_count',
  'Large',
  null,
  'A substantial pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.',
  '<p id="">A substantial pie made with seasoned minced beef, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.</p><p id="">‍</p>',
  'A substantial pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 8 people.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc86a4fad4ead0c51401bc_Untitled%20(34).png',
  10,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-10-12T12:45:26.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e2',
  'Pork Pie - Medium',
  'pork-pie-medium',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  7,
  'by_count',
  'Medium',
  null,
  'A medium sized pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.',
  '<p id="">A medium sized pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.</p><p id="">‍</p>',
  'A medium sized pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will feed up to 3 people.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc865c2e66522862eca5fa_Untitled%20(33).png',
  9,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:04.000Z',
  '2023-08-18T15:26:59.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c105',
  'Pork Pie - Small',
  'pork-pie-small',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  2.3,
  'by_count',
  'Small',
  null,
  'An individual pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.',
  '<p id="">A individual pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.</p>',
  'An individual pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8625d12c1cc492e45a6c_Untitled%20(32).png',
  8,
  false,
  false,
  '2025-06-07T10:28:32.000Z',
  '2023-08-02T22:56:05.000Z',
  '2025-06-07T10:28:32.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e5',
  'Pork Pie - XL',
  'pork-pie-xl',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-beef-pork-pies'),
  50,
  'by_count',
  'X-Large',
  null,
  'A very substantial pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.',
  '<p id="">A very substantial pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.</p><p id="">‍</p>',
  'A very substantial pie made with seasoned minced pork, encased in a crisp, hot water pastry crust, perfect for enjoying on its own or with accompaniments. Will serve approximately 25 people. These can also be personalised, which make a great gift. Please contact us with your specific requirements.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8758ed009bfff2b85da8_Untitled%20(37).png',
  11,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:05.000Z',
  '2023-10-12T12:44:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c106',
  'Pork Steak',
  'pork-steak-0359d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'A slice of pork meat, often from the shoulder or leg, suitable for grilling or frying.',
  '<p>A slice of pork meat, often from the shoulder or leg, suitable for grilling or frying.</p>',
  'A slice of pork meat, often from the shoulder or leg, suitable for grilling or frying.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024dfae66900b40493c9_Pork-steaks-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:05.000Z',
  '2023-08-02T22:56:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c115',
  'Potato Cakes',
  'potato-cakes',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  3,
  'by_count',
  null,
  null,
  'Savoury griddled cakes, made with mashed potatoes and flour, ideal for breakfast or a hearty snack.',
  '<p id="">Savoury griddled cakes, made with mashed potatoes and flour, ideal for breakfast or a hearty snack.</p>',
  'Savoury griddled cakes, made with mashed potatoes and flour, ideal for breakfast or a hearty snack.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdf8fa987bd31083aacdd_potato-cakes_540x.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:27:03.000Z',
  '2023-08-15T20:27:03.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c107',
  'Potted Meat',
  'potted-meat-e977f',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  2,
  'by_count',
  null,
  null,
  'Our potted meat, a convenient and savoury spread for sandwiches or a quick snack.',
  '<p>Our potted meat, a convenient and savoury spread for sandwiches or a quick snack.</p>',
  'Our potted meat, a convenient and savoury spread for sandwiches or a quick snack.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3ef0ae4a0c26129cfe_potted-meat.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:05.000Z',
  '2023-08-15T22:33:23.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c120',
  'Premium Wild Bird Seed',
  'premium-wild-bird-seed',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A luxurious blend of seeds to attract a diverse range of garden birds; nature''s best for your feathered friends.',
  null,
  'A luxurious blend of seeds to attract a diverse range of garden birds; nature''s best for your feathered friends.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed5b8ea8d901610983f7_Premium-Seed-Mix.webp',
  104,
  false,
  true,
  null,
  '2023-08-15T21:04:30.000Z',
  '2023-08-16T07:22:37.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c140',
  'Pureety Beef Casserole',
  'pureety-beef-casserole',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Turn your beef into a luscious, slow-cooked delight with this flavourful mix.',
  '<p id="">Turn your beef into a luscious, slow-cooked delight with this flavourful mix.</p><p>‍</p>',
  'Turn your beef into a luscious, slow-cooked delight with this flavourful mix.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffe9877b0d54a5f92f17_Beef-Casserole-Recipe-Seasoning-1.webp',
  22,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13f',
  'Pureety Char Sui Glaze',
  'pureety-char-sui-glaze',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Infuse your dishes with the sweet and savoury notes of traditional Chinese barbecue.',
  '<p id="">Infuse your dishes with the sweet and savoury notes of traditional Chinese barbecue.</p><p>‍</p>',
  'Infuse your dishes with the sweet and savoury notes of traditional Chinese barbecue.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0003f4d1acc5ace3bf55_Chinese-Char-Sui-Marinade-Glaze-1.png',
  23,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c143',
  'Pureety Chicken Casserole',
  'pureety-chicken-casserole',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Elevate your chicken dishes with this aromatic and hearty casserole base.',
  '<p id="">Elevate your chicken dishes with this aromatic and hearty casserole base.</p><p>‍</p>',
  'Elevate your chicken dishes with this aromatic and hearty casserole base.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff8f1c8ed08e4c8df226_NEW-Chicken-Casserole-Angled-copy.png',
  24,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:34.000Z',
  '2023-08-15T23:23:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c146',
  'Pureety Chilli Con Carne',
  'pureety-chilli-con-carne',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Turn up the heat and flavour with this spicy and rich chili blend.',
  null,
  'Turn up the heat and flavour with this spicy and rich chili blend.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfef036aac837fc76b7c2_NEW-Chilli-Con-Carne-Angled-copy.png',
  25,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:34.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13b',
  'Pureety Fajita Seasoning',
  'pureety-fajita-seasoning',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Add some authentic Mexican zest to your fajitas with this robust seasoning.',
  '<p id="">Add some authentic Mexican zest to your fajitas with this robust seasoning.</p><p>‍</p>',
  'Add some authentic Mexican zest to your fajitas with this robust seasoning.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00c4f546d537f26d1624_Fajita-Recipe-Seasoning-1_1200x1200.webp',
  26,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c149',
  'Pureety Garden Mint Glaze',
  'pureety-garden-mint-glaze',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Infused with fresh garden mint, this glaze delivers a refreshing and aromatic touch, perfect for lamb or enhancing grilled vegetables.',
  null,
  'Infused with fresh garden mint, this glaze delivers a refreshing and aromatic touch, perfect for lamb or enhancing grilled vegetables.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfe58bcb06643adec44a1_garden-mint-1.png',
  27,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:34.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13d',
  'Pureety Garlic Butter Glaze',
  'pureety-garlic-butter-glaze',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Rich and aromatic, this glaze is a treat for garlic lovers.',
  '<p id="">Rich and aromatic, this glaze is a treat for garlic lovers.</p><p>‍</p>',
  'Rich and aromatic, this glaze is a treat for garlic lovers.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00498a6ae341f1174c21_Garlic-Butter-1.png',
  28,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c141',
  'Pureety Lamb Casserole',
  'pureety-lamb-casserole',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A rich and hearty base, perfect for crafting a comforting lamb stew.',
  '<p id="">A rich and hearty base, perfect for crafting a comforting lamb stew.</p><p>‍</p>',
  'A rich and hearty base, perfect for crafting a comforting lamb stew.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffd61c8ed08e4c8e4267_Lamb-Casserole-Recipe-Seasoning.png',
  29,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c144',
  'Pureety Moroccan Tagine',
  'pureety-moroccan-tagine',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Aromatic spices and herbs bring North African warmth to your dishes.',
  '<p id="">Aromatic spices and herbs bring North African warmth to your dishes.</p><p>‍</p>',
  'Aromatic spices and herbs bring North African warmth to your dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff78a987bd31086275e6_Moroccan-Tagine-Recipe-Seasoning-1.png',
  30,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:34.000Z',
  '2023-08-15T23:23:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13c',
  'Pureety Paella Seasoning',
  'pureety-paella-seasoning',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Bring Spain to your kitchen with this aromatic blend, perfect for an authentic paella.',
  '<p id="">Bring Spain to your kitchen with this aromatic blend, perfect for an authentic paella.</p><p>‍</p>',
  'Bring Spain to your kitchen with this aromatic blend, perfect for an authentic paella.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc005e7a3bd16fe777eac2_NEW-Paella-Angled-copy-copy.png',
  31,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13a',
  'Pureety Potato Seasoning',
  'pureety-potato-seasoning',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Transform your potatoes into a flavourful sensation with this expert blend.',
  '<p id="">Transform your potatoes into a flavourful sensation with this expert blend.</p><p>‍</p>',
  'Transform your potatoes into a flavourful sensation with this expert blend.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00a597b7479a58bf859f_Original-Potato-Seasoning-1.png',
  32,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c13e',
  'Pureety Salt & Pepper Glaze',
  'pureety-salt-pepper-glaze',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A classic blend to enhance the natural flavours of your dishes.',
  '<p id="">A classic blend to enhance the natural flavours of your dishes.</p><p>‍</p>',
  'A classic blend to enhance the natural flavours of your dishes.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0033f4d1acc5ace3fbe2_Spicy-Salt-Pepper-Marinade-Glaze-1-1391x1536_1024x1024.webp',
  33,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c142',
  'Pureety Sticky BBQ Glaze',
  'pureety-sticky-bbq-glaze',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Smoky and sweet, give your meats a luscious barbecue finish.',
  '<p id="">Smoky and sweet, give your meats a luscious barbecue finish.</p><p>‍</p>',
  'Smoky and sweet, give your meats a luscious barbecue finish.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffa4d4a0274ea5e4b34f_Sticky-BBQ-Marinade-Glaze-1.webp',
  34,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:33.000Z',
  '2023-08-15T23:23:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c145',
  'Pureety Thai Green Curry',
  'pureety-thai-green-curry',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Spice up your meals with this authentic and fragrant Thai blend.',
  '<p id="">Spice up your meals with this authentic and fragrant Thai blend.</p><p>‍</p>',
  'Spice up your meals with this authentic and fragrant Thai blend.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff1dbcb06643adecff0d_NEW-Thai-Green-Angled-copy.png',
  35,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T21:04:34.000Z',
  '2023-08-15T23:23:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0eb',
  'Rabbit',
  'rabbit-7fda2',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  9,
  'by_weight',
  null,
  null,
  'Meat from a rabbit.',
  '<p>Meat from a rabbit.</p>',
  'Meat from a rabbit.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe5ffd73e86904984c_rabbit2.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:05.000Z',
  '2023-08-02T22:56:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c136',
  'Red Cabbage',
  'red-cabbage',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Pickled to perfection, adding a vibrant touch of colour and flavour to your plate.',
  '<p id="">Pickled to perfection, adding a vibrant touch of colour and flavour to your plate.</p><p>‍</p>',
  'Pickled to perfection, adding a vibrant touch of colour and flavour to your plate.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc021961b4f572fecb3eca_1104-Red-Cabbage-300x300.png',
  7,
  false,
  true,
  null,
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0fe',
  'Red Leicester Wedges',
  'red-leicester-wedges-8f730',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  1,
  'by_count',
  null,
  null,
  'Red Leicester wedges, recognisable by its vibrant colour and sweet, nutty flavour.',
  '<p>Red Leicester wedges, recognisable by its vibrant colour and sweet, nutty flavour.</p>',
  'Red Leicester wedges, recognisable by its vibrant colour and sweet, nutty flavour.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba95a6c2325c4d697626b_red-leicester-cheese.jpg',
  null,
  true,
  false,
  null,
  '2023-08-02T22:56:06.000Z',
  '2023-08-16T18:31:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0dd',
  'Rib Of Beef',
  'rib-of-beef-0a91a',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  17,
  'by_weight',
  null,
  null,
  'A prime cut of beef with the rib bone attached, renowned for its juicy and flavorful meat.',
  '<p>A prime cut of beef with the rib bone attached, renowned for its juicy and flavorful meat.</p>',
  'A prime cut of beef with the rib bone attached, renowned for its juicy and flavorful meat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc4805f80ff25c11f2a_Ribofbeef.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:06.000Z',
  '2023-08-02T22:56:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ea',
  'Ribeye Steak',
  'ribeye-steak-c2b8d',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  24,
  'by_weight',
  null,
  null,
  'A highly marbled and flavorful steak cut from the rib section, known for its tenderness and juiciness.',
  '<p>A highly marbled and flavorful steak cut from the rib section, known for its tenderness and juiciness.</p>',
  'A highly marbled and flavorful steak cut from the rib section, known for its tenderness and juiciness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc628b86305f258d244_ribeye%2520steak.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:06.000Z',
  '2023-08-02T22:56:06.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f5',
  'Rindless Back Bacon',
  'rindless-back-bacon-7b670',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Rindless Back Bacon: Lean, tasty, and perfect for a classic British breakfast.',
  '<p>Rindless Back Bacon: Lean, tasty, and perfect for a classic British breakfast.</p>',
  'Rindless Back Bacon: Lean, tasty, and perfect for a classic British breakfast.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36d7651eb5e3c5625f_Back-Bacon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:06.000Z',
  '2023-08-15T16:08:27.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f6',
  'Roast Beef',
  'roast-beef-30724',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  20,
  'by_weight',
  null,
  null,
  'Roast beef, tender and juicy, delicious paired with horseradish on sandwiches.',
  '<p id="">Roast beef, tender and juicy, delicious paired with horseradish on sandwiches.</p>',
  'Roast beef, tender and juicy, delicious paired with horseradish on sandwiches.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f56f7b732d107a119_roastbeef.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:06.000Z',
  '2023-08-16T07:37:30.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f0',
  'Roast Ham',
  'roast-ham-160ff',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  17,
  'by_weight',
  null,
  null,
  'Roast ham, succulent and savoury, an ideal choice for any special occasion.',
  '<p>Roast ham, succulent and savoury, an ideal choice for any special occasion.</p>',
  'Roast ham, succulent and savoury, an ideal choice for any special occasion.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4068851c5137e64745_roastham.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:06.000Z',
  '2023-08-15T22:29:57.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e7',
  'Roast Ox Heart',
  'roast-ox-heart-19052',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  11,
  'by_weight',
  null,
  null,
  'Roast ox heart, bold and flavourful, for the adventurous food lovers.',
  '<p>Roast ox heart, bold and flavourful, for the adventurous food lovers.</p>',
  'Roast ox heart, bold and flavourful, for the adventurous food lovers.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f96d600d1ee50e96d_beef-heart-500x500.jpeg',
  null,
  true,
  false,
  null,
  '2023-08-02T22:56:07.000Z',
  '2023-08-16T16:54:59.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c101',
  'Roast Pork',
  'roast-pork-cdfac',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-cooked-meats'),
  16,
  'by_weight',
  null,
  null,
  'Roast pork, with a perfect balance of lean meat and juicy fat, ready for your family meal.',
  '<p>Roast pork, with a perfect balance of lean meat and juicy fat, ready for your family meal.</p>',
  'Roast pork, with a perfect balance of lean meat and juicy fat, ready for your family meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e40c03337dc4d2e7f68_roast%2520pork.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:07.000Z',
  '2023-08-15T22:29:40.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0de',
  'Rolled Rib Joint',
  'rolled-rib-joint-def1a',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  20,
  'by_weight',
  null,
  null,
  'A boneless cut of beef from the rib section, rolled and tied, offering tender and succulent meat.',
  '<p>A boneless cut of beef from the rib section, rolled and tied, offering tender and succulent meat.</p>',
  'A boneless cut of beef from the rib section, rolled and tied, offering tender and succulent meat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc48275029b2f5087f8_rolledribbeef.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:07.000Z',
  '2023-08-02T22:56:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c100',
  'Rump Steak',
  'rump-steak-fc699',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  16,
  'by_weight',
  null,
  null,
  'A lean and tender steak cut from the hindquarters, often grilled or pan-seared for a delicious meal.',
  '<p>A lean and tender steak cut from the hindquarters, often grilled or pan-seared for a delicious meal.</p>',
  'A lean and tender steak cut from the hindquarters, often grilled or pan-seared for a delicious meal.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc6500fa85b4f9b8290_Rump-Steak-Beef-63.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:07.000Z',
  '2023-08-02T22:56:07.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f1',
  'Sausage Meat',
  'sausage-meat-990a8',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Our sausage meat - your secret ingredient for homemade stuffing, meatballs, and more.',
  '<p>Our sausage meat - your secret ingredient for homemade stuffing, meatballs, and more.</p>',
  'Our sausage meat - your secret ingredient for homemade stuffing, meatballs, and more.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32628dcb533fe21c48_Wild-Boar-Sausagemeat.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:07.000Z',
  '2023-08-15T11:45:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c109',
  'Sausage Rolls',
  'sausage-rolls',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  1.6,
  'by_count',
  'Small',
  null,
  'Delicious sausage meat, made in store, wrapped in a buttery, flaky pastry.',
  '<p>Delicious sausage meat, made in store, wrapped in a buttery, flaky pastry.</p>',
  'Delicious sausage meat, made in store, wrapped in a buttery, flaky pastry.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8583af0cee8d7ac71202_Untitled%20(30).png',
  5,
  false,
  false,
  '2025-06-07T10:10:48.000Z',
  '2023-08-02T22:56:08.000Z',
  '2025-06-07T10:02:36.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c148',
  'Seed Feeder',
  'seed-feeder',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Crafted for garden enthusiasts, this feeder is the ideal way to invite a flurry of feathered friends, ensuring they dine with ease and elegance.',
  '<p id="">Crafted for garden enthusiasts, this feeder is the ideal way to invite a flurry of feathered friends, ensuring they dine with ease and elegance.</p>',
  'Crafted for garden enthusiasts, this feeder is the ideal way to invite a flurry of feathered friends, ensuring they dine with ease and elegance.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe8b8877b0d54a5de3f4e_R401636_2.jpg',
  100,
  false,
  true,
  null,
  '2023-08-15T21:04:34.000Z',
  '2023-08-16T07:21:56.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e9',
  'Shoulder Joint',
  'shoulder-joint-bd35a',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  8,
  'by_weight',
  null,
  null,
  'Cut of pork from the shoulder of the pig, suitable for roasting or slow cooking.',
  '<p>Cut of pork from the shoulder of the pig, suitable for roasting or slow cooking.</p>',
  'Cut of pork from the shoulder of the pig, suitable for roasting or slow cooking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024dfae66900b40493b3_Blackwells-Pork-Shoulder.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c108',
  'Shoulder Of Lamb',
  'shoulder-of-lamb-4c786',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-lamb'),
  11,
  'by_weight',
  null,
  null,
  'A versatile and flavorful cut of lamb from the shoulder, commonly used for roasting, stewing, or braising.',
  '<p>A versatile and flavorful cut of lamb from the shoulder, commonly used for roasting, stewing, or braising.</p>',
  'A versatile and flavorful cut of lamb from the shoulder, commonly used for roasting, stewing, or braising.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff8ab0f160825624b71_Whole-Shoulder-of-Lamb-scaled.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f8',
  'Shoulder Steak',
  'shoulder-steak-a407f',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  11,
  'by_weight',
  null,
  null,
  'A flavorful cut of beef from the shoulder, typically used for slow cooking, braising, or stewing.',
  '<p>A flavorful cut of beef from the shoulder, typically used for slow cooking, braising, or stewing.</p>',
  'A flavorful cut of beef from the shoulder, typically used for slow cooking, braising, or stewing.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc65f40c9b20e206096_raw-shoulder-steak.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0fd',
  'Silverside Joint',
  'silverside-joint-71714',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  12,
  'by_weight',
  null,
  null,
  'A lean and boneless cut of beef from the hindquarters, often used for roasting or slow cooking.',
  '<p>A lean and boneless cut of beef from the hindquarters, often used for roasting or slow cooking.</p>',
  'A lean and boneless cut of beef from the hindquarters, often used for roasting or slow cooking.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc467ffbab04ceca94f_Salt-Beef-Silverside-1KG_001_websize.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ff',
  'Sirloin Joints',
  'sirloin-joints-d37c5',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  23,
  'by_weight',
  null,
  null,
  'Premium cuts of beef from the lower back, known for their tenderness and marbling, ideal for roasting or grilling.',
  '<p>Premium cuts of beef from the lower back, known for their tenderness and marbling, ideal for roasting or grilling.</p>',
  'Premium cuts of beef from the lower back, known for their tenderness and marbling, ideal for roasting or grilling.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc48d20e90607eb4407_beef-sirloin-joint_2_1.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e8',
  'Sirloin Steak',
  'sirloin-steak-97c07',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  24,
  'by_weight',
  null,
  null,
  'A popular and tender steak cut from the upper back, known for its balanced flavor and tenderness.',
  '<p>A popular and tender steak cut from the upper back, known for its balanced flavor and tenderness.</p>',
  'A popular and tender steak cut from the upper back, known for its balanced flavor and tenderness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc7f1c666939cc964c5_Sirloin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:08.000Z',
  '2023-08-02T22:56:08.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0fb',
  'Skin On Fillets',
  'skin-on-fillets-f745c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  9,
  'by_weight',
  null,
  null,
  'Boneless chicken breast with the skin intact.',
  '<p>Boneless chicken breast with the skin intact.</p>',
  'Boneless chicken breast with the skin intact.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb83280cff039d635c_chicken_breast_skinon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:09.000Z',
  '2023-08-02T22:56:09.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c117',
  'Small Brown Loaf',
  'small-brown-loaf',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  3,
  'other',
  null,
  null,
  'Nutty in flavour with a hint of molasses, this loaf offers a wholesome choice for bread lovers.',
  '<p id="">Nutty in flavour with a hint of molasses, this loaf offers a wholesome choice for bread lovers.</p>',
  'Nutty in flavour with a hint of molasses, this loaf offers a wholesome choice for bread lovers.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe098f4d1acc5acbd0484_Wholemeal-tin-loaf-400g.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:31:25.000Z',
  '2023-08-15T23:47:13.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c116',
  'Small White Loaf',
  'small-white-loaf',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  3,
  'by_count',
  null,
  null,
  'Classic and soft, this loaf boasts a tender crumb with a crisp crust, versatile for any sandwich or toast.',
  '<p>Classic and soft, this loaf boasts a tender crumb with a crisp crust, versatile for any sandwich or toast.</p>',
  'Classic and soft, this loaf boasts a tender crumb with a crisp crust, versatile for any sandwich or toast.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdffb97b7479a58986d6d_IMG_9465_530x%402x.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:28:47.000Z',
  '2023-08-15T20:28:47.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ec',
  'Smoked Middle Bacon',
  'smoked-middle-bacon-589e5',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Smoked Middle Bacon: Offering a deep, smoky flavour to elevate your meals.',
  '<p>Smoked Middle Bacon: Offering a deep, smoky flavour to elevate your meals.</p>',
  'Smoked Middle Bacon: Offering a deep, smoky flavour to elevate your meals.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36f6e03eb6d787a460_smoked%2520middle.png',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:09.000Z',
  '2023-08-15T16:08:17.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10a',
  'Smoked Rindless Bacon',
  'smoked-rindless-bacon-d956c',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Our Smoked Rindless Bacon: lean, yet filled with smoky, savoury goodness.',
  '<p>Our Smoked Rindless Bacon: lean, yet filled with smoky, savoury goodness.</p>',
  'Our Smoked Rindless Bacon: lean, yet filled with smoky, savoury goodness.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3687618c8955405ea1_essington-farm-oak-smoked-rindless-back-bacon.png',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:09.000Z',
  '2023-08-15T16:07:53.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ef',
  'Smoked Streaky Bacon',
  'smoked-streaky-bacon-15e13',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Smoked Streaky Bacon: thin, crisp, and smoky - a flavourful addition to any dish.',
  '<p>Smoked Streaky Bacon: thin, crisp, and smoky - a flavourful addition to any dish.</p>',
  'Smoked Streaky Bacon: thin, crisp, and smoky - a flavourful addition to any dish.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36ca9d080769c0c2e9_unsmokedstreakybacon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:09.000Z',
  '2023-08-15T16:08:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f9',
  'Special Occasion Pies',
  'special-occasion-pies',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  60,
  'by_count',
  'X-Large',
  null,
  'Custom made pies filled with your choice of Beef or Pork, personalised with a message of your choice. These start at £60 for a basic design, please contact us for specific requirements and pricing.',
  '<p id="">Custom made pies filled with your choice of Beef or Pork, personalised with a message of your choice. These start at £60 for a basic design, please contact us for specific requirements and pricing.</p><p id="">‍</p>',
  'Custom made pies filled with your choice of Beef or Pork, personalised with a message of your choice. These start at £60 for a basic design, please contact us for specific requirements and pricing.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc87f1fad4ead0c5155e25_Untitled%20(40).png',
  7,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:09.000Z',
  '2023-08-16T08:25:23.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11d',
  'Staffordshire Oatcakes',
  'staffordshire-oatcakes',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  1,
  'other',
  null,
  null,
  'Savoury oat pancakes, a regional delicacy, best served warm with cheese, bacon, or eggs.',
  '<p id="">Savoury oat pancakes, a regional delicacy, best served warm with cheese, bacon, or eggs.</p>',
  'Savoury oat pancakes, a regional delicacy, best served warm with cheese, bacon, or eggs.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe2c3994a47c4a034815b_6141506637_8098b818b8.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:40:54.000Z',
  '2023-08-15T20:40:54.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f3',
  'Steak and Kidney',
  'steak-and-kidney',
  (select id from public.categories where slug = 'pies'),
  (select id from public.subcategories where slug = 'pies-special-pies'),
  2.8,
  'by_count',
  'Medium',
  null,
  'Hearty Classic Pie, robust flavours of high-quality beef and kidney, perfectly enclosed in handmade pastry.',
  '<p id="">Hearty Classic Pie, robust flavours of high-quality beef and kidney, perfectly enclosed in handmade &nbsp;pastry.</p>',
  'Hearty Classic Pie, robust flavours of high-quality beef and kidney, perfectly enclosed in handmade pastry.',
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8542fad4ead0c5126d77_Untitled%20(29).png',
  2,
  false,
  false,
  '2025-06-07T11:09:32.000Z',
  '2023-08-02T22:56:10.000Z',
  '2025-06-07T11:09:32.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f2',
  'Sweet Chilli Sausages',
  'sweet-chilli-sausages-9dbbc',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Sweet Chilli Sausages: for those who enjoy a touch of heat with their meat.',
  '<p>Sweet Chilli Sausages: for those who enjoy a touch of heat with their meat.</p>',
  'Sweet Chilli Sausages: for those who enjoy a touch of heat with their meat.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32b9f49da96129b451_sweet%2520chilli%2520sausages.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:10.000Z',
  '2023-08-15T11:44:54.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c129',
  'Sweet Farmhouse Pickle',
  'sweet-farmhouse-pickle',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A delightful mix of crunch and sweetness; the ideal partner for cheeses and cold cuts.',
  null,
  'A delightful mix of crunch and sweetness; the ideal partner for cheeses and cold cuts.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec8d3ba8cf33c2039c5e_0601-Farmhouse-Pickle.png',
  7,
  false,
  true,
  null,
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c102',
  'T Bone Steak',
  't-bone-steak-70acb',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  20,
  'by_weight',
  null,
  null,
  'A steak that includes a T-shaped bone with meat on both sides, featuring both tenderloin and strip loin sections.',
  '<p>A steak that includes a T-shaped bone with meat on both sides, featuring both tenderloin and strip loin sections.</p>',
  'A steak that includes a T-shaped bone with meat on both sides, featuring both tenderloin and strip loin sections.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc77c1c4f92aadec474_TBone-raw-website-.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:10.000Z',
  '2023-08-02T22:56:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c103',
  'Tasty Lancashire (Leigh Toaster)',
  'tasty-lancashire-leigh-toaster-f00a7',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  14,
  'by_weight',
  null,
  null,
  'Tasty Lancashire (Leigh Toaster), a superb melting cheese with a full-bodied taste.',
  '<p>Tasty Lancashire (Leigh Toaster), a superb melting cheese with a full-bodied taste.</p>',
  'Tasty Lancashire (Leigh Toaster), a superb melting cheese with a full-bodied taste.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e453178de565c3044df_Tasty%2520Lancashire.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:10.000Z',
  '2023-08-15T16:24:05.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c12a',
  'Tomato Chutney',
  'tomato-chutney',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'A rich and tangy blend of ripe tomatoes, perfect as an accompaniment or dip.',
  null,
  'A rich and tangy blend of ripe tomatoes, perfect as an accompaniment or dip.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc04a1ba1a8a181e2da56b_SUNDRIED-TOM-GARLIC-CHUTNEY-600x600.png',
  7,
  false,
  true,
  null,
  '2023-08-15T21:04:31.000Z',
  '2023-08-15T23:23:12.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e3',
  'Topside Joint',
  'topside-joint-ca627',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-beef'),
  12,
  'by_weight',
  null,
  null,
  'A lean and boneless cut of beef from the hind leg, suitable for roasting or braising.',
  '<p>A lean and boneless cut of beef from the hind leg, suitable for roasting or braising.</p>',
  'A lean and boneless cut of beef from the hind leg, suitable for roasting or braising.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc496298081293fd867_Topside.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:10.000Z',
  '2023-08-02T22:56:10.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c104',
  'Treacle Bacon',
  'treacle-bacon-f6d6f',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  13,
  'by_weight',
  null,
  null,
  'Treacle Bacon: Sweet, smoky, and utterly irresistible.',
  '<p>Treacle Bacon: Sweet, smoky, and utterly irresistible.</p>',
  'Treacle Bacon: Sweet, smoky, and utterly irresistible.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3710577e8841e3db70_blackwells-black-treacle-bacon.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:11.000Z',
  '2023-08-15T16:04:51.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ed',
  'True Grit',
  'true-grit-ff119',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  11,
  'by_weight',
  null,
  null,
  'True Grit, a unique, aged cheese, offering a rich, powerful flavour that lingers.',
  '<p>True Grit, a unique, aged cheese, offering a rich, powerful flavour that lingers.</p>',
  'True Grit, a unique, aged cheese, offering a rich, powerful flavour that lingers.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e5018f6497d1ff5c780_truegrit.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:11.000Z',
  '2023-08-15T16:23:50.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e1',
  'Turkey Crown',
  'turkey-crown-bf149',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  13,
  'by_weight',
  null,
  null,
  'A boneless turkey breast with the wings and skin removed',
  '<p>A boneless turkey breast with the wings and skin removed</p>',
  'A boneless turkey breast with the wings and skin removed',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abfd92cf06a008e2149_rolled-turkey-crown-special-offer-5932-p.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:56:11.000Z',
  '2023-08-15T20:04:00.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c10c',
  'Vanilla Slice',
  'vanilla-slice',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  2,
  'other',
  null,
  null,
  'A delicate layering of creamy vanilla custard between flaky pastry, finished with a smooth icing top.',
  '<p>A delicate layering of creamy vanilla custard between flaky pastry, finished with a smooth icing top.</p>',
  'A delicate layering of creamy vanilla custard between flaky pastry, finished with a smooth icing top.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdc73570b6c05af6279f5_647503b9c0611d740d0618b0_IMG_2152.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:13:02.000Z',
  '2023-08-15T20:13:45.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0ee',
  'Venison Steaks',
  'venison-steaks-85ba6',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  20,
  'by_weight',
  null,
  null,
  'Tender and delicious steaks cut from deer meat',
  '<p>Tender and delicious steaks cut from deer meat</p>',
  'Tender and delicious steaks cut from deer meat',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abfcc68ca17281b2f47_venison-loin.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:11.000Z',
  '2023-08-02T22:56:11.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0e0',
  'Weekly Special Sausages',
  'weekly-special-sausages-bf682',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-pork'),
  9,
  'by_weight',
  null,
  null,
  'Our weekly special sausages, always innovating to bring you something exciting and delicious.',
  '<p>Our weekly special sausages, always innovating to bring you something exciting and delicious.</p>',
  'Our weekly special sausages, always innovating to bring you something exciting and delicious.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30d12c92ca978c5c71_Special%2520Sausages.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:11.000Z',
  '2023-08-15T11:44:41.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f7',
  'Wensleydale & Cranberries',
  'wensleydale-cranberries-2a411',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-guest-cheeses'),
  13,
  'by_weight',
  null,
  null,
  'Wensleydale & Cranberries, a sweet and tangy pairing that''s a feast for the senses.',
  '<p>Wensleydale &amp; Cranberries, a sweet and tangy pairing that''s a feast for the senses.</p>',
  'Wensleydale & Cranberries, a sweet and tangy pairing that''s a feast for the senses.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e45538964976eaaebb0_wensleydale-with-cranberries-cheese.jpeg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:12.000Z',
  '2023-08-15T16:34:32.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c11a',
  'White Baps',
  'white-baps',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-patisserie'),
  1,
  'by_count',
  null,
  null,
  'Fluffy and light, these white rolls are the perfect accompaniment for our famous burgers or filled sandwiches.',
  '<p id="">Fluffy and light, these white rolls are the perfect accompaniment for our famous burgers or filled sandwiches.</p>',
  'Fluffy and light, these white rolls are the perfect accompaniment for our famous burgers or filled sandwiches.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1b9a987bd31083d45d5_99692021878362184.jpg',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-15T20:36:19.000Z',
  '2023-08-15T20:36:19.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c132',
  'Wholegrain Mustard',
  'wholegrain-mustard',
  (select id from public.categories where slug = 'deli'),
  (select id from public.subcategories where slug = 'deli-store-cupboard'),
  2,
  'by_count',
  null,
  null,
  'Bursting with grains and flavour, this mustard offers a textured bite.',
  null,
  'Bursting with grains and flavour, this mustard offers a textured bite.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbebe6a987bd31084a21ca_1003-Wholegrain-Mustard-300x300.png',
  9,
  false,
  true,
  null,
  '2023-08-15T21:04:32.000Z',
  '2023-08-15T23:23:13.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0f4',
  'Wookey Hole',
  'wookey-hole-40c36',
  (select id from public.categories where slug = 'cheese'),
  (select id from public.subcategories where slug = 'cheese-everyday-cheeses'),
  17,
  'by_weight',
  null,
  null,
  'Wookey Hole, a cave-aged Cheddar with a deep, nutty flavour and earthy undertones.',
  '<p>Wookey Hole, a cave-aged Cheddar with a deep, nutty flavour and earthy undertones.</p>',
  'Wookey Hole, a cave-aged Cheddar with a deep, nutty flavour and earthy undertones.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba85ef2cd7030709e2717_IMG_1176_700x700.webp',
  null,
  false,
  false,
  '2024-01-19T18:35:04.000Z',
  '2023-08-02T22:56:12.000Z',
  '2023-08-15T16:31:29.000Z'
);

insert into public.products (
  legacy_collection_id,
  legacy_item_id,
  name,
  slug,
  category_id,
  subcategory_id,
  price,
  price_type,
  size,
  inventory,
  short_description,
  description_html,
  source_product_description,
  source_image_url,
  order_on_page,
  is_archived,
  is_draft,
  published_at,
  source_created_at,
  source_updated_at
) values (
  '65aac0c230244b51ed39bd17',
  '65aac0c230244b51ed39c0fc',
  'Xmas Deposit',
  'xmas-deposit-24e88',
  (select id from public.categories where slug = 'meat'),
  (select id from public.subcategories where slug = 'meat-chicken-duck-game'),
  10,
  'by_weight',
  null,
  null,
  'A deposit for ordering a turkey for Christmas.',
  '<p>A deposit for ordering a turkey for Christmas.</p>',
  'A deposit for ordering a turkey for Christmas.',
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465927d_Turkey_raw%25402x.jpeg',
  null,
  false,
  true,
  null,
  '2023-08-02T22:56:12.000Z',
  '2023-08-15T17:13:24.000Z'
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = '4-quail'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cb7fa2923ec66dd9265ff6_64a98abf3ad9b2d8948556c8_Quail4.jpeg',
  '4 Quail',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'apple-sauce'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec56c811fd71a8b1a28d_0701-Luxury-Bramley-Apple-Sauce.png',
  'Apple Sauce',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'autumn-fruit-chutney'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc047702fea82689f90efb_0503-Autumn-Fruit-Chutney-300x300.png',
  'Autumn Fruit Chutney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'bacon-ribs'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cb7fa293daf9d341703111_64ca9e32e5febf3b34b238a4_bacon%252520ribs.jpeg',
  'Bacon Ribs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'barnsley-chops-856b0'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5ee316f6748607208_barnsley%2520chops.jpeg',
  'Barnsley Chops',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'bavette-steak-c2870'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc52f1fc7debc86bfba_Bavette-Steak-1024x486.jpeg',
  'Bavette Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-burgers-d8392'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3771dc019f2cbcc442_Grass-Fed-Organic-Burgers.jpeg',
  'Beef Burgers',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-dripping-packets-72360'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3bd5afbe69824e8ec7_dripping.jpeg',
  'Beef Dripping (Packets)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-pie-large'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc86d35995512c6d8979df_Untitled%20(35).png',
  'Beef Pie - Large',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-pie-medium'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc865c2e66522862eca5fa_Untitled%20(33).png',
  'Beef Pie - Medium',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-pie-small'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc85ca0cfc1c9b6d4fa64c_Untitled%20(31).png',
  'Beef Pie - Small',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-pie-xl'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8758ed009bfff2b85da8_Untitled%20(37).png',
  'Beef Pie - XL',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-sausages-08ab4'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30d80b9bf1fb7ffc67_healthy-halal-meat-online-beef-sausages-delivery.jpeg',
  'Beef Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-short-ribs-4515c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cab5e7a08e5e83883eaf99_64a56d6465cdb3718a085e9c_raw-beef-short-ribs-bone-dark-surface.jpeg',
  'Beef Short Ribs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'beef-skirt-0cea8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc70e545201084edc09_Beef%2520Skirt.jpeg',
  'Beef Skirt',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'belly-pork-666b7'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024b11a3d5015792204f_pork-belly-bone-in.jpeg',
  'Belly Pork',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'black-pepper-garlic-sausage-irish-6df82'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3056f7b732d1078cfe_CFTNTGBP_Raw.jpeg',
  'Black Pepper & Garlic Sausage (Irish)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'black-pudding-54fd5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8168a926ddaf9de81fff_9bd1f83e-ece5-424a-99b5-9d8a57510c36.jpg',
  'Black Pudding',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'blacksticks-blue-38ff9'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4110577e8841e3ea16_BLACKSTICKS-TOP-1200x1203.jpeg',
  'Blacksticks Blue',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'boiled-ham-7be8c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcff25ae53ac5bd1eabe44_Nigels-Cooked-Ham-with-breadcrumbs.jpg',
  'Boiled Ham',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'braising-steak-0ccaa'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc54cbf454723efa377_84298-52594-braising-steak.jpeg',
  'Braising Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'breast-of-lamb-64973'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5ebf988cbabd54e8f_free-range-breast-of-lamb-98-p.jpeg',
  'Breast Of Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'breast-on-bone-b5525'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb81e87e14cc5a8f99_chicken-breast-on-bone_shutterstock_1656042634-scaled.jpeg',
  'Breast On Bone',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'brie-wedges-5514a'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e41d12c92ca978c7b13_briecheesewedge_jdzi.jpeg',
  'Brie Wedges',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'brisket-joint-a1450'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd8866eeab31cf481146d_4cdd9db2-e42b-42ea-addb-24058d88ece2.jpg',
  'Brisket Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'brock-blue-89750'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e48ab528577efcfb575_brock%2520blue.jpeg',
  'Brock Blue',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'brown-baps'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1e675cea4f20e60c8aa_brown-soft-roll-4-pack.jpg',
  'Brown Baps',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'capon-8d9e7'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc23106e4e32339bf0_capon.jpeg',
  'Capon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'caramelised-onion-chutney'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc044d61b4f572fece1a7f_0522-Caramilised-Onion-Chutney-300x300.png',
  'Caramelised Onion Chutney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cheddar-cheese-6aff6'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cadef39ff94cbabaf5840b_64c930fda73080d5c4ad9b0e_Somerset-Cheddar_1280x800.jpeg',
  'Cheddar Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cheese-onion'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc83341b62dc3a96e30081_Untitled%20(22).png',
  'Cheese & Onion',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cheese-wafer-biscuits'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc05d392f0edeec2cd0f3b_Untitled%20(18).png',
  'Cheese Wafer Biscuits',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cherry-cake'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdd76e9a91b6706556357_Cherry-Cake-1200-4.jpg',
  'Cherry Cake',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-drumsticks-8dc66'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab9f4bb3aa034658f60_chickendrumsticks.jpeg',
  'Chicken Drumsticks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-fillets-b9438'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab953a8cd97b6edac20_chickenfillets.jpeg',
  'Chicken Fillets',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-ham-and-leek'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc84b1e636d414d59e5c35_Untitled%20(28).png',
  'Chicken, Ham and Leek',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-leg-d44ac'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98aba0fdcdb0cb2cfd2d8_chicklegs.jpeg',
  'Chicken Leg',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-liver-31b59'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e381f23feb607f8d4db_Chicken-Liver.jpeg',
  'Chicken Liver',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-mushroom'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc84b1e636d414d59e5c35_Untitled%20(28).png',
  'Chicken & Mushroom',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-supremes-bd5a5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab948fbf45c6d2a2b6b_Chicken-Supreme1-1024x768.jpeg',
  'Chicken Supremes',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-thighs-ce449'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98ab902bee661d59ac2d9_chickthighs.jpeg',
  'Chicken Thighs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chicken-wings-80d46'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb7dba1d1588eb8804_chickwings.jpeg',
  'Chicken Wings',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chilli-jam'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0507eaa6ce6a0edd6c6d_0121-Chiili-Jam-600x600.png',
  'Chilli Jam',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chippolatas-a9871'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3010577e8841e3ce89_GF_Sausage_GlutenFree_web-1.jpeg',
  'Chippolatas',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'chocolate-eclair'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdcea36aac837fc4d8007_DSC_5256-e1488034184153.jpg',
  'Chocolate Eclair',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'christmas-cake'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdecece04d5883061be65_easy-retro-Christmas-cake-1.jpg',
  'Christmas Cake',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cooked-chicken-f1616'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3c0a3558ea4f3a6ae7_cooked%2520chicken.jpeg',
  'Cooked Chicken',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cooked-chicken-portions-c64c1'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3c9d803250aa5459eb_cooked%2520chicken%2520portions.jpeg',
  'Cooked Chicken Portions',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cornish-yarg-e5002'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e476ed61b5208134964_cornish-yarg-cheese.jpeg',
  'Cornish YARG',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cranberry-sauce'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc029aba1a8a181e2b204c_0707-Cranberry-Sauce-300x300.png',
  'Cranberry Sauce',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cropwell-bishop-blue-stilton-8dfde'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e41bfcdbee3b4341242_cropwell_bishop_b_3_sj6hlbxkhrwsplmk.webp',
  'Cropwell Bishop Blue Stilton',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'cumberland-sausages-a181c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e309fd9c2bbc367cf9f_cumberland-scaled.jpeg',
  'Cumberland Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'derbyshire-oatcakes'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe22ac811fd71a8a4c9fd_Derbyshire-Oatcake.jpg',
  'Derbyshire Oatcakes',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'diced-leg-lamb-2cf23'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5de6e86b98d934e4b_diced%2520leglamb.jpeg',
  'Diced Leg Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'diced-pork-12d3e'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024b64c6b63672985a9d_diced%2520pork.jpeg',
  'Diced Pork',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'diced-shoulder-09129'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff5f926d08bddaecbb8_Diced-Lamb-Shoulder-1.jpeg',
  'Diced Shoulder',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'diced-venison-98887'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abf28069a8bf0ae484b_diced%2520venison.jpeg',
  'Diced Venison',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'dijon-mustard'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc02ad76cd459eff598559_1004-Dijon-Mustard-300x300.png',
  'Dijon Mustard',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'dragon-sausage-8d4cd'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32f0ae4a0c26128cfd_WELSH-DRAGON-min.jpeg',
  'Dragon Sausage',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'dry-cured-middle-bacon-09c70'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e33c347e260a5745c7d_SmokedMiddleBacon.jpeg',
  'Dry Cured Middle Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'duck-breast-9b36d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abcd558b9f04015ebc0_duck%2520breast.jpeg',
  'Duck Breast',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'duck-legs-984a8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abd410ff20685682cec_duck-leg.jpeg',
  'Duck Legs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'english-smooth-mustard'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbebfc4179764099d7caf7_1001-English-Mustard.png',
  'English Smooth Mustard',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'farmhouse-cake'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbde8e6e26164c7811dc40_garden_2614.jpg',
  'Farmhouse Cake',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'farmhouse-cheshire-b1914'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd8567750b16680e26a44_9261b79f-cb5a-49f7-ab15-7037cac1ed63.jpg',
  'Farmhouse Cheshire',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'fat-ball-cage'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed797a3bd16fe7624547_harrisons-fat-ball-feeder-cage-standard_1st_3396_large.jpg',
  'Fat Ball Cage',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'feta-3bfa5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dcd865f8ff97f0d634ff18_cadedede-942d-4e67-ba6d-9e6b994bb94f.jpg',
  'Feta',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'fillet-of-lamb-ec2d3'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd9941a23fce4fe7e75a3_Fillet-of-Lamb-e1500912823181.jpg',
  'Fillet Of Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'fillet-steak-4c23f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd83c38e01a13572c1cac_800x800-owt-fillet-steak.webp',
  'Fillet Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'free-range-large-eggs'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed368a6ae341f10028aa_download.jpg',
  'Free Range Large Eggs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'fresh-ducks-3af82'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc93be72508a39d98f_whole-duck.jpeg',
  'Fresh Ducks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'fresh-turkeys-438f3'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465927d_Turkey_raw%25402x.jpeg',
  'Fresh Turkeys',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'frying-steak-792b3'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc6fe52d431ff9de683_FRYING%2520STEAK.jpeg',
  'Frying Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'gammon-joints-5972c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e33a2f970245b88313a_green-gammon-main-image.jpeg',
  'Gammon Joints',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'gammon-steaks-bac4d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34a2f970245b8831e8_gammonsteaks.jpeg',
  'Gammon Steaks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'garstang-crumbly-lancashire-102ca'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49b3d3c4c2fc7742d0_Garstang-Lancashire-1.jpeg',
  'Garstang Crumbly Lancashire',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'gazeebo-feeder'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed4ca987bd31084b9844_images.jpg',
  'Gazeebo Feeder',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'goats-cheese-13d65'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4268851c5137e6494d_goats%2520cheese.jpeg',
  'Goats Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'goose-4f7c0'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465933c_goose-web-square-scaled.jpeg',
  'Goose',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'gordon-rhodes-apple-apricot-bay-leaf-stuffing'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0612c6f09e585d19e3ec_Untitled%20(19).png',
  'Gordon Rhodes Apple, Apricot & Bay Leaf Stuffing',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'granary-loaf'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1047eda85d52730cf7a_JBP_3534.jpg',
  'Granary Loaf',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'grandma-singletons-832f1'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49ef7e59466e8582af_grandma%2520singletons.webp',
  'Grandma Singletons',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'guest-cheese-fe1fb'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e42d5afbe69824e9542_guest%2520Cheese.jpeg',
  'Guest Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'guineafowl-855c5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe3ad9b2d8948554d1_guinea-fowl.jpeg',
  'Guineafowl',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'haggis'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64f1e1cb1ff97c258a99758b_macsween_traditional_haggis_various_sizes_.jpg',
  'Haggis',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'haggis-2bf43'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3e0a3558ea4f3a6c2c_largehaggis.jpeg',
  'Haggis',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ham-end-6654d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3dca9d080769c0ce28_hamends.webp',
  'Ham End',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ham-ends'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3dca9d080769c0ce28_hamends.webp',
  'Ham Ends',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ham-shanks-d5994'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34fcfced990f11860f_hamshanks.jpeg',
  'Ham Shanks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ham-with-cloves-8ee16'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e40ef7e59466e857453_hamcloves.jpeg',
  'Ham with Cloves',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'homecured-streaky-bacon-be812'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e34b9f49da96129b6aa_drycuredstreaky.jpeg',
  'Homecured Streaky Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'honey-goats-cheese-191fb'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e469d803250aa5467db_honey%2520goats%2520cheese.jpeg',
  'Honey Goats Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'horseradish'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc02f23bd839a6f797314e_0703-Creamed-Horseradish-300x300.png',
  'Horseradish',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'kebabs-31e23'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3734050af259978f19_kebabs.jpeg',
  'Kebabs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lamb-chump-chops-c6209'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff56388b8af3be2990f_Lamb-Chump-Chops-22501.jpeg',
  'Lamb Chump Chops',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lamb-cutlets-d6379'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff687ae1507100a4858_Lamb_Cutlets_37.jpeg',
  'Lamb Cutlets',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lamb-koftas-b7ae4'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e37ee91134f3eb55411_free-range-lamb-koftas-22-p.jpeg',
  'Lamb Koftas',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lamb-neck-rings-72025'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff6588bd3b2257cfbe5_Lamb%252BNeck%252BRings.jpeg',
  'Lamb Neck Rings',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lamb-steaks-7e168'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd914ca66b00cd2cb28a8_Lamb-Chump-Steak.jpg',
  'Lamb Steaks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lambs-heart-e5dd8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3893dcec3c3932e779_lamb-heart.jpeg',
  'Lambs Heart',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lambs-kidney-e94fa'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3834050af259978f70_lamb-kidney.jpeg',
  'Lambs Kidney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lambs-liver-023a8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e38a2f970245b88381f_lambs%2520liver-474x474.jpeg',
  'Lambs Liver',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lancashire-chees-36807'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64cadefc22309a8c9ba7291f_64c930ac6bf793372221b121_Lancashire_cheese.jpeg',
  'Lancashire Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lardons-12d7c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e350d06a05074d89d94_lardons.jpeg',
  'Lardons',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'large-chicken-54955'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abd48fbf45c6d2a2e47_whole-chicken-in-tin.jpeg',
  'Large Chicken',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lean-shin-beef-7106e'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc84cbf454723efa5b1_Beef-shin.jpeg',
  'Lean Shin Beef',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'leg-joint-df70b'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c3036f38e45cc1719_porklegbin.jpeg',
  'Leg Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'leg-of-lamb-bf57f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff606707cb5ceb48975_legof%2520lamb.jpeg',
  'Leg Of Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lemon-bun'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdcaa1386946f9c332a1b_lemonbun_800x.webp',
  'Lemon Bun',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lemon-cheese'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc018dc6f09e585d1420b2_0206-Lemon-Cheese-300x300.png',
  'Lemon Cheese',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lemon-crumble-cake'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdd2fc42ae7062191039f_lemon-crumb-cake-2.jpg',
  'Lemon Crumble Cake',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lemon-curd'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc01afc9fd321241c584fc_0201-Lemon-Curd.png',
  'Lemon Curd',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'loin-lamb-chops-a3b5d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc803cafbf93965fa14830_0001468_loin-lamb-chops_882.jpeg',
  'Loin Lamb Chops',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'loin-steaks-1a0ce'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024d7c7fc8bae49026c3_porkloinsteaks.jpeg',
  'Loin Steaks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'lye-cross-a5d52'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e44317d87b753d111b9_lyre%2520cross.jpeg',
  'Lye Cross',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'marinated-ribs-3c273'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024cbdf3454cb7a5ab0c_Marinated-Pork-Ribs.jpeg',
  'Marinated Ribs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'marinated-steak-bdb0f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024d7c7fc8bae49027e2_marinated%2520pork%2520steaks.jpeg',
  'Marinated Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'marinated-thighs-7cd67'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abbca450f6d9ba6d8c8_bbqchickenthighs.jpeg',
  'Marinated Thighs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'marinated-wings-a6162'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb8fea82aa6a186da4_Marinated-Chicken-Wings.jpeg',
  'Marinated Wings',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'marmalade'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0939ba1a8a181e33da88_0301-Medium-Cut-Marmalade-300x300.png',
  'Marmalade',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mature-cheddar-colliers-7bf45'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4310577e8841e3ec82_Colliersmature.jpeg',
  'Mature Cheddar (Colliers)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'meat-potato'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc844b5d6c06f472f7e354_Untitled%20(27).png',
  'Meat & Potato',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'medium-chickens-512fc'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abc5ffd73e8690494b3_mediumchicken.jpeg',
  'Medium Chickens',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'middle-neck-42c09'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff620a1350f440938e6_free-range-lamb-middle-neck-116-p.jpeg',
  'Middle Neck',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mild-cheddar-04e6b'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4310577e8841e3ecdc_MILD%252BCHEDDAR%252B1KG%252B4.jpeg',
  'Mild Cheddar',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mild-lancashire-leigh-toaster-ad0b8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba71e027a9bf8c14a4f79_Lancashire%20Kirkhamsresized.jpg',
  'Mild Lancashire (Leigh Toaster)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'milk-roll'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1679d36729bcfa1e038_Milk-roll-400g.jpg',
  'Milk Roll',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'minced-beef-8e8b4'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc80e545201084edc62_Lean-Beef-Mince-1-a.jpeg',
  'Minced Beef',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'minced-lamb-9d9c7'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff7d1f5786c16c14ec1_Lamb-Mince-3-a.jpeg',
  'Minced Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'minced-pork-3f2d0'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c3036f38e45cc165b_minced%2520pork.jpeg',
  'Minced Pork',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mint-jelly'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc01f0f86eef77c95e8b0d_0901-Mint-Jelly.png',
  'Mint Jelly',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mint-sauce'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc04183f5cd9386b4d3ae5_Untitled%20(17).png',
  'Mint Sauce',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'minty-lamb-ribs-c5dc4'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff780fe0135f9f77dca_Minted%252BLamb%252BRibs.jpeg',
  'Minty Lamb Ribs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'minty-lamb-steaks-4265e'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff8d1f5786c16c14f18_minted-lamb-leg-steaks.jpeg',
  'Minty Lamb Steaks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'montagnolo'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba7c4fe41775e65f5a289_21-Montagnolo-shutterstock_614859215.jpg',
  'Montagnolo',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mrs-rhodes-tasty-lancashire-d9c22'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba900df2cf6ea9d84a608_lancashire-large-product-page-resized-touched_1200x.webp',
  'Mrs Rhodes Tasty Lancashire',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'mums-eggs'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed1cbcb06643add77c06_brown-eggs-how-long-do-farm-fresh-eggs-last-storing-farm-fresh-eggs-scaled.jpg',
  'Mums Eggs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-cheeks-52cc6'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc597672a80b195438f_Oxcheeks.jpeg',
  'Ox Cheeks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-heart-1deeb'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39317d87b753d0fdf7_oxheart.jpeg',
  'Ox Heart',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-kidney-56853'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39fcfced990f118a21_oxkidney.jpeg',
  'Ox Kidney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-liver-43dca'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39ca9d080769c0c53a_oxliver.jpeg',
  'Ox Liver',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-tail-568b6'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd7fba7d18185d351075c_oxtail.jpg',
  'Ox Tail',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ox-tongue-210df'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfb207e68e8f614f8200e_2659.webp',
  'Ox Tongue',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pancetta-c0880'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3671dc019f2cbcc100_pancetta.jpeg',
  'Pancetta',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'parkin'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbddd97eda85d5272d1fcc_7d094e3168b1ae2524bd380a7dbbe744.jpg',
  'Parkin',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'parmigiano-reggiano-a2867'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e480a3558ea4f3a77dd_parmiggiano.webp',
  'Parmigiano Reggiano',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pate-a35db'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f628dcb533fe22665_pate.jpeg',
  'Pate',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'paxo-sage-onion-stuffing'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0129ba1a8a181e2993ab_homemade-paxo-cranny.jpg',
  'Paxo Sage & Onion Stuffing',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'peanut-sunflower-feeder'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe8dc523fa99082a5d7c1_7511001_-_peanut_-_20cm_-_cut_out.jpg',
  'Peanut & Sunflower Feeder',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'philadelphia-1356d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e49673dcc1e5d26d9d6_philadelphia.jpeg',
  'Philadelphia',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'picalilli'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec68ce04d5883073a88a_0605-Chunky-Picalilli-300x300.png',
  'Picalilli',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pickled-onions'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc024fb9981b77ee63c1ea_1113-Pickled-Onions-in-Malt-Vinegar-300x300.png',
  'Pickled Onions',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pickled-ox-tongue-a0320'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e39ca9d080769c0c57a_Pickled-Beef-Tongue-19.jpeg',
  'Pickled Ox Tongue',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pickled-shallots'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbeb9a7eda85d5273d896d_1102-Pickled-Shallots.png',
  'Pickled Shallots',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pigeon-breasts-d2889'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe5ffd73e86904987d_pigeonbreast.jpeg',
  'Pigeon Breasts',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pigs-heart-11b2a'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3ac03337dc4d2e7add_pigs%2520heart.jpeg',
  'Pigs Heart',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pigs-kidney-a72b5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3b6ab438ad3dbba0f9_pigs%2520kidney.jpeg',
  'Pigs Kidney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pigs-liver-2ab9d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3bc03337dc4d2e7b36_PorkLiver.webp',
  'Pigs Liver',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pigs-trotters-88a75'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3b3178de565c303d30_m1717_1_Pig%2520Trotters.jpeg',
  'Pigs Trotters',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pikelets'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdf20ca66b00cd2d31e99_pikelets.png',
  'Pikelets',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'plain-pork-sausages-d9b63'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30942d1d68cd23c3a0_newplainsausage.jpeg',
  'Plain Pork Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'plain-ribs-23877'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024cc11009bfb1d39d66_plain%2520pork%2520ribs.jpeg',
  'Plain Ribs',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-and-apple-burgers-cee38'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e38fcfced990f118942_SP104-Pork-Apple-Burgers-Raw1-scaled.jpeg',
  'Pork And Apple Burgers',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-apple-sausages-c981c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3118f6497d1ff5b39a_Pork_Pork-Apple_Sausages_IMG_0293.jpeg',
  'Pork & Apple Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-chive-sausages-3a837'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30ee91134f3eb54fe1_porkchive.jpeg',
  'Pork & Chive Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-chops-aaac4'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbd9d186a027d63b978950_Pork-Loin-Chops-e1567018681949.jpg',
  'Pork Chops',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-dripping-pots-2c834'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3e87618c89554065dd_porkdrippingpots.jpeg',
  'Pork Dripping (Pots)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-fillet-775d1'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024c4a57286e7b47ed5f_Pork-Fillet-Loin.jpeg',
  'Pork Fillet',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-leek-sausages-39241'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e31b9f49da96129b284_pork_and_leek_sausages_1.jpeg',
  'Pork & Leek Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-pie-large'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc86a4fad4ead0c51401bc_Untitled%20(34).png',
  'Pork Pie - Large',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-pie-medium'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc865c2e66522862eca5fa_Untitled%20(33).png',
  'Pork Pie - Medium',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-pie-small'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8625d12c1cc492e45a6c_Untitled%20(32).png',
  'Pork Pie - Small',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-pie-xl'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc8758ed009bfff2b85da8_Untitled%20(37).png',
  'Pork Pie - XL',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pork-steak-0359d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024dfae66900b40493c9_Pork-steaks-scaled.jpeg',
  'Pork Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'potato-cakes'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdf8fa987bd31083aacdd_potato-cakes_540x.webp',
  'Potato Cakes',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'potted-meat-e977f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3ef0ae4a0c26129cfe_potted-meat.jpeg',
  'Potted Meat',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'premium-wild-bird-seed'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbed5b8ea8d901610983f7_Premium-Seed-Mix.webp',
  'Premium Wild Bird Seed',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-beef-casserole'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffe9877b0d54a5f92f17_Beef-Casserole-Recipe-Seasoning-1.webp',
  'Pureety Beef Casserole',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-char-sui-glaze'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0003f4d1acc5ace3bf55_Chinese-Char-Sui-Marinade-Glaze-1.png',
  'Pureety Char Sui Glaze',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-chicken-casserole'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff8f1c8ed08e4c8df226_NEW-Chicken-Casserole-Angled-copy.png',
  'Pureety Chicken Casserole',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-chilli-con-carne'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfef036aac837fc76b7c2_NEW-Chilli-Con-Carne-Angled-copy.png',
  'Pureety Chilli Con Carne',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-fajita-seasoning'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00c4f546d537f26d1624_Fajita-Recipe-Seasoning-1_1200x1200.webp',
  'Pureety Fajita Seasoning',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-garden-mint-glaze'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbfe58bcb06643adec44a1_garden-mint-1.png',
  'Pureety Garden Mint Glaze',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-garlic-butter-glaze'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00498a6ae341f1174c21_Garlic-Butter-1.png',
  'Pureety Garlic Butter Glaze',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-lamb-casserole'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffd61c8ed08e4c8e4267_Lamb-Casserole-Recipe-Seasoning.png',
  'Pureety Lamb Casserole',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-moroccan-tagine'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff78a987bd31086275e6_Moroccan-Tagine-Recipe-Seasoning-1.png',
  'Pureety Moroccan Tagine',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-paella-seasoning'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc005e7a3bd16fe777eac2_NEW-Paella-Angled-copy-copy.png',
  'Pureety Paella Seasoning',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-potato-seasoning'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc00a597b7479a58bf859f_Original-Potato-Seasoning-1.png',
  'Pureety Potato Seasoning',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-salt-pepper-glaze'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc0033f4d1acc5ace3fbe2_Spicy-Salt-Pepper-Marinade-Glaze-1-1391x1536_1024x1024.webp',
  'Pureety Salt & Pepper Glaze',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-sticky-bbq-glaze'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbffa4d4a0274ea5e4b34f_Sticky-BBQ-Marinade-Glaze-1.webp',
  'Pureety Sticky BBQ Glaze',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'pureety-thai-green-curry'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbff1dbcb06643adecff0d_NEW-Thai-Green-Angled-copy.png',
  'Pureety Thai Green Curry',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'rabbit-7fda2'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abe5ffd73e86904984c_rabbit2.jpeg',
  'Rabbit',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'red-cabbage'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc021961b4f572fecb3eca_1104-Red-Cabbage-300x300.png',
  'Red Cabbage',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'red-leicester-wedges-8f730'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba95a6c2325c4d697626b_red-leicester-cheese.jpg',
  'Red Leicester Wedges',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'rib-of-beef-0a91a'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc4805f80ff25c11f2a_Ribofbeef.jpeg',
  'Rib Of Beef',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'ribeye-steak-c2b8d'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc628b86305f258d244_ribeye%2520steak.jpeg',
  'Ribeye Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'rindless-back-bacon-7b670'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36d7651eb5e3c5625f_Back-Bacon.jpeg',
  'Rindless Back Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'roast-beef-30724'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f56f7b732d107a119_roastbeef.jpeg',
  'Roast Beef',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'roast-ham-160ff'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e4068851c5137e64745_roastham.jpeg',
  'Roast Ham',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'roast-ox-heart-19052'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3f96d600d1ee50e96d_beef-heart-500x500.jpeg',
  'Roast Ox Heart',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'roast-pork-cdfac'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e40c03337dc4d2e7f68_roast%2520pork.jpeg',
  'Roast Pork',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'rolled-rib-joint-def1a'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc48275029b2f5087f8_rolledribbeef.jpeg',
  'Rolled Rib Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'rump-steak-fc699'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc6500fa85b4f9b8290_Rump-Steak-Beef-63.jpeg',
  'Rump Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sausage-meat-990a8'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32628dcb533fe21c48_Wild-Boar-Sausagemeat.webp',
  'Sausage Meat',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sausage-rolls'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8583af0cee8d7ac71202_Untitled%20(30).png',
  'Sausage Rolls',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'seed-feeder'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe8b8877b0d54a5de3f4e_R401636_2.jpg',
  'Seed Feeder',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'shoulder-joint-bd35a'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a8024dfae66900b40493b3_Blackwells-Pork-Shoulder.jpeg',
  'Shoulder Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'shoulder-of-lamb-4c786'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a59ff8ab0f160825624b71_Whole-Shoulder-of-Lamb-scaled.jpeg',
  'Shoulder Of Lamb',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'shoulder-steak-a407f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc65f40c9b20e206096_raw-shoulder-steak.jpeg',
  'Shoulder Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'silverside-joint-71714'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc467ffbab04ceca94f_Salt-Beef-Silverside-1KG_001_websize.jpeg',
  'Silverside Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sirloin-joints-d37c5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc48d20e90607eb4407_beef-sirloin-joint_2_1.jpeg',
  'Sirloin Joints',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sirloin-steak-97c07'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc7f1c666939cc964c5_Sirloin.jpeg',
  'Sirloin Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'skin-on-fillets-f745c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abb83280cff039d635c_chicken_breast_skinon.jpeg',
  'Skin On Fillets',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'small-brown-loaf'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe098f4d1acc5acbd0484_Wholemeal-tin-loaf-400g.jpg',
  'Small Brown Loaf',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'small-white-loaf'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdffb97b7479a58986d6d_IMG_9465_530x%402x.webp',
  'Small White Loaf',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'smoked-middle-bacon-589e5'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36f6e03eb6d787a460_smoked%2520middle.png',
  'Smoked Middle Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'smoked-rindless-bacon-d956c'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3687618c8955405ea1_essington-farm-oak-smoked-rindless-back-bacon.png',
  'Smoked Rindless Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'smoked-streaky-bacon-15e13'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e36ca9d080769c0c2e9_unsmokedstreakybacon.jpeg',
  'Smoked Streaky Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'special-occasion-pies'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc87f1fad4ead0c5155e25_Untitled%20(40).png',
  'Special Occasion Pies',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'staffordshire-oatcakes'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe2c3994a47c4a034815b_6141506637_8098b818b8.webp',
  'Staffordshire Oatcakes',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'steak-and-kidney'),
  'https://cdn.prod.website-files.com/63b344fefe5f637ead19b171/64dc8542fad4ead0c5126d77_Untitled%20(29).png',
  'Steak and Kidney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sweet-chilli-sausages-9dbbc'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e32b9f49da96129b451_sweet%2520chilli%2520sausages.jpeg',
  'Sweet Chilli Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'sweet-farmhouse-pickle'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbec8d3ba8cf33c2039c5e_0601-Farmhouse-Pickle.png',
  'Sweet Farmhouse Pickle',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 't-bone-steak-70acb'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc77c1c4f92aadec474_TBone-raw-website-.jpeg',
  'T Bone Steak',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'tasty-lancashire-leigh-toaster-f00a7'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e453178de565c3044df_Tasty%2520Lancashire.jpeg',
  'Tasty Lancashire (Leigh Toaster)',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'tomato-chutney'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dc04a1ba1a8a181e2da56b_SUNDRIED-TOM-GARLIC-CHUTNEY-600x600.png',
  'Tomato Chutney',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'topside-joint-ca627'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a56bc496298081293fd867_Topside.jpeg',
  'Topside Joint',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'treacle-bacon-f6d6f'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e3710577e8841e3db70_blackwells-black-treacle-bacon.jpeg',
  'Treacle Bacon',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'true-grit-ff119'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e5018f6497d1ff5c780_truegrit.jpeg',
  'True Grit',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'turkey-crown-bf149'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abfd92cf06a008e2149_rolled-turkey-crown-special-offer-5932-p.jpeg',
  'Turkey Crown',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'vanilla-slice'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbdc73570b6c05af6279f5_647503b9c0611d740d0618b0_IMG_2152.jpg',
  'Vanilla Slice',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'venison-steaks-85ba6'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abfcc68ca17281b2f47_venison-loin.jpeg',
  'Venison Steaks',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'weekly-special-sausages-bf682'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e30d12c92ca978c5c71_Special%2520Sausages.jpeg',
  'Weekly Special Sausages',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'wensleydale-cranberries-2a411'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64ca9e45538964976eaaebb0_wensleydale-with-cranberries-cheese.jpeg',
  'Wensleydale & Cranberries',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'white-baps'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbe1b9a987bd31083d45d5_99692021878362184.jpg',
  'White Baps',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'wholegrain-mustard'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dbebe6a987bd31084a21ca_1003-Wholegrain-Mustard-300x300.png',
  'Wholegrain Mustard',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'wookey-hole-40c36'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64dba85ef2cd7030709e2717_IMG_1176_700x700.webp',
  'Wookey Hole',
  true,
  0
);

insert into public.product_images (product_id, source_url, alt_text, is_primary, sort_order)
values (
  (select id from public.products where slug = 'xmas-deposit-24e88'),
  'https://uploads-ssl.webflow.com/63b344fefe5f637ead19b171/64a98abef4bb3aa03465927d_Turkey_raw%25402x.jpeg',
  'Xmas Deposit',
  true,
  0
);

commit;
