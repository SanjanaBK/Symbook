/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 *
 * @author hp
 */
@Entity 
@Table (name = "user") 
public class sample implements Serializable{
    @Id
    @Column(name = "userid",nullable=false)
    private String userid;
    @Column(name = "password",nullable=false) 
    private String password;
    @Column(name = "name",nullable=false)
    private String name;
    @Column(name = "email",nullable=false)
    private String email;
    @Column(name = "dob",nullable=false)
    private Date dob;
    @Column(name = "verified",nullable=false)
    private int verified;
    @Column(name = "flags",nullable=false) 
    private int flags;
    public String getUserid() {
        return userid;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public Date getDob() {
        return dob;
    }

    public int getVerified() {
        return verified;
    }

    public int getFlags() {
        return flags;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public void setVerified(int verified) {
        this.verified = verified;
    }

    public void setFlags(int flags) {
        this.flags = flags;
    }
    

}

