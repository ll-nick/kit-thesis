// KIT Dissertation Template — Example Document
// Compile from this directory:
//   typst compile main.typ
// (Fonts are found automatically via typst.toml font-paths.)

#import "/lib.typ": appendix, dissertation, flex-caption

#show: dissertation.with(
    // ── Author ──────────────────────────────────────────────────────────────
    author-title: "M.Sc.",
    author-firstname: "Max",
    author-surname: "Mustermann",
    author-male: true,

    // ── Thesis ──────────────────────────────────────────────────────────────
    title: [
        Ein vollständiger Titel der Dissertation --- Über mehrere Zeilen
    ],

    // ── Degree ──────────────────────────────────────────────────────────────
    doc-degree: "Doktors der Ingenieurwissenschaften (Dr.-Ing.)",
    doc-degree-f: "Doktorin der Ingenieurwissenschaften (Dr.-Ing.)",

    // ── Institution ─────────────────────────────────────────────────────────
    department: "KIT-Fakultät für Maschinenbau",
    university-genitive: "des Karlsruher Instituts für Technologie (KIT)",

    // ── Language ────────────────────────────────────────────────────────────
    lang: "de",

    // ── Margin preset ───────────────────────────────────────────────────────
    // "short" < 200 pages | "medium" 200–399 | "long" ≥ 400
    margin-preset: "short",

    // ── Status ──────────────────────────────────────────────────────────────
    // false = submitted ("eingereichte"), true = approved ("angenommene")
    status-approved: false,

    // ── Advisor info — fill in when status-approved = true ──────────────────
    // exam-date:         "12.12.2025",
    // main-advisor:      "Prof. Dr.-Ing. Hauptreferent",
    // main-advisor-male: true,
    // co-advisor:        "Prof. Dr. Korreferent",
    // co-advisor-male:   true,

    // ── Front matter ────────────────────────────────────────────────────────
    abstract-en: include "content/abstract-en.typ",
    abstract-de: include "content/abstract-de.typ",
    acknowledgements: include "content/acknowledgements.typ",
    notation: include "content/notation.typ",
    abbreviations: include "content/abbreviations.typ",

    // ── CV ───────────────────────────────────────────────────────────────────
    cv-name: "Max Mustermann",
    cv-entries: (
        ("1990",      "Geboren in Musterstadt"),
        ("2010–2015", "Studium Maschinenbau, KIT"),
        ("2015–2025", "Wissenschaftlicher Mitarbeiter, KIT"),
    ),

    // ── Back matter ─────────────────────────────────────────────────────────
    show-lof: true,
    show-lot: true,
    show-lol: false,

    own-publications: [
        = Eigene Publikationen

        Mustermann, M. (2024). *Ein Beispiel-Konferenzbeitrag*. In _Proceedings of
        the International Conference on Examples_, S. 1--10.
    ],

    supervised-theses: [
        = Betreute studentische Arbeiten

        Musterfrau, M. (2024). _Titel der Masterarbeit_. Masterarbeit, KIT.
    ],
)

// ── Chapters ─────────────────────────────────────────────────────────────

#include "content/introduction.typ"

// ── Bibliography ─────────────────────────────────────────────────────────

#heading(
    level: 1,
    numbering: none,
    outlined: true,
    bookmarked: true,
)[Literaturverzeichnis]
#bibliography(
    "bib/references.bib",
    title: none,
    style: "ieee",
)

// ── Appendix ─────────────────────────────────────────────────────────────

#show: appendix

= Supplementary Material

#lorem(120)
