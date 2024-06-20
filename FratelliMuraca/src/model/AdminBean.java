package model;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

public class AdminBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String username;
	private String password;
	
	
	public AdminBean(int id, String username, String password) {
		this.id = id;
		this.username = username;
		this.password = password;
	}
	
	public AdminBean(String username, String password) {
		this.username = username;
		this.password = password;
	}
	
	
	
	public AdminBean() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public void encryptPassword() {
		String psw = password;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] messageDigest = md.digest(psw.getBytes());

            // Convert byte array to hex string
            StringBuilder hexString = new StringBuilder();
            for (byte b : messageDigest) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            this.password = hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AdminBean other = (AdminBean) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "AdminBean [id=" + id + ", username=" + username + ", password=" + password + "]";
	}
	
}
