package com.stma.util;


public class Student extends User {

    private String studentNo;

    public Student(String userName,String firstName, String lastName, String email, String studentNo){
        super(userName, firstName, lastName, email);
        this.studentNo = studentNo;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }




}
