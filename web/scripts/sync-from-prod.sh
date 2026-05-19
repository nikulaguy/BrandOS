#!/usr/bin/env bash
#
# sync-from-prod.sh
#
# Synchronise les tokens et (optionnellement) des composants
# depuis un clone local du repo Gitlab `frontguys/accessibility-website` (= SiteA11Y).
#
# Usage :
#   ./scripts/sync-from-prod.sh tokens
#   ./scripts/sync-from-prod.sh component Button
#   ./scripts/sync-from-prod.sh component Card Footer Header
#   ./scripts/sync-from-prod.sh all-styles
#
# Variable d'env :
#   SITEA11Y_PATH=/chemin/vers/SiteA11Y   (défaut : ../SiteA11Y, relatif à web/)
#
# Pré-requis : avoir cloné/téléchargé SiteA11Y localement et à jour.

set -euo pipefail

# Résolution du chemin SiteA11Y
WEB_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SITEA11Y_PATH="${SITEA11Y_PATH:-${WEB_DIR}/../SiteA11Y}"

if [ ! -d "${SITEA11Y_PATH}" ]; then
	echo "❌ SiteA11Y introuvable à : ${SITEA11Y_PATH}"
	echo "   Cloner depuis Gitlab ou définir SITEA11Y_PATH=/chemin/vers/clone."
	exit 1
fi

echo "📂 Source SiteA11Y : ${SITEA11Y_PATH}"
echo "📂 Cible web : ${WEB_DIR}"
echo ""

action="${1:-}"

case "${action}" in
	tokens)
		echo "🎨 Synchronisation des tokens JSON..."
		cp -v "${SITEA11Y_PATH}/src/tokens/"*.json "${WEB_DIR}/src/tokens/"
		echo ""
		echo "🎨 Synchronisation de terrazzo.config.js..."
		cp -v "${SITEA11Y_PATH}/terrazzo.config.js" "${WEB_DIR}/terrazzo.config.js"
		echo ""
		echo "✅ Tokens synchronisés. Pense à relancer 'pnpm build-tokens'."
		;;

	all-styles)
		echo "🎨 Synchronisation de TOUS les styles globaux (01-utils, 02-base, 03-fonts)..."
		cp -Rv "${SITEA11Y_PATH}/src/assets/styles/." "${WEB_DIR}/src/assets/styles/"
		echo ""
		echo "✅ Styles globaux synchronisés. Pense à relancer 'pnpm build-tokens'."
		;;

	component)
		shift
		if [ "$#" -eq 0 ]; then
			echo "❌ Aucun nom de composant fourni."
			echo "   Usage : ./scripts/sync-from-prod.sh component Button [autres...]"
			exit 1
		fi
		for name in "$@"; do
			src="${SITEA11Y_PATH}/src/components/${name}"
			# Composants à la racine (Logo, MainHead, etc.) sont des fichiers, pas des dossiers
			if [ -d "${src}" ]; then
				echo "📦 Copie du composant ${name} (dossier)..."
				cp -Rv "${src}" "${WEB_DIR}/src/components/"
			elif [ -f "${SITEA11Y_PATH}/src/components/${name}.astro" ]; then
				echo "📦 Copie du composant ${name}.astro (fichier racine)..."
				cp -v "${SITEA11Y_PATH}/src/components/${name}.astro" "${WEB_DIR}/src/components/"
			else
				echo "❌ Composant introuvable : ${name}"
				echo "   Cherché dans : ${SITEA11Y_PATH}/src/components/"
				exit 1
			fi
			echo "   ⚠️  Pense à :"
			echo "       1. Vérifier les imports internes (site.config, utils, etc.)"
			echo "       2. Créer la fiche dans docs/components/${name}.md"
			echo "       3. Ajouter l'entrée dans docs/figma-to-astro-mapping.md"
			echo ""
		done
		echo "✅ Composants synchronisés."
		;;

	"")
		echo "Usage :"
		echo "  ./scripts/sync-from-prod.sh tokens                  # tokens JSON + terrazzo.config"
		echo "  ./scripts/sync-from-prod.sh all-styles              # tout le dossier src/assets/styles"
		echo "  ./scripts/sync-from-prod.sh component <Nom> [...]   # un ou plusieurs composants"
		echo ""
		echo "Variable d'env :"
		echo "  SITEA11Y_PATH=/chemin (défaut : ../SiteA11Y)"
		exit 0
		;;

	*)
		echo "❌ Action inconnue : ${action}"
		echo "   Lance ./scripts/sync-from-prod.sh (sans arg) pour voir l'usage."
		exit 1
		;;
esac
