import react from "@astrojs/react";
import { defineConfig } from "astro/config";

/**
 * Configuration Astro minimale pour le pilier code du Brand OS Frontguys.
 *
 * Notes :
 * - Cohérent avec SiteA11Y pour faciliter la portabilité des composants.
 * - On n'inclut PAS netlify / posthog / mdx / sitemap : ce projet est un sandbox de prototypes,
 *   pas un site de prod. On ajoutera ces intégrations seulement si un prototype l'exige.
 * - L'`additionalData` SCSS rejoue le même contrat que SiteA11Y : tous les fichiers SCSS
 *   reçoivent variables + mixins en amont, ce qui rend les composants copiables sans modification.
 */
export default defineConfig({
	integrations: [react()],
	prefetch: true,
	vite: {
		css: {
			preprocessorOptions: {
				scss: {
					api: "modern-compiler",
					additionalData: `
@use '${import.meta.dirname}/src/assets/styles/01-utils/_variables.scss' as *;
@use '${import.meta.dirname}/src/assets/styles/01-utils/_mixins.scss' as *;
`,
				},
			},
		},
	},
});
