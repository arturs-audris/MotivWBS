package my.training.motivwbs.repositaries;

import my.training.motivwbs.dto.Todo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TodoRepo extends JpaRepository<Todo, Long> {
}
