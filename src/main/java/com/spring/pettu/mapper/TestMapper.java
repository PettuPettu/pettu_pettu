package com.spring.pettu.mapper;

import com.spring.pettu.test.vo.TestEntity;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface TestMapper {
    List<TestEntity> testList();
    int insertTest(TestEntity testEntity);
}

