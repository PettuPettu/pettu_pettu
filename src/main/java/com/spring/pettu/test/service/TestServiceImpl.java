package com.spring.pettu.test.service;

import com.spring.pettu.test.vo.TestEntity;
import com.spring.pettu.mapper.TestMapper;
import com.spring.pettu.test.repository.TestRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class TestServiceImpl implements TestService {

    private final TestRepository testRepository;
    private final TestMapper testMapper;



    public void test() {
        testRepository.testCall();
        System.out.println("testCallService");
    }

    @Override
    public List<TestEntity> findALl() {
        return testMapper.testList();
    }

    // 트랜잭션 확인용
    @Override
    public int addTestEntity(TestEntity testEntity) {
        int row = testMapper.insertTest(testEntity);
        log.error("ERROR !!!!!!!!!");
        throw new RuntimeException();
    }
}
