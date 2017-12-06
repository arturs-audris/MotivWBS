package my.training.motivwbs.dto;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class MotivUser {

    @Id
    @GeneratedValue
    private long id;
    private long userId;

    public MotivUser(final long userId, List<Todo> tasks) {
        this.userId = userId;
    }

    public long getId() {
        return id;
    }

    public long getUserId() {
        return userId;
    }

    public MotivUser() {
    }
}
