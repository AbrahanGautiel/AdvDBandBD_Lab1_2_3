package com.isep.testjpa.controller;

import com.isep.testjpa.repository.EmpRepository;
import com.isep.testjpa.model.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class SimpleController {

    @Autowired
    private EmpRepository empRepository;

    @RequestMapping(value="/", method= RequestMethod.GET)
    public String hello(@Param("name") String name) {
        return "Hello " + name;
    }

    @RequestMapping(value="/employees", method= RequestMethod.GET)
    public List<Emp> getEmployees() {
        return empRepository.findAll();
    }

    @PostMapping(value="/employees")
    public Emp addEmployee(@RequestBody Emp emp) {
        return empRepository.save(emp);
    }

    @GetMapping(value="/employees/{id}")
    public Emp getEmployeeById(@PathVariable Long id) {
        return empRepository.findById(id).map(emp -> ResponseEntity.ok().body(emp))
                .orElse(ResponseEntity.notFound().build()).getBody();
    }

    @PutMapping("/employees/{id}")
    public ResponseEntity<Emp> updateEmployee(@PathVariable Long id, @RequestBody Emp empDetails) {
        return empRepository.findById(id)
                .map(emp -> {
                    emp.setEname(empDetails.getEname());
                    emp.setEfirst(empDetails.getEfirst());
                    emp.setJob(empDetails.getJob());
                    emp.setMgr(empDetails.getMgr());
                    emp.setSal(empDetails.getSal());
                    return ResponseEntity.ok(empRepository.save(emp));
                })
                .orElse(ResponseEntity.notFound().build());
    }

    @DeleteMapping("employees/{id}")
    public ResponseEntity<Object> deleteEmployee(@PathVariable Long id) {
        return empRepository.findById(id)
                .map(employee -> {
                    empRepository.delete(employee); // Elimina el empleado de la base de datos
                    return ResponseEntity.noContent().build(); // Retorna un 204 No Content
                })
                .orElse(ResponseEntity.notFound().build()); // Si no existe, retorna un 404 Not Found
    }

}

