package com.isep.testjpa.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

//IMPORTANT: PUT DATA BEFORE ENTITY SO JPA PROCESS THE ENTITY MAPS AFTER LOMBOK GENERATES THE GETTERS AND SETTERS.
@Data
@Entity
public class Emp {
    @Id
    @GeneratedValue
    private Long empno;
    @Column(name = "ename")
    private String ename;
    @Column(name = "efirst")
    private String efirst;
    @Column(name = "job")
    private String job;
    @Column(name = "mgr")
    private Long mgr;
    @Column(name = "sal")
    private Long sal;
}


