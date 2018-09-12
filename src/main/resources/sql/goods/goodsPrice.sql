-- Create table
create table TB_GOODS_PRICE
(
  id       NUMBER not null,
  goods_id NUMBER,
  name     VARCHAR2(20),
  price    NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table TB_GOODS_PRICE
  is '商品价格表';
-- Add comments to the columns 
comment on column TB_GOODS_PRICE.id
  is '价格id';
comment on column TB_GOODS_PRICE.goods_id
  is '商品id';
comment on column TB_GOODS_PRICE.name
  is '名称或属性';
comment on column TB_GOODS_PRICE.price
  is '价格';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_GOODS_PRICE
  add constraint PK_TB_GOODS_PRICE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
