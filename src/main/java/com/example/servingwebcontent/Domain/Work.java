package com.example.servingwebcontent.Domain;

import javax.persistence.*;

@Entity
public class Work {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "carId")
    private Car car;
//разобраться с хранением даты!!!!!!!!!!!!!!!!
 //   private Date

    private Integer mileage;
    //Лист запчастей!!
    //Лист работ!!
}
