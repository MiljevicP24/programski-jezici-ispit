package com.miljevicp.spring_demo.repository;

import com.miljevicp.spring_demo.entity.StudyProgramme;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface StudyProgrammeRepository extends JpaRepository<StudyProgramme, Integer> {
    List<StudyProgramme> findAllByDeletedAtIsNull();
    Optional<StudyProgramme> findByIdAndDeletedAtIsNull(Integer id);


}
