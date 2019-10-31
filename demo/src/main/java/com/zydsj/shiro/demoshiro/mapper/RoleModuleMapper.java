package com.zydsj.shiro.demoshiro.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleModuleMapper {

    //根据roloid，查询所有的modual_id
    List<Integer> selectModualId(@Param("role_id") Integer role_id);

}
