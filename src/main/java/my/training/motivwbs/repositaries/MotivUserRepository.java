package my.training.motivwbs.repositaries;

import my.training.motivwbs.dto.MotivUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MotivUserRepository extends JpaRepository<MotivUser, Long> {
    MotivUser findByUserId(long id);
}
