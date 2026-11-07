package nl.novi.beachmatch.entities;

import jakarta.persistence.*;

@Entity
@Table(name = "favorites")
public class FavoriteEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long favoriteId;


    @ManyToOne
    @JoinColumn(name = "beachId", nullable = false)
    private BeachEntity beach;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private UserEntity user;

    public Long getFavoriteId() {
        return favoriteId;
    }

    public void setFavoriteId(Long favoriteId) {
        this.favoriteId = favoriteId;
    }

    public BeachEntity getBeach() {
        return beach;
    }

    public void setBeach(BeachEntity beach) {
        this.beach = beach;
    }

    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }
}
