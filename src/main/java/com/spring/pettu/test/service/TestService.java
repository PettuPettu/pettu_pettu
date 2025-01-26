package com.spring.pettu.test.service;

import com.spring.pettu.test.vo.TestEntity;

import java.util.List;

public interface TestService {

    List<TestEntity> findALl();
    int addTestEntity(TestEntity testEntity);
}
