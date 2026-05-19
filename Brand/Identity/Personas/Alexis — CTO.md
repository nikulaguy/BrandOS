# Alexis — CTO

---

## persona_id: alexis role: CTO decision_role: acheteur technique language_register: composants, tests, architecture core_concerns: \[séniorité front, accessibilité production, adoption DS, dette technique, IA-ready codebase\] ai_status: hypothesis ai_concern: respect conventions / DS par l'IA, souveraineté, qualité du code généré relevant_ai_cases: \[LFP refactoring par agents IA, Lefebvre Dalloz DS IA native, Agent DS semi-autonome\] tags: \[Développeur React senior, TypeScript, Storybook, Accessibilité, Core Web Vitals, Handoff, Expertise\] source: knowtion/alexis-cto last_synced: 2026-05-11

# Alexis — CTO

> « J'ai le design, j'ai les specs — ce qu'il me faut, ce sont des développeurs front seniors qui savent ce qu'est un composant accessible en production. »

## Contexte

Alexis a un produit qui marche, une équipe backend solide, mais un problème récurrent côté front : soit il n'a pas assez de devs front seniors, soit ceux qu'il a ne maîtrisent pas les enjeux accessibilité + design system + performance à la fois. Il a un Figma à implémenter — parfois un Design System existant à faire adopter, parfois une refonte de composants critiques, parfois une migration vers une nouvelle stack.

Il ne cherche pas du conseil. Il cherche des devs front qui livrent du code propre, accessible, maintenable — et qui comprennent assez le design system pour ne pas poser de questions basiques à chaque composant.

Son rapport aux prestataires dev : il a été déçu par des agences qui envoient des devs juniors derrière un CTO senior en démo. Il veut voir qui sera réellement sur la mission avant de signer.

## Objectifs

* Renforcer sa squad front avec des profils seniors sur une mission délimitée
* Implémenter un Design System dans la codebase sans créer de nouvelle dette
* Livrer des interfaces accessibles WCAG AA en production — pas en post-correction
* Réduire le time-to-ship sur les sujets front sans recruter en CDI
* Avoir un Design System que les devs adoptent réellement (pas juste Figma)
* Livrer plus vite sans régresser sur l'accessibilité ni la qualité front
* Avoir des interfaces cohérentes sur l'ensemble des surfaces produit
* Faire monter en compétence les équipes déjà en place, redynamiser les bonnes pratiques d'ingénierie
* Avoir une équipe impliquée à la création de valeur ajoutée dans son organisation produit

## Frustrations

* Mes devs corrigent des problèmes UI au lieu de livrer des features
* On a lancé une initiative DS il y a 18 mois. Elle est à l'arrêt — faute d'ownership clair
* Mon Lead Designer est seul face à 6 développeurs — sous-staffing chronique
* Le DS existe mais chaque équipe fait sa version — incohérence visuelle cross-produit
* On m'a envoyé un junior présenté comme senior — j'ai perdu 3 sprints
* L'accessibilité, mes devs la traitent en dernier — résultat : audit RGAA catastrophique

## Comportement sur le site

* Arrive par recommandation pair ou LinkedIn — cherche une validation rapide de l'expertise
* Scanne d'abord les cas clients et la section Expertises avant de lire le reste
* Cherche des preuves concrètes : stack citée, métriques chiffrées, processus explicite
* Lit la page "Offre" pour évaluer si l'approche est mission ponctuelle ou partenariat
* Quitte si le vocabulaire est trop "agentiel" ou trop "conseil stratégique" — il veut du concret
* Sensible au vocabulaire orienté outcomes : "résultats mesurables", "équipes autonomes", "transfert"
* Déclenche le contact si : approche claire + preuve sur un contexte similaire
* Partage la page à Thomas (CTO) et au Lead Designer avant de décider

## Jobs-to-be-done

> « Donne-moi des devs front seniors qui maîtrisent React, TypeScript et l'accessibilité — qui s'intègrent dans ma squad sans que j'aie à les former — et qui livrent du code que mon équipe peut maintenir après leur départ. »

* **Fonctionnel** : trouver des développeurs front seniors opérationnels sur sa stack (React 18+, TypeScript strict, tests, accessibilité WCAG) capables de livrer sans friction dans un repo existant
* **Émotionnel** : ne plus gérer des prestataires qui font semblant de comprendre la stack. Avoir enfin des interlocuteurs à qui il peut parler composants, architecture et patterns sans tout réexpliquer
* **Social** : livrer le projet front dans les délais sans recruter en CDI — et pouvoir dire à son CEO que le partenaire était vraiment senior

## Signaux de confiance attendus sur le site

