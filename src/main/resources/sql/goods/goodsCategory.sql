-- Create table
create table TB_GOODS_CATEGORY
(
  id         NUMBER not null,
  name       VARCHAR2(50),
  code       VARCHAR2(100),
  cate_level NUMBER,
  sup_id     NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
-- Add comments to the table 
comment on table TB_GOODS_CATEGORY
  is '商品分类表';
-- Add comments to the columns 
comment on column TB_GOODS_CATEGORY.id
  is '分类id';
comment on column TB_GOODS_CATEGORY.name
  is '分类名称';
comment on column TB_GOODS_CATEGORY.code
  is '分类编码';
comment on column TB_GOODS_CATEGORY.cate_level
  is '分类等级';
comment on column TB_GOODS_CATEGORY.sup_id
  is '上级分类id';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_GOODS_CATEGORY
  add constraint PK_TB_GOODS_CATEGORY primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
