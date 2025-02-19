package com.edumanage.model;

public class Course {
    private int id;
    private String name;
    private String description;

    // Constructors
    public Course() {}

    public Course(String name, String description) {
        this.name = name;
        this.description = description;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
