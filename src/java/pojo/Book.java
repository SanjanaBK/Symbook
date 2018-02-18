/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pojo;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Lob;
import javax.persistence.Table;

/**
 *
 * @author hp
 */
@Entity //@IdClass(BookId.class)
@Table (name="Book")
public class Book implements Serializable{
    @Id
    @Column(name="b_id",nullable=false)
    private long id;
    @Id
    @Column(name="b_owner",nullable=false)
    private String user;
    @Column(name="b_name",nullable=false)
    private String name;
    @Lob
    @Column(name = "b_image",nullable=false, columnDefinition="mediumblob")
    private byte image;
    @Column(name = "b_status",nullable =false)
    private int status;
    @Column(name ="b_genre")
    private String genre;
    @Column(name ="b_type")
    private int type;

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
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public byte getb_image() {
        return image;
    }

    public void setb_image(byte sb_image) {
        this.image = sb_image;
    }
    
}
