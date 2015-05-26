/**
 * Inspired by Manfred Mohr's P-61, "geometric hints" (1970),
 * and Bild series (1960-61)
 */
public class Landscape {

	private float width;
	private float height;
	private float padding; // padding around main rect.
	private color background_color;

	static private color OLIVINE = color (151, 191, 125);
	static private color OLIVINE_LIGHT = color (167, 207, 141);
	static private color CELADON = color (172, 225, 175);
	static private color SPROUT_WARM = color (168, 207, 157);

	public Landscape (float width, float height) {
		this.width = width;
		this.height = height;
		this.padding = 40;

		this.background_color = OLIVINE;
	}


	public void display (float width, float height) {
		this.width = width;
		this.height = height;

		fill (background_color);
		noStroke ();
		rect (padding, padding, width - 2*padding, height - 2*padding);
	}
}