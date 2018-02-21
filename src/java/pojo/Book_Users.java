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
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author hp
 */
@Entity
@Table (name="book_user")        
public class Book_Users implements Serializable{
    @Id
    @Column(name="lenderid",nullable=false)
    private String lender;
    
    @Id
    @Column(name="b_name",nullable=false)
    private String name;
    
    @Id
    @Column(name="borrowerid",nullable=false)
    private String borrower;
    
    @Temporal(TemporalType.DATE)
    @Column(name="date",nullable=false)
    private Date date;
    @Temporal(TemporalType.DATE)
    @Column(name="Rdate")
    private Date rdate;

    public Date getRdate() {
        return rdate;
    }

    public void setRdate(Date rdate) {
        this.rdate = rdate;
    }
    @Column(name="author",nullable=false)
    private String author;
    @Column(name="status",nullable=false)
    private int status;
    @Column(name="genre",nullable=false)
    private String genre;
    @Column(name="type",nullable=false)
    private int type;

    public String getLender() {
        return lender;
    }

    public void setLender(String lender) {
        this.lender = lender;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBorrower() {
        return borrower;
    }

    public void setBorrower(String borrower) {
        this.borrower = borrower;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
