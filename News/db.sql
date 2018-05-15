 create database news;
  create table news_UserInfo
  (
    uid int auto_increment primary key not null,
    uname varchar(32) not null,
    upwd varchar(32) not null
  );