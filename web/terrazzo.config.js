import { defineConfig } from "@terrazzo/cli";
import css from "@terrazzo/plugin-css";
import { converter, formatCss, parse, round } from "culori";

export default defineConfig({
	tokens: ["./src/tokens/colors.json", "./src/tokens/text-styles.json"],
	outDir: "./src/assets/styles/01-utils/",
	plugins: [
		css({
			filename: "variables/_tokens.scss",
			baseScheme: "light dark",
			modeSelectors: [
				{
					mode: "light",
					selectors: ["@media (prefers-color-scheme: light)"],
					scheme: "light",
				},
				{
					mode: "dark",
					selectors: ["@media (prefers-color-scheme: dark)"],
					scheme: "dark",
				},
				{ mode: "small", selectors: ["@media (width < 600px)"] },
				{ mode: "large", selectors: ["@media (width >= 600px)"] },
			],
			transform: (token) => {
				// Generate color values in oklch for core color tokens
				if (token.$type === "color" && token.id.includes("Core")) {
					// 1. Create RGB color object from HEX string
					const tokenParsedInRGB = parse(token.$value.hex);
					// 2. Create a LCH converter + Convert HEX color object to OKLCH color object
					const oklch = converter("oklch");
					const LCHconvertedColor = oklch(tokenParsedInRGB);
					// 3. Create CSS oklch string from OKLCH color object
					const perceivedLightnessRounding = round(2);
					const chromaRounding = round(2);
					const hueRounding = round(0);
					const finalColorFormattedInOKLCH = formatCss({
						mode: "oklch",
						l: perceivedLightnessRounding(LCHconvertedColor.l),
						c: chromaRounding(LCHconvertedColor.c),
						h: hueRounding(LCHconvertedColor.h),
					});
					// 4. Generate final CSS string value with hex color in comment to identify token value from Figma
					return `${finalColorFormattedInOKLCH}; // ${token.$value.hex}`;
				}

				// Convert typography font sizes from px to rem, but let Terrazzo
				// handle the rest of the typography mapping (font-family, etc.).
				if (
					token.$type === "typography" &&
					token.$value?.fontSize?.unit === "px"
				) {
					const baseFontSize = 16; // 1rem = 16px

					// Mutate the token value so the built-in css plugin sees a rem value
					token.$value.fontSize = {
						value: token.$value.fontSize.value / baseFontSize,
						unit: "rem",
					};

					// Do not return anything here so @terrazzo/plugin-css continues
					// with its default handling (including references → CSS vars).
				}
			},
		}),
	],
	lint: {
		/** @see https://terrazzo.app/docs/cli/lint */
	},
});
