package com.zydsj.shiro.demoshiro.mapper;

import com.zydsj.shiro.demoshiro.po.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {

    Integer save(User user);

    User select(@Param("userName") String userName,@Param("passWord") String passWord);


}