* Stack listée nommément : React · TypeScript · Storybook · Vitest/Jest · Playwright · Tokens
* Mention que les devs travaillent dans le repo client — pas en livraison externe
* Exemples de composants livrés avec tests d'accessibilité automatisés (axe-core, jest-axe)
* Profils de développeurs avec expériences front réelles et visibles
* Mode d'intervention précis : squad augmentée · mission délimitée · handover propre
* Pas de jargon "transformation digitale" — vocabulaire de dev

## Vocabulaire à mobiliser pour Alexis

* React, TypeScript strict, hooks, composants, props
* Storybook, Vitest, Jest, Playwright, axe-core, jest-axe
* WCAG, RGAA, accessibilité production, Core Web Vitals
* Repo, PR, code review, handoff, conventions, patterns
* Squad augmentée, mission délimitée, handover, transfert
* "Dans votre repo", "vos conventions", "votre stack"

## Vocabulaire à éviter avec Alexis

* "Transformation digitale", "accompagnement stratégique", "conseil"
* Vocabulaire purement design sans ancrage code
* Vocabulaire commercial / business excessif (terrain de Marc-Antoine)
* Promesses sans preuve technique


---

## Rapport à l'IA 🔵

> Hypothèse non validée terrain. Utiliser pour calibrer, ne pas affirmer comme certitude commerciale.

### Pression ressentie

Alexis vit l'IA au quotidien dans sa codebase. Ses devs utilisent Copilot, Cursor, Claude Code — le code généré fonctionne, mais il ne respecte pas le Design System, les conventions d'architecture, ni les patterns d'accessibilité de l'équipe. Résultat : l'IA accélère la production de code, mais augmente le travail de code review et crée de la dette silencieuse. Son DS existant n'est pas structuré pour être "consommé" par des agents de génération de code.

> « Copilot me sort un composant en 30 secondes, mais il ignore nos tokens, nos conventions de nommage et nos patterns d'accessibilité. Mes devs passent plus de temps à corriger le code généré qu'à l'écrire from scratch. »

### Besoin émergent

Rendre son Design System compatible avec les outils de génération de code — des composants basés sur des standards ouverts (BaseUI, Shadcn), des tokens correctement exportés, une documentation technique exhaustive que les LLM peuvent consommer. Et au-delà : des agents IA spécialisés capables de refactorer du code legacy en respectant les conventions du DS.

### Objection ou frein principal

> « Je ne veux pas d'un agent IA qui code dans son coin et me livre une PR de 500 lignes sans contexte. L'IA doit travailler dans notre cadre — nos conventions, nos tests, notre repo. »

Il est aussi méfiant sur la sécurité : les agents IA accèdent-ils au code source ? Les données transitent-elles par des API tierces hors Europe ?

### Signaux d'intérêt Frontguys (cas qui résonnent)

* **LFP — Refactoring assisté par agents IA** : une codebase legacy qui empêchait l'adoption du DS interne a été refactorée avec des agents IA (OpenAI Codex, Claude Code). L'IA documente le code legacy, détecte les règles métier altérées, automatise les tâches répétitives et crée des batteries de tests. Résultat : migration Angular + adoption DS + réduction du poids applicatif — une refonte qui était inenvisageable jusque-là. Cadre de maîtrise : documentation de l'interface des composants en amont, exemples avant/après, spécifications techniques pour guider les LLM. 🔵
* **Lefebvre Dalloz — DS IA native** : reconstruction d'un DS avec des composants open source (BaseUI/Shadcn) habillés d'un thème personnalisé, adapté à Copilot. L'IA échafaude les composants React, assemble les vues, branche les API. L'humain garde la code review, les conventions et la qualité finale. 2 semaines → 5 jours. 🔵
* **Agent DS semi-autonome (POC)** : un agent IA on-premise, basé sur des solutions open-source connectées au cloud européen (Scaleway, OVH, HuggingFace, Mistral), qui déclenche la création de composants après publication Figma, génère les stories et les tests. Entièrement souverain et économique. Intégration d'outils MCP Figma, Chrome et Storybook. 🔵

### Hypothèses à valider en entretien

* Alexis perçoit-il la compatibilité IA de son DS comme un enjeu technique prioritaire, ou reste-t-il focalisé sur le delivery immédiat ?
* Le cas LFP (refactoring par agents) résonne-t-il avec son vécu, ou le perçoit-il comme un cas trop spécifique ?
* La souveraineté (hébergement européen, open source) est-elle un critère de décision chez lui, ou un nice-to-have ?
* Accepterait-il que des agents IA interviennent dans son repo, ou est-ce une ligne rouge culturelle dans son équipe ?
* Le vocabulaire "agent IA", "MCP", "skills" fait-il partie de son langage ou risque-t-il de paraître trop expérimental ?