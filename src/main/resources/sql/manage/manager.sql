-- Create table
create table TB_MANAGE_MANAGER
(
  id        NUMBER not null,
  name      VARCHAR2(50),
  email     VARCHAR2(50),
  tel       VARCHAR2(11),
  status    VARCHAR2(2),
  role_id   NUMBER,
  password  VARCHAR2(50),
  user_name VARCHAR2(50)
)
tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Add comments to the table 
comment on table TB_MANAGE_MANAGER
  is '管理员表';
-- Add comments to the columns 
comment on column TB_MANAGE_MANAGER.id
  is '管理员id';
comment on column TB_MANAGE_MANAGER.name
  is '姓名';
comment on column TB_MANAGE_MANAGER.email
  is '邮箱';
comment on column TB_MANAGE_MANAGER.tel
  is '电话';
comment on column TB_MANAGE_MANAGER.status
  is '状态: -1冻结, 1正常';
comment on column TB_MANAGE_MANAGER.role_id
  is '角色ID';
comment on column TB_MANAGE_MANAGER.password
  is '密码';
comment on column TB_MANAGE_MANAGER.user_name
  is '登录名';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_MANAGE_MANAGER
  add constraint PK_MANAGE_MANAGER primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
  
  
  -- Create sequence 
create sequence TB_MANAGE_MANAGER_ID_SEQ
minvalue 100
maxvalue 999999999999999999999999
start with 101
increment by 1
cache 20;



create or replace trigger tr_tb_manage_manager
  before insert
  on TB_MANAGE_MANAGER 
  for each row
when(new.id is null)
begin
 select  TB_MANAGE_MANAGER_ID_SEQ.nextval into:NEW.ID from dual;
end ;

