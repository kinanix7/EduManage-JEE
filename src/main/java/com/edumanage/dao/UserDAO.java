package com.edumanage.dao;

import com.edumanage.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

    private Connection dbConnection;

    public UserDAO() throws SQLException {
        dbConnection = DatabaseConnection.getConnection();
    }

    public User getUser(String username, String password) {
        String sql = "SELECT * FROM users WHERE name = ? AND password = ?";
        try (PreparedStatement stmt = dbConnection.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new User(rs.getInt("id"), rs.getString("name"), rs.getString("password"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}