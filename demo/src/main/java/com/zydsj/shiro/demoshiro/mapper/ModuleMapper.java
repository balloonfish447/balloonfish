package com.zydsj.shiro.demoshiro.mapper;

import com.zydsj.shiro.demoshiro.po.Module;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ModuleMapper {

    List<Module> select(@Param("moduals") List<Integer> moduals);
}
