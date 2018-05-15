
CREATE  TABLE `easybuy`.`ClassInfo` (
  `Cid` INT NOT NULL COMMENT '编号' ,
  `Ctitle` VARCHAR(32) NULL COMMENT '活动标题' ,
  `Ccontent` VARCHAR(8000) NULL COMMENT '活动内容' ,
  `CDate` DATETIME NULL COMMENT '活动时间' ,
  `CAuthor` VARCHAR(32) NULL COMMENT '活动策划人' ,
  PRIMARY KEY (`Cid`) )
COMMENT = '班级活动表';
