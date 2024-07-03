package com.miljevicp.spring_demo.repository;

import com.miljevicp.spring_demo.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {

   List<Student> findAllByDeletedAtIsNull();
   Optional<Student> findByIdAndDeletedAtIsNull(Integer id);
    List<Student> findByIndeksContainsAndDeletedAtIsNull(String indeks);

}
