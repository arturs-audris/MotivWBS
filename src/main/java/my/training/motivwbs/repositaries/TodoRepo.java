package my.training.motivwbs.repositaries;

import my.training.motivwbs.dto.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TodoRepo extends JpaRepository<Todo, Long> {
    List<Todo> findByUserId(long id);
}
