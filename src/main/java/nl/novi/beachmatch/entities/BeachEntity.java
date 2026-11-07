package nl.novi.beachmatch.entities;

import jakarta.persistence.*;

import java.util.HashSet;
import java.util.List;
import java.util.Set;


@Entity
@Table (name = "beaches")
public class BeachEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long beachId;

    @Column(nullable = false, unique = true, length = 100)
    private String name;
    @Column(nullable = false, length = 255)
    private String description;
    @Column(nullable = false)
    private String province;
    @Column(nullable = false)
    private Double latitude;
    @Column(nullable = false)
    private Double longitude;

    @OneToOne(cascade = CascadeType.REMOVE)
    @JoinColumn(name = "photo_id")
    private BeachPhotoEntity beachPhoto;

    @OneToMany(mappedBy = "beach", cascade = CascadeType.REMOVE)
    private List<ReviewEntity> reviews;

    @OneToMany(mappedBy = "beach", cascade = CascadeType.REMOVE)
    private List<FavoriteEntity> favorites;

    @ManyToMany()
    @JoinTable(
            name = "beaches_beachfeatures",
            joinColumns = @JoinColumn(name = "beach_id"),
            inverseJoinColumns = @JoinColumn(name = "beachfeature_id")
    )
    private Set<BeachFeatureEntity> beachFeatures = new HashSet<>();

    public Long getBeachId() {
        return beachId;
    }

    public void setBeachId(Long beachId) {
        this.beachId = beachId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getLatitude() {
        return latitude;
    }

    public void setLatitude(Double latitude) {
        this.latitude = latitude;
    }

    public Double getLongitude() {
        return longitude;
    }

    public void setLongitude(Double longitude) {
        this.longitude = longitude;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BeachPhotoEntity getBeachPhoto() {
        return beachPhoto;
    }

    public void setBeachPhoto(BeachPhotoEntity beachPhoto) {
        this.beachPhoto = beachPhoto;
    }

    public List<ReviewEntity> getReviews() {
        return reviews;
    }

    public void setReviews(List<ReviewEntity> reviews) {
        this.reviews = reviews;
    }

    public List<FavoriteEntity> getFavorites() {
        return favorites;
    }

    public void setFavorites(List<FavoriteEntity> favorites) {
        this.favorites = favorites;
    }

    public Set<BeachFeatureEntity> getBeachFeatures() {
        return beachFeatures;
    }

    public void setBeachFeatures(Set<BeachFeatureEntity> beachFeatures) {
        this.beachFeatures = beachFeatures;
    }
}
