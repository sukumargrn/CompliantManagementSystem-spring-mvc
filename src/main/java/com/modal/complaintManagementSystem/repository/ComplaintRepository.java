package com.modal.complaintManagementSystem.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.modal.complaintManagementSystem.entity.Complaint;
import com.modal.complaintManagementSystem.entity.UserEntity;

@Repository
public interface ComplaintRepository extends JpaRepository<Complaint, Integer> {

	List<Complaint> findByUser(UserEntity user);

	 @Modifying
	    @Query("UPDATE Complaint c SET c.complaintDetails = :complaintDetails WHERE c.complaintId = :complaintId")
	    int updateComplaintDetails(@Param("complaintId") int complaintId, @Param("complaintDetails") String complaintDetails);
}
