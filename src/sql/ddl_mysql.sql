-- SYS_GROUP
create table `SYS_GROUP`
(
  `GROUP_ID`   VARCHAR(32)  not null comment '组ID',
  `GROUP_NAME` VARCHAR(100) not null comment '组名',
  `GROUP_NO`   VARCHAR(10) comment '组编号',
  `REMARK`     VARCHAR(500) comment '备注',
  `ADD_TIME`   DATETIME comment '添加时间',
  primary key(`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 comment='系统用户组表';
  
-- SYS_MENU
create table `SYS_MENU`
(
  `MENU_ID`        VARCHAR(32) not null comment 'ID、主键',
  `MENU_NAME`      VARCHAR(100) not null comment '菜单名',
  `MENU_URL`       VARCHAR(100) comment '菜单对应的URL',
  `PARENT_MENU_ID` VARCHAR(32) comment '父菜单',
  `UPDATE_TIME`    DATETIME comment '更新时间',
  primary key(`MENU_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment='系统菜单表';

-- SYS_ROLE
create table `SYS_ROLE`
(
  `ROLE_ID`     VARCHAR(32) not null comment 'ID、主键',
  `ROLE_NAME`   VARCHAR(50) comment '角色名',
  `REMARK`      VARCHAR(500) comment '备注',
  `UPDATE_TIME` DATETIME comment '更新时间',
  primary key(`ROLE_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment='系统用户角色表';
  
-- SYS_ROLE_MENU
create table `SYS_ROLE_MENU`
(
  `ID`      VARCHAR(32)  not null comment '主键',
  `ROLE_ID` VARCHAR(32) comment '角色ID，对应角色表',
  `MENU_ID` VARCHAR(32) comment '菜单ID，对应菜单表',
  primary key(`ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment='角色菜单表';


-- SYS_USER
create table `SYS_USER`
(
  `USER_ID`  VARCHAR(32) not null comment 'ID、主键',
  `USERNAME` VARCHAR(50) comment '用户名、登录名',
  `PASSWORD` VARCHAR(40) comment '密码（MD5存储）',
  `NAME`     VARCHAR(50) comment '姓名',
  `ROLE_ID`  VARCHAR(32) comment '角色ID',
  `GROUP_ID` VARCHAR(32) comment '组ID（可作为部门标识）',
  `ADD_TIME` DATETIME comment '添加时间',
  primary key(`USER_ID`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 comment='系统用户表';

