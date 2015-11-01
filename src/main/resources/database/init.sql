--初始化菜单表
DROP TABLE IF EXISTS T_MENU;
CREATE TABLE T_MENU (
  ID VARCHAR(64) PRIMARY KEY,
  NAME VARCHAR(64),
  URL VARCHAR(128),
  ADMIN VARCHAR(5)
);
INSERT INTO T_MENU  VALUES('main', '主页', '/main.action', 'false');
INSERT INTO T_MENU  VALUES('data', '数据管理', '/data/list.action', 'false');
INSERT INTO T_MENU  VALUES('user', '用户管理', '/user/list.action', 'true');

--初始化用户表
DROP TABLE IF EXISTS T_USER;
CREATE TABLE T_USER (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  USERNAME VARCHAR(64),
  PASSWORD VARCHAR(64),
  ADMIN VARCHAR(5),
  CREATETIME TIMESTAMP,
  DESC VARCHAR(512)
);
INSERT INTO T_USER  VALUES(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'true', now(),'admin');
INSERT INTO T_USER  VALUES(2, 'ums', '21232f297a57a5a743894a0e4a801fc3', 'false', now(),'ums');

