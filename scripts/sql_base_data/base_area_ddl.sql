/*
base_area_ddl
*/


-- ----------------------------
-- Table structure for base_area
-- ----------------------------
DROP TABLE IF EXISTS `base_area`;
CREATE TABLE `base_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '地区名',
  `grade` int(1) DEFAULT NULL COMMENT '级别 enum:province,省;city,市;area,区',
  `parent_id` int(10) DEFAULT NULL COMMENT '上级',
  `state` varchar(20) DEFAULT NULL COMMENT '状态: enum:disable,禁用;enable,启用',
  `create_user` varchar(100) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建日期',
  `modify_user` varchar(100) DEFAULT NULL COMMENT '修改人',
  `modify_date` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区表';
