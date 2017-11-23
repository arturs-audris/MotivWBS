package my.training.motivwbs.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


@Entity
public class Todo {

    @Id
    @GeneratedValue
    private long id;
    private String description;
    private String dueDate;

    public Todo(long id, String description, String dueDate) {
        this.id = id;
        this.description = description;
        this.dueDate = dueDate;
    }

    protected Todo() {}

    public long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public String getDueDate() {
        return dueDate;
    }

    @Override
    public String toString() {
        return "{ " +
                "\"id\":" + id +
                ", \"description\":\"" + description + '\"' +
                ", \"dueDate\":\"" + dueDate + '\"' +
                '}';
    }
}
