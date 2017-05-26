package domain;

import java.util.List;

public class SkinType {
	
	private String baumanType;
	private List<String> recommendedIngredient;
	private List<String> bannedIngredient;
	private String habit;
	private List<Cosmetic> recommendedCosmetics;
	
	public SkinType(){}

	public SkinType(String baumanType, List<String> recommendedIngredient, List<String> bannedIngredient, String habit,
			List<Cosmetic> recommendedCosmetics) {
		super();
		this.baumanType = baumanType;
		this.recommendedIngredient = recommendedIngredient;
		this.bannedIngredient = bannedIngredient;
		this.habit = habit;
		this.recommendedCosmetics = recommendedCosmetics;
	}

	public String getBaumanType() {
		return baumanType;
	}

	public void setBaumanType(String baumanType) {
		this.baumanType = baumanType;
	}

	public List<String> getRecommendedIngredient() {
		return recommendedIngredient;
	}

	public void setRecommendedIngredient(List<String> recommendedIngredient) {
		this.recommendedIngredient = recommendedIngredient;
	}

	public List<String> getBannedIngredient() {
		return bannedIngredient;
	}

	public void setBannedIngredient(List<String> bannedIngredient) {
		this.bannedIngredient = bannedIngredient;
	}

	public String getHabit() {
		return habit;
	}

	public void setHabit(String habit) {
		this.habit = habit;
	}

	public List<Cosmetic> getRecommendedCosmetics() {
		return recommendedCosmetics;
	}

	public void setRecommendedCosmetics(List<Cosmetic> recommendedCosmetics) {
		this.recommendedCosmetics = recommendedCosmetics;
	}

	@Override
	public String toString() {
		return "SkinType [baumanType=" + baumanType + ", recommendedIngredient=" + recommendedIngredient
				+ ", bannedIngredient=" + bannedIngredient + ", habit=" + habit + ", recommendedCosmetics="
				+ recommendedCosmetics + "]";
	}
	
	
	
	

}
