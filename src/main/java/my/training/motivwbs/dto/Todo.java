package my.training.motivwbs.dto;

public class Todo {

    private final long id;
    private final String description;
    private final String dueDate;

    public Todo(long id, String description, String dueDate) {
        this.id = id;
        this.description = description;
        this.dueDate = dueDate;
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
}
