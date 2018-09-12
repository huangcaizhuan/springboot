-- Create table
create table TB_GOODS_GOODS
(
  id            NUMBER not null,
  name          VARCHAR2(100),
  price         NUMBER,
  description   CLOB,
  category_id   NUMBER,
  category_name VARCHAR2(50),
  recommend     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table TB_GOODS_GOODS
  is '商品表';
-- Add comments to the columns 
comment on column TB_GOODS_GOODS.id
  is '商品ID';
comment on column TB_GOODS_GOODS.name
  is '商品名称';
comment on column TB_GOODS_GOODS.price
  is '商品最低价格';
comment on column TB_GOODS_GOODS.description
  is '商品描述';
comment on column TB_GOODS_GOODS.category_id
  is '分类id';
comment on column TB_GOODS_GOODS.category_name
  is '分类名称';
comment on column TB_GOODS_GOODS.recommend
  is '推荐指数';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_GOODS_GOODS
  add constraint PK_TB_GOODS_GOODS primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
