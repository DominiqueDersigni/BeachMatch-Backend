package nl.novi.beachmatch.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "beachfeatures")
public class BeachFeatureEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long beachFeatureId;

    @Column(nullable = false, unique = true, length = 100)
    private String name;
    @Column(nullable = false, length = 255)
    private String description;

    public Long getBeachFeatureId() {
        return beachFeatureId;
    }

    public void setBeachFeatureId(Long beachFeatureId) {
        this.beachFeatureId = beachFeatureId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
