package com.zydsj.shiro.demoshiro.mapper;

import com.zydsj.shiro.demoshiro.po.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper {

    List<Permission> selectPermission(@Param("ids") List<Integer> modual_id);
}
