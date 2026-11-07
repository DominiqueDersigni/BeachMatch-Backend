package nl.novi.beachmatch.entities;

import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity@Table(name = "reviews")
public class ReviewEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long reviewId;

    @Column(nullable = false, length = 100)
    private String title;
    @Column(nullable = false, length = 255)
    private String text;
    @Column(nullable = false)
    private Integer score;

    @Column(nullable = false)
    private LocalDateTime createDate;

    @PrePersist
    protected void onCreate() {
        createDate = LocalDateTime.now();
    }

    @ManyToOne
    @JoinColumn(name = "beachId", nullable = false)
    private BeachEntity beach;

    @ManyToOne
    @JoinColumn(name = "userId", nullable = false)
    private UserEntity user;

    public Long getReviewId() {
        return reviewId;
    }

    public void setReviewId(Long reviewId) {
        this.reviewId = reviewId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public LocalDateTime getCreateDate() {
        return createDate;
    }

    public void setCreateDate(LocalDateTime createDate) {
        this.createDate = createDate;
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

