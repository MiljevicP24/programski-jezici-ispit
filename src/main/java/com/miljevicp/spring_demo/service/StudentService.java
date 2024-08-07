package com.miljevicp.spring_demo.service;

import com.miljevicp.spring_demo.entity.Student;
import com.miljevicp.spring_demo.entity.StudyProgramme;
import com.miljevicp.spring_demo.model.StudentModel;
import com.miljevicp.spring_demo.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StudentService {
    private final StudentRepository repository;

    private final StudyProgrammeService studyProgrammeService;

    public List<Student> getAllStudents(){
        return repository.findAllByDeletedAtIsNull();
    }
    public Optional<Student> getStudentById(Integer id){
        return repository.findByIdAndDeletedAtIsNull(id);
    }
    public List<Student> getStudentByIndeks(String indeks){
        return repository.findByIndeksContainsAndDeletedAtIsNull(indeks);
    }
    public Student createStudent(StudentModel model){
        StudyProgramme study = studyProgrammeService
                .getStudyProgrammeById(model.getStudyProgrammeId())
                .orElseThrow();
        Student student=new Student();
        student.setName(model.getName());
        student.setPrezime(model.getSurname());
        student.setIndeks(model.getIndeks());
        student.setStudyProgramme(study);
        student.setCreatedAt(LocalDateTime.now());
        return repository.save(student);
    }

    public Student updateStudent(Integer id,StudentModel model){
        Student student = repository.findByIdAndDeletedAtIsNull(id).orElseThrow();
        StudyProgramme study = studyProgrammeService
                .getStudyProgrammeById(model.getStudyProgrammeId())
                .orElseThrow();
        student.setName(model.getName());
        student.setPrezime(model.getSurname());
        student.setIndeks(model.getIndeks());
        student.setStudyProgramme(study);
        student.setUpdatedAt(LocalDateTime.now());
        return repository.save(student);
    }
    public void deletedStudent(Integer id){
        Student student = repository.findByIdAndDeletedAtIsNull(id).orElseThrow();
        student.setDeletedAt(LocalDateTime.now());
        repository.save(student);
    }
}
