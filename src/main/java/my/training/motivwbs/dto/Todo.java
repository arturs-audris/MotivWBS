package my.training.motivwbs.dto;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;


@Entity
@Table
public class Todo {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @JsonIgnore
    private long id;
    private String description;
    private String dueDate;
    @JsonProperty(required=false)
    private boolean completed;
    @JsonProperty(required=false)
    private long userId;

    public Todo(long id, String description, String dueDate, boolean completed, long userId) {
        this.id = id;
        this.description = description;
        this.dueDate = dueDate;
        this.completed = completed;
        this.userId = userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public Todo() {
    }

    public long getId() {
        return id;
    }

    public String getDescription() {
        return description;
    }

    public String getDueDate() {
        return dueDate;
    }

    public boolean isCompleted() {
        return completed;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setDueDate(String dueDate) {
        this.dueDate = dueDate;
    }

    public void setCompleted(boolean completed) {
        this.completed = completed;
    }


    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", dueDate='" + dueDate + '\'' +
                ", completed=" + completed +
                '}';
    }
}
