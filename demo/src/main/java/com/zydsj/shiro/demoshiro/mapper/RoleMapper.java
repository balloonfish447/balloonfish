package com.zydsj.shiro.demoshiro.mapper;

import com.zydsj.shiro.demoshiro.po.Role;
import org.apache.ibatis.annotations.Param;

public interface RoleMapper {

    Role select(@Param("id") Integer id);
}
