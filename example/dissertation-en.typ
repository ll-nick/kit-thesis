// KIT Dissertation Template — English language example
// Verifies: English body text labels, German title page strings.
// Compile: typst compile --root . --font-path fonts example/dissertation-en.typ example/dissertation-en.pdf

#import "/lib.typ": appendix, dissertation

#show: dissertation.with(
    // ── Author ──────────────────────────────────────────────────────────────
    author-title: "M.Sc.",
    author-firstname: "Jane",
    author-surname: "Doe",
    author-male: false,

    // ── Thesis ──────────────────────────────────────────────────────────────
    title: [
        A Complete Dissertation Title --- Spanning Multiple Lines
    ],

    // ── Degree ──────────────────────────────────────────────────────────────
    doc-degree: "Doktors der Ingenieurwissenschaften (Dr.-Ing.)",
    doc-degree-f: "Doktorin der Ingenieurwissenschaften (Dr.-Ing.)",

    // ── Institution ─────────────────────────────────────────────────────────
    department: "KIT-Fakultät für Maschinenbau",
    university-genitive: "des Karlsruher Instituts für Technologie (KIT)",

    // ── Language: English ───────────────────────────────────────────────────
    // Title page always uses German strings regardless.
    lang: "en",

    // ── Margin preset ───────────────────────────────────────────────────────
    margin-preset: "short",

    // ── Status ──────────────────────────────────────────────────────────────
    status-approved: false,

    // ── Front matter ────────────────────────────────────────────────────────
    abstract-en: include "content/abstract-en.typ",
    abstract-de: include "content/abstract-de.typ",

    // ── Back matter ─────────────────────────────────────────────────────────
    show-lof: true,
    show-lot: true,
    show-lol: false,
)

// ── Chapters ─────────────────────────────────────────────────────────────

#include "content/introduction.typ"

// ── Bibliography ─────────────────────────────────────────────────────────

#heading(level: 1, numbering: none, outlined: true, bookmarked: true)[Bibliography]
#bibliography(
    "bib/references.bib",
    title: none,
    style: "ieee",
)
