package nl.novi.beachmatch.entities;

import jakarta.persistence.*;
import nl.novi.beachmatch.enums.ModeOfTransport;

import java.util.List;

@Entity
@Table(name = "users")
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    @Column(nullable = false)
    private String name;
    @Column(nullable = false)
    private String email;
    private String address;
    private String city;
    private Integer age;

    @Column(nullable = false,  unique = true)
    private String keycloakId;

    @ElementCollection(fetch = FetchType.EAGER)
    @Enumerated(EnumType.STRING)
    private List<ModeOfTransport> modesOfTransport;

    private String profilePhotoFileName;
    private String profilePhotoContentType;

    @Lob
    private byte[] profilePhotoData;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<FavoriteEntity> favorites;

    @OneToMany(mappedBy = "user", cascade = CascadeType.REMOVE)
    private List<ReviewEntity> reviews;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getKeycloakId() {
        return keycloakId;
    }

    public void setKeycloakId(String keycloakId) {
        this.keycloakId = keycloakId;
    }

    public List<ModeOfTransport> getModesOfTransport() {
        return modesOfTransport;
    }

    public void setModesOfTransport(List<ModeOfTransport> modesOfTransport) {
        this.modesOfTransport = modesOfTransport;
    }

    public String getProfilePhotoFileName() {
        return profilePhotoFileName;
    }

    public void setProfilePhotoFileName(String profilePhotoFileName) {
        this.profilePhotoFileName = profilePhotoFileName;
    }

    public String getProfilePhotoContentType() {
        return profilePhotoContentType;
    }

    public void setProfilePhotoContentType(String profilePhotoContentType) {
        this.profilePhotoContentType = profilePhotoContentType;
    }

    public byte[] getProfilePhotoData() {
        return profilePhotoData;
    }

    public void setProfilePhotoData(byte[] profilePhotoData) {
        this.profilePhotoData = profilePhotoData;
    }

    public List<FavoriteEntity> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<FavoriteEntity> favorites) {
        this.favorites = favorites;
    }

    public List<ReviewEntity> getReviews() {
        return reviews;
    }

    public void setReviews(List<ReviewEntity> reviews) {
        this.reviews = reviews;
    }
}
