-- Create table
create table TB_MANAGE_ROLE
(
  id           NUMBER not null,
  name         VARCHAR2(50),
  popedom_json CLOB
)
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
-- Add comments to the table 
comment on table TB_MANAGE_ROLE
  is '角色表';
-- Add comments to the columns 
comment on column TB_MANAGE_ROLE.id
  is '角色ID';
comment on column TB_MANAGE_ROLE.name
  is '角色名称';
comment on column TB_MANAGE_ROLE.popedom_json
  is '权限json,格式为{"模块代号":""操作代号","模块代号":""操作代号,操作代号"},如,{"001":"001,002","002":"003"}';
-- Create/Recreate primary, unique and foreign key constraints 
alter table TB_MANAGE_ROLE
  add constraint PK_TB_MANAGE_ROLE primary key (ID)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255;
