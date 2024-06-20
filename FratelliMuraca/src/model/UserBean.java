package model;

import java.io.Serializable;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;

public class UserBean implements Serializable {
	private static final long serialVersionUID = 1L;

	private int id;
	private String email;
	private String password;
	private String nome;
	private String cognome;
	private Date ddn;
	private String phone;
	
	public UserBean(int id, String email, String password, String nome, String cognome, Date ddn, String phone) {
		this.id = id;
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.ddn = ddn;
		this.phone = phone;
	}
	
	public UserBean(String email, String password, String nome, String cognome, Date ddn, String phone) {
		this.email = email;
		this.password = password;
		this.nome = nome;
		this.cognome = cognome;
		this.ddn = ddn;
		this.phone = phone;
	}
	
	public UserBean() {}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public String getFullName() {
		return nome + " " + cognome;
	}
	
	public Date getDdn() {
		return ddn;
	}

	public void setDdn(Date ddn) {
		this.ddn = ddn;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
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
		UserBean other = (UserBean) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	@Override
	public String toString() {
		return "UserBean [id=" + id + ", email=" + email + ", password=" + password + ", nome=" + nome + ", cognome=" + cognome + ", ddn="
				+ ddn + ", phone=" + phone + "]";
	}
	
}
