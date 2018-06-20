-- Create table
create table TB_MANAGE_FUCNTION
(
  id               NUMBER not null,
  name             VARCHAR2(50),
  code             VARCHAR2(50),
  sup_id           NUMBER,
  order_level      NUMBER,
  page             VARCHAR2(50),
  create_timestamp DATE default sysdate,
  cate_level       NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TB_MANAGE_FUCNTION
  is '系统功能表';
-- Add comments to the columns 
comment on column TB_MANAGE_FUCNTION.id
  is '功能ID';
comment on column TB_MANAGE_FUCNTION.name
  is '功能名称';
comment on column TB_MANAGE_FUCNTION.code
  is '功能编码';
comment on column TB_MANAGE_FUCNTION.sup_id
  is '上级id';
comment on column TB_MANAGE_FUCNTION.order_level
  is '排序等级';
comment on column TB_MANAGE_FUCNTION.page
  is '返回的页面';
comment on column TB_MANAGE_FUCNTION.create_timestamp
  is '创建时间戳';
comment on column TB_MANAGE_FUCNTION.cate_level
  is '功能等级（1一级、2二级、3三级...）';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_MANAGE_FUCNTION
  add constraint PK_TB_MANAGE_FUCNTION primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    minextents 1
    maxextents unlimited
  );

  
  
 --序列
 -- Create sequence 
create sequence TB_MANAGE_FUCNTION_ID_SEQ
minvalue 1
maxvalue 99999999999
start with 1
increment by 1
cache 10
order;

  
--触发器
create or replace trigger tr_tb_manage_fucntion 
before insert on TB_MANAGE_FUCNTION
for each row
when(new.id is null)
begin
  select  TB_MANAGE_FUCNTION_ID_SEQ.nextval into:NEW.ID from dual;
end;
