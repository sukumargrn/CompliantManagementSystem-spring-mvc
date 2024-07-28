package com.modal.complaintManagementSystem.entity;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonBackReference;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "complaint")
public class Complaint {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="complaint_id")
    private Long complaintId;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", nullable = false)
    @JsonBackReference
    private UserEntity user;

    @Column(nullable = false)
    private String department;

    @Column(nullable = false)
    private String country;

    @Column(nullable = false)
    private String state;

    @Column(name = "city_area", nullable = false)
    private String cityArea;

    @Column(name = "complaint_address", nullable = false)
    private String complaintAddress;

    @Column(name = "complaint_details", nullable = false)
    private String complaintDetails;

    @Column(name="status")
    private String status;

    @Column(name = "created_at")
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(complaintId);
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Complaint that = (Complaint) o;
        return Objects.equals(complaintId, that.complaintId);
    }

}
